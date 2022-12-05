import 'package:foodzy/foodzy_app.dart';

///App Init
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  runApp(const FoodzyApp());
}
