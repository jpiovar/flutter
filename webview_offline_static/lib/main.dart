// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:convert';
// import 'package:webview_flutter/webview_flutter.dart';

// void main() => runApp(WebViewTest());

// class WebViewTest extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _WebViewTestState();
//   }
// }

// class _WebViewTestState extends State<WebViewTest> {
//   //
//   late WebViewController _webViewController;
//   String filePath = 'files/test.html';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Webview Demo')),
//       body: WebView(
//         initialUrl: '',
//         javascriptMode: JavascriptMode.unrestricted,
//         onWebViewCreated: (WebViewController webViewController) {
//           _webViewController = webViewController;
//           _loadHtmlFromAssets();
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () {
//           _webViewController.evaluateJavascript('add(10, 10)');
//         },
//       ),
//     );
//   }

//   _loadHtmlFromAssets() async {
//     String fileHtmlContents = await rootBundle.loadString(filePath);
//     _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
//             mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
//         .toString());
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String filePath = 'assets/files/test.html';
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        // body: const Center(
        //   child: Text('Hello World'),
        // ),
        body: WebView(
          initialUrl: '',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
            _loadHtmlFromAssets();
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            _webViewController.evaluateJavascript('add(10, 10)');
          },
        ),
      ),
    );
  }

  _loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
