import 'package:internet_connection_checker/internet_connection_checker.dart';

//* I'm using InternetConnectionChecker instead of DataConnectionChecker cuz the later doesn't support null safty
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;
  NetworkInfoImpl(this._internetConnectionChecker);
  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}
