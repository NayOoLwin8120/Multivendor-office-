import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:multi/components/carousel/categoryslider.dart';
import 'package:multi/components/carousel/slider.dart';
import 'package:multi/components/searchbar.dart';
import 'package:multi/pages/userdetail.dart';
import 'package:multi/pages/validation/login.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  final bool  isAuthenticating;
   Home({Key? key , required this.isAuthenticating}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;
  int addtocart=0;
  int _selectedIndex = 0;

  static  List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    // Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),


  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        title:Text("Multivendor"),
        // actions: widget.isAuthenticating
        //     ? Container(
        //   child: Row(
        //       children: [
        //                 Stack(
        //                 alignment: Alignment.center,
        //                 children: [
        //       IconButton(
        //         onPressed:(){
        //           setState(() {
        //             counter=0;
        //           });
        //         },
        //         icon:Icon(Icons.favorite_outlined,size: 25,),
        //       ),
        //       if (counter != 0)
        //         Positioned(
        //           right: 10,
        //           top: 12,
        //           child:  Container(
        //             padding: EdgeInsets.all(2),
        //             decoration: new BoxDecoration(
        //               color: Colors.red,
        //               borderRadius: BorderRadius.circular(6),
        //             ),
        //             constraints: BoxConstraints(
        //               minWidth: 14,
        //               minHeight: 14,
        //             ),
        //             child: Text(
        //               '$counter',
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 10,
        //               ),
        //               textAlign: TextAlign.center,
        //             ),
        //           ),
        //         )
        //     ],
        //                 ),
        //                 Stack(
        //     alignment: Alignment.center,
        //     children: [
        //       IconButton(
        //         onPressed:(){
        //           setState(() {
        //             counter=0;
        //           });
        //         },
        //         icon:Icon(Icons.shopping_cart,size: 25,),
        //       ),
        //       if (counter != 0)
        //         Positioned(
        //           right: 10,
        //           top: 12,
        //           child:  Container(
        //             padding: EdgeInsets.all(2),
        //             decoration: new BoxDecoration(
        //               color: Colors.red,
        //               borderRadius: BorderRadius.circular(6),
        //             ),
        //             constraints: BoxConstraints(
        //               minWidth: 14,
        //               minHeight: 14,
        //             ),
        //             child: Text(
        //               '$addtocart',
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 10,
        //               ),
        //               textAlign: TextAlign.center,
        //             ),
        //           ),
        //         )
        //     ],
        //   ),
        //                 TextButton(
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder:(context)=>LoginScreen()
        //           ),
        //         );
        //       },
        //       child: const Text('Login',style:TextStyle(color:Colors.cyanAccent,fontSize:18),),
        //     ),
        //                 IconButton(
        //       icon: const Icon(
        //         Icons.info,
        //         size: 28,
        //       ),
        //       tooltip: 'Detail',
        //       onPressed: () {
        //         showDialog(
        //             context: context,
        //             builder: (BuildContext context) => AlertDialog(
        //               shape: const RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.all(Radius.circular(40))),
        //               title:
        //               Container(
        //                   width: double.infinity,
        //
        //                   height: 50,
        //                   padding: EdgeInsets.symmetric(horizontal: 10),
        //                   decoration: BoxDecoration(
        //                     color: Colors.black54,
        //                     borderRadius: BorderRadius.all(Radius.circular(40)),
        //                   ),
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Text(
        //                         "About",
        //                         style: TextStyle(color: Colors.white),
        //                       ),
        //                       Text(" "),
        //                       Text(" "),
        //                       IconButton(
        //                           onPressed: () {
        //                             Navigator.pop(context, 'Cancel');
        //                           },
        //                           icon: Icon(
        //                             Icons.close,
        //                             size: 28,
        //                             color: Color.fromARGB(255, 249, 142, 140),
        //                           ))
        //                     ],
        //                   )),
        //               // icon: Icon(Icons.close_rounded),
        //               content: Container(
        //                 width: 200,
        //                 height: 350,
        //                 child: Column(
        //                   children: [
        //                     LottieBuilder.network("https://assets7.lottiefiles.com/private_files/lf30_hvkvxnt3.json",height: 100,),
        //
        //                     Text(
        //                       "Multi Shopping \n",
        //                       style: TextStyle(
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 19,
        //                       ),
        //                     ),
        //                     Text(
        //                       "Version 1.0.0 \n ",
        //                       style: TextStyle(
        //                           color: Colors.black,
        //                           fontWeight: FontWeight.bold,
        //                           fontSize: 17,
        //                           fontStyle: FontStyle.italic),
        //                     ),
        //                     Text(
        //                       "Multi Shopping is used for people reduce time for they want .We sell item for normal price.  \n",
        //                       style: TextStyle(
        //                           color: Colors.black,
        //                           fontWeight: FontWeight.bold,
        //                           fontSize: 17,
        //                           fontStyle: FontStyle.italic),
        //                     ),
        //                     Text(
        //                       "Developed By Nay Oo lwin \n",
        //                       style: TextStyle(
        //                           color: Colors.black,
        //                           fontWeight: FontWeight.bold,
        //                           fontSize: 17,
        //                           fontStyle: FontStyle.italic),
        //                     ),
        //                     Container(
        //                       height: 20,
        //                       child: Row(
        //                           mainAxisAlignment:
        //                           MainAxisAlignment.spaceBetween,
        //                           children: [
        //                             IconButton(
        //                                 onPressed: () async {
        //                                   final url = Uri.parse(
        //                                       'https://github.com/NayOoLwin8120');
        //                                   if (await launchUrl(url)) {
        //                                     await launchUrl(url);
        //                                   }
        //                                 },
        //                                 icon: Icon(Icons.facebook)),
        //                             IconButton(
        //                                 onPressed: () async {
        //                                   final url = Uri.parse(
        //                                       'https://github.com/NayOoLwin8120');
        //                                   if (await launchUrl(url)) {
        //                                     await launchUrl(url);
        //                                   }
        //                                 },
        //                                 icon: Icon(Icons.facebook)),
        //                             IconButton(
        //                                 onPressed: () async {
        //                                   final url = Uri.parse(
        //                                       'https://github.com/NayOoLwin8120');
        //                                   if (await launchUrl(url)) {
        //                                     await launchUrl(url);
        //                                   }
        //                                 },
        //                                 icon: Icon(Icons.facebook))
        //                           ]),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ));
        //       },
        //     ),
        //               ],
        //             ),
        //
        //   ) : Container(
        //   child: Row(
        //     children: [
        //       Stack(
        //         alignment: Alignment.center,
        //         children: [
        //           IconButton(
        //             onPressed:(){
        //               setState(() {
        //                 counter=0;
        //               });
        //             },
        //             icon:Icon(Icons.favorite_outlined,size: 25,),
        //           ),
        //           if (counter != 0)
        //             Positioned(
        //               right: 10,
        //               top: 12,
        //               child:  Container(
        //                 padding: EdgeInsets.all(2),
        //                 decoration: new BoxDecoration(
        //                   color: Colors.red,
        //                   borderRadius: BorderRadius.circular(6),
        //                 ),
        //                 constraints: BoxConstraints(
        //                   minWidth: 14,
        //                   minHeight: 14,
        //                 ),
        //                 child: Text(
        //                   '$counter',
        //                   style: TextStyle(
        //                     color: Colors.white,
        //                     fontSize: 10,
        //                   ),
        //                   textAlign: TextAlign.center,
        //                 ),
        //               ),
        //             )
        //         ],
        //       ),
        //       Stack(
        //         alignment: Alignment.center,
        //         children: [
        //           IconButton(
        //             onPressed:(){
        //               setState(() {
        //                 counter=0;
        //               });
        //             },
        //             icon:Icon(Icons.shopping_cart,size: 25,),
        //           ),
        //           if (counter != 0)
        //             Positioned(
        //               right: 10,
        //               top: 12,
        //               child:  Container(
        //                 padding: EdgeInsets.all(2),
        //                 decoration: new BoxDecoration(
        //                   color: Colors.red,
        //                   borderRadius: BorderRadius.circular(6),
        //                 ),
        //                 constraints: BoxConstraints(
        //                   minWidth: 14,
        //                   minHeight: 14,
        //                 ),
        //                 child: Text(
        //                   '$addtocart',
        //                   style: TextStyle(
        //                     color: Colors.white,
        //                     fontSize: 10,
        //                   ),
        //                   textAlign: TextAlign.center,
        //                 ),
        //               ),
        //             )
        //         ],
        //       ),
        //       TextButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder:(context)=>LoginScreen()
        //             ),
        //           );
        //         },
        //         child: const Text('Login',style:TextStyle(color:Colors.cyanAccent,fontSize:18),),
        //       ),
        //       IconButton(
        //         icon: const Icon(
        //           Icons.info,
        //           size: 28,
        //         ),
        //         tooltip: 'Detail',
        //         onPressed: () {
        //           showDialog(
        //               context: context,
        //               builder: (BuildContext context) => AlertDialog(
        //                 shape: const RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.all(Radius.circular(40))),
        //                 title:
        //                 Container(
        //                     width: double.infinity,
        //
        //                     height: 50,
        //                     padding: EdgeInsets.symmetric(horizontal: 10),
        //                     decoration: BoxDecoration(
        //                       color: Colors.black54,
        //                       borderRadius: BorderRadius.all(Radius.circular(40)),
        //                     ),
        //                     child: Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         Text(
        //                           "About",
        //                           style: TextStyle(color: Colors.white),
        //                         ),
        //                         Text(" "),
        //                         Text(" "),
        //                         IconButton(
        //                             onPressed: () {
        //                               Navigator.pop(context, 'Cancel');
        //                             },
        //                             icon: Icon(
        //                               Icons.close,
        //                               size: 28,
        //                               color: Color.fromARGB(255, 249, 142, 140),
        //                             ))
        //                       ],
        //                     )),
        //                 // icon: Icon(Icons.close_rounded),
        //                 content: Container(
        //                   width: 200,
        //                   height: 350,
        //                   child: Column(
        //                     children: [
        //                       LottieBuilder.network("https://assets7.lottiefiles.com/private_files/lf30_hvkvxnt3.json",height: 100,),
        //
        //                       Text(
        //                         "Multi Shopping \n",
        //                         style: TextStyle(
        //                           color: Colors.black,
        //                           fontWeight: FontWeight.bold,
        //                           fontSize: 19,
        //                         ),
        //                       ),
        //                       Text(
        //                         "Version 1.0.0 \n ",
        //                         style: TextStyle(
        //                             color: Colors.black,
        //                             fontWeight: FontWeight.bold,
        //                             fontSize: 17,
        //                             fontStyle: FontStyle.italic),
        //                       ),
        //                       Text(
        //                         "Multi Shopping is used for people reduce time for they want .We sell item for normal price.  \n",
        //                         style: TextStyle(
        //                             color: Colors.black,
        //                             fontWeight: FontWeight.bold,
        //                             fontSize: 17,
        //                             fontStyle: FontStyle.italic),
        //                       ),
        //                       Text(
        //                         "Developed By Nay Oo lwin \n",
        //                         style: TextStyle(
        //                             color: Colors.black,
        //                             fontWeight: FontWeight.bold,
        //                             fontSize: 17,
        //                             fontStyle: FontStyle.italic),
        //                       ),
        //                       Container(
        //                         height: 20,
        //                         child: Row(
        //                             mainAxisAlignment:
        //                             MainAxisAlignment.spaceBetween,
        //                             children: [
        //                               IconButton(
        //                                   onPressed: () async {
        //                                     final url = Uri.parse(
        //                                         'https://github.com/NayOoLwin8120');
        //                                     if (await launchUrl(url)) {
        //                                       await launchUrl(url);
        //                                     }
        //                                   },
        //                                   icon: Icon(Icons.facebook)),
        //                               IconButton(
        //                                   onPressed: () async {
        //                                     final url = Uri.parse(
        //                                         'https://github.com/NayOoLwin8120');
        //                                     if (await launchUrl(url)) {
        //                                       await launchUrl(url);
        //                                     }
        //                                   },
        //                                   icon: Icon(Icons.facebook)),
        //                               IconButton(
        //                                   onPressed: () async {
        //                                     final url = Uri.parse(
        //                                         'https://github.com/NayOoLwin8120');
        //                                     if (await launchUrl(url)) {
        //                                       await launchUrl(url);
        //                                     }
        //                                   },
        //                                   icon: Icon(Icons.facebook))
        //                             ]),
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //               ));
        //         },
        //       ),
        //     ],
        //   ),
        //
        // )
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
         _widgetOptions.elementAt(_selectedIndex),

      ],
      ),

      // _______________ Start  For Bottom Navigation __________
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve:Curves.easeInToLinear ,
        backgroundColor: Colors.white,
          height: 60,
          color: Colors.blue,
          animationDuration: Duration(milliseconds: 300),
          items: [
            Icon(Icons.home,size: 30,),
            Icon(Icons.search,size: 30,),
            IconButton(icon: Icon(Icons.account_circle),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder:(context)=>LoginScreen()
                ),
              );
            },),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.home),
            //     label: 'Home',
            //     backgroundColor: Colors.green
            // ),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.search),
            //     label:'Search',
            //     backgroundColor: Colors.yellow
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.person),
            //   label: 'Profile',
            //   backgroundColor: Colors.blue,
            // ),
          ],
          // type: BottomNavigationBarType.shifting,
          // currentIndex: _selectedIndex,
          // selectedItemColor: Colors.black,
          // iconSize: 40,
          onTap: _onItemTapped,
          // elevation: 5
      ),

// _______________ End For Bottom Navigation ____________


      floatingActionButton: Wrap( //will break to another line on overflow
        direction: Axis.horizontal, //use vertical to show  on vertical axis
        children: <Widget>[
          Container(
              margin:EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: (){
                  setState(() {
                    counter++;
                  });
                },
                child: Icon(Icons.favorite_outlined),
              )
          ), //button first

          Container(
              margin:EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: (){
                  setState(() {
                    addtocart++;
                  });

                },
                backgroundColor: Colors.deepPurpleAccent,
                child: Icon(Icons.shopping_cart),
              )
          ), // button second


          // button third

          // Add more buttons here
        ],),


    );
  }
}
