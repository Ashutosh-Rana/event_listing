import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final WebViewController webViewController;

  const WebViewScreen({super.key, required this.webViewController});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Container(
                    height: MediaQuery.of(context).size.height*.95,
                    child: WebViewWidget(controller: widget.webViewController)
                  ),
                ],
              ),
            ),
          ),)
    );
  }
}