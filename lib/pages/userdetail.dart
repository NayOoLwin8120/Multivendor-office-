import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:multi/pages/home.dart';
import 'package:multi/pages/validation/login.dart';

class UserDetailsPage extends StatefulWidget {
  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final _storage = FlutterSecureStorage();
  String? _username;
  String? _password;

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  void _loadUserDetails() async {
    final username = await _storage.read(key: 'username');
    final password = await _storage.read(key: 'password');
    setState(() {
      _username = username;
      _password = password;
    });
  }
  void _logout() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {

        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          title: Text('Are You Sure To Logout !'),
          // content: Text('Welcome to MultiOnline Shop'),
          actions: [
            TextButton(

              child: Text('Cancel' ,style: TextStyle(color: Colors.green),),
              onPressed: () => Navigator.pop(context, 'Cancel'),

            ),
            TextButton(

              child: Text('OK' ,style: TextStyle(color: Colors.red),),
              onPressed: () async{
                await _storage.delete(key: 'username');
                await _storage.delete(key: 'password');
                Navigator.pop(context);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),

                );
              },
            ),
          ],
        );
      },




    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Username: $_username'),
            Text('Password: $_password'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _logout,
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}