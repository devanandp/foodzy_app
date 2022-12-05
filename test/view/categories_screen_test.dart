import 'package:foodzy/foodzy_app.dart';

Widget createHomeScreen() => ChangeNotifierProvider<CartViewModel>(
      create: (context) => CartViewModel(),
      child: const MaterialApp(home: CartScreen()),
    );

void main() {
  group('Cart Page Widget Tests', () {

    ///Widget test to find a Widget having the text as Cart
    testWidgets('Testing Cart screen Title', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Cart'), findsOneWidget);
    });
  });
}
