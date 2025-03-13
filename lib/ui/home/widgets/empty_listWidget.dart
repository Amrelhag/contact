import 'package:contact/core/ColorManager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyListwidget extends StatelessWidget {
  const EmptyListwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/animation/empty_list.json"),
          Text("There is No Contacts Added Here",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: ColorManager.secondaryG
          ),)
        ],
      ),
    );
  }
}
