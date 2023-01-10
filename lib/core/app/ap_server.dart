class APServer {
  static const String _apiIdentity =
      'https://identitytoolkit.googleapis.com/v1/accounts';
  static const String _apiFirebase =
      'https://firestore.googleapis.com/v1/projects/applaudo-todo-app/databases/(default)/documents/';

  static String login(String firebaseApiKey) =>
      '$_apiIdentity:signInWithPassword?key=$firebaseApiKey';

  static String getTasks(String firebaseApiKey) =>
      '${_apiFirebase}tasks?key=$firebaseApiKey';
}
