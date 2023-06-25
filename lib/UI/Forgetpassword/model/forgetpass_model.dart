class ForgetModel {
  ForgetModel({
    required this.success,
    required this.title,
    required this.message,
    required this.ForgetData,
  });
  late final bool success;
  late final String title;
  late final String message;
  late final Data ForgetData;

  ForgetModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    title = json['title'];
    message = json['message'];
    ForgetData = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['title'] = title;
    _data['message'] = message;
    _data['data'] = ForgetData.toJson();
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