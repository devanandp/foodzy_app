///Repository for Categories related actions

import 'package:foodzy/foodzy_app.dart';

class CategoriesRepository {
  final CategoriesService _categoriesService = CategoriesService();

  ///Get Categories response from Service and serialize into CategoriesModel
  Future<CategoriesModel> getCategories() async {
    final dynamic response = await _categoriesService.getCategories();
    final success = response['taxonomy_data'] != null;
    if (success) {
      final dynamic categoriesData = response;
      final categoriesDataSerialized = CategoriesModel.fromJson(categoriesData);
      return categoriesDataSerialized;
    } else {
      throw Exception('Failed to get data');
    }
  }

  ///Get individual Category details with respect to particular category on response from Service and serialize into CategoriesDetailModel
  Future<CategoryDetailsModel> getCategoryDetails(String categoryName) async {
    final dynamic response =
        await _categoriesService.getCategoryDetails(categoryName);
    final success = response['data'] != null;
    if (success) {
      final dynamic categoryDetailsData = response;
      final categoryDetailsDataSerialized =
          CategoryDetailsModel.fromJson(categoryDetailsData);
      return categoryDetailsDataSerialized;
    } else {
      throw Exception('Failed to get data');
    }
  }
}
