
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';


class InfoPage extends StatelessWidget {

 // final String imageUrl;
final Article noticias;
const InfoPage( this.noticias);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _TarjetaNoticia(noticias)
      
    );
  }
}
class _TarjetaNoticia extends StatelessWidget {
  final Article noticias;
 
   _TarjetaNoticia( this.noticias);
  final Completer<WebViewController> _completer= Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: noticias.url,
      onWebViewCreated: (WebViewController webViewController){
        _completer.complete(webViewController);
      },
    );
  }
}