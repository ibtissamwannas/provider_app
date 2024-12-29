import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider_app/models/item.dart';

class ItemProvider with ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => UnmodifiableListView(_items);

  int get itemCount => _items.length;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }

  void toggleCheckbox(Item item) {
    item.toggleComplete();
    notifyListeners();
  }
}
