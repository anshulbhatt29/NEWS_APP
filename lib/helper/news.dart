import 'dart:convert';//converting between data's.
import'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
class CategoryNewsClass{
  List<ArticleModel> news=[];
  Future<void> getNews(String category) async{
      String url="http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=7021bb35dee8497cb69ee2726ef7fe32";//api assume.
      var response= await http.get(url);
      var jsondata=jsonDecode(response.body);//convert jason to map.
      if(jsondata['status']=='ok'){
        jsondata['articles'].forEach((element)
        {
          if(element['urlToImage']!=null&&element['description']!=null)//same property name as in docs of api.
          {
            ArticleModel articleModel=ArticleModel(
              title:element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],

               );
               news.add(articleModel);

          }
        }
        );
      }

  }

}
class News{
  List<ArticleModel> news=[];
  Future<void> getNews() async{
      String url="http://newsapi.org/v2/top-headlines?country=in&apiKey=7021bb35dee8497cb69ee2726ef7fe32";
      var response= await http.get(url);
      var jsondata=jsonDecode(response.body);
      if(jsondata['status']=='ok'){//status code 200.
        jsondata['articles'].forEach((element)//property in api docs.
        {
          if(element['urlToImage']!=null&&element['description']!=null)
          {
            ArticleModel articleModel=ArticleModel(
              title:element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],

               );
               news.add(articleModel);

          }
        }
        );
      }

  }

}