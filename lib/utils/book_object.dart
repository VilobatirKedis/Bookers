class Book {
  String author;
  String title;

  Book(this.author, this.title);

  set setTitle(String _title) {
    title = _title;
  }

  set setAuthor(String _author) {
    author = _author;
  }
}