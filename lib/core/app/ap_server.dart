import 'package:todo/core/utils/constants.dart';

class APServer {
  static const String _apiIdentity =
      'https://identitytoolkit.googleapis.com/v1/accounts';
  static const String _apiFirebase =
      'https://firestore.googleapis.com/v1/projects/applaudo-todo-app/databases/(default)/documents/';

  static String login() =>
      '$_apiIdentity:signInWithPassword?key=${AppConstant.firebaseToken}';

  static String getTasks() =>
      '${_apiFirebase}tasks?key=${AppConstant.firebaseToken}';
}
