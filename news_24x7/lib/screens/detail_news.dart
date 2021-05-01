import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_24x7/controller/news_controller.dart';

class ArticleDetail extends StatelessWidget {
  final ArticlesController articlesController = Get.find();
  final int index;
  ArticleDetail({this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articlesController.articlesList[index].title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: articlesController.articlesList[index].urlToImage,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Center(
                    child: new Text(
                  'Image Not Found!',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )),
              ),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(30.0)),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(articlesController.articlesList[index].source.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 8.0)),
              ),
            ),
            SizedBox(height: 8.0),
            Text(articlesController.articlesList[index].description,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0))
          ],
        ),
      ),
    );
  }
}
