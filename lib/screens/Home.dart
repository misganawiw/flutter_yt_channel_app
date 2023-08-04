import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});
//   late WebViewController _controller;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Title'),
//         ),
//         body: WebView(
//           initialUrl: 'https://flutter.io',
//           javascriptMode: JavascriptMode.unrestricted,
//         ));
//   }
// }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //late WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://davejimma.com/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
