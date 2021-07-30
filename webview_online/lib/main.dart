import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
              initialUrl: 'http://codeseasy.com',
              javascriptMode: JavascriptMode.unrestricted)),
    );
  }
}
