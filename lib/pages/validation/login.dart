

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:multi/pages/home.dart';
import 'package:multi/pages/validation/regiester.dart';



class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();

  final _storage = FlutterSecureStorage();
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isAuthenticating = false;

  Future<void> _authenticate() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isAuthenticating = true;
      });


      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      try {
        final response = await Dio().post(
          'https://your-api-url.com/authenticate',
          data: {
            'email': email,
            'password': password,
          },
        );

        if (response.statusCode == 200) {
          final responseData = response.data;
          final token = responseData['token'];

          await _storage.write(key: 'token', value: token);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        } else {
          final errorMessage = response.data['message'];
          showDialog(
            context: errorMessage,
            builder: (context) => AlertDialog(
              title: Text('Error'),
              content: Text(errorMessage),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      } catch (error) {

        showDialog(
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text(error.toString()),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
          context:context,
        );
      }

      setState(() {
        _isAuthenticating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:Container(
      child: Column(
        children: [
          // Lottie.network(
          //     "https://assets1.lottiefiles.com/packages/lf20_wzAk0pBKAp.json",
          //     height: 200,
          //     width: double.infinity),
          Form(
            key: _key,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(

                  child: Text(
                    "Multivendor",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "Welcome!",
                  style:TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 16 / 2,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "Login to continue",
                  style:TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    controller:_emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
                      hintText: "Enter your email address",
                      labelText: "Email ",
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    ),
                    validator: (value) =>
                    value!.isEmpty ? "Email field required" : null,
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
                      hintText: "Enter Your Password",
                      labelText: "password ",
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    ),
                    validator: (value) =>
                    value!.isEmpty ? "Password field required" : null,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(

                    onPressed: _isAuthenticating ? null : _authenticate,
                    child: _isAuthenticating
                        ? CircularProgressIndicator()
                        : Text('Login'),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16),
                //   child: ElevatedButton(
                //       onPressed: () async {
                //         debugPrint("Login Successfuly");
                //         // if (_key.currentState!.validate()) {
                //         //   await userController
                //         //       .login(
                //         //       phone: phoneController.text,
                //         //       password: passwordController.text)
                //         //       .then((response) => {
                //         //     if (response.message == "Login Sucessfull")
                //         //       {
                //         //         Navigator.push(
                //         //             context,
                //         //             MaterialPageRoute(
                //         //               builder: (context) =>
                //         //                   WelcomePage(),
                //         //             ))
                //         //       }
                //         //     else
                //         //       {showAlertDialog(context, "Login Failed")}
                //         //   });
                //         // } else {
                //         //   print("Form validation failed");
                //         // }
                //       },
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: const [
                //             Icon(Icons.login),
                //             SizedBox(
                //               width: 16,
                //             ),
                //             Text("L O G I N ")
                //           ],
                //         ),
                //       )),
                // ),
                const SizedBox(
                  height: 20,
                ),

                Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Do you have no account? ",style:TextStyle(fontSize: 20,fontWeight:FontWeight.w400)),
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>SignupPage(),
                              )),
                          child: Text(
                            "Register Now",style:TextStyle(fontSize: 20,color: Colors.blue,fontStyle:FontStyle.italic,decoration:TextDecoration.underline),
                          ),
                        ),
                      ],
                    )
                )
              ],
            ),

          ),

        ],
      ),
      )

    );
    // );
  }

  showAlertDialog(BuildContext context, String info) {
    // set up the buttons
    Widget okButton = ElevatedButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Registration"),
      content: Text(
        info,
        style: const TextStyle(color: Colors.green),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
