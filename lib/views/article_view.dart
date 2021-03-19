import 'dart:async';
import'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';//check this import.
class ArticleView extends StatefulWidget {
  final String blogUrl;
  ArticleView({this.blogUrl});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer=Completer<WebViewController>();
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
            ),
            ),
            Text('NEWS',
            style: TextStyle(
              color: Colors.cyanAccent
            ),
            ),
          ],
          ),
         /* actions: [
            Opacity(
              opacity:0,
              child:Container(
                padding: EdgeInsets.symmetric(horizontal:16),
                child:Icon(Icons.save)),
            )
          ],*/
          ),
       body:Container(
      child: WebView(//for running url in mobile without running in browser.
        initialUrl: widget.blogUrl,
        onWebViewCreated: ((WebViewController webViewController){
          _completer.complete(webViewController);
        }),
        ),
    ),
    );
  }
}