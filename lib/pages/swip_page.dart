import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../routers/application.dart';
class SwipPage extends StatelessWidget{
  final String pics;
  final String currentIndex;
  SwipPage({this.pics,this.currentIndex});
  @override
  Widget build(BuildContext context) {
    List picList = pics.split(',');
    int index = int.parse(currentIndex);
    return Container(
      decoration: BoxDecoration(
        color: Colors.black
      ),
      child: Center(
        child: Swiper(
          index: index,
          itemCount: picList.length,
          itemBuilder: (context,index){
            return Image.network(
              picList[index],
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
            );
          },
          pagination: new SwiperPagination(),
          loop: false,
          scale: 0.1,
          onTap: (index){
            Application.router.pop(context);
          },
        ),
      ),
    );
  }
}