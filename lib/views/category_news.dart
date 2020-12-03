import 'package:flutter/foundation.dart';
import'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/article_view.dart';
class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});
  @override
  _State createState() => _State();
}

class _State extends State<CategoryNews> {
  List<ArticleModel> articles=new List<ArticleModel>();
  bool _loading=true;
    void initState() {
    super.initState();
    getCategoryNews();

  }
  getCategoryNews() async{
    CategoryNewsClass newst=CategoryNewsClass();
    await newst.getNews(widget.category);
    articles=newst.news;
    setState(() {
      _loading=false;
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('FLUTTER'),
            Text('NEWS',
            style: TextStyle(
              color: Colors.blue
            ),
            ),
          ],
          ),
          actions: [
            Opacity(
              opacity:0,
              child:Container(
                padding: EdgeInsets.symmetric(horizontal:16),
                child:Icon(Icons.save)),
            )
          ],
          ),
          body: _loading ? Center(
                      child: Container(
              child:CircularProgressIndicator(),
              ),
          ): SingleChildScrollView(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal:16),
              child:Column(
                children: [
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
                ) ,
                ),
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
            blogUrl: url,

          )

        ));

      },
          child: Container(
        margin: EdgeInsets.only(bottom:16),
        child: Column(children: [
          ClipRRect(
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