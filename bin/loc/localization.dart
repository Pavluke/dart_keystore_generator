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
}
