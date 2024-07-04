import 'package:news/core/storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageImpl implements LocalStorage {
  final SharedPreferences _prefs;

  const LocalStorageImpl(this._prefs);

  static const String _keyLikedList = "likedList";

  @override
  List<String> get likedList => _prefs.getStringList(_keyLikedList) ?? [];

  @override
  set likedList(List<String> list) => _prefs.setStringList(_keyLikedList, list);
}
