import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/views/category_news.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories =new List<CategoryModel>();
  List<ArticleModel> articles =new List<ArticleModel>();
  bool loading=true; 
  @override
  void initState() {
    super.initState();
    categories=getCategories();
    getNews();

  }
  getNews() async{
    News newst=News();
    await newst.getNews();
    articles=newst.news;
    setState(() {
      loading=false;
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ANIME ',
               style: TextStyle(
              color: Colors.cyanAccent
            ),),
            Text('NEWS',
            style: TextStyle(
              color: Colors.cyanAccent
            ),
            ),
          ],),
          ),
          body: loading ? Center(
                      child: Container(
              child:CircularProgressIndicator(),
              ),
          ): SingleChildScrollView(
                      child: Container(
                         //padding: EdgeInsets.symmetric(horizontal:16),
                         padding: EdgeInsets.all(16.0),
              child: Column(
                //category
                children: [
                  Container(
                    height: 80,
                    child: ListView.builder(
                      itemCount: categories.length,
                      shrinkWrap: true,//
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(context,index){
                        return CategoryTiles( 
                          imageurl: categories[index].imageurl,
                          categoryname: categories[index].categoryName,
                        );
                      }

                    ),
                  ),
                  SizedBox(height: 10,),
                  //Blogs
                  Container(
                    padding: EdgeInsets.only(top:16),
                    child: ListView.builder(
                      itemCount: articles.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context,index){
                        return BlogTile(
                          imageurl: articles[index].urlToImage,
                          title: articles[index].title,
                          descp: articles[index].description,
                          url: articles[index].url,
                          );
                      },
                    ),
                    )
                  
                ],
                ),
            ),
          ),

    );
  }
}
class CategoryTiles extends StatelessWidget {
  final String imageurl,categoryname;
  CategoryTiles({this.imageurl,this.categoryname});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(
          builder:(context)=> CategoryNews(
            category:categoryname.toLowerCase(),
          )
        )
        );

      },
          child: Container(
        margin: EdgeInsets.only(right:16),
       // child: Stack(//overlay for.
       child:Column(
          children:[
          //  ClipRRect(
            //  borderRadius: BorderRadius.circular(6), child:
               CachedNetworkImage(
                imageUrl:imageurl,width: 120,height: 60,),//fit: BoxFit.cover,
              //  ),
        /*    Container(
              alignment: Alignment.center,
              width: 120,height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color:Colors.grey[100],
                ),

              child:Text(categoryname,style: TextStyle(
                color:Colors.white ,
                fontSize: 14,
                ),
              ),
              )*/
              Text(
                categoryname,style: TextStyle(
                color:Colors.black,
                fontSize: 14,

              ),
              textAlign:TextAlign.center,
              ),
          ]
        )   
      ),
    );
  }
}
class BlogTile extends StatelessWidget {
  final String imageurl,title,descp,url;
  BlogTile({this.imageurl,this.title,this.descp,this.url});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>ArticleView(
            blogUrl: url,// main url.

          )

        ));

      },
          child: Container(
        margin: EdgeInsets.only(bottom:16),
        child: Column(children: [
          ClipRRect(// used for image display in circular form.
            borderRadius: BorderRadius.circular(6),

            child: Image.network(imageurl)
            ),
            
            SizedBox(height: 8,),

          Text(title,style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
            fontWeight: FontWeight.w600, 
            ),
            ),
           SizedBox(height: 8,),

          Text(descp,style: TextStyle(
            color: Colors.black54
          ),),
        ],),
        
      ),
    );
  }
}