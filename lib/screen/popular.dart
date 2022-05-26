import 'package:flutter/material.dart';
import 'package:movie_db/color/color.dart';

class Popular extends StatelessWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 32, 32),
      body: Center(
        child: Text(
          'Popular',
          style: TextStyle(color: AppColors.secondaryColor),
        ),
      ),
    );
  }
}
