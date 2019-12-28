import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _message;
  @override
  void initState() {
    super.initState();

    _initFluwx();
  }

  _initFluwx() async {
    await fluwx.registerWxApi(
        appId: "wxd930ea5d5a258f4f",
        universalLink: "https://your.univeral.link.com/placeholder/");
  }

  // 检测是否安装微信
  void _checkInstalled() async {
    var isInstalled = await fluwx.isWeChatInstalled();
    setState(() {
      _message = " $isInstalled>>>>>>>>>>";
    });
  }

  void _shareText() async {
    await fluwx.shareToWeChat(fluwx.WeChatShareTextModel(
        text: "text from fluwx",
        transaction: "transaction", //仅在android上有效，下同。
        scene: fluwx.WeChatScene.TIMELINE));
    // setState(() {
    //   _message = " $isInstalled>>>>>>>>>>";
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                _shareText();
              },
              child: Text('用来测试Fluwx'),
            ),
            Text('${_message}')
          ],
        ),
      ),
    );
  }
}
