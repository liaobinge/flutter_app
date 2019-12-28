

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());
String serverUrl = "http://192.168.31.139:8000/";
String amt = "";

void toast(String str){
  Fluttertoast.showToast(
      msg: str,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.cyan,
      textColor: Colors.black54
  );
}

void postJSON(data) async {
  print(data.toString());
  print(serverUrl);
  Options options = Options(headers: {HttpHeaders.acceptHeader:"accept: application/json","content-type": "application/json"});

  Dio _dio = Dio();
  _dio.options.contentType="application/json";
  String result;
  try {
    var response = await _dio.post(serverUrl, data: data,options: options);
    print(response);
      var result = response.data;
      toast("Result:"+result);

  } catch (e) {
    toast("Ex:"+e.toString());
    return print(e.toString());
    
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController urlController = new TextEditingController();
  final TextEditingController amtController = new TextEditingController();

  // final TextEditingController amtController = new TextEditingController();
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    urlController.addListener(() {
      print("urlController.addListener");
      serverUrl = urlController.text;
    });
    amtController.addListener(() {
      amt = amtController.text;
    });
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: new Text('Example title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: Text('连接地址'),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                  ),
                  child: TextField(
                    controller: urlController,
                    decoration: new InputDecoration(
                      hintText: '连接地址,IP和端口',
                      labelText:"http://192.168.31.139:8000/",
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 30),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 150,
                  ),
                  child: TextField(
                    controller: amtController,
                    decoration: new InputDecoration(
                      hintText: '消费金额',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 150,
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: new InputDecoration(
                      hintText: '凭证号',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 150,
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: new InputDecoration(
                      hintText: '参考号',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 150,
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: new InputDecoration(
                      hintText: '交易日期',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 150,
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: new InputDecoration(
                      hintText: '付款码',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 150,
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: new InputDecoration(
                      hintText: '唯一订单号',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 40,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    postJSON({"transId":"签到","amt":"000000000001","projectTag":"SliverStoneCloudPay"});
                  },
                  child: const Text('签到', style: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text('消费', style: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text('撤销', style: TextStyle(fontSize: 15)),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text('退货', style: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text('重打印', style: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text('读取卡号', style: TextStyle(fontSize: 15)),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text('优惠立减', style: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text('扫码消费', style: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text('扫码退货', style: TextStyle(fontSize: 15)),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text('聚合支付', style: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text('聚合退货', style: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text('聚合查询', style: TextStyle(fontSize: 15)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
