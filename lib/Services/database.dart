import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_demo/Models/Recipes.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addrecipe(Recipe recipe) async {
    try {
      await _firestore.collection('recipes').add(
        {
          'createdAt': Timestamp.now(),
          'status': recipe.status,
          'recipe': recipe.recipe,
          'ingredients': recipe.ingredients
        },
      );
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Stream<List<Recipe>> recipeStream() {
    return _firestore
        .collection('recipes')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<Recipe> retVal = List();
      query.docs.forEach((element) {
        retVal.add(Recipe.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}
