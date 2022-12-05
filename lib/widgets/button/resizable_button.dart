import 'package:foodzy/foodzy_app.dart';

///Customized Button used across the app
class ResizableButton extends StatefulWidget {
  const ResizableButton(
      {Key? key,
      required this.buttonText,
      required this.buttonTextColor,
      required this.buttonColor,
      this.buttonBorderColor = Colors.transparent,
      required this.verticalPadding,
      this.fontWeight = FontWeight.w500,
      required this.horizontalPadding,
      required this.buttonTap,
      this.buttonIcon,
      this.sizeFont = 18,
      this.iconColor = Colors.black,
      this.mainAxisSize = MainAxisSize.max})
      : super(key: key);

  final String buttonText;
  final double sizeFont;
  final IconData? buttonIcon;
  final Color buttonTextColor;
  final Color iconColor;
  final Color buttonColor;
  final Color buttonBorderColor;
  final double verticalPadding;
  final double horizontalPadding;
  final FontWeight fontWeight;
  final MainAxisSize mainAxisSize;
  final void Function() buttonTap;

  @override
  _ResizableButtonState createState() => _ResizableButtonState();
}

class _ResizableButtonState extends State<ResizableButton> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: widget.buttonTap,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: widget.verticalPadding,
              horizontal: widget.horizontalPadding),
          decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: widget.buttonBorderColor),
          ),
          child: Row(
            mainAxisSize: widget.mainAxisSize,
            mainAxisAlignment: widget.buttonIcon != null
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              widget.buttonIcon != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 35, right: 16),
                      child: Icon(
                        widget.buttonIcon,
                        size: 17,
                        color: widget.iconColor,
                      ),
                    )
                  : const SizedBox.shrink(),
              Text(widget.buttonText,
                  overflow: TextOverflow.ellipsis,
                  textAlign: widget.buttonIcon != null
                      ? TextAlign.left
                      : TextAlign.center,
                  style: TextStyle(
                      fontWeight: widget.fontWeight,
                      color: widget.buttonTextColor,
                      fontSize: widget.sizeFont)),
            ],
          ),
        ),
      );
}
