
import 'package:mocity/models/api_response.dart';
import 'package:mocity/models/item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mocity/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemService{
  
  SharedPreferences _prefs;
  int _cityId = 3;

  Future<APIResponse<List<Item>>> getItemList(var categoryId, var menu) async {

    _prefs = await SharedPreferences.getInstance();
    _cityId = _prefs.getInt('cityId');
    
    var fields = '_fields=id,listingtitle,listingsubtitle,listingdescription,contactno,alternateno,alternateno2,email,alternateemail,source,sourceurl,listingimage1,listingimage2,address';
    var itemUrl = "newscategory";
    if(menu=='Doctors'){
      itemUrl = "doctor";
    }else if(menu=='News'){
      itemUrl = "news";
      fields = '_fields=id,newstitle,newssubtitle,newsdescription,newssource';
    }else if(menu=='Explore'){
      itemUrl = "listing";
    }else if(menu=='Emergency'){
      itemUrl = "emergency";
    }else if(menu=='Covid-19'){
      itemUrl = "covid-19";
    }else if(menu=='Healthcare'){
      itemUrl = "healthcare";
    }else if(menu=='Education'){
      itemUrl = "education";
    }else if(menu=='Tourism'){
      itemUrl = "tour";
    }else if(menu=='Shopping'){
      itemUrl = "shop";
    }

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

    return http.get(API_BASE_URL + '/$itemUrl?per_page=10&$categoryUrl=$categoryId&city=$_cityId&$fields').then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        final items = <Item>[];
        for (var item in jsonData) {
          //print(item["listingtitle"]);
          Item itemModel = Item.fromJson(item, menu);
          items.add(itemModel);
        }
        return APIResponse<List<Item>>(data: items);
      }
      return APIResponse<List<Item>>(error: true, errorMessage: 'An error occured while fetching listings');
    })
    .catchError((_) => APIResponse<List<Item>>(error: true, errorMessage: 'An error occured while fetching listings'));
  }

}