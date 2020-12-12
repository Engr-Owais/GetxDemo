import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
  String recipe;
  String recipeId;
  Timestamp createdAt;
  bool status;
  List<dynamic> ingredients;

  Recipe();

  Recipe.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    recipeId = documentSnapshot.id;
    recipe = documentSnapshot.data()['recipe'];
    createdAt = documentSnapshot.data()['createdAt'];
    status = documentSnapshot.data()['status'];
    ingredients = documentSnapshot.data()['ingredients'];
  }
}
