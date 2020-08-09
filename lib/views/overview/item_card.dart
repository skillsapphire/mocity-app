import 'package:flutter/material.dart';
import 'package:mocity/constants/ui_constants.dart';
import 'package:mocity/models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final Function press;
  const ItemCard({
    Key key,
    this.item,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              // For  demo we use fixed height  and width
              // Now we dont need them
               height: MediaQuery.of(context).size.height,
               width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: appPrimaryColor,
              ),
              child: Text(
                "${item.id} \n ${item.title} \n ${item.content}",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: appFontFamily, color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
             /* child: Hero(
                tag: "${item.id} \n ${item.title} \n ${item.content}",
                child: Image.asset(product.image),
              ),*/
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              item.title,
              style: TextStyle(fontFamily: appFontFamily, color: kTextColor, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          /*Text(
            "${item.content}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )*/
        ],
      ),
    );
  }
}
