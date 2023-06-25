class ApiUrls {
  static const String baseUrl = 'https://heraaviation.technerdstesting.net/';
  static const String version = 'v1';

  static const String singUpUrl = 'api/$version/signup';
  static const String verifyOTPUrl = 'api/$version/email/verify';

  static const String loginUrl = 'api/$version/login';
  static const String forgetUrl='api/$version/password/forgot';
  static const  String VerifyOTPUrl = 'api/$version/token/validate';
  static const String SetNewPasswordUrl = 'api/$version/password/reset';
}
