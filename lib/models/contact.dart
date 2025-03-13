import 'dart:io';

 class Contacts{

 File image;
 String name;
 String phone;
 String email;

 Contacts({required this.image,required this.name,
   required this.phone,required this.email});

static List<Contacts> contacts=[];

}