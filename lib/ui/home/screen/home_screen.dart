import 'dart:io';

import 'package:contact/core/AssetsManager.dart';
import 'package:contact/core/ColorManager.dart';
import 'package:contact/models/contact.dart';
import 'package:contact/ui/home/widgets/Store_care.dart';
import 'package:contact/ui/home/widgets/bottom_sheet.dart';
import 'package:contact/ui/home/widgets/contact_card.dart';
import 'package:contact/ui/home/widgets/custom_button.dart';
import 'package:contact/ui/home/widgets/empty_listWidget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName="home";
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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

              Contacts.contacts.isEmpty
                  ? EmptyListwidget()
                  :Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(16),
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio:0.7 ),
                    itemBuilder:(context ,index)
                    =>ContactCard(onDeleteClick: (int index){
                      Contacts.contacts.removeAt(index);
                      setState(() {

                      });
                    },
                        contact: Contacts.contacts[index],
                     index: index),
                  itemCount: Contacts.contacts.length,))

            ],
          ),
        ),
      ),



      floatingActionButton: Column(mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Visibility(visible: Contacts.contacts.isNotEmpty,
            child: FloatingActionButton(
                onPressed:(){
            Contacts.contacts.removeAt(Contacts.contacts.length-1);
            setState(() {

            });
                },
            backgroundColor: Colors.red,
              foregroundColor: ColorManager.tertiary,
              child: Icon(Icons.delete),
            ),
          ),

          SizedBox(height: 8,),
          
          Visibility(visible:Contacts.contacts.length<=6 ,
            child: FloatingActionButton(
                onPressed:(){
            _showModelButtonSheet();
                },
            backgroundColor: ColorManager.secondaryG,
              foregroundColor: ColorManager.primary,
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),

    );
  }




  void _showModelButtonSheet()async{
   await showModalBottomSheet(context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft:Radius.circular(40),
          topRight: Radius.circular(40)
          )
        ),
        isScrollControlled: true,
        backgroundColor: ColorManager.primary,
        builder:(context)=>BottomSheetWidget(),);

   setState(() {

   });
  }
}
