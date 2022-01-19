import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {

  late WebViewController _controller;

  final Completer<WebViewController> _controllerCompleter =
  Completer<WebViewController>();
  //Make sure this function return Future<bool> otherwise you will get an error
  Future<bool> _onWillPop(BuildContext context) async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: SafeArea(
        child: Scaffold(
          body: WebviewScaffold(
            url: Uri.encodeFull("https://www.agrasenbhagwan.org/index.php"),
            withZoom: true,
            withLocalStorage: true,
            withJavascript: true,
            enableAppScheme: true,
            // withLocalUrl: true,
            supportMultipleWindows: true,
            appCacheEnabled: true,
            allowFileURLs: true,
            ignoreSSLErrors: true,
            // hidden: true,
            // initialChild: Container(
            //   color: Colors.redAccent,
            //   child: const Center(
            //     child: Text('Waiting.....'),
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}


// WebView(
// initialUrl: "https://lionsbusinessnetwork.org/",
// javascriptMode: JavascriptMode.unrestricted,
// key: UniqueKey(),
// allowsInlineMediaPlayback: true,
// onWebViewCreated: (WebViewController webViewController) {
// _controllerCompleter.future.then((value) => _controller = value);
// _controllerCompleter.complete(webViewController);
// },
// userAgent: "HSPMUserAgent",
// ),