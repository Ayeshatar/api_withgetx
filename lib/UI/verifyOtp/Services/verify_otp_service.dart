
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/apiUrls.dart';

class VerifyOtpApiService {
  static Future otpService({
    required String otp,
  }) async {
    try {
      
    final prefs = await SharedPreferences.getInstance();
var headers = {
  'Content-Type': 'application/json'
};
var request = http.Request('POST', Uri.parse(ApiUrls.baseUrl + ApiUrls.VerifyOTPUrl));
request.body = json.encode({
  "email": prefs.getString("eemail"),
  "password_reset_token": otp
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
      Map mapBody = jsonDecode(responseBody);
        Get.snackbar(mapBody["title"].toString(), mapBody["message"].toString());
      return true;
      } else {
        Map mapBody = jsonDecode(responseBody);
        Get.snackbar(mapBody["title"].toString(), mapBody["message"].toString());
      return false;
      }
    } catch (e) {
      print(e);
    }
  }
}
