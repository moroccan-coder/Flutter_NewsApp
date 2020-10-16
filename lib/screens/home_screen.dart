import 'package:flutter/material.dart';
import 'package:news_app/api/authors_api.dart';
import 'package:news_app/api/categories_api.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/screens/home_tabs/favourites.dart';
import 'package:news_app/screens/home_tabs/popular.dart';
import 'package:news_app/screens/home_tabs/whats_new.dart';
import 'package:news_app/screens/pages/about.dart';
import 'package:news_app/screens/pages/contact.dart';
import 'package:news_app/screens/pages/help.dart';
import 'package:news_app/screens/pages/settings.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopoutMenu { HELP, ABOUT, CONTACT, SETTINGS }

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          _PopupMenu(context),
        ],
        bottom: TabBar(
          tabs: [
            Tab(
              text: "What's New",
            ),
            Tab(
              text: "Popular",
            ),
            Tab(
              text: "Favourites",
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: TabBarView(
          children: [
            WhatsNew(),
            Popular(),
            Favourites(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }

  Widget _PopupMenu(BuildContext context) {
    return PopupMenuButton<PopoutMenu>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopoutMenu>(value: PopoutMenu.ABOUT,child: Text("ABOUT"),),
          PopupMenuItem<PopoutMenu>(value: PopoutMenu.HELP,child: Text("HELP"),),
          PopupMenuItem<PopoutMenu>(value: PopoutMenu.CONTACT,child: Text("CONTACT"),),
          PopupMenuItem<PopoutMenu>(value: PopoutMenu.SETTINGS,child: Text("SETTINGS"),),
        ];
      },
      onSelected: (PopoutMenu menu) {

        switch(menu)
            {
              case PopoutMenu.ABOUT :
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs(),));
                break;

          case PopoutMenu.CONTACT :
            Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs(),));
            break;

          case PopoutMenu.HELP :
            Navigator.push(context, MaterialPageRoute(builder: (context) => Help(),));
            break;

          case PopoutMenu.SETTINGS :
            Navigator.push(context, MaterialPageRoute(builder: (context) => Settings(),));
            }



      },
    );
  }
}
