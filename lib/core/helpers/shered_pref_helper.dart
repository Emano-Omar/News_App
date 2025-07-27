import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper{

  SharedPrefHelper._();

  static removeData(String key) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }

  static saveData(String key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    switch(value.runtimeType)
    {
      case String:
        await sharedPreferences.setString(key, value);
        break;
      case int:
        await sharedPreferences.setInt(key, value);
        break;
      case bool:
        await sharedPreferences.setBool(key, value);
        break;
      case double:
        await sharedPreferences.setDouble(key, value);
        break;
      default:
        return null;
    }
  }

  static getBool(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getBool(key) ?? false;
  }
}