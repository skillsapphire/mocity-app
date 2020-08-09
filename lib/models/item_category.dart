import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ItemCategory{

  int id;
  String name;

  ItemCategory({this.id, this.name});

  factory ItemCategory.fromJson(dynamic itemCategory) => _$ItemCategoryFromJson(itemCategory);
}

ItemCategory _$ItemCategoryFromJson(dynamic json) {

  int id = json["id"];
  String name = json["name"];
  
  return ItemCategory(
    id: id,
    name: name
  );
}