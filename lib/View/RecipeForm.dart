import 'package:flutter/material.dart';
import 'package:getx_demo/Models/Recipes.dart';
import 'package:getx_demo/Services/database.dart';
import 'package:getx_demo/Widgets/DynamicWidgetTextField.dart';

class RecipeForm extends StatefulWidget {
  @override
  _RecipeFormState createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  List<DynamicWidget> listDynamic = [];
  final List ingrediants = new List();
  List<String> data = [];
  TextEditingController _recipeController = TextEditingController();

  Icon floatingIcon = new Icon(Icons.add);

  addDynamic() {
    if (data.length != 0) {
      floatingIcon = new Icon(Icons.add);

      data = [];
      listDynamic = [];
      print('if');
    }
    setState(() {});
    if (listDynamic.length >= 100) {
      return;
    }
    listDynamic.add(new DynamicWidget());
  }

  submitData() {
    floatingIcon = new Icon(Icons.arrow_back);
    data = [];
    listDynamic.forEach(
      (widget) => ingrediants.addAll([
        {'name': widget.ingcontroller.text, 'qty': widget.qntcontroller.text}
      ]),
    );
    setState(() {});
    final Recipe recipe = new Recipe();

    recipe.recipe = _recipeController.text;
    recipe.status = true;
    recipe.ingredients = ingrediants;
    Database().addrecipe(recipe);
    print(ingrediants);
  }

  @override
  Widget build(BuildContext context) {
    Widget result = new Flexible(
        flex: 1,
        child: new Card(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      padding: new EdgeInsets.only(left: 10.0),
                      child: new Text("${index + 1} : ${data[index]}"),
                    ),
                    new Divider()
                  ],
                ),
              );
            },
          ),
        ));

    Widget dynamicTextField = new Flexible(
      flex: 2,
      child: new ListView.builder(
        itemCount: listDynamic.length,
        itemBuilder: (_, index) => listDynamic[index],
      ),
    );

    Widget submitButton = new Container(
      child: new RaisedButton(
        onPressed: submitData,
        child: new Padding(
          padding: new EdgeInsets.all(16.0),
          child: new Text('Submit Data'),
        ),
      ),
    );

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Dynamic App'),
        ),
        body: new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextField(
                  controller: _recipeController,
                  decoration: new InputDecoration(hintText: 'Enter Recipe'),
                ),
              ),
              data.length == 0 ? dynamicTextField : result,
              data.length == 0 ? submitButton : new Container(),
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: addDynamic,
          child: floatingIcon,
        ),
      ),
    );
  }
}
