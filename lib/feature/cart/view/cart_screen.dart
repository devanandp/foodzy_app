import 'package:foodzy/foodzy_app.dart';

///UI for Cart SCreen
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    ///Provider object for Cart
    final cart = Provider.of<CartViewModel>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text('Cart',
            style: TextStyle(
                color: primaryBlack,
                fontSize: 24,
                fontWeight: FontWeight.w700)),
        elevation: 0,
      ),
      body: cart.items.isNotEmpty
          ? SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CartItemWidget(
                            productId:
                                cart.items.values.toList()[index].productId,
                            title: cart.items.values.toList()[index].title,
                            price: ((double.parse(cart.items.values
                                        .toList()[index]
                                        .price!)) /
                                    100)
                                .toString(),
                            quantity:
                                cart.items.values.toList()[index].quantity,
                          );
                        },
                        itemCount: cart.items.length,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              // Image border
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(30), // Image radius
                                child: Image.asset(LocalImages().delivery,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('Delivery',
                                  style: TextStyle(
                                      color: primaryBlack,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        ),
                        Text('€${cart.deliveryFee}',
                            style: const TextStyle(
                                color: primaryBlack,
                                fontSize: 24,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: Divider(
                        thickness: 0.7,
                        color: darkGrey.withOpacity(0.5),
                        endIndent: 5,
                        indent: 5,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Total:',
                            style: TextStyle(
                                color: primaryBlack,
                                fontSize: 24,
                                fontWeight: FontWeight.w700)),
                        Text('€${cart.orderFee.toString()}',
                            style: const TextStyle(
                                color: primaryBlack,
                                fontSize: 24,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      child: DottedLine(
                        dashColor: darkGrey,
                        lineThickness: 1,
                      ),
                    ),
                    ResizableButton(
                      buttonText:
                          'CHECKOUT                        €${cart.orderFee}',
                      buttonColor: primaryOrange,
                      buttonTap: () async {
                        showOrderPlacedModal(context);
                      },
                      buttonTextColor: primaryBlack,
                      horizontalPadding: 0,
                      verticalPadding: 20,
                      sizeFont: 18,
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.local_mall,
                      size: 45,
                      color: primaryOrange,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'No Items in Cart. Please explore the categories to add items to Cart',
                      style: TextStyle(
                          color: primaryBlack,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  ///Show the Modal when order is placed
  void showOrderPlacedModal(BuildContext context) async {
    final cart = Provider.of<CartViewModel>(context, listen: false);
    await showGeneralDialog(
        context: context,
        pageBuilder: (ctx, a1, a2) {
          return Container();
        },
        transitionBuilder: (ctx, a1, a2, child) {
          var curve = Curves.easeInOut.transform(a1.value);
          return Transform.scale(
            scale: curve,
            child: CustomDialog(
              dialogTitle: '                \n Congratulations!',
              body: Text(
                'Your order has been successfully placed for €${cart.orderFee} \n\n\n Explore more to serve your Hunger🎉',
                style: const TextStyle(
                  color: primaryBlack,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              actions: ResizableButton(
                buttonText: 'Back to Home',
                buttonColor: primaryOrange,
                buttonTap: () async {
                  cart.clearCart();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      AllRoutes().homeBase, (Route<dynamic> route) => false);
                },
                buttonTextColor: primaryBlack,
                horizontalPadding: 0,
                verticalPadding: 20,
                sizeFont: 18,
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
        barrierDismissible: false,
        barrierLabel: 'Dismissed');
  }
}
