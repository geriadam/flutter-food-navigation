import 'package:flutter/material.dart';
import 'package:flutter_food_navigation/fake_data.dart';
import 'package:flutter_food_navigation/models/Category.dart';
import 'package:flutter_food_navigation/models/Food.dart';
class FoodsPage extends StatelessWidget {
  static const String routeName = '/FoodsPage';
  Category category;
  FoodsPage({this.category});
  @override
  Widget build(BuildContext context) {
    Map<String, Category> arguments = ModalRoute.of(context).settings.arguments;
    this.category = arguments['category'];
    List<Food> foods = FAKE_FOODS.where((food) => food.categoryId == this.category.id).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Food\'s from ${category.content}'),
      ),
      body: Center(
        child: Center(
          child: ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, index) {
                Food food = foods[index];
                print(food.urlImage);
                return Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        clipBehavior: Clip.hardEdge,
                        child: Center(
                          child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/loading.gif',
                              image: food.urlImage
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 30,
                        left: 30,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2)
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.timer, color: Colors.white, size: 25),
                              Text('${food.duration.inMinutes} minutes',
                                style: TextStyle(fontSize: 22, color: Colors.white),
                              )
                            ],
                          ),
                        )
                    )
                  ],
                );
              }
          ),
        ),
      ),
    );
  }
}