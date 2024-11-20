import 'localization.dart';

part 'en.dart';
part 'ru.dart';

abstract class Localizations {
  static Localization get ru => RuLocalization();
  static Localization get en => EnLocalization();
}
