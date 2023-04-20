import 'package:flutter/material.dart';

class Searching extends StatefulWidget {
  const Searching({Key? key}) : super(key: key);

  @override
  State<Searching> createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(children: [
        Container(
          color: Colors.white,
         child: Row(children: [
           Container(

             width:336,
             height:35,
             padding: const EdgeInsets.symmetric(horizontal: 5.0),
           // Use a Material design search bar
           child: TextField(
             textAlignVertical:TextAlignVertical.bottom,
             autofocus: true,
             controller: _searchController,
             cursorColor: Colors.red,
             cursorWidth: 2,
             cursorHeight: 22,
             decoration: InputDecoration(
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                 borderRadius: BorderRadius.circular(50.0),
               ),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(width: 3, color: Colors.black54),
                 borderRadius: BorderRadius.circular(50.0),
               ),
               errorBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                     width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                 borderRadius: BorderRadius.circular(50.0),
               ),
               hintStyle: TextStyle(fontWeight:FontWeight.w600),
               hintText: "Searching......",
               // Add a clear button to the search bar
               suffixIcon: IconButton(
                 alignment: Alignment.topCenter,
                 icon: Icon(Icons.search,color:Colors.black),
                 onPressed: () =>
                     // _searchController.clear(),
                 print(_searchController.text)
               ),
               // Add a search icon or button to the search bar
               // prefixIcon: IconButton(
               //   icon: Icon(Icons.search),
               //   onPressed: () {
               //     // Perform the search here
               //   },
               // ),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(20.0),
               ),
             ),
           ),
           ),
           SizedBox(width: 2,),
           Container(

             height: 38,
             color: Colors.black,
             width:2,

           ),

           SizedBox(width: 3,),
           Container(
             // color:Color(0xFF0077b6),
             width:48,
             height:50,
               child:IconButton(
                 icon:Icon(Icons.message,size: 25,),
                 onPressed: (){
                   print("Hello user");
                 },
               ),

           )
         ],),
        ),
        Container(
          color: Color(0xFF0077b6),
          child: Row(children: [
            Container(
                width:345,
                height:50,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(children: [
                    Text("All" ,style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic,color: Colors.white),) ,
                    SizedBox(width:6,),
                    Text("Health&Beauty",style: TextStyle(fontSize: 18,color: Colors.white,fontStyle: FontStyle.italic),),
                    SizedBox(width:6,),
                    Text("Food&Drinks",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                    SizedBox(width:6,),
                    Text("Home",style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontStyle: FontStyle.italic
                    ),
                    ),
                    SizedBox(width:6,),

                  ],),
                ),
            ),
            Container(

              width:47,
              height:50,
              child:IconButton(
                icon:Icon(Icons.list_sharp,size: 35,color: Colors.white,),
                onPressed: (){
                  print("Route to All Category Detail");
                },
              ),
            )
          ],),
        ),
      ],),
    );
  }
}
