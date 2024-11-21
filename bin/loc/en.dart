part of 'localizations.dart';

class EnLocalization extends Localization {
  @override

  ///`Enter password for keystore or press Enter for password generate: `
  String get enterPasswordOrPressEnter =>
      'Enter password for keystore or press Enter for password generate: ';

  @override

  ///`Listing keystore contents:`
  String get listingKeystore => 'Listing keystore contents:';

  @override

  /// `Password must be at least 6 characters long. Please try again.`
  String get passwordTooShort =>
      'Password must be at least 6 characters long. Please try again.';

  @override

  /// `Passwords do not match. Please try again.`
  String get passwordsDontMatch => 'Passwords do not match. Please try again.';

  @override

  /// `Re-enter password for keystore: `
  String get reenterPassword => 'Re-enter password for keystore: ';

  @override

  /// `Keystore and key.properties file generated successfully!`
  String get successMessage =>
      'Keystore and key.properties file generated successfully!';

  @override

  /// `en`
  String get localCode => 'en';

  @override

  /// `Version: $version`
  String version(String version) => 'Version: $version';

  @override

  /// `Enter app package name: `
  String get enterPackageName => 'Enter app name: ';

  @override

  /// `Invalid app package name!`
  String get invalidPackageName => 'Invalid app package name!';

  /// `Enter your first and last name [$name]: `
  @override
  String enterFullName(String name) =>
      'Enter your first and last name [$name]: ';

  /// `The name of your organizational unit [$unit]: `
  @override
  String enterOrgUnitName(String unit) =>
      'The name of your organizational unit [$unit]: ';

  /// `The name of your organization [$organization]: `
  @override
  String enterOrgName(String organization) =>
      'The name of your organization [$organization]: ';

  /// `The name of your City or Locality [$city]: `
  @override
  String enterCityOrLocality(String city) =>
      'The name of your City or Locality [$city]: ';

  /// `Enter the name of your State or Province or press Enter to skip [Moscow]: `
  @override
  String enterStateOrProvince(String state) =>
      'The name of your State or Province [$state]: ';
}
