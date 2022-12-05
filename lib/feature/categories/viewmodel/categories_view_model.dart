///Categories related Provider containing getters and setters

import 'package:foodzy/foodzy_app.dart';

class CategoriesViewModel extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  ApiResponse get response => _apiResponse;

  ///Categories data related ViewModel
  CategoriesModel? _categoriesModel;

  ///Method to get Categories List and associate with View
  Future getCategories() async {
    debugPrint('Get Category List');

    _apiResponse = ApiResponse.loading('Getting Category List');
    try {
      final CategoriesModel categoriesModel =
          await CategoriesRepository().getCategories();
      setCategories(categoriesModel);
      debugPrint("Came here");

      _apiResponse = ApiResponse.completed(categoriesModelGetter);
    } on UnauthorisedException catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  ///Setter for Categories List
  void setCategories(CategoriesModel? categoriesModel) {
    _categoriesModel = categoriesModel;
    notifyListeners();
  }

  ///Getter for Exercise List
  CategoriesModel get categoriesModelGetter => _categoriesModel!;

  ///Categories data related ViewModel
  CategoryDetailsModel? _categoryDetailsModel;

  ///Method to get Category Details List and associate with View
  Future getCategoryDetails(String categoryName) async {
    debugPrint('Get Category Details List');

    _apiResponse = ApiResponse.loading('Getting Category List');
    try {
      final CategoryDetailsModel categoryDetailsModel =
          await CategoriesRepository().getCategoryDetails(categoryName);
      setCategoryDetails(categoryDetailsModel);
      _apiResponse = ApiResponse.completed(categoryDetailsModelGetter);
    } on UnauthorisedException catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  ///Setter for Categories List
  void setCategoryDetails(CategoryDetailsModel? categoryDetailsModel) {
    _categoryDetailsModel = categoryDetailsModel;
    notifyListeners();
  }

  ///Getter for Categories List
  CategoryDetailsModel get categoryDetailsModelGetter => _categoryDetailsModel!;
}
