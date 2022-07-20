import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: context.theme.shadowColor,
        appBar: AppBar(
          leading: Icon(Icons.login_outlined),
        backgroundColor: context.theme.bottomAppBarColor,
        iconTheme: IconThemeData(color: MyTheme.creamColor),
        title: Text("Catalog App",style:TextStyle(color: MyTheme.creamColor)),
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
                  fontSize: 24,
                  color: context.theme.accentColor,
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

                        else if (value.length > 12) {
                          return"Username cannot be greater than 12";
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
                      color: context.theme.buttonColor,
                      child: InkWell(
                        splashColor: Colors.deepPurple,
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton?50 : 450,
                          height: 50,   
                          alignment: Alignment.center,
                          child:changeButton?Icon(Icons.done,color : context.theme.textSelectionColor) : Text("Login",
                          style: TextStyle(
                            color: context.theme.textSelectionColor,
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
