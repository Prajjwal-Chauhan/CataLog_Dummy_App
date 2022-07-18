import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
    if (_formkey.currentState!.validate()) {
      
    setState(() {
    changeButton = true;
    });

    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    
    setState(() {
    changeButton = false;
    });
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Catalog",),
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
                child: Form(
                  key : _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username"
                      ),
                      validator: (value){
                        if (value!.isEmpty) {
                          return"Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password" 
                      ),
                      validator: (value){
                        if (value!.isEmpty) {
                          return"Password cannot be empty";
                        }
                        else if (value.length < 6) {
                          return"Password length should be atleast 6";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height:30.0
                    ),
                
                    Material(
                      borderRadius: changeButton? BorderRadius.circular(25) : BorderRadius.circular(8),
                      color: MyTheme.darkBluishColor,
                      child: InkWell(
                        splashColor: Colors.deepPurple,
                        onTap: () => moveToHome(context),
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
                            
                        ),
                      ),
                    )
                  ],
                  ),
                ),
              )
          ],
              ),
        )
        );
  }
}
