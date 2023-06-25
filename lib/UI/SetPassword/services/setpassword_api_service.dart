
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apiget/UI/SetPassword/controller/set_password_controller.dart';
import '../../../common/apiUrls.dart';
import '../../../common/appTexts.dart';
import '../../login/view/loginscreen.dart';
import '../../verifyOtp/binding/verifyotp_binding.dart';
import '../../verifyOtp/view/verifyotpscreen.dart';


class SetPasswordApiService {
  var isLoading = false.obs;
  static Future setPassword({

    required String confirmpassword,
    required String newpassword,


  }) async {
    try {
      
    final prefs = await SharedPreferences.getInstance();

var headers = {
  'Content-Type': 'application/json'
};
    var request = http.Request('POST', Uri.parse( ApiUrls.baseUrl + ApiUrls.forgetUrl));
request.body = json.encode({
  "device_id": "uuid_of_device",
  "password_reset_token": prefs.getString("ootp"),
  "password": newpassword,
  "password_confirmation": confirmpassword
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

