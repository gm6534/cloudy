import 'package:flutter/material.dart';

import '../constants.dart';
import 'FilePickerScreen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Constants.prefs?.setBool("loggedIn", false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.teal.shade800,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 80.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                      width: 180,
                      child: Image.asset("assets/img/logo.png")),
                ],
              ),
            ),
            SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Text("Login", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.teal.shade800),),
                  SizedBox(height: 40,),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Email",
                      // hintText: "Type Here",
                      prefixIcon: Icon(Icons.mail, color: Colors.teal.shade800, size: 25,)
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Password",
                        // hintText: "Type Here",
                        prefixIcon: Icon(Icons.lock_outline, color: Colors.teal.shade800, size: 25,),
                      suffixIcon: Icon(Icons.visibility, color: Colors.teal.shade800, size: 25,)
                    ),
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                      backgroundColor: MaterialStateProperty.all(Colors.teal.shade800)
                    ),
                      onPressed: (){
                        // Constants.prefs?.setBool("loggedIn", true);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BrowseScreen()));
                      },
                      child: Text("Log In", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),))

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
