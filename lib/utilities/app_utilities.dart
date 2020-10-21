import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isLoggedIn() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool isLoggedIn = pref.getBool("isloggedin");
  if (isLoggedIn == null || isLoggedIn == false) {
    return false;
  }
  return true;
}
