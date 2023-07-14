import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app_section_9/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});


