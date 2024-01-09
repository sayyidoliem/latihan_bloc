import 'package:shared_preferences/shared_preferences.dart';

//add
Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('data', 0);
}

//get
Future<int?> getNumber() async {
  final prefs = await SharedPreferences.getInstance();
  final data = prefs.getInt('data');
  return data;
}

//remove
Future<void> removeData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('data');
}
