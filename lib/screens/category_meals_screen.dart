import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealesScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;


  CategoryMealesScreen(this.availableMeals);

  @override
  _CategoryMealesScreenState createState() => _CategoryMealesScreenState();
}

class _CategoryMealesScreenState extends State<CategoryMealesScreen> {
    String categoryTitle;
    List<Meal> displayedMeals;
  @override
  void initStat() {
  //...
    super.initState();
  }
  @override
  void didChangeDependencies() {
    final routsArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routsArgs['title'];
    final categoryId = routsArgs['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMEal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id==mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            durtaion: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
