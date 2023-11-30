import 'package:shared_preferences/shared_preferences.dart';
class Cache{
  static late SharedPreferences sharedPrefeneces;

  static Future<void> init() async{
    sharedPrefeneces = await SharedPreferences.getInstance();
  }

  // save language in shared preferences
  static Future<void> saveLanguage(String code) async{
    await sharedPrefeneces.setString('language', code);
  }

  // get language value in shared preferences
  static String? getLanguage(){
    return sharedPrefeneces.getString('language');
  }
}