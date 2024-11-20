part of 'localizations.dart';

class RuLocalization extends Localization {
  @override

  ///`Введите пароль для хранилища ключей или нажмите Enter для генерации пароля: `
  String get enterPasswordOrPressEnter =>
      'Введите пароль для хранилища ключей или нажмите Enter для генерации пароля: ';

  @override

  ///`Содержимое хранилища ключей:`
  String get listingKeystore => 'Содержимое хранилища ключей:';

  @override

  /// `Пароли не совпадают. Пожалуйста, попробуйте еще раз.`
  String get passwordTooShort =>
      'Пароли не совпадают. Пожалуйста, попробуйте еще раз.';

  @override

  /// `Пароли не совпадают. Пожалуйста, попробуйте еще раз.`
  String get passwordsDontMatch =>
      'Пароли не совпадают. Пожалуйста, попробуйте еще раз.';

  @override

  /// `Повторите пароль для хранилища ключей: `
  String get reenterPassword => 'Повторите пароль для хранилища ключей: ';

  @override

  /// `Файл хранилища ключей и key.properties успешно созданы!`
  String get successMessage =>
      'Файл хранилища ключей и key.properties успешно созданы!';

  @override

  /// `ru`
  String get localCode => 'ru';

  /// `Версия: $version`
  @override
  String version(String version) => 'Версия: $version';

  @override

  /// `Введите название пакета приложения: `
  String get enterPackageName => 'Введите имя пакета приложения: ';

  @override

  /// `Некорректное имя пакета приложения!`
  String get invalidPackageName => 'Некорректное имя пакета приложения!';
}
