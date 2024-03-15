class Item {
  String title;
  String id;
  bool isDone;

  Item({required this.title, required this.id, required this.isDone});

  void toggleDone() {
    isDone = !isDone;
  }
}
