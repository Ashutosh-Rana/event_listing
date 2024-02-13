import 'package:event_list/screens/event_screen.dart';
import 'package:event_list/screens/web_view.dart';
import 'package:event_list/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EventRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case eventRoute:
        final String args = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => EventScreen(
                  categoryData: args,
                ));

      case webViewRoute:
        final args = settings.arguments as WebViewController;
        return MaterialPageRoute(
            builder: (_) => WebViewScreen(
                  webViewController: args,
                ));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
