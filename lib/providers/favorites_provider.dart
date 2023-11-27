import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

//Add initiall values + values to change the values in that list
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  //set initial list in the notifier
  FavoriteMealsNotifier() : super([]);

  //Methods to edit this list data
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    //If a meal is a favorite we have to remove it without .remove
    //We can then set the state we will keep the meal id
    //the id is not equal to the meal being passed in as an argument
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      //return false if removed
      return false;
    } //else add to the list
    else {
      state = [...state, meal];
      //Return ture is added 
      return true;
    }
  }
} 

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
