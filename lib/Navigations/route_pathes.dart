class MyRoutePath {
 const MyRoutePath.home() : isHomePage = true, isPage = false;

const  MyRoutePath.page() : isPage = true, isHomePage = false;

  final bool isHomePage;

  final   bool isPage;

}