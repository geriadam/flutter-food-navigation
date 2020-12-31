import 'package:flutter/material.dart';
import 'package:flutter_food_navigation/foods_page.dart';
import 'package:flutter_food_navigation/models/Category.dart';
class CategoryItem extends StatelessWidget {
  Category category;
  CategoryItem({this.category});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Color _color = this.category.color;
    return InkWell(
      splashColor: Colors.deepPurple,
      onTap: () {
        /*Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FoodsPage(category: this.category))
        );*/
        Navigator.pushNamed(context, FoodsPage.routeName, arguments: {'category': category});
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(this.category.content, style: Theme.of(context).textTheme.title)
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _color.withOpacity(0.6),
              _color
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft
          ),
          color: _color,
          borderRadius: BorderRadius.circular(20)
        ),
      )
    );
  }
}