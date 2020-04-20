import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<List<String>> getnotes() async {
    SharedPreferences prefs = await _prefs;
    return (prefs.getStringList('notes') ?? []);
  }

  void saveNotes({List<String> notes}) async {
    SharedPreferences prefs = await _prefs;
    prefs.setStringList('notes', notes);
  }
}