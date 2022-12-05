///Services handling API Calls and provide the data related to Categories

import 'package:foodzy/foodzy_app.dart';
import 'package:http/http.dart' as http;

class CategoriesService {
  ///To get Categories associated with Taxonomy - food_type in the Categories listing screen
  Future getCategories() async {
    dynamic responseJson;
    try {
      responseJson = taxonomyData;
      debugPrint(responseJson.toString());
    } on UnauthorisedException {
      throw FetchDataException('Auth token Invalid');
    }
    return responseJson;
  }

  ///To get Category Details associated with Taxonomy - food_type in the Categories Detail screen
  Future getCategoryDetails(String categoryName) async {
    final url =
        '${baseURL!}api/products?filter[class]=food&filter[taxons]=$categoryName';
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      responseJson = returnResponse(response);
      debugPrint(responseJson.toString());
    } on UnauthorisedException {
      throw FetchDataException('Auth token Invalid');
    }
    return responseJson;
  }

  ///Mapping Responses based on Status code
  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 422:
        final Map responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server with status code : ${response.statusCode}');
    }
  }
}
