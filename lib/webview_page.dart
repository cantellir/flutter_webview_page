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
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return WillPopScope(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(widget.url),
          ),
          onWebViewCreated: (controller) => _webViewController = controller,
          onProgressChanged: (controller, progress) {
            if ((progress < 100) && (!isLoading)) {
              setState(() {
                isLoading = true;
              });
            }
            if (progress == 100) {
              setState(() {
                isLoading = false;
              });
            }
          },
        ),
        onWillPop: () async {
          _webViewController!.goBack();
          return false;
        });
  }
}
