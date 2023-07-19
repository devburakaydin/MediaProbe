import 'package:get/get.dart';
import 'package:mediaprobe/models/article.dart';
import 'package:mediaprobe/services/api_service.dart';
import 'package:mediaprobe/views/detail_view.dart';

class HomeViewController extends GetxController {
  List<Article> articles = [];

  @override
  void onInit() {
    super.onInit();
    getMostPopularArticle();
  }

  Future<void> getMostPopularArticle() async {
    articles = await ApiService.fetchMostPopularArticles();
    articles.sort((a, b) => b.publishedDate.compareTo(a.publishedDate));
    update();
  }

  Future<void> onTapArticleCard(Article article) async {
    Get.to(() => DetailView(article: article));
  }
}
