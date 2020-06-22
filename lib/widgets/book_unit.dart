import 'package:flutter/material.dart';
import '../util/util.dart';
import 'in_text_dot.dart';
class BookListUnit extends StatelessWidget{
final cellInfo;
BookListUnit({this.cellInfo});
@override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Util.setPercentage(0.03, context),
          vertical: 15.0
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Color(0xffe6e8e8),width: 0.5)
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: Util.setPercentage(0.03,context)),
              child: Image.network(
                cellInfo.img,
                width: Util.setPercentage(0.2, context),
                height: 100.0,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      cellInfo.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xff343838),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 16.0,
                            height: 16.0,
                            margin: EdgeInsets.only(right: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(cellInfo.userData.avatarLarge),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 2.0),
                            child: Text(
                              cellInfo.userData.username,
                              style: TextStyle(color: Color(0xff343838),fontSize: 16.0),
                            ),
                          ),
                         Tag(level: cellInfo.userData.level),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '${cellInfo.lastSectionCount}小节',
                          style: TextStyle(color: Color(0xffb2bac2)),
                        ),
                        InTextDot(),
                        Text(
                          '${cellInfo.lastSectionCount}人已购买',
                          style: TextStyle(color: Color(0xffb2bac2)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
              decoration: BoxDecoration(
                color: Color(0xfff0f7ff),
                borderRadius: BorderRadius.all(Radius.circular(15.0))
              ),
              child: Text(
                '￥${cellInfo.price}',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16.0
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Tag extends StatelessWidget{
  final level;
  Tag({this.level});
  final List<Color> _colorList = <Color>[
    Color(0xff8CDBF4),
    Color(0xff6ECEFF),
    Color(0xff599DFF),
    Color(0xff34D19B),
    Color(0xffFFA000),
    Color(0xffF36262),
  ];
  @override
  Widget build(BuildContext context) {
    if(level == ''){
      return Container();
    }
    return Container(
      height: 10.0,
      padding: EdgeInsets.symmetric(horizontal: 1.0),
      decoration: BoxDecoration(
        color: _colorList[level-1],
        borderRadius: BorderRadius.all(Radius.circular(1.0))
      ),
      child: Text(
        'Lv$level',
        style: TextStyle(
          color: Colors.white,
          fontSize: 9.0,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}