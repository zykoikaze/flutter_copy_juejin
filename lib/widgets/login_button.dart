import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../routers/application.dart';
class LoginButton extends StatelessWidget{
  final String username;
  final String userpic;
  LoginButton({this.username,this.userpic});
  @override
  Widget build(BuildContext context) {
   if(username.isEmpty){
     return FlatButton(
       onPressed: (){
         Application.router.navigateTo(context, '/login',transition: TransitionType.fadeIn);
       }, 
       child: Text(
         '登录 · 注册',
         style: TextStyle(
           color: Theme.of(context).primaryColor,
           fontSize: 16,
           fontWeight: FontWeight.w200
         ),
       )
      );
   }
   return Container(
     child: Row(
       children: <Widget>[
         CircleAvatar(
           backgroundImage: NetworkImage(userpic),
           child: Text(username),
         )
       ],
     ),
   );
  }
}