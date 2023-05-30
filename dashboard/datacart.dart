import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'home.dart';

class DataCart extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<Photo> _items = [];

  /// An unmodifiable view of the items in the cart.
  List<Photo> get items => _items;

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(Photo item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}