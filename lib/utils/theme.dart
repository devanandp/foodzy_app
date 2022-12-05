import 'package:foodzy/foodzy_app.dart';

class FoodzyAppCustomTheme {
  factory FoodzyAppCustomTheme() => _instance;

  FoodzyAppCustomTheme._();

  static final FoodzyAppCustomTheme _instance = FoodzyAppCustomTheme._();

  ///Theme for Foodzy App
  ThemeData foodzyAppTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: _foodzyAppColorTheme,
      primaryColor: Colors.white,
      backgroundColor: Colors.white,
      toggleableActiveColor: primaryOrange,
      buttonTheme: ButtonThemeData(
        colorScheme: _foodzyAppColorTheme,
        textTheme: ButtonTextTheme.normal,
      ),
      primaryIconTheme: _foodzyAppCustomIconTheme(base.iconTheme),
      textTheme: _foodzyAppTextTheme(base.textTheme),
      primaryTextTheme: _foodzyAppTextTheme(base.primaryTextTheme),
      iconTheme: _foodzyAppCustomIconTheme(base.iconTheme),
    );
  }

  ///ColorScheme used default in Foodzy App
  final ColorScheme _foodzyAppColorTheme = const ColorScheme(
    primary: Colors.white,
    secondary: primaryGrey,
    surface: Colors.white,
    background: Colors.white,
    error: Colors.red,
    onPrimary: primaryOrange,
    onSecondary: Colors.white,
    onSurface: primaryBlack,
    onBackground: Colors.white,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  double defaultLetterSpacing = 0.03;

  ///Custom Icon Theme for Foodzy App
  IconThemeData _foodzyAppCustomIconTheme(IconThemeData original) =>
      original.copyWith(color: primaryOrange);

  ///Custom Text Theme for Foodzy App
  TextTheme _foodzyAppTextTheme(TextTheme base) => base
      .copyWith(
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Inter-Regular',
        displayColor: Colors.white,
        bodyColor: Colors.white,
      );
}
