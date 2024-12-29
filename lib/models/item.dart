class Item {
  final String item;
  bool complete;
  Item({required this.item, this.complete = false});

  void toggleComplete() {
    complete = !complete;
  }
}
