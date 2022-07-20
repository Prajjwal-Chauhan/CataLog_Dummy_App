import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatefulWidget {


  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  String name = "";
  bool changeButton = false;
  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

    closeDrawer() async{
      if(_scaffoldkey.currentState!.isDrawerOpen){
        _scaffoldkey.currentState?.openEndDrawer();
      }
    }
  moveToLogin(BuildContext context) async{
      
    setState(() {
    changeButton = true;
    });


    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.loginRoute);
    
    setState(() {
    changeButton = false;
    });
  }

  // final imageUrl = "https://i.pinimg.com/564x/28/d9/ea/28d9ea718df647571e3eb788570208ae.jpg";
  final imageUrl = "assets/images/profile.jpg";

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: context.theme.bottomAppBarColor,
          child: ListView(
            children: [
              DrawerHeader(
                
                padding: EdgeInsets.zero,
                
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Prajjwal Chauhan"), 
                  accountEmail: Text("prajjwalchauhan94017@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(imageUrl),
                  ),
                  ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  // closeDrawer();
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Already on Home Page buddy :) ".text.make(),));
                },
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text(
                "Home",
                    textScaleFactor:1.2,
                style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                ),
                )
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  // closeDrawer();
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Developer profile unaccessible...".text.make(),));
                },
                leading: Icon(
                  CupertinoIcons.person_crop_circle_fill,
                  color: Colors.white,
                ),
                title: Text(
                "Profile",
                    textScaleFactor:1.2,
                style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                ),
                )
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  // closeDrawer();
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Gmail not supported yet...".text.make(),));
                },
                leading: Icon(
                  CupertinoIcons.mail_solid,
                  color: Colors.white,
                ),
                title: Text(
                "Email Me",
                    textScaleFactor:1.2,
                style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                ),
                )
              ),
              ListTile(
                onTap: () async{ 
                  // closeDrawer();
                  moveToLogin(context);
                  //  await Future.delayed(Duration(seconds:1));
                //    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                // content: "Signing out...".text.make(),));
                  },
                leading: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  child: changeButton?Icon(Icons.done,color: Colors.white):Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                "Sign Out",
                    textScaleFactor:1.2,
                style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                ),
                )
              )
                ],
          ),
        ),
      );
    
  }

  }