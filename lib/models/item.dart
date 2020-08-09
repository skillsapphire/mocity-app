import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Item {
  
  int id;
  String title;
  String subtitle;
  String content;
  String contactNo;
  String alternateNo;
  String alternateNo2;
  String email;
  String alternateEmail;
  String address;
  
  Item({this.id, this.title, this.subtitle, this.content, this.contactNo, this.alternateNo, this.alternateNo2, this.email, this.alternateEmail, this.address});

  factory Item.fromJson(dynamic item, menu) => _$ItemFromJson(item, menu);
}

Item _$ItemFromJson(dynamic json, menu) {
  //print("json ${json}");
  //print(json["id"].runtimeType);
  int id; String title; String subtitle; String content;
  String contactNo;
  String alternateNo;
  String alternateNo2;
  String email;
  String alternateEmail;
  String address;

    if(menu=='Explore'){
      id = json["id"];
      title = json["listingtitle"];
      content = json["listingdescription"];
    }else if(menu=='Covid-19'){
      id = json["id"];
      title = json["listingtitle"];
      content = json["listingdescription"];
      contactNo = json["contactNo"];
      alternateNo = json["alternateNo"];
      email = json["email"];
      alternateEmail = json["alternateEmail"];
    }else{
      id = json["id"];
      title = json["listingtitle"];
      subtitle = json["listingsubtitle"];
      content = json["listingdescription"];
      contactNo = json["contactNo"];
      alternateNo = json["alternateNo"];
      alternateNo2 = json["alternateNo2"];
      email = json["email"];
      alternateEmail = json["alternateEmail"];
      address = json["address"];
    }
  
  
  return Item(
    id: id,
    title: title,
    subtitle: subtitle,
    content: content,
    contactNo: contactNo,
    alternateNo: alternateNo,
    alternateNo2: alternateNo2,
    email: email,
    alternateEmail: alternateEmail,
    address: address
  );
}

Map<dynamic, dynamic> _$ItemToJson(Item instance) => <dynamic, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content
    };