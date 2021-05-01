import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_24x7/controller/news_controller.dart';
import 'package:news_24x7/screens/detail_news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ArticlesController articlesController = Get.put(ArticlesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Flutter",
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              ),
              Text(
                "News",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (articlesController.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else
                  return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: articlesController.articlesList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => ArticleDetail(index: index));
                          },
                          child: Container(
                            // height: 350,
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26, blurRadius: 3.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200.0,
                                  width: double.infinity,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: articlesController
                                        .articlesList[index].urlToImage,
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Center(
                                            child: new Text(
                                      'Unable to Load!',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                            articlesController
                                                .articlesList[index]
                                                .source
                                                .name,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8.0)),
                                      ),
                                    ),
                                    SizedBox(width: 80.0),
                                    Expanded(
                                      child: Text(
                                          DateTime.parse(articlesController
                                                  .articlesList[index]
                                                  .publishedAt
                                                  .toString())
                                              .toString()
                                              .substring(0, 10),
                                          style: TextStyle(fontSize: 10.0)),
                                    )
                                  ],
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                    articlesController
                                        .articlesList[index].title,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0))
                              ],
                            ),
                          ),
                        );
                      },
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1));
              }),
            )
          ],
        ));
  }
}
