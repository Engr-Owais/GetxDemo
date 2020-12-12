import 'package:flutter/material.dart';

class DynamicWidget extends StatelessWidget {
  final TextEditingController ingcontroller = new TextEditingController();
  final TextEditingController qntcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(8.0),
      child: Expanded(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: new TextField(
                controller: ingcontroller,
                decoration: new InputDecoration(hintText: 'Ingrideient'),
              ),
            ),
            Expanded(
              child: new TextField(
                controller: qntcontroller,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(hintText: 'Qty'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
