import 'package:flutter/material.dart';
import '../model/book_list_cell.dart';
import '../util/data_utils.dart';
import 'book_unit.dart';
import 'load_more.dart';
class BookTabView extends StatefulWidget{
 final String alias;
  BookTabView({this.alias});
  @override
  State<StatefulWidget> createState() {
    return _BookTabViewState();
  }
}
class _BookTabViewState extends State<BookTabView>{
  List<BookListCell> bookList = <BookListCell>[];
  int pageIndex = 1;
  bool isRequesting = false;
  bool hasMore = true;
  getBookList(bool isLoadMore){
    if(isRequesting || !hasMore) return;
    if(!isLoadMore){
      pageIndex = 1;
    }
    isRequesting = true;
    DataUtils.getBookListData(pageIndex,widget.alias).then((result){
      pageIndex+=1;
      List<BookListCell> _resuleList = new List();
      if(isLoadMore){
        _resuleList.addAll(bookList);
      }
      _resuleList.addAll(result);
      if(mounted){
        setState(() {
          bookList = _resuleList;
          isRequesting = false;
          hasMore = result.length == 20 ? true : false;
        });
      }
    });
  }
  ScrollController _controller = ScrollController();
  Widget _itemBuilder(context,index){
    if(index == bookList.length){
      return LoadMore(hasMore);
    }
    return BookListUnit(cellInfo: bookList[index],);
  }
  Future _onRefresh() async{
    bookList.clear();
    setState(() {
      pageIndex = 1;
      isRequesting = false;
      hasMore=true;
    });
    getBookList(false);
    return null;
  }
  @override
  void initState() {
    super.initState();
    getBookList(false);
    _controller.addListener((){
      if(_controller.position.pixels >= _controller.position.maxScrollExtent){
        getBookList(true);
      }
    });
  }
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(bookList.length == 0){
      return Center(child: CircularProgressIndicator(),);
    }
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: bookList.length + 1,
        itemBuilder: _itemBuilder,
        controller: _controller,
      ), 
      onRefresh: _onRefresh
    );
  }
}

