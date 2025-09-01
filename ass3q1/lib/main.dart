import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'User Details App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Color.fromARGB(255, 234, 184, 241),
      ),
      home: UserDetailsInputPage(),
    );
  }
}
class UserDetailsInputPage extends StatefulWidget{
  @override
  _UserDetailsInputPageState createState() => _UserDetailsInputPageState();
}
class _UserDetailsInputPageState extends State<UserDetailsInputPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _rollNoController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  
  void _navigateToShowDetails(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailsDisplayPage(
          name: _nameController.text,
          email: _emailController.text,
          rollNo: _rollNoController.text,
          phone: _phoneController.text,
        ),
      ),
    ).then((_){
      _showLogoutPopup(_nameController.text);
    });
  }
  void _showLogoutPopup(String username) {
    _nameController.clear();
    _emailController.clear();
    _rollNoController.clear();
    _phoneController.clear();
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Logged out'),
          content: Text('User $username logged out.'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: Text('OK')
              ),
          ],
        );
      },
      );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(130.0),
        child: Center(
          child: Card(
            elevation: 15,
            child: Padding(
              padding:EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextField(
                    controller: _rollNoController,
                    decoration: InputDecoration(labelText: 'Roll No'),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _navigateToShowDetails,
                    child: Text('Show Details'),
                  ),
                ],
              ),
            ),
          ),
        ),
        ),
    );
  }
}
class UserDetailsDisplayPage extends StatelessWidget{
  final String name;
  final String email;
  final String rollNo;
  final String phone;
  const UserDetailsDisplayPage({
    required this.name,
    required this.email,
    required this.rollNo,
    required this.phone,
  });
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name'),
            Text('Email: $email'),
            Text('Roll No: $rollNo'),
            Text('Phone Number: $phone'),
          ],
          ),
        ),
    );
  }
}
