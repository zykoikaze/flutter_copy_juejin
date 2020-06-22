import 'package:flutter/material.dart';
import '../routers/application.dart';
import '../event/event-bus.dart';
import '../event/event-model.dart';
class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}
class _LoginState extends State<Login>{
  String username = '';
  String password='';
  String userpic = 'https://mirror-gold-cdn.xitu.io/168e0940c8a794d171a?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1';
  _usernameChange(String val){
    setState(() {
      username = val;
    });
  }
  _passwordChange(String val){
    setState(() {
      password = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: '请输入用户名'
              ),
              onChanged: _usernameChange,
            ),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.security),
                labelText: '请输入密码'
              ),
              onChanged: _passwordChange,
            ),
            FlatButton(
              onPressed: (){
                if(username.isNotEmpty && password.isNotEmpty){
                  Application.router.pop(context);
                  ApplicationEvent.event.fire(UserLoginInEvent(username: username,userpic: userpic));
                }
              }, 
              color: Theme.of(context).primaryColor,
              child: Text(
                '登录',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}