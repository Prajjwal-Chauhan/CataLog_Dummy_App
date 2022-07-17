import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  // final imageUrl = "https://i.pinimg.com/564x/28/d9/ea/28d9ea718df647571e3eb788570208ae.jpg";
  final imageUrl = "assets/images/profile.jpg";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
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
            )
              ],
        ),
      ),
    );
  }
}