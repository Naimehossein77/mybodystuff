import 'package:get/get.dart';

class AppData {
  //make it singleTone class
  static final AppData _singleton = AppData._internal();
  factory AppData() {
    return _singleton;
  }
  AppData._internal();
  //code starts from here
  String token = '';
  // String token =
  //     "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI5NDQ3NDcxNzAxIiwic2NvcGVzIjpbeyJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dLCJpc3MiOiJodHRwOi8vZXpib3QuY29tIiwiaWF0IjoxNjkwMzcwMjIzLCJleHAiOjE3MjE5MDYyMjN9.V1M-w1goPvK5UgwLrMOgX3C6v_Tf7kmE6EGQodVW2MM";
  RxString title = ''.obs;
  RxString body = ''.obs;

  String id = '';
  String serial = '';
  String name = '';

  getProdFromParamToAppData(Map<String, String> json) async {
    if (json['id'] == null || json['serial'] == null || json['name'] == null) {
      return;
    }
    id = json['id']??'';
    serial = json['serial']??'';
    name = json['name']??'';
  }
}

AppData appData = AppData();
