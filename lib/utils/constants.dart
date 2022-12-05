import 'package:foodzy/foodzy_app.dart';

///Primary colors used in app
const primaryBlack = Color(0xff181818);
const primaryOrange = Color(0xffffca51);
const primaryGrey = Color(0xfff2f3f5);
const darkGrey = Color(0xff9e9e9e);
const primaryGreen = Color(0xff019c00);
const primaryRed = Color(0xffff0626);

///Constant Strings for baseURL fetch from Server
String? baseURL = dotenv.env['BASE_URL'];

///*** Hardcoded Category Data ***
var taxonomyData = {
  "taxonomy_data": [
    {
      "id": 5,
      "taxonomy_id": 2,
      "parent_id": null,
      "_lft": 3,
      "_rgt": 4,
      "priority": null,
      "name": "Pasta",
      "slug": "pasta",
      "meta_title": "Pasta",
      "meta_keywords": null,
      "meta_description":
          "Pasta is a type of food made from a mixture of flour, eggs, and water that is formed into different shapes and then boiled.",
      "created_at": "2022-11-30T11:39:02.000000Z",
      "updated_at": "2022-11-30T16:31:49.000000Z",
      "taxonomy": {
        "id": 2,
        "name": "Food type",
        "slug": "food-type",
        "created_at": "2022-11-30T11:38:45.000000Z",
        "updated_at": "2022-11-30T11:38:45.000000Z"
      },
      "children": []
    },
    {
      "id": 4,
      "taxonomy_id": 2,
      "parent_id": null,
      "_lft": 1,
      "_rgt": 2,
      "priority": null,
      "name": "Pizza",
      "slug": "pizza",
      "meta_title": "Pizza",
      "meta_keywords": null,
      "meta_description":
          "A dish made typically of flattened bread dough spread with a savory mixture usually including tomatoes and cheese.",
      "created_at": "2022-11-30T11:38:56.000000Z",
      "updated_at": "2022-11-30T16:33:18.000000Z",
      "taxonomy": {
        "id": 2,
        "name": "Food type",
        "slug": "food-type",
        "created_at": "2022-11-30T11:38:45.000000Z",
        "updated_at": "2022-11-30T11:38:45.000000Z"
      },
      "children": []
    }
  ]
};
