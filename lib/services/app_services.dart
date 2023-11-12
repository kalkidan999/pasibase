import 'package:flutter/material.dart';
import 'package:pasibase_test/models/content_visibilty.dart';

class AppServices with ChangeNotifier{
  ContentVisiblity _contentVisiblity = ContentVisiblity();
  
   
  ContentVisiblity get isvisble => _contentVisiblity;
  bool _moreVisblity = false;
  bool get ismoreVisible => _moreVisblity;


  void show() {
    _contentVisiblity.showContent();
    notifyListeners();
  }

  void hide() {
   _contentVisiblity.hideContent();
    notifyListeners();
  }

  void showMore() {
   _moreVisblity = true;
    notifyListeners();
  }

  void hideMore() {
    _moreVisblity = false;
    notifyListeners();
  }

}