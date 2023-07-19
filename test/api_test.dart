import 'package:flutter_test/flutter_test.dart';
import 'package:mediaprobe/services/api_service.dart';

void main() {
  test('Get Most Popular Articles', () async {
    final articles = await ApiService.fetchMostPopularArticles();

    expect(articles.isNotEmpty, true);
  });
}
