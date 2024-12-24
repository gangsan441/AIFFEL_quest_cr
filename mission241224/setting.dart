import 'package:flutter/material.dart';

class MySetting extends StatelessWidget {
  const MySetting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.yellow,
        appBar: AppBar(
          backgroundColor: Colors.white,
          // title: const Text('AppBar Demo'),
          actions: <Widget>[
            IconButton(
              // icon: const Icon(Icons.navigate_next),
              icon: const Icon(Icons.clear),
              tooltip: '종료',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: const SettingScreen(),
      ),
    );
  }
}

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  SettingTextState createState() => SettingTextState();
}

class SettingTextState extends State<SettingScreen> {

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('../images/kakao/1_4.png'), fit: BoxFit.fill),
        ),
        // Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 250),
            ),
          ],
        ));

  }

}
