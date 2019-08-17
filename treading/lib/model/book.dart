import 'package:flutter/cupertino.dart';

class Book with ChangeNotifier {
  String title;
  String cate;
  String catename;
  String author;
  String description;
  String info;
  String lastchapter;
  String lastcid;
  String thumb;
  String updatetime;
  String status;

  Book(
      this.title,
      this.cate,
      this.catename,
      this.author,
      this.description,
      this.info,
      this.lastchapter,
      this.lastcid,
      this.thumb,
      this.updatetime,
      this.status);
}

class BookList with ChangeNotifier {
  List<Book> _list = [];
  Book _active;

  List<Book> get list => _list;
  Book get active => _active;

  void setList(List<Book> data) {
    _list = data;
    notifyListeners();
  }

  void appendList(List<Book> data) {
    _list..addAll(data);
    notifyListeners();
  }

  void setActiveBook(Book book) {
    _active = book;
    notifyListeners();
  }
}
