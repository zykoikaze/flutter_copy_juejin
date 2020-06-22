import 'package:flutter/material.dart';
class LoadMore extends StatelessWidget{
  final bool hasMore;
  LoadMore(this.hasMore);
  @override
  Widget build(BuildContext context) {
    if(hasMore){
      return Container(
        height: 70.0,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container(
      child: Center(
        child: Text(
          '亲，我也是有底线的',
          style: TextStyle(
            color: Theme.of(context).accentColor
          ),
        ),
      ),
    );
  }
}