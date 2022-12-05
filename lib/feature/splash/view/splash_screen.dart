///A simple splash screen appearing at the app initialisation

import 'package:foodzy/foodzy_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed(AllRoutes().homeBase));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          LocalImages().logo,
          height: 300,
          width: 300,
        ),
      ),
    );
  }
}
