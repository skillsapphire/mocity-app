
import 'package:mocity/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mocity/constants/app_constants.dart';
import 'package:mocity/models/item_category.dart';

class ItemCategoryService{

  Future<APIResponse<List<ItemCategory>>> getItemCategoryList(var menu) {
    
    var categoryUrl = "newscategory";
    if(menu=='Doctors'){
      categoryUrl = "doctorcategory";
    }else if(menu=='News'){
      categoryUrl = "newscategory";
    }else if(menu=='Explore'){
      categoryUrl = "listingcategory";
    }else if(menu=='Emergency'){
      categoryUrl = "emergencycategory";
    }else if(menu=='Covid-19'){
      categoryUrl = "covid19";
    }else if(menu=='Healthcare'){
      categoryUrl = "healthcategory";
    }else if(menu=='Education'){
      categoryUrl = "educationcategory";
    }else if(menu=='Tourism'){
      categoryUrl = "tourismcategory";
    }else if(menu=='Shopping'){
      categoryUrl = "shoppingcategory";
    }
    return http.get(API_BASE_URL + '/$categoryUrl/?_fields=id,name').then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        final itemCategories = <ItemCategory>[];
        for (var itemCategory in jsonData) {
          ItemCategory itemCategoryModel = ItemCategory.fromJson(itemCategory);
          itemCategories.add(itemCategoryModel);
        }
        return APIResponse<List<ItemCategory>>(data: itemCategories);
      }
      return APIResponse<List<ItemCategory>>(error: true, errorMessage: 'An error occured while fetching categories');
    })
    .catchError((_) => APIResponse<List<ItemCategory>>(error: true, errorMessage: 'An error occured while fetching categories'));
  }

}