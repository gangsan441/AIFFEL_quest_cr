import 'package:flutter/material.dart';
import 'home.dart';
import 'setting.dart';
/// Flutter code sample for [AppBar].

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: '설정',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MySetting()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            tooltip: '종료',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],

        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.settings),
        //     tooltip: '설정',
        //     onPressed: () {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //           const SnackBar(content: Text('This is a snackbar')));
        //     },
        //   ),
        //   IconButton(
        //     icon: const Icon(Icons.clear),
        //     tooltip: '종료',
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        // ],
      ),
      body: const TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  TextState createState() => TextState();
}

class TextState extends State<TestScreen> {
  final userNameController = TextEditingController();
  String userName = '';

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('../images/kakao/kakao_background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 300),
            ),
            Column(children: [
              _UserInfoTextField(
                  const Icon(Icons.lock), 'Password', '암호를 입력해주세요.', userNameController),
            ]),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  _SubmitButton("로그인"),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _UserInfoTextField(Icon icon, String labelText, String hintText,
      TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: TextField(
          obscureText: true,
          style: const TextStyle(fontSize: 15.0, color: Colors.black),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelText: labelText,
            hintText: hintText,
            prefixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
          ),
          controller: controller,
        ),
      ),
    );
  }

  Widget _SubmitButton(String text) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextButton(
        onPressed: () {
          if (userNameController.text.isEmpty) {
            _showAlertDialog(context);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHome()),
            );
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("알림"),
          content: const Text("암호를 입력해야 합니다."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("확인"),
            ),
          ],
        );
      },
    );
  }
}




// import 'package:flutter/material.dart';
// // import 'setting.dart';
// import 'home.dart';
// /// Flutter code sample for [AppBar].
//
// void main() => runApp(const AppBarApp());
//
// class AppBarApp extends StatelessWidget {
//   const AppBarApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: AppBarExample(),
//     );
//   }
// }
//
// class AppBarExample extends StatelessWidget {
//   const AppBarExample({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.yellow,
//         // title: const Text('AppBar Demo'),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.settings),
//             tooltip: '설정',
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('This is a snackbar')));
//             },
//           ),
//           IconButton(
//             // icon: const Icon(Icons.navigate_next),
//             icon: const Icon(Icons.clear),
//             tooltip: '종료',
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//       body: const TestScreen(),
//     );
//   }
// }
//
// class TestScreen extends StatefulWidget {
//   const TestScreen({super.key});
//
//   @override
//   TextState createState() => TextState();
// }
//
// class TextState extends State<TestScreen> {
//   final userNameController = TextEditingController();
//   String userName = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//         decoration: BoxDecoration(
//           image: DecorationImage(image: AssetImage('../images/kakao/kakao_background.png'), fit: BoxFit.fill),
//         ),
//         // Container(
//         child: Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.only(top: 300),
//             ),
//             Column(children: [
//               _UserInfoTextField(Icon(Icons.lock), 'Password', '암호를 입력해주세요.',
//                   userNameController),
//
//             ]),
//             Padding(
//               padding: const EdgeInsets.all(8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(width: 20),
//                   _SubmitButton("로그인"),
//                 ],
//               ),
//             ),
//             if (userName.isNotEmpty)
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const MyHome()),
//               );
//           ],
//         ));
//
//   }
//
//
//   Widget _UserInfoTextField(Icon icon, String labelText, String hintText,
//       TextEditingController controller) {
//     return Container(
//       // TextField 외곽 스타일
//       // color: Colors.white,  //TextField 외곽
//       padding: const EdgeInsets.all(8),
//       child: SizedBox(
//         width: MediaQuery.of(context).size.width / 2, // 화면 너비의 반
//         child: TextField(
//           obscureText: true, // 암호 입력 시 텍스트 가림
//           style: const TextStyle(fontSize: 15.0, color: Colors.black),
//           textAlign: TextAlign.center,
//           decoration: InputDecoration(
//             fillColor: Colors.white,
//             filled: true,
//             labelText: labelText,
//             hintText: hintText,
//             prefixIcon: icon,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(color: Colors.grey, width: 1.5),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(color: Colors.blue, width: 2),
//             ),
//           ),
//           controller: controller,
//         ),
//       ),
//     );
//   }
//
//
//   Widget _SubmitButton(String text) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: TextButton(
//         onPressed: () {
//           if (userNameController.text.isEmpty) {
//             _showAlertDialog(context);
//           } else {
//             setState(() {
//               userName = userNameController.text;
//             });
//           }
//         },
//         style: TextButton.styleFrom(
//           backgroundColor: Colors.grey,
//           padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//         ),
//         child: Text(
//           text,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showAlertDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("알림"),
//           content: const Text("암호를 입력해야 합니다."),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text("확인"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
