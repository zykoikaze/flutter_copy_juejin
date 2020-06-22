import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../routers/application.dart';
import '../util/util.dart';
import '../model/pins_cell.dart';
import '../widgets/in_text_dot.dart';
import 'package:share/share.dart';

class PinsListCell extends StatelessWidget{
  final PinsCell cellInfo;
  PinsListCell({Key key,this.cellInfo}):super(key:key);  
  @override
  Widget build(BuildContext context) {    
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderCell(cellInfo: cellInfo),
          Container(
            padding: EdgeInsets.only(left: 44.0),
            child: ContentCell(
              cellInfo.content
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 44.0),
            child: ImageListCell(cellInfo.pictures),
          ),
          cellInfo.topic!=null ? Container(
            padding: EdgeInsets.only(left: 44.0),
            child: TopicCell(topic: cellInfo.topic,),
          ) : Container(),
          Divider(),
          Container(
            height: 25.0,
            child: BottomCell(cellInfo: cellInfo,),
          )
        ],
      ),
    );
  }
}

class HeaderCell extends StatelessWidget{
  final PinsCell cellInfo;
  HeaderCell({Key key,this.cellInfo}):super(key:key);

  final TextStyle titleTextStyle = TextStyle(
    color: Color(0xffb2bac2),
    fontWeight: FontWeight.w300,
    fontSize: 11.0,
  );
  List<Widget> _renderListRow(){
    List<Widget> _listRow = new List();
    if(cellInfo.user.jobTitle.isNotEmpty){
      _listRow.add(ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 80.0
        ),
        child: Text(
          cellInfo.user.jobTitle,
          style: titleTextStyle,
          overflow: TextOverflow.ellipsis,
        ),
      ));
    }
    if(cellInfo.user.jobTitle.isNotEmpty && cellInfo.user.company.isNotEmpty){
      _listRow.add(Container(
        margin: EdgeInsets.symmetric(horizontal: 2.0),
        child: Text('@',style: titleTextStyle,),
      ));
    }
    if(cellInfo.user.company.isNotEmpty){
      _listRow.add(ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 80.0
        ),
        child: Text(
        cellInfo.user.company,
        style: titleTextStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      ));
    }
    if((cellInfo.user.jobTitle.isNotEmpty || cellInfo.user.company.isNotEmpty) && cellInfo.createdAt.isNotEmpty){
       _listRow.add(InTextDot());
    }
    if(cellInfo.createdAt.isNotEmpty){
      _listRow.add(Expanded(
        child: Text(
          Util.getTimeDutation(cellInfo.createdAt),
          style: titleTextStyle,
        )
      ));
    }
    return _listRow;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 38.0,
          height: 38.0,
          margin: EdgeInsets.only(right: 6.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(cellInfo.user.avatarLarge),
              fit: BoxFit.cover
            )
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(cellInfo.user.username),
              ),
              Row(
                children: _renderListRow(),
              )
            ],
          ),
        ),
        Container(
          width: 40.0,
          height: 20.0,
          child: FlatButton(
            onPressed: null,
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xff6cbd45)
              ),
              borderRadius: BorderRadius.circular(3)
            ),
            child: Text(
              '关注',
              style: TextStyle(
                color: Color(0xff6cbd45),
                fontSize: 12.0
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ContentCell extends StatelessWidget{
  final String content;
  ContentCell(this.content);
  @override
  Widget build(BuildContext context) {
    List<Widget> _content = new List();
    RegExp url = new RegExp(r"((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+");
    List listUrl = new List();
    List listString = content.split(url);
    Iterable<RegExpMatch> matches = url.allMatches(content);
    int urlIndex = 0;
    matches.forEach((url){
      listUrl.add(url.group(0));
    });
    listString.forEach((item){
      if(item.isEmpty){
        _content.add(LinkCell(listUrl[urlIndex]));
        urlIndex += 1;
      }else{
        _content.add(Text(
          item,
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
        ));
      }
    });
    return Wrap(
      children: _content,
    );
  }
}

class ImageListCell extends StatelessWidget{
  final pictures;
  ImageListCell(this.pictures); 
  String _buildPicsStr() {
    String picStr = '';
    pictures.forEach((ele) {
      picStr += '$ele,';
    });
    return picStr.substring(0, picStr.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    var _children = <Widget>[];
    double _picHeight = 150.0;
    if(pictures.length > 3){
      _picHeight = 90.0;
    }
    if(pictures.length > 0){
      for(int i = 0; i < pictures.length; i += 3){
        List<Widget> _tempRow = List();
        _tempRow.add(
          Expanded(
            child: InkWell(
              onTap: (){
                Application.router.navigateTo(
                  context, 
                  '/swip?pics=${Uri.encodeComponent(_buildPicsStr())}&currentIndex=${i.toString()}',
                  transition: TransitionType.fadeIn);
              },
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: _picHeight
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 8.0),
                  child: Image.network(
                    pictures[i],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            flex: 1,
          ),
        );
        if (i + 1 < pictures.length) {
          _tempRow.add(
            Expanded(
              child: InkWell(
                onTap: (){
                  Application.router.navigateTo(
                    context, 
                    '/swip?pics=${Uri.encodeComponent(_buildPicsStr())}&currentIndex=${(i + 1).toString()}',
                    transition: TransitionType.fadeIn
                  );
                },
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: _picHeight
                  ),
                  child: Container(
                    margin: EdgeInsets.only(right: 8.0),
                    child: Image.network(
                      pictures[i + 1],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              flex: 1,
            ),
          );
        }
        if (i + 2 < pictures.length) {
          _tempRow.add(
            Expanded(
              child: InkWell(
                onTap: (){
                  Application.router.navigateTo(
                    context, 
                    '/swip?pics=${Uri.encodeComponent(_buildPicsStr())}&currentIndex=${(i + 2).toString()}',
                    transition: TransitionType.fadeIn
                  );
                },
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: _picHeight
                  ),
                  child: Container(
                    margin: EdgeInsets.only(right: 8.0),
                    child: Image.network(
                      pictures[i + 2],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              flex: 1,
            ),
          );
        }
        _children.add(Container(
          child: Row(children: _tempRow,),
          margin: EdgeInsets.symmetric(vertical: 8.0),
        ));
      }      
    }
    return Wrap(
      children: _children,
    );
  }
}

class LinkCell extends StatelessWidget{
  final String linkUrl;
  LinkCell(this.linkUrl);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          Application.router.navigateTo(
            context, 
            "/web?url=${Uri.encodeComponent(linkUrl)}&title=${Uri.encodeComponent('掘金沸点')}");
        },
        child: Text(
          linkUrl,
          style: TextStyle(
            color: Colors.blue,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class BottomCell extends StatelessWidget{
  final PinsCell cellInfo;
  BottomCell({Key key,this.cellInfo}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,      
      children: <Widget>[
        FlatButton(
          onPressed: null, 
          child: Row(
            children: <Widget>[
              Icon(
                Icons.thumb_up,
                size: 15.0,
                color: Color(0xff8a93a0),
              ),
              Text(
                '${cellInfo.likeCount}',
                style: TextStyle(
                  color: Color(0xff8a93a0),
                  fontSize: 13.0
                ),
              )
            ],
          )
        ),
        SizedBox(
          height: 20.0,
          child: VerticalDivider(),
        ),
        FlatButton(
          onPressed: null, 
          child: Row(
            children: <Widget>[
              Icon(
                Icons.sms,
                size: 18.0,
                color: Color(0xff8a93a0),
              ),
              Text(
                '${cellInfo.commentCount}',
                style: TextStyle(color: Color(0xff8a93a0),),
              )
            ],
          )
        ),
        SizedBox(
          height: 20.0,
          child: VerticalDivider(),
        ),
        FlatButton(
          onPressed: (){
            final RenderBox box = context.findRenderObject();
            Share.share(cellInfo.content,
              subject: '测试分享',
              sharePositionOrigin:
                box.localToGlobal(Offset.zero) &
                  box.size);
          }, 
          child: Row(
            children: <Widget>[
              Icon(
                Icons.share,
                size: 18.0,
                color: Color(0xff8a93a0),
              ),
              Text(
                '分享',
                style: TextStyle(color: Color(0xff8a93a0),),
              )
            ],
          )
        )
      ],
    );
  }
}

class TopicCell extends StatelessWidget{
  final Map topic;
  TopicCell({this.topic});
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).primaryColor;
    return InkWell(
      onTap: null,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 1.5
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: textColor,
            width: 1.0
          ),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(15.0),
            right: Radius.circular(15.0)
          )
        ),
        child: Text(
          topic['title'],
          style: TextStyle(
            color: textColor,
            fontSize: 12.0
          ),
        ),
      ),
    );
  }
}