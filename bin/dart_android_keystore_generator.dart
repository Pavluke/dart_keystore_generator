import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:archive/archive_io.dart';

import 'loc/loc.dart';

/// Версия
const String version = '0.0.2';

/// Включает отображение хранилища ключей после его создания,
/// если `true`
const bool debug = false;

/// Название вашей организации как подразделения.
String fullName = 'Flutter Developer';
String organizationUnitName = 'softlex.pro';
late String organizationName;
String city = 'Moscow';
String state = 'MSK';
late String countryCode;

/// Функция для генерации случайного пароля
String generateRandomPassword(int length) {
  const String chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random rnd = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}

/// Функция для проверки валидности bundleName
bool isValidBundleName(String bundleName) {
  final RegExp bundleNameRegex =
      RegExp(r'^[a-zA-Z]+(\.[a-zA-Z][a-zA-Z0-9]*)+$');
  return bundleNameRegex.hasMatch(bundleName);
}

void main() {
  // Загрузка строк локализации
  Localization localization = Locale.fromPlatform().localization;
  countryCode = localization.localCode.toUpperCase();
  // Показываем версию
  print(localization.version(version));

  late String packageName;
  while (true) {
    stdout.write(localization.enterPackageName);
    packageName = stdin.readLineSync(encoding: utf8)!;

    // Проверка валидности bundleName
    if (!isValidBundleName(packageName)) {
      print(localization.invalidPackageName);
      continue;
    } else {
      organizationName =
          packageName.split('.').take(2).toList().reversed.join('.');
      break;
    }
  }

  // Генерация alias
  String alias = 'upload_$packageName';

  // Запрос пароля
  String password = '';
  while (true) {
    stdout.write(localization.enterPasswordOrPressEnter);
    password = stdin.readLineSync(encoding: utf8)!;

    // Проверка длины пароля
    if (password.isEmpty) {
      password = generateRandomPassword(12);

      break;
    } else if (password.length < 6) {
      print(localization.passwordTooShort);
      continue;
    } else {
      stdout.write(localization.reenterPassword);
      String reenteredPassword = stdin.readLineSync(encoding: utf8)!;

      // Проверка совпадения паролей
      if (password == reenteredPassword) {
        break;
      } else {
        print(localization.passwordsDontMatch);
      }
    }
  }
  //
  stdout.write(localization.enterFullName(fullName));
  if (stdin.readLineSync(encoding: utf8)!.isNotEmpty) {
    fullName = stdin.readLineSync(encoding: utf8)!;
  }
  //
  stdout.write(localization.enterOrgUnitName(organizationUnitName));
  if (stdin.readLineSync(encoding: utf8)!.isNotEmpty) {
    organizationUnitName = stdin.readLineSync(encoding: utf8)!;
  }
  //
  stdout.write(localization.enterOrgName(organizationName));
  if (stdin.readLineSync(encoding: utf8)!.isNotEmpty) {
    organizationName = stdin.readLineSync(encoding: utf8)!;
  }
  //
  stdout.write(localization.enterCityOrLocality(city));
  if (stdin.readLineSync(encoding: utf8)!.isNotEmpty) {
    city = stdin.readLineSync(encoding: utf8)!;
  }
  //
  stdout.write(localization.enterStateOrProvince(state));
  if (stdin.readLineSync(encoding: utf8)!.isNotEmpty) {
    state = stdin.readLineSync(encoding: utf8)!;
  }
  // Удаление старых файлов, если они существуют
  List<String> filesToDelete = ['key.jks', 'key.properties'];
  for (String file in filesToDelete) {
    File(file).deleteSync(recursive: true);
  }

  // Генерация ключа с использованием переменных окружения для пароля
  ProcessResult result = Process.runSync(
    'keytool',
    [
      '-genkey',
      '-v',
      '-keystore',
      'key.jks',
      '-alias',
      alias,
      '-keyalg',
      'RSA',
      '-keysize',
      '2048',
      '-validity',
      '10000',
      '-storepass',
      password,
      '-keypass',
      password,
      '-dname',
      'CN=$fullName, OU=$organizationName, O=$packageName, L=$city, ST=$state, C=$countryCode}'
    ],
  );

  if (result.exitCode != 0) {
    print('Error generating keystore: ${result.toString()}');
    exit(result.exitCode);
  }
  if (debug) {
    // Вывод содержимого хранилища ключей
    print(localization.listingKeystore);
    ProcessResult listResult = Process.runSync(
      'keytool',
      ['-list', '-v', '-keystore', 'key.jks', '-storepass', password],
    );

    if (listResult.exitCode != 0) {
      print('Error listing keystore: ${listResult.stderr}');
      exit(listResult.exitCode);
    } else {
      print(listResult.stdout);
    }
  }

  final now = DateTime.now().toString().split('.').first;

  // Создание файла key.properties
  File propertiesFile = File('key.properties');
  propertiesFile.writeAsStringSync('''
## Package name: $packageName
## Generated at: $now

storePassword=$password
keyPassword=$password
keyAlias=$alias
## The storeFile might be located at /Users/<user name>/key.jks on macOS
## or C:\\Users\\<user name>\\key.jks
storeFile=${Platform.isWindows ? 'C:\\Users\\${Platform.environment['USERNAME']}\\key.jks' : '/Users/${Platform.environment['USER']}/key.jks'}
''');

  // Создаем архив с ключами
  final encoder = ZipFileEncoder();
  encoder.create(
      '${packageName}_${now.replaceAll(RegExp(r'[-:]'), '')}_keystore.zip'
          .replaceAll(' ', '_'));
  encoder.addFile(File('key.jks'));
  encoder.addFile(propertiesFile);
  encoder.close();
  print(localization.successMessage);
}
