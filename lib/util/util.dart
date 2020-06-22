import 'package:flutter/material.dart';
class Util{
  static String getTimeDutation(String comTime){
    var nowTime = DateTime.now();
    var compareTime = DateTime.parse(comTime);
    if(nowTime.year - compareTime.year > 0){
      return '${nowTime.year - compareTime.year}年前';
    }else if(nowTime.month - compareTime.month > 0){
      return '${nowTime.month - compareTime.month}月前';
    }else if(nowTime.day - compareTime.day > 0){
      return '${nowTime.day - compareTime.day}天前';
    }else if(nowTime.hour - compareTime.hour > 0){
      return '${nowTime.hour - compareTime.hour}小时前';
    }else if(nowTime.minute - compareTime.minute > 0){
      return '${nowTime.minute - compareTime.minute}分钟前';
    }else{
      return '片刻之间';
    }    
  }
  static double setPercentage( percentage, context){
    return MediaQuery.of(context).size.width * percentage;
  }
  static String getWeek(String time){
    var compareTime = DateTime.parse(time);
    String weekDay = '';
    switch(compareTime.weekday){
       case 2:
        weekDay = '周二';
        break;
      case 3:
        weekDay = '周三';
        break;
      case 4:
        weekDay = '周四';
        break;
      case 5:
        weekDay = '周五';
        break;
      case 6:
        weekDay = '周六';
        break;
      case 7:
        weekDay = '周日';
        break;
      default:
        weekDay = '周一';
    }
    return '${compareTime.month}-${compareTime.day} $weekDay';
  }
}