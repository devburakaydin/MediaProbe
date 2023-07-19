import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediaprobe/controllers/home_view_controller.dart';
import 'package:mediaprobe/widgets/cards/article_card.dart';

class HomeView extends GetView<HomeViewController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(builder: (_) {
      return Scaffold(
        appBar: buildAppBar,
        body: controller.articles.isEmpty
            ? buildCircularProgressIndicator
            : buildBody,
      );
    });
  }

  AppBar get buildAppBar {
    return AppBar(
      title: const Text("NY Times Most Popular"),
    );
  }

  Widget get buildCircularProgressIndicator {
    return const Center(child: CircularProgressIndicator());
  }

  Widget get buildBody {
    final articles = controller.articles;
    return ListView.separated(
      itemCount: articles.length,
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        final article = articles[index];
        return ArticleCard(
          article: article,
          onTap: controller.onTapArticleCard,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
    );
  }
}
