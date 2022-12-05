import 'package:foodzy/foodzy_app.dart';

void main() {
  group('Testing Cart Provider', () {
    var cartItemForTest = CartViewModel();

    ///Unit test to add Burgers food type and test addItem Method in provider
    test('Burgers should be added', () {
      String foodType = 'Burgers';
      cartItemForTest.addItem(productId: '25', price: '25', title: foodType);
      expect(cartItemForTest.items['25']!.title! == 'Burgers', true);
    });

    ///Unit test to remove Burgers food type and test removeItem Method in provider
    test('Burgers should be deleted', () {
      cartItemForTest.removeItem('25');
      expect(cartItemForTest.items['25'] != null, false);
    });
  });
}
