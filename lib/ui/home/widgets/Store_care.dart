import 'dart:io';

import 'package:contact/core/AssetsManager.dart';
import 'package:contact/core/ColorManager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StoreCare extends StatefulWidget {

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
Function onClick;
  File? image;
   StoreCare({required this.nameController,required this.phoneController,
     required this.emailController,required this.image,required this.onClick});

  @override
  State<StoreCare> createState() => _StoreCareState();
}

class _StoreCareState extends State<StoreCare> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: ()async{
             await widget.onClick();
             setState(() {

             });
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.3,
                child: AspectRatio(
                    aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      width: 2,
                      color: ColorManager.secondaryG
                    )
                  ),

                  child: widget.image==null
                      ?Lottie.asset(AssetsManager.imagePickerAnimation)
                  :Image.file(widget.image!,fit: BoxFit.cover,),
                ),)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder(valueListenable: widget.nameController,
                      builder:(context, value, child) =>
                          Text(value.text.isEmpty?"User Name"
                          :value.text,
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorManager.secondaryG
                          ),)
                           ,),

                  Divider(color: ColorManager.secondaryG,endIndent: 20,height: 30,),

                  ValueListenableBuilder(valueListenable: widget.emailController,
                      builder:(context, value, child) =>
                          Text(value.text.isEmpty?"Example@email.com"
                          :value.text,
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorManager.secondaryG
                          ),)
                           ,),
              Divider(color: ColorManager.secondaryG,endIndent: 20,height: 30,),

                  ValueListenableBuilder(valueListenable: widget.phoneController,
                      builder:(context, value, child) =>
                          Text(value.text.isEmpty?"+0200000000000"
                          :value.text,
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorManager.secondaryG
                          ),)
                           ,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
