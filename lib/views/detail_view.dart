import 'package:flutter/material.dart';
import 'package:mediaprobe/constants/helper.dart';
import 'package:mediaprobe/models/article.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key, required this.article});

  final Article article;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  bool isLoading = true;
  String bodyData = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var url = widget.article.url;
    if (url == null) return;
    bodyData = await Helper.getArticleData(url);
    isLoading = false;
    setState(() {});
  }

  String get url {
    try {
      return widget.article.media?.first.mediaMetadata?[2].url ?? "";
    } catch (e) {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      body: buildBody,
    );
  }

  AppBar get buildAppBar {
    return AppBar(title: const Text('Detail'));
  }

  Widget get buildBody {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImage,
          buildContent,
        ],
      ),
    );
  }

  Widget get buildImage {
    return url.isEmpty
        ? const SizedBox()
        : Image.network(
            url,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          );
  }

  Widget get buildContent {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle,
          const SizedBox(height: 8),
          buildDetail,
          const SizedBox(height: 16),
          buildArticleBody,
        ],
      ),
    );
  }

  Widget get buildTitle {
    return Text(
      widget.article.title ?? "",
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget get buildDetail {
    return Row(
      children: [
        const Icon(Icons.person, size: 16),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            widget.article.byline ?? "",
            style: const TextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(width: 10),
        const Icon(Icons.calendar_today, size: 16),
        const SizedBox(width: 4),
        Text(
          widget.article.publishedDate,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget get buildArticleBody {
    return Text(
      bodyData,
      style: const TextStyle(fontSize: 18),
    );
  }
}
