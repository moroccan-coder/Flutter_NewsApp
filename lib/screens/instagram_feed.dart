import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class InstagramFeed extends StatefulWidget {
  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {
  TextStyle _hashTagsStyle = TextStyle(
    color: Colors.orange.shade400,
  );

  TextStyle _buttonStyle = TextStyle(
    color : Colors.blue.shade300
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram Feeds"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        itemCount: 20,
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _drawHeader(),
                _drawTitle(),
                _drawHashTags(),
                _drawBody(),
                _drawFooter(),
              ],
            ),
          );
        },
      ),
    );
  }

  _drawHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
                Text(
                  "Yassine El haitar",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Mon, 5 oct 2020 . 9:00 pm',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.grey.shade400,
              ),
              onPressed: () {},
            ),
            Transform.translate(
                offset: Offset(-12, 0),
                child: Text(
                  "12",
                  style: TextStyle(color: Colors.grey.shade400),
                ))
          ],
        ),
      ],
    );
  }

  _drawTitle() {
    return Padding(
      padding: EdgeInsets.only(bottom: 4, left: 16, right: 16, top: 16),
      child: Text(
        "The AI futures is scary, think about it!",
        style: TextStyle(color: Colors.grey.shade900),
      ),
    );
  }

  _drawHashTags() {
    return Container(
      child: Wrap(
        children: [
          FlatButton(child: Text("#Computer", style: _hashTagsStyle), onPressed: () {}),
          FlatButton(child: Text("#AI", style: _hashTagsStyle), onPressed: () {}),
          FlatButton(child: Text("#Technology", style: _hashTagsStyle), onPressed: () {}),
        ],
      ),
    );
  }

  _drawBody() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.32,
      child: Image(
        image: AssetImage("assets/images/placeholder_bg.png",),
        fit: BoxFit.cover,
      ),
    );
  }

  _drawFooter() {
    return Wrap(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlatButton(child: Text("2 COMMENTS",style: _buttonStyle,), onPressed: (){},),
            Row(
              children: [
                FlatButton(child: Text("SHARE",style: _buttonStyle,), onPressed: (){},),
                FlatButton(child: Text("OPEN",style: _buttonStyle,), onPressed: (){},),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
