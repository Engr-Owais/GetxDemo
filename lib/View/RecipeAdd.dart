import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/Controllers/RecipeController.dart';
import 'package:getx_demo/View/RecipeForm.dart';

class AddRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD RECIPE"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                Get.to(
                  RecipeForm(),
                );
              },
              color: Colors.blueAccent,
              child: Text("Create Recipe"),
            ),
          ),
          GetX<RecipeController>(
              init: Get.put<RecipeController>(RecipeController()),
              // ignore: missing_return
              builder: (RecipeController recipeController) {
                if (recipeController != null &&
                    recipeController.recipe != null) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: recipeController.recipe.length,
                      itemBuilder: (_, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 2.0,
                              color: Colors.white70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      recipeController.recipe[index].recipe,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Column(
                                    children: recipeController
                                        .recipe[index].ingredients
                                        .map(
                                          (element) => Text(
                                            "INGREDIENTS" +
                                                "\n" +
                                                element['name'] +
                                                "\n\n\nQUANTITY\n" +
                                                element['qty'],
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Text("loading...");
                }
              }),
        ],
      ),
    );
  }
}
