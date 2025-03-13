import 'package:contact/core/ColorManager.dart';
import 'package:flutter/material.dart';

import '../../../models/contact.dart';

class ContactCard extends StatelessWidget {
  Contacts contact;
  int index;
  Function onDeleteClick;
   ContactCard({required this.contact,required this.index,required this.onDeleteClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.secondaryG,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        children: [
          Expanded(child: ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(16),
                topLeft: Radius.circular(16)),
            child: Stack(
              children:[ Image.file(contact.image,fit: BoxFit.cover,
              width: double.infinity,),

                Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(decoration: BoxDecoration(
                        color: ColorManager.secondaryG,
                        borderRadius: BorderRadius.circular(8)
                      ),
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(contact.name,style:TextStyle(
                            fontSize: 14,fontWeight: FontWeight.w500
                          ) ,),
                        ) ,

                      ),
                    ),
                  ],
                )
                ,]
            ),
          )),


          Padding(padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.email,color: ColorManager.primary,),
                    SizedBox(width: 8,),
                    Expanded(child: Text(contact.email))
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Icon(Icons.phone,color: ColorManager.primary,),
                    SizedBox(width: 8,),
                    Expanded(child: Text(contact.phone))
                  ],
                ),
                SizedBox(height: 8,),
                FilledButton(onPressed: (){
onDeleteClick(index);

                },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: ColorManager.tertiary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    child:Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete,color: ColorManager.tertiary,),
                    SizedBox(width: 8,),
                    Expanded(child: Text("Delete"))
                  ],
                ) )
              ],
            ),

          )
        ],
      ),
    );
  }
}
