import 'package:flutter/material.dart';
import 'package:news_app/models/nav_menu.dart';
import 'package:news_app/screens/facebook_feeds.dart';
import 'package:news_app/screens/headline_news.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/instagram_feed.dart';
import 'package:news_app/screens/pages/login.dart';
import 'package:news_app/screens/twitter_feed.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  bool isLoggedIn = false;
  String token;

  SharedPreferences pref;

  List<NavMenuItem> NavigationMenu = [
    NavMenuItem("Explore", () => HomeScreen()),
    NavMenuItem("HeadLine News", () => HeadLineNews()),
    NavMenuItem("Twitter Feeds", () => TwitterFeed()),
    NavMenuItem("Instagram Feeds", () => InstagramFeed()),
    NavMenuItem("Facebook Feeds", () => FacebookFeeds()),
    /*
    NavMenuItem("Register", () => FacebookFeeds()),
    NavMenuItem("Logout", () => FacebookFeeds()),*/
  ];

  _checkToken() async {
    pref = await SharedPreferences.getInstance();
    token = pref.get("token");

    setState(() {
      if (token == null) {
       // isLoggedIn = false;
        NavigationMenu.add(new NavMenuItem("Login", () => Login()));
      } else {
       // isLoggedIn = true;
        NavigationMenu.add(new NavMenuItem("Logout", () => HomeScreen()));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _checkToken();



  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 40),
          child: ListView.builder(
            itemCount: NavigationMenu.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  NavigationMenu[index].title,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {

                  if(NavigationMenu[index].title =="Logout")
                    {
                      pref.remove("token");
                      Navigator.pop(context);
                    }
                  else
                    {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return NavigationMenu[index].destination();
                        },
                      ));

                    }




                },
              );
            },
          ),
        ),
      ),
    );
  }


}
