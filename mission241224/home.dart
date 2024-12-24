import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

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
        body: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeTextState createState() => HomeTextState();
}

class HomeTextState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('../images/kakao/home.png'), fit: BoxFit.fill),
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
