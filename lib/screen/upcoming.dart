import 'package:flutter/material.dart';

import '../color/color.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 32, 32),
      body: Center(
        child: Text(
          'Upcoming',
          style: TextStyle(color: AppColors.secondaryColor),
        ),
      ),
    );
  }
}
