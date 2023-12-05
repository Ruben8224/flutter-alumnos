// UserDataProvider.dart
import 'package:flutter/foundation.dart';

class UserDataProvider extends ChangeNotifier {
  String? _userName;
  String? _userMatricula;
  String? _userCarrera;

  // Add setters to update values
  set userName(String? value) {
    _userName = value;
    notifyListeners();
  }

  set userMatricula(String? value) {
    _userMatricula = value;
    notifyListeners();
  }

  set userCarrera(String? value) {
    _userCarrera = value;
    notifyListeners();
  }

  // Add getters to retrieve values
  String? get userName => _userName;
  String? get userMatricula => _userMatricula;
  String? get userCarrera => _userCarrera;
}
