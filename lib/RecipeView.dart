import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeView extends StatefulWidget {
  String url;
  RecipeView(this.url);

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {

  late String finalUrl;
  final Completer<WebViewController> controller = Completer<WebViewController>();

  @override
  void initState(){
    super.initState();
    if(widget.url.toString().contains("http://")){
      finalUrl = widget.url.toString().replaceAll("http://", "https://");
    }
    else{
      finalUrl = widget.url;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("Your Recipe"),
      ),
      body: Container(
        child: WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..currentUrl()
        ),
        ),
    );
  }
}
