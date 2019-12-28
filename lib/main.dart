import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());
String serverUrl = "http://192.168.31.139:8000/";
String amt = "";
String pzh = "";
String ckh = "";
String tradeDate = "";
String appName = "HMSBank";
String fkm = "";
String orderId = "";

String getAmt() {
  int size = amt.length;
  String result = "";

  for (int i = 0; i < 12 - size; i++) {
    result += "0";
  }
  if (size > 0) {
    result += amt;
  } else {
    result += "1";
  }
  return result;
}

void toast(String str) {
  Fluttertoast.showToast(
      msg: str,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.cyan,
      textColor: Colors.black54);
}

void postJSON(data) async {
  print(data.toString());
  print(serverUrl);
  Options options = Options(headers: {
    HttpHeaders.acceptHeader: "accept: application/json",
    "content-type": "application/json"
  });

  Dio _dio = Dio();
  _dio.options.contentType = ContentType.parse("application/json");
  String result;
  try {
    var response = await _dio.post(serverUrl, data: data, options: options);
    print(response);
    var result = response.data;
    toast("Result:" + result);
  } catch (e) {
    toast("Ex:" + e.toString());
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
  final TextEditingController pzhController = new TextEditingController();
  final TextEditingController ckhController = new TextEditingController();
  final TextEditingController tradeDateController = new TextEditingController();
  final TextEditingController fkmController = new TextEditingController();

  // final TextEditingController amtController = new TextEditingController();
  final TextEditingController oderIdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    urlController.addListener(() {
      print("urlController.addListener");
      serverUrl = urlController.text;
    });
    amtController.addListener(() {
      amt = amtController.text;
    });
    pzhController.addListener(() {
      pzh = pzhController.text;
    });
    ckhController.addListener(() {
      ckh = ckhController.text;
    });
    tradeDateController.addListener(() {
      tradeDate = tradeDateController.text;
    });
    fkmController.addListener(() {
      fkm = fkmController.text;
    });
    oderIdController.addListener(() {
      orderId = oderIdController.text;
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
                      labelText: "http://192.168.31.139:8000/",
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
                    controller: pzhController,
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
                    controller: ckhController,
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
                    controller: tradeDateController,
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
                    controller: fkmController,
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
                    controller: oderIdController,
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
                    postJSON({
                      "transId": "签到",
                      "amt": "0000 0000 0001",
                      "appName": appName,
                      "projectTag": "SliverStoneCloudPay"
                    });
                  },
                  child: const Text('签到', style: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    postJSON({
                      "transId": "消费",
                      "amt": getAmt(),
                      "appName": appName,
                      "projectTag": "SliverStoneCloudPay"
                    });
                  },
                  child: const Text('消费', style: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    if (pzh.length < 2) {
                      toast("请输入凭证号");
                    } else {
                      postJSON({
                        "transId": "撤销",
                        "orgTraceNo": pzh,
                        "appName": appName,
                        "projectTag": "SliverStoneCloudPay"
                      });
                    }
                  },
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
                  onPressed: () {
                    if (ckh.length < 2) {
                      toast("请输入参考号");
                    } else if (tradeDate.length < 4) {
                      toast("请输入交易日期");
                    } else if (amt.length < 1) {
                      toast("请输入金额");
                    } else {
                      postJSON({
                        "transId": "退货",
                        "amt": getAmt(),
                        "orgRefNo": ckh,
                        "transDate": tradeDate,
                        "appName": appName,
                        "projectTag": "SliverStoneCloudPay"
                      });
                    }
                  },
                  child: const Text('退货', style: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    if (pzh.length < 2) {
                      toast("请输入凭证号");
                    } else {
                      postJSON({
                        "transId": "重打印任意一笔",
                        "traceNo": pzh,
                        "appName": appName,
                        "projectTag": "SliverStoneCloudPay"
                      });
                    }
                  },
                  child: const Text('重打印', style: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    postJSON({
                      "transId": "余额查询",
                      "appName": appName,
                      "projectTag": "SliverStoneCloudPay"
                    });
                  },
                  child: const Text('查余', style: TextStyle(fontSize: 15)),
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
                  onPressed: () {
                    postJSON({
                      "transId": "优惠立减",
                      "amt": getAmt(),
                      "appName": appName,
                      "projectTag": "SliverStoneCloudPay"
                    });
                  },
                  child: const Text('优惠立减', style: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    if (pzh.length < 8) {
                      toast("请输入付款码");
                    } else if (amt.length < 1) {
                      toast("请输入金额");
                    } else {
                      postJSON({
                        "transId": "微信/支付宝消费",
                        "amt": getAmt(),
                        "qrCodeParam": fkm,
                        "appName": appName,
                        "projectTag": "SliverStoneCloudPay"
                      });
                    }
                  },
                  child: const Text('扫码消费', style: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    if (pzh.length < 8) {
                      toast("请输入付款码");
                    } else if (amt.length < 1) {
                      toast("请输入金额");
                    } else {
                      postJSON({
                        "transId": "微信/支付宝退货",
                        "amt": getAmt(),
                        "qrCodeParam": fkm,
                        "appName": appName,
                        "projectTag": "SliverStoneCloudPay"
                      });
                    }
                  },
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
                  onPressed: () {
                    if (pzh.length < 8) {
                      toast("请输入付款码");
                    } else if (amt.length < 1) {
                      toast("请输入金额");
                    } else {
                      postJSON({
                        "transId": "聚合扫码支付",
                        "amt": getAmt(),
                        "qrCodeParam": fkm,
                        "appName": appName,
                        "projectTag": "SliverStoneCloudPay"
                      });
                    }
                  },
                  child: const Text('聚合支付', style: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    if (pzh.length < 8) {
                      toast("请输入付款码");
                    } else if (amt.length < 1) {
                      toast("请输入金额");
                    } else {
                      postJSON({
                        "transId": "聚合扫码退货",
                        "amt": getAmt(),
                        "qrCodeParam": fkm,
                        "appName": appName,
                        "projectTag": "SliverStoneCloudPay"
                      });
                    }
                  },
                  child: const Text('聚合退货', style: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    if (pzh.length < 8) {
                      toast("请输入付款码");
                    } else if (amt.length < 1) {
                      toast("请输入金额");
                    } else {
                      postJSON({
                        "transId": "聚合支付异常订单查询（微信/支付宝异常订单查询 或 微信/支付宝订单查询）",
                        "amt": getAmt(),
                        "qrCodeParam": fkm,
                        "appName": appName,
                        "projectTag": "SliverStoneCloudPay"
                      });
                    }
                  },
                  child: const Text('聚合查询', style: TextStyle(fontSize: 15)),
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
                  onPressed: () {
                    postJSON({
                      "transId": "读取卡号",
                      "appName": appName,
                      "projectTag": "SliverStoneCloudPay"
                    });
                  },
                  child: const Text('读取卡号', style: TextStyle(fontSize: 15)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
