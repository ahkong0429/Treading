import 'package:flutter/material.dart';

class LoadModel with ChangeNotifier {
  bool _isloading = false;
  bool get isloading => _isloading;

  void startLoading() {
    _isloading = true;
    notifyListeners();
  }

  void endLoading() {
    _isloading = false;
    notifyListeners();
  }
}
