import 'package:get/state_manager.dart';
import 'package:news_24x7/modals/article_modals.dart';
import 'package:news_24x7/services/api_services.dart';

class ArticlesController extends GetxController {
  var isLoading = true.obs;
  var articlesList = List<Article>().obs;
  @override
  void onInit() {
    getArticles();
    super.onInit();
  }

  void getArticles() async {
    try {
      isLoading(true);
      var articles = await ApiServices.fetchNews();
      if (articles != null) {
        articlesList.value = articles;
      }
    } finally {
      isLoading(false);
    }
  }
}
