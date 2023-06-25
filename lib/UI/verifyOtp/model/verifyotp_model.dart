class VerifyOtpModel {
  VerifyOtpModel({
    required this.success,
    required this.title,
    required this.message,
    required this.verifyData,
  });
  late final bool success;
  late final String title;
  late final String message;
  late final Data verifyData ;

  VerifyOtpModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    title = json['title'];
    message = json['message'];
    verifyData = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['title'] = title;
    _data['message'] = message;
    _data['data'] = verifyData.toJson();
    return _data;
  }
}

class Data {
  Data();

  Data.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}