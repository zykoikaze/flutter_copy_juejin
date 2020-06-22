import 'package:flutter/material.dart';
import '../model/index_cell.dart';
import '../routers/application.dart';
import '../widgets/in_text_dot.dart';

class IndexListCell extends StatelessWidget{
  final IndexCell cellInfo;
  IndexListCell({Key key,this.cellInfo}):super(key:key);

  final TextStyle titleTextStyle = TextStyle(
    color: Color(0xffb2bac2),
    fontWeight: FontWeight.w300,
    fontSize: 13.0
  );

  List<Widget> _buildFirstRow(){
    List<Widget> _listRow = new List();
    if(cellInfo.hot){
      _listRow.add(Text(
        '热',
        style: TextStyle(
          color: Color(0xfff53040),
          fontWeight: FontWeight.w600
        ),
      ));
      _listRow.add(InTextDot());
    }
    if(cellInfo.isCollection == 'post'){
      _listRow.add(Text(
        '专栏',
        style: TextStyle(
          color: Color(0xffbc30da),
          fontWeight: FontWeight.w600
        ),
      ));
      _listRow.add(InTextDot());
    }
    _listRow.add(Text(cellInfo.username,style: titleTextStyle,));
    _listRow.add(InTextDot());
    _listRow.add(Text(cellInfo.createTime,style: titleTextStyle,));
    _listRow.add(InTextDot());
    _listRow.add(Expanded(
      child: Text(
        cellInfo.tag,
        style: titleTextStyle,
        overflow: TextOverflow.ellipsis,
      )
    ));
    return _listRow;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 20.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _buildFirstRow(),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 9.0),
            child: InkWell(
              onTap: (){
                Application.router.navigateTo(
                  context,
                  '/detail?title=${Uri.encodeComponent(cellInfo.title)}&id=${Uri.encodeComponent(cellInfo.detailUrl)}'
                );
              },
              child: Text(
                cellInfo.title,
                style: TextStyle(
                  color: Color(0xff393c3f),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Cell([
            InCell(Icons.star, cellInfo.collectionCount),
            InCell(Icons.speaker_notes, cellInfo.commentsCount)
          ]),
          SizedBox(
            height: 15.0,
          ),
          Divider(
            height: 2.0,
          )
        ],
      ),
    );
  }
}

class Cell extends StatelessWidget{
  final List<InCell> list;
  Cell(this.list);  
  @override
  Widget build(BuildContext context) {
    List<Widget> children = list.map(
    (item)=>Container(
      height: 20.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffb2bac2),
          
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            item.icon,
            size: 13.0,
            color: Color(0xffb2bac2),
          ),
          Text(
            '${item.count}',
            style: TextStyle(
              color: Color(0xffb2bac2),
              fontWeight: FontWeight.w300,
              fontSize: 12.0
            ),
          )
        ],
      ),
    )
  ).toList();
    return Row(
      children:children,
    );
  }
}

class InCell{
  IconData icon;
  int count;
  InCell(this.icon,this.count);
}