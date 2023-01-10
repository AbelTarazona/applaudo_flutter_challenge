import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/core/app/db.dart';
import 'package:todo/core/utils/preferences.dart';

class GlobalStore {
  GlobalStore._internal();

  static final GlobalStore _instance = GlobalStore._internal();

  static GlobalStore get instance => _instance;

  String _apiToken = '';

  String get apiToken => _apiToken;

  //TODO: In REAL LIFE mode we can use SecureSharedPreference
  final SharedPreferences _sharedPreferences = DB.instance.prefs;

  Future<void> init() async {
    _apiToken = _sharedPreferences.getString(PreferencesHelper.token) ?? '';
  }

  Future<void> loginSession({required String token}) async {
    _apiToken = token;
    await _sharedPreferences.setString(PreferencesHelper.token, token);
  }

  Future<void> logOutSession() async {
    _apiToken = '';
    await _sharedPreferences.setString(PreferencesHelper.token, '');
  }
}
