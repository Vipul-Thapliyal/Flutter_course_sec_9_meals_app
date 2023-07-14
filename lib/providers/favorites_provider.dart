import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app_section_9/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]); // Way to initialized constructor by using : colon

  bool toggleMealFavoriteStatus(Meal meal) {
    /// You can not edit a value while using StateNotifier
    /// Can't add or remove items from list
    final mealIsFavorite = state.contains(meal);

    if(mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }
    else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
