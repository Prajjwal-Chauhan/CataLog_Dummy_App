import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        title: Text("Catalog"),
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/Login_image.png", 
                fit: BoxFit.cover
                ),
              SizedBox(
                height:20.0
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.bold,
        
                ),
              ),
              SizedBox(
                height:20.0
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal : 32.0,vertical : 16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                      hintText: "Enter username",
                      labelText: "Username"
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {
                        
                      });
                    },
                  ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password" 
                    )
                  ),
                  SizedBox(
                    height:30.0
                  ),

                  InkWell(
                    onTap: () async{

                      setState(() {
                        changeButton = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                       Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButton?50 : 450,
                      height: 50,   
                      alignment: Alignment.center,
                      child:changeButton?Icon(Icons.done,color : Colors.white) : Text("Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                        )
                        ),
                        decoration: BoxDecoration(
                          // shape: changeButton?BoxShape.circle:BoxShape.rectangle,
                          borderRadius: changeButton? BorderRadius.circular(25) : BorderRadius.circular(8),
                          color: Colors.deepPurpleAccent,
                          ),
                    ),
                  )
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // print("Hi Prajjwal");
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   child: Text("Login"),
                  //   style: TextButton.styleFrom(
                  //     minimumSize: Size(450, 36)
                  //   ),
                  //   )
                ],
                ),
              )
          ],
              ),
        ));
  }
}
