// ignore_for_file: prefer_typing_uninitialized_variables

class AppExceptions implements Exception {
  final message;

  AppExceptions([this.message]);

  @override
  String toString() {
    return '$message';
  }
}

class InternetExceptions extends AppExceptions {
  InternetExceptions([String? message]) : super('No Internet');
}

class RequestExceptions extends AppExceptions {
  RequestExceptions([String? message]) : super('Request Exception');
}

class ServerExceptions extends AppExceptions {
  ServerExceptions([String? message]) : super(message);
}

class AuthoricationExceptions extends AppExceptions {
  AuthoricationExceptions([String? message]) : super(message);
}


class TimeOutExceptions extends AppExceptions {
  TimeOutExceptions([String? message]) : super('Api time out');
}

class FetchDataExceptions extends AppExceptions {
  FetchDataExceptions([String? message]) : super(message);
}


class InvalidUrlExceptions extends AppExceptions {
  InvalidUrlExceptions([String? message]) : super(message);
}
