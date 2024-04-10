import 'package:flutter/cupertino.dart';
import 'package:power/Navigations/route_pathes.dart';

class MyRouteInformationParser extends RouteInformationParser<MyRoutePath>{
  @override
  Future<MyRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    // Parse the URI and extract the path
    if (uri.pathSegments.isEmpty) {
      print("uri1");
      return MyRoutePath.home(); // If it's the root URL
    } else if (uri.pathSegments.length == 1 && uri.pathSegments[0] == "dashboard") {
      print("uri2");
      return MyRoutePath.page(); // If it's '/page'
    } else {
      print("uri3");
      // Handle other routes or fallback to home
      return MyRoutePath.home();
    }

  }

  @override
  RouteInformation? restoreRouteInformation(MyRoutePath configuration) {
    if (configuration.isHomePage) {
      print("truueeeeeeeeeeeee");
      return  RouteInformation(uri:Uri.parse("/") );
    } else if (configuration.isPage) {
      print("falseeeeeeeeeeeeeeeeeee");

      return  RouteInformation(uri:Uri.parse("/dashboard"));
    }else{
      return  null;

    }



  }


}