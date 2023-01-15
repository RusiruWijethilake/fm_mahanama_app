class FeedItem {
  final String id;
  final DateTime createdAt;
  final String message;
  final String fullPicture;
  final String permLink;

  FeedItem({
    required this.id,
    required this.createdAt,
    required this.message,
    required this.fullPicture,
    required this.permLink,
  });

  String get getId => id;
  DateTime get getCreatedAt => createdAt;
  String get getMessage => message;
  String get getFullPicture => fullPicture;
  String get getPermLink => permLink;
}