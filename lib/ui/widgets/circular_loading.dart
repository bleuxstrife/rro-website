
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(color ?? systemPrimaryColor),
    );
  }
}
