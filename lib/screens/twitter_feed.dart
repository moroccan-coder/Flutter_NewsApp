import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter Feed"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: NavigationDrawer(),
      body: (ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                _cardHeader(),
                _cardBody(),
                _cardFooter(),
              ],
            ),
          );
        },
      )),
    );
  }

  Widget _cardHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/placeholder_bg.png"),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Yassine El haitar"),
                SizedBox(
                  width: 16,
                ),
                Text("@coders.ma",style: TextStyle(color: Colors.grey.shade600),),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text('Mon, 5 oct 2020 . 9:00 pm',style: TextStyle(color: Colors.grey.shade600),),
          ],
        )
      ],
    );
  }

  Widget _cardBody() {
    return Padding(
      padding: EdgeInsets.only(right: 16, top: 4, left: 16, bottom: 16),
      child: Text(
          "We’re supporting a community where more than 50 million people learn, share, and work together to build software."),
    );
  }

  Widget _cardFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.repeat,
                  color: Colors.orange,
                ),
                onPressed: () {},
              ),
              Text("55"),
            ],
          ),
        ),
        Row(
          children: [
            FlatButton(
              child: Text("Share",style: TextStyle(color: Colors.orange.shade800),),
              onPressed: () {},
            ),
            FlatButton(
              child: Text("Open",style: TextStyle(color: Colors.orange.shade800)),
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
