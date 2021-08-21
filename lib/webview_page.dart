import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  final String url;
  const WebviewPage({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  @override
  Widget build(BuildContext context) {
    return WebView(initialUrl: widget.url);
  }
}
