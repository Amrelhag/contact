import 'package:contact/core/AssetsManager.dart';
import 'package:contact/core/ColorManager.dart';
import 'package:contact/models/contact.dart';
import 'package:contact/ui/home/widgets/custom_button.dart';
import 'package:contact/ui/home/widgets/empty_listWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName="home";
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
List<Contacts> contacts=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AssetsManager.logo),

              contacts.isEmpty? EmptyListwidget()
                  :Container(color: Colors.red,),

            ],
          ),
        ),
      ),



      floatingActionButton: FloatingActionButton(
          onPressed:(){
_showModelButtonSheet();
          },
      backgroundColor: ColorManager.secondaryG,
        foregroundColor: ColorManager.primary,
        child: Icon(Icons.add),
      ),

    );
  }




  void _showModelButtonSheet(){

    final nameController=TextEditingController();
    final emailController=TextEditingController();
    final phoneController=TextEditingController();

    showModalBottomSheet(context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft:Radius.circular(40),
          topRight: Radius.circular(40)
          )
        ),
        isScrollControlled: true,
        backgroundColor: ColorManager.primary,
        builder:(context)=>Container(margin: EdgeInsets.all(16),
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Wrap(children: [

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



                  FilledButton(onPressed: (){},
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
        ));
  }
}
