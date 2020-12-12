import 'package:get/state_manager.dart';
import 'package:getx_demo/Models/Recipes.dart';
import 'package:getx_demo/Services/database.dart';

class RecipeController extends GetxController {
  Rx<List<Recipe>> recipeList = Rx<List<Recipe>>();

  List<Recipe> get recipe => recipeList.value;

  @override
  // ignore: must_call_super
  void onInit() {
    recipeList.bindStream(
      Database().recipeStream(),
    );
  }
}
