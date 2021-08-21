import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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
  InAppWebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
            child: Stack(
              fit: StackFit.expand,
              children: [
                InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: Uri.parse(widget.url),
                  ),
                  onWebViewCreated: (controller) =>
                      _webViewController = controller,
                ),
              ],
            ),
            onWillPop: () async {
              _webViewController!.goBack();
              return false;
            }),
      ),
    );
  }
}
