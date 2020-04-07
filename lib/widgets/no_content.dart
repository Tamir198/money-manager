import 'package:flutter/cupertino.dart';

class NoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text("No transactions added"),
      SizedBox(height: 18,),
      Container(
        height: 200,
        child: Image.asset(
            "images/no_content.png",
            fit: BoxFit.fitWidth),
      )
    ],);
  }
}
