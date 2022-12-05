///Defined the route strings to be used across the application as constant values in a Singleton Instance

class AllRoutes {
  factory AllRoutes() => _instance;

  AllRoutes._();

  static final AllRoutes _instance = AllRoutes._();

  String splash = '/splash';
  String homeBase = '/homeBase';
  String categoriesScreen = '/categoriesScreen';
  String categoryDetailScreen = '/categoryDetailScreen';
  String cartScreen = '/cartScreen';
}
