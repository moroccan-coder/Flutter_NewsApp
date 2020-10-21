import 'package:flutter/material.dart';
import 'package:news_app/models/nav_menu.dart';
import 'package:news_app/screens/facebook_feeds.dart';
import 'package:news_app/screens/headline_news.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/instagram_feed.dart';
import 'package:news_app/screens/pages/login.dart';
import 'package:news_app/screens/twitter_feed.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {


  bool isLoggedIn = false;

  List<NavMenuItem> NavigationMenu = [
    NavMenuItem("Explore", () => HomeScreen()),
    NavMenuItem("HeadLine News", () => HeadLineNews()),
    NavMenuItem("Twitter Feeds", () => TwitterFeed()),
    NavMenuItem("Instagram Feeds", () => InstagramFeed()),
    NavMenuItem("Facebook Feeds", () => FacebookFeeds()),
    NavMenuItem("Login", () => Login()),
  /*
    NavMenuItem("Register", () => FacebookFeeds()),
    NavMenuItem("Logout", () => FacebookFeeds()),*/
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(isLoggedIn)
      {
        NavigationMenu.add(new NavMenuItem("Logout", () => FacebookFeeds()));
      }
    else{

    }
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
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return NavigationMenu[index].destination();
                    },
                  ));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
