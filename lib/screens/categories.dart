import 'package:flutter/material.dart';
import 'package:meals_app_section_9/data/dummy_data.dart';
import 'package:meals_app_section_9/models/category.dart';
import 'package:meals_app_section_9/models/meal.dart';
import 'package:meals_app_section_9/screens/meals.dart';
import 'package:meals_app_section_9/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
    {
      Key? key,
      required this.onToggleFavorite,
      required this.availableMeals,
    }
  ) : super(key: key);

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
    // dummyMeals ek list hai Meals ki, is list ki har ek meal check hogi
    // Meal mey ek list hai categories
    // Agar meal ki categories list mey pass ho rahi category ki id hui
    // Toh uss meal ko return kar doh jis meal ki category id match ho jaaye
    // woh saari meals return unky jinky category id match hogi
    // ek list ban jaegi

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( // Cross Axis Left to right
          crossAxisCount: 2, // No of columns in grid, Horizontally two columns
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20, // Spacing between coloumns, Horizontal Spacing
          mainAxisSpacing: 20, // Vertical Spacing
        ),
        children: [
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
          for(final category in availableCategories)
            // availableCategories list me ek ek category select hogi, us sey grid ka element banega
            // jis grid pe tap hoga uska category object pass hoga CategoryGridItem ko, onSelectCategory() function ko
            CategoryGridItem( /// Displays a grid item
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
    );
  }
}
