import 'package:flutter/material.dart';

class TestAppWidget extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appbar;
  const TestAppWidget({Key? key, required this.body, this.appbar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Center(
        child: body,
      ),
    );
  }
}
