


import 'dart:io';

import 'package:image_picker/image_picker.dart';
 import 'package:flutter/material.dart';
 void main(){
   runApp(MyApp());
 }
 class MyApp extends StatefulWidget { const MyApp({ Key? key }) : super(key: key);
 
   @override
   _MyAppState createState() => _MyAppState();
 }
 
 class _MyAppState extends State<MyApp> {
XFile? image;
final ImagePicker _picker = ImagePicker();
Future filepicker()async{
  final XFile? selectimage =await _picker.pickImage(source: ImageSource.gallery);
  print(selectimage!.path);
  setState(() {
    image = selectimage;
  });
}

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       home: Scaffold(
         body:SafeArea(child: Column(
           children: [
             
             Center(child: TextButton(onPressed: filepicker, child: const Text("selcet image"))),
             const SizedBox(height: 20,),
             image== null ? Text("no image found") : Image.file(File(image!.path),width: 280,fit: BoxFit.fill,)
           ],
         ))
       ),
     );
   }
 }