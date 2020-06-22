import 'package:flutter/material.dart';
import '../util/util.dart';
class ActivityUnit extends StatelessWidget{
  final cellInfo;
  ActivityUnit({this.cellInfo});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Color(0xffe6e8e8),width: 0.5)
          )
        ),
        child:Column(
          children: <Widget>[
            Container(
              width: Util.setPercentage(1.0, context),
              child: Image.network(
                cellInfo.screenshot,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 60,
                    child: Text(
                      cellInfo.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.date_range,
                        color: Color(0xff888888),
                        size: 20,
                      ),
                      Text(
                        Util.getWeek(cellInfo.startTime),
                        style: TextStyle(color: Color(0xff333333)),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Color(0xff888888),
                              size: 20,
                            ),
                            Text(
                              cellInfo.city,
                              style: TextStyle(color: Color(0xff333333)),
                            )
                          ],
                        )
                      ),
                      Container(
                        width: 120.0,
                        height: 30.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0)
                          )
                        ),
                        child: Text(
                          '报名参加',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}