abstract class Localization {
  ///`Enter password for keystore: `
  String get enterPasswordOrPressEnter;

  ///`Listing keystore contents:`
  String get listingKeystore;

  /// `Password must be at least 6 characters long. Please try again.`
  String get passwordTooShort;

  /// `Passwords do not match. Please try again.`
  String get passwordsDontMatch;

  /// `Re-enter password for keystore: `
  String get reenterPassword;

  /// `Keystore and key.properties file generated successfully!`
  String get successMessage;

  /// `en`
  String get localCode;

  /// `Version: $version`
  String version(String version);

  /// `Enter app name: `
  String get enterPackageName;

  /// `App name must be not empty!`
  String get invalidPackageName;

  /// `Enter your first and last name [$name]: `
  String enterFullName(String name);

  /// `Enter the name of your organizational unit [$unit]: `
  String enterOrgUnitName(String unit);

  /// `Enter the name of your organization [$organization]: `
  String enterOrgName(String organization);

  /// `Enter the name of your City or Locality [$city]: `
  String enterCityOrLocality(String city);

  /// `Enter the name of your State or Province [$state]: `
  String enterStateOrProvince(String state);
}
