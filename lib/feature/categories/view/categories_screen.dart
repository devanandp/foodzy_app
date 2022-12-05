import 'package:foodzy/foodzy_app.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int selectedIndex = 0;
  String? foodName = 'Pasta';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: selectedIndex == 0
            ? AppBar(
                title: const Center(
                  child: Text('Categories',
                      style: TextStyle(
                          color: primaryBlack,
                          fontSize: 24,
                          fontWeight: FontWeight.w700)),
                ),
                elevation: 0,
              )
            : null,
        body: IndexedStack(
          index: selectedIndex,
          children: [
            getCategoriesList(context),
            getDetailsForCategory(foodName!, context)
          ],
        ));
  }

  ///Method to get Categories(Taxonomies) - ** Hardcoded for now **
  Widget getCategoriesList(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: AsyncBuilder<CategoriesModel>(
          builder: (context, value) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 25, mainAxisSpacing: 25),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                      foodName = value.taxonomyData![index].name;
                    });
                  },
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: primaryBlack,
                        ),
                        color: Colors.white),
                    child: Center(
                      child: ListView(
                        padding: const EdgeInsets.all(10),
                        children: [
                          Image.asset(
                            value.taxonomyData![index].name == 'Pasta'
                                ? LocalImages().pasta
                                : LocalImages().pizza,
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              value.taxonomyData![index].name!,
                              style: const TextStyle(
                                color: primaryBlack,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: value!.taxonomyData!.length,
            );
          },
          future: getCategories(context),
          waiting: (context) => const CircularProgressIndicator(
            color: primaryOrange,
          ),
        ),
      );

  ///Method to get Categories Detailed List with respect to each Category
  Widget getDetailsForCategory(String foodName, BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Stack(
          children: [
            Stack(
              children: [
                Image.asset(
                  foodName == 'Pasta'
                      ? LocalImages().pasta
                      : LocalImages().pizza,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 50,
                  left: 10,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
              ],
            ),
            Positioned(
              top: 100,
              left: 30,
              child: Text(foodName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        AsyncBuilder<CategoryDetailsModel>(
          builder: (context, value) {
            final List<Widget> foodListing = [];
            for (int i = 0; i < value!.data!.length; i++) {
              foodListing.add(Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (value.data![i].variants![0].product!.metaFields !=
                                        null &&
                                    value.data![i].variants![0].product!
                                        .metaFields!.isNotEmpty)
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(value.data![i].title!,
                                        style: const TextStyle(
                                            color: primaryBlack,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500)),
                                  )
                                : Text(value.data![i].title!,
                                    style: const TextStyle(
                                        color: primaryBlack,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500)),
                            (value.data![i].variants![0].product!.metaFields !=
                                        null &&
                                    value.data![i].variants![0].product!
                                        .metaFields!.isNotEmpty)
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Proteins',
                                                style: TextStyle(
                                                    color: primaryBlack,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text(
                                                '${value.data![i].variants![0].product!.metaFields![2].value} gr',
                                                style: const TextStyle(
                                                    color: primaryBlack,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Carbohydrate',
                                                style: TextStyle(
                                                    color: primaryBlack,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text(
                                                '${value.data![i].variants![0].product!.metaFields![3].value} gr',
                                                style: const TextStyle(
                                                    color: primaryBlack,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Fibre',
                                                style: TextStyle(
                                                    color: primaryBlack,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text(
                                                '${value.data![i].variants![0].product!.metaFields![4].value} gr',
                                                style: const TextStyle(
                                                    color: primaryBlack,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          children: [
                                            CircularProgressIndicator(
                                              value: getCaloriesProgress(value
                                                  .data![i]
                                                  .variants![0]
                                                  .product!
                                                  .metaFields![1]
                                                  .value
                                                  .toString()),
                                              color: getCaloriesProgressColor(
                                                  value
                                                      .data![i]
                                                      .variants![0]
                                                      .product!
                                                      .metaFields![1]
                                                      .value),
                                              backgroundColor: primaryGrey,
                                            ),
                                            Positioned(
                                              top: 10,
                                              left: 10,
                                              child: Text(
                                                  '${value.data![i].variants![0].product!.metaFields![1].value.toString()} \nkCal',
                                                  style: const TextStyle(
                                                      color: primaryBlack,
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                : const SizedBox(
                                    height: 20,
                                  ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _buildChip(value, i, context),
                                (value.data![i].variants![0].price != null)
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30.0),
                                        child: Text(
                                            '${value.data![i].variants![0].price!.formatted}',
                                            style: const TextStyle(
                                                color: darkGrey,
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal)),
                                      )
                                    : const Text('€1.00',
                                        style: TextStyle(
                                            color: darkGrey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal)),
                              ],
                            )
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          // Image border
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(40), // Image radius
                            child: Image.asset(
                                foodName == 'Pasta'
                                    ? LocalImages().pasta
                                    : LocalImages().pizza,
                                fit: BoxFit.cover),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 0.7,
                    color: darkGrey.withOpacity(0.5),
                    endIndent: 10,
                    indent: 10,
                  ),
                ],
              ));
            }
            return Column(
              children: [
                ...foodListing,
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: ResizableButton(
                    buttonText: 'Proceed to Cart',
                    buttonColor: primaryOrange,
                    buttonTap: () async {
                      Navigator.of(context).pushNamed(AllRoutes().cartScreen);
                    },
                    buttonTextColor: primaryBlack,
                    horizontalPadding: 0,
                    verticalPadding: 20,
                    sizeFont: 18,
                  ),
                ),
              ],
            );
          },
          future: getCategoryDetails(foodName, context),
          waiting: (context) => const CircularProgressIndicator(
            color: primaryOrange,
          ),
        ),
      ]),
    );
  }

  ///Widget for Quantity Chip and related actions included
  Widget _buildChip(CategoryDetailsModel categoryDetailsModel, int index,
      BuildContext context) {
    ///Provider instance for cart related actions
    final cart = Provider.of<CartViewModel>(context);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: primaryGrey),
      margin: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (cart.items.isNotEmpty &&
                  cart.items[categoryDetailsModel.data![index].id.toString()] !=
                      null) {
                ((cart.items[categoryDetailsModel.data![index].id.toString()]!
                                .quantity! -
                            1) >
                        0)
                    ? cart.removeQuantity(
                        productId:
                            categoryDetailsModel.data![index].id.toString(),
                        title: categoryDetailsModel.data![index].title,
                        price: categoryDetailsModel
                                    .data![index].variants![0].price !=
                                null
                            ? (categoryDetailsModel
                                    .data![index].variants![0].price!.amount) ??
                                1
                            : 1000)
                    : cart.removeItem(
                        categoryDetailsModel.data![index].id.toString());
              }
            },
            icon: const Icon(
              Icons.remove,
              size: 20,
              color: primaryBlack,
            ),
          ),
          Text(
            (cart.items[categoryDetailsModel.data![index].id.toString()] != null
                    ? cart
                        .items[categoryDetailsModel.data![index].id.toString()]!
                        .quantity!
                    : '0')
                .toString(),
            style: const TextStyle(color: primaryBlack, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          Center(
            child: IconButton(
              onPressed: () {
                cart.addItem(
                    productId: categoryDetailsModel.data![index].id.toString(),
                    title: categoryDetailsModel.data![index].title,
                    price:
                        categoryDetailsModel.data![index].variants![0].price !=
                                null
                            ? (categoryDetailsModel
                                    .data![index].variants![0].price!.amount) ??
                                100
                            : 100);
              },
              icon: const Icon(
                Icons.add,
                size: 20,
                color: primaryBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///Helper method to get Category Details from Server - Backend Action included
  Future<CategoryDetailsModel>? getCategoryDetails(
      String categoryName, BuildContext context) async {
    CategoryDetailsModel? categoriesDetailData;

    await Provider.of<CategoriesViewModel>(context, listen: false)
        .getCategoryDetails(categoryName);

    final ApiResponse apiResponse =
        Provider.of<CategoriesViewModel>(context, listen: false).response;

    if (apiResponse.status == Status.completed) {
      categoriesDetailData =
          Provider.of<CategoriesViewModel>(context, listen: false)
              .categoryDetailsModelGetter;

      return categoriesDetailData;
    }
    return categoriesDetailData!;
  }

  ///Get Calories Progress Values for Progress Indicator
  double getCaloriesProgress(String value) => double.parse(value) / 1000;

  ///Fetch respective color for Progress Indicator
  Color getCaloriesProgressColor(int value) {
    return value > 800
        ? primaryRed
        : (value >= 501 && value <= 800)
            ? primaryOrange
            : primaryGreen;
  }

  ///Helper method to get Categories data from Server - Backend Action included
  Future<CategoriesModel>? getCategories(BuildContext context) async {
    CategoriesModel? categoryListData;

    await Provider.of<CategoriesViewModel>(context, listen: false)
        .getCategories();

    final ApiResponse apiResponse =
        Provider.of<CategoriesViewModel>(context, listen: false).response;

    if (apiResponse.status == Status.completed) {
      categoryListData =
          Provider.of<CategoriesViewModel>(context, listen: false)
              .categoriesModelGetter;

      return categoryListData;
    }
    return categoryListData!;
  }
}
