///Creates the Home base for Tab Navigations

import 'package:foodzy/foodzy_app.dart';

class HomeBase extends StatefulWidget {
  const HomeBase({Key? key, this.pageIndex}) : super(key: key);

  @override
  State<HomeBase> createState() => _HomeBaseState();
  final int? pageIndex;
}

class _HomeBaseState extends State<HomeBase> {
  int _selectedIndex = 0;
  bool isDataConnected = true;
  static final List<Widget> _pages = <Widget>[
    const CategoriesScreen(),
    const CartScreen(),
  ];

  Map<int, GlobalKey> navigatorKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.pageIndex ?? 0;
  }

  ///Set State value according to ItemTapped on BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  ///Handling back action from Home base screen for app exit
  Future<bool> _onWillPop() async {
    if (_selectedIndex == 0) {
      return await showDialog(
          context: context,
          builder: (BuildContext context) => CustomDialog(
              dialogTitle: 'Foodzy Says',
              body: const Text('Do you really want to exit the app?',
                  style: TextStyle(
                    color: primaryBlack,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )),
              actions: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ResizableButton(
                    buttonText: 'No',
                    buttonTextColor: Colors.white,
                    buttonColor: primaryBlack,
                    verticalPadding: 8,
                    horizontalPadding: 50,
                    buttonTap: () {
                      Navigator.of(context).pop(false);
                    },
                    buttonBorderColor: primaryBlack,
                  ),
                  const SizedBox(width: 20),
                  ResizableButton(
                    buttonText: 'Yes',
                    buttonTextColor: Colors.white,
                    buttonColor: primaryBlack,
                    verticalPadding: 8,
                    buttonBorderColor: primaryBlack,
                    horizontalPadding: 50,
                    buttonTap: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              )));
    } else {
      setState(() {
        _selectedIndex = 0;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    ///Provider instance for Cart related actions
    final cart = Provider.of<CartViewModel>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: _pages.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: primaryOrange),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 25,
                color: _selectedIndex == 0 ? primaryOrange : darkGrey,
              ),
              label: _selectedIndex == 0 ? '.' : '',
              backgroundColor: primaryOrange,
            ),
            BottomNavigationBarItem(
              icon: cart.cartQuantity > 0
                  ? Badge(
                      badgeColor: _selectedIndex == 1 ? primaryRed : darkGrey,
                      badgeContent: Text(cart.cartQuantity.toString(),
                          style: const TextStyle(color: primaryBlack)),
                      borderRadius: BorderRadius.circular(0.5),
                      shape: BadgeShape.circle,
                      position: BadgePosition.bottomEnd(),
                      child: Icon(
                        Icons.local_mall,
                        size: 25,
                        color: _selectedIndex == 1 ? primaryOrange : darkGrey,
                      ),
                    )
                  : Icon(
                      Icons.local_mall,
                      size: 25,
                      color: _selectedIndex == 1 ? primaryOrange : darkGrey,
                    ),
              label: _selectedIndex == 1 ? '.' : '',
              backgroundColor: primaryBlack,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: primaryOrange,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
