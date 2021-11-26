import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Catalog App'),
        backgroundColor: Color(0xFF3F3D56),
      ),
      body: Center(
        child: Image(
          image: AssetImage('assets/images/home.png'),
        ),
      ),
    );
  }
}
