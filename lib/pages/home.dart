import 'package:flutter/material.dart';
import 'package:multi/components/carousel/categoryslider.dart';
import 'package:multi/components/carousel/slider.dart';
import 'package:multi/components/searchbar.dart';
import 'package:multi/pages/validation/login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        title:Text("Multivendor"),
        actions: <Widget>[
        TextButton(
        onPressed: () {
         Navigator.push(
           context,
           MaterialPageRoute(
               builder:(context)=>LoginScreen()
           ),
         );
        },
        child: const Text('Login',style:TextStyle(color:Colors.cyanAccent,fontSize:18),),
      ),
      ],
      ),
      body:Column(children: [
        //for Searing and header
         Searching(),

        SizedBox(height: 10,),
        //for Slider Image
        Sliderimage(),
        SizedBox(height: 10,),
        // for Category Slider

        Categoryslider(),
      ],)
      ,
    );
  }
}
