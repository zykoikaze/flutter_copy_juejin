import 'package:flutter/material.dart';
class IndexListHeader extends StatelessWidget{
  final bool hasLogin;
  IndexListHeader(this.hasLogin);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '热门文章',
                style: TextStyle(
                  color: Color(0xff434343),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              FlatButton(
                onPressed: (){

                }, 
                child: Text(
                  '查看更多',
                  style: TextStyle(
                    color: Color(0xff757575)
                  ),
                )
              ),                
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}