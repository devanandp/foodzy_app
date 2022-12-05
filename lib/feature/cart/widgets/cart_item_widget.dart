import 'package:foodzy/foodzy_app.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget(
      {Key? key, this.title, this.price, this.quantity, this.productId})
      : super(key: key);

  final String? productId;
  final String? title;
  final String? price;
  final int? quantity;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    ///Provider instance for Cart related actions
    final cart = Provider.of<CartViewModel>(context);

    return Column(
      children: [
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
                    child: Image.asset(
                        widget.title!.contains('Pasta')
                            ? LocalImages().pasta
                            : LocalImages().pizza,
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text('${widget.quantity}',
                          style: const TextStyle(
                              color: primaryBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      const Text('   x',
                          style: TextStyle(
                              color: primaryBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      Container(
                        width: 160,
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          '   ${widget.title}(€${widget.price})',
                          style: const TextStyle(
                              color: primaryBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                    '€${double.parse((double.parse(widget.price!) * widget.quantity!).toStringAsPrecision(2))}',
                    style: const TextStyle(
                        color: darkGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
                IconButton(
                    onPressed: () {
                      cart.removeItem(widget.productId!);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 25,
                      color: primaryRed,
                    )),
              ],
            ),
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
      ],
    );
  }
}
