import 'package:foodzy/foodzy_app.dart';

///Customized Model used across the app
class CustomDialog extends StatefulWidget {
  const CustomDialog(
      {Key? key,
      required this.dialogTitle,
      this.image,
      required this.body,
      required this.actions})
      : super(key: key);

  final String dialogTitle;
  final Widget? image;
  final Widget body;
  final Widget actions;

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Material(
        type: MaterialType.transparency,
        elevation: 25,
        shadowColor: primaryGrey,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, //buttonGrey,
                borderRadius: BorderRadius.circular(24)),
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(LocalImages().successGif, height: 250),
                  if (widget.dialogTitle.isNotEmpty)
                    Text(
                      widget.dialogTitle,
                      style: const TextStyle(
                          color: primaryBlack,
                          fontSize: 21,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.justify,
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  widget.image ?? const SizedBox.shrink(),
                  widget.body,
                  const SizedBox(
                    height: 25,
                  ),
                  widget.actions
                ],
              ),
            ),
          ),
        ),
      );
}
