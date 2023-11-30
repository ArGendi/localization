import 'package:shared_preferences/shared_preferences.dart';
class Cache{
  static late SharedPreferences sharedPrefeneces;

  static Future<void> init() async{
    sharedPrefeneces = await SharedPreferences.getInstance();
  }

  static Future<void> saveLanguage(String code) async{
    await sharedPrefeneces.setString('language', code);
  }

  static String? getLanguage(){
    return sharedPrefeneces.getString('language');
  }
}