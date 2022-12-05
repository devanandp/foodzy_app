import 'package:foodzy/foodzy_app.dart';

class FoodzyApp extends StatelessWidget {
  const FoodzyApp({Key? key}) : super(key: key);

  ///App Build starts from here and Providers are instantiated
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: CategoriesViewModel()),
          ChangeNotifierProvider.value(value: CartViewModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            AllRoutes().splash: (context) => const SplashScreen(),
            AllRoutes().homeBase: (context) => const HomeBase(),
            AllRoutes().categoriesScreen: (context) => const CategoriesScreen(),
            AllRoutes().cartScreen: (context) => const CartScreen(),
          },
          initialRoute: AllRoutes().splash,
          title: 'Foodzy',
          theme: FoodzyAppCustomTheme().foodzyAppTheme(),
        ),
      );
}
