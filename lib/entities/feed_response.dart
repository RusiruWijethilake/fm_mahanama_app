import 'package:fm_mahanama_app/entities/feed_item.dart';

class NewsFeedResponse {
  final List<FeedItem> feedItems;
  final String nextUrl;

  NewsFeedResponse(
    this.feedItems,
    this.nextUrl
  );

  List<FeedItem> get getFeedItems => feedItems;
  String get getNextUrl => nextUrl;

  static NewsFeedResponse fromJson(decodedData) {
    List<FeedItem> feedItems = [];
    String nextUrl = '';

    if (decodedData['data'] != null) {
      for (var item in decodedData['data']) {
        if (item['message'] != null) {
          feedItems.add(FeedItem(
            id: item['id'],
            createdAt: DateTime.parse(item['created_time']),
            message: item['message'],
            fullPicture: item['full_picture'] ?? '',
            permLink: item['permalink_url'],
          ));
        } else {
          feedItems.add(FeedItem(
            id: item['id'],
            createdAt: DateTime.parse(item['created_time']),
            message: '',
            fullPicture: item['full_picture'] ?? '',
            permLink: item['permalink_url'],
          ));
        }
      }
    }

    if (decodedData['paging'] != null) {
      nextUrl = decodedData['paging']['next'];
    }

    return NewsFeedResponse(feedItems, nextUrl);
  }
}