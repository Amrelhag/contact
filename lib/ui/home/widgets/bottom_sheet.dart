import 'dart:io';

import 'package:contact/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/ColorManager.dart';
import 'Store_care.dart';
import 'custom_button.dart';

class BottomSheetWidget extends StatefulWidget {

   BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheetWidget> {
  final nameController=TextEditingController();

  final emailController=TextEditingController();

  final phoneController=TextEditingController();

  File? image;
final formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return   Form(
      key: formKey,
      child: Container(margin: EdgeInsets.all(16),
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Wrap(children: [
            StoreCare(nameController: nameController,
              phoneController: phoneController,
              emailController: emailController,
              image:image ,
              onClick: ()async{
                ImagePicker imagePicker=ImagePicker();
                var file=await imagePicker.pickImage(source: ImageSource.gallery,);
                if(file!=null){
                  image= File(file.path);
                  setState(() {
      
                  });
      
                }
              },),
      
      
      
            CustomButton(textInputType: TextInputType.name,controller: nameController, hint:"Enter User Name " ,
                validator: (value)=>value.isEmpty?"Enter Your Name":null),
      
      
            CustomButton(textInputType: TextInputType.emailAddress,controller: emailController, hint:"Enter User Email " ,
                validator: (value){
                  if(value.isEmpty){
                    return "Enter User Email";
                  }
                  else if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value));
                }),
      
            CustomButton(textInputType: TextInputType.phone,controller: phoneController, hint:"Enter User Phone  " ,
                validator: (value){
                  if(value.isEmpty){
                    return "Enter User Phone ";
                  }
                  else if(RegExp(   r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/')
                      .hasMatch(value));
      
                }),
      
      
      
            FilledButton(

                onPressed: (){
                  if(formKey.currentState!.validate()){
                    if(image==null){
                      return;
                    }
                  }
                    Contacts.contacts.add(Contacts(image:image! ,name:nameController.text ,
                        email:emailController.text ,phone:phoneController.text ));
Navigator.pop(context);
                },
                style: FilledButton.styleFrom(
                  backgroundColor: ColorManager.secondaryG,
                  foregroundColor: ColorManager.primary,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
      
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                ),
                child:Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter User"),
                    ],
                  ),
                ) )
          ],),
        ),
      ),
    );
  }
}
