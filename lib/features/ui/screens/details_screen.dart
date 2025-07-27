import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:news_app/features/data/models/articles.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.articles});
  final Articles articles;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _initWebView();
  }

  void _initWebView() {
    final url = widget.articles.url;
    final validUrl = (url != null && Uri.tryParse(url)?.hasAbsolutePath == true)
        ? url
        : 'https://example.com';

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(_buildNavigationDelegate())
      ..loadRequest(Uri.parse(validUrl));
  }

  NavigationDelegate _buildNavigationDelegate() {
    return NavigationDelegate(
      onProgress: (int progress) {
        debugPrint('Loading progress: $progress%');
      },
      onPageStarted: (String url) {
        debugPrint('Page started loading: $url');
      },
      onPageFinished: (String url) {
        debugPrint('Page finished loading: $url');
      },
      onWebResourceError: (WebResourceError error) {
        debugPrint('Error: ${error.description}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error loading page: ${error.description}")),
        );
      },
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.articles.title ?? 'No Title'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
