import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Container(
      margin: EdgeInsets.fromLTRB(20, paddingTop + 10, 20, 5),
      padding: EdgeInsets.fromLTRB(20, 30, 20, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19), color: Colors.white60
      ),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
