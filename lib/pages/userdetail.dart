import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
    // Clear user details from secure storage
    await _storage.delete(key: 'username');
    await _storage.delete(key: 'password');

    // Navigate back to login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>LoginScreen() ,
      ),
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