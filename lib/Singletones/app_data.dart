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
  String title = '';
  String body = '';
}

AppData appData = AppData();
