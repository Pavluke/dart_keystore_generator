import 'dart:io';

import 'localization.dart';
import 'localizations.dart';

enum Locale {
  en,
  ru;

  static Locale fromPlatform() {
    late String locale = 'en';
    if (Platform.isWindows) {
      // Для Windows используем переменную окружения USERPROFILE
      final String platformLocale =
          Platform.environment['USERPROFILE']!.split('\\')[1];
      if (platformLocale.length == 2) {
        locale = platformLocale;
      }
    } else if (Platform.isMacOS || Platform.isLinux) {
      // Для macOS и Linux используем команду locale
      ProcessResult result = Process.runSync('locale', []);
      final String platformLocale =
          result.stdout.split('\n').first.split('_')[0].split('"')[1];
      if (platformLocale.length == 2) {
        locale = platformLocale;
      }
    }
    return Locale.values.firstWhere(
      (l) => l.name == locale.substring(0, 2),
    );
  }

  Localization get localization => switch (this) {
        Locale.ru => RuLocalization(),
        Locale.en => EnLocalization(),
      };
}
