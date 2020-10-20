import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/models/post.dart';

class SinglePost extends StatefulWidget {
  final Post post;

  SinglePost(this.post);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.post.featuredImage),
                  fit: BoxFit.cover,
                ),
              ),
            )),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            if (index == 0) {
              return _drawPostDetails();
            } else if (index >= 1 && index < 25) {
              return _comments();
            } else {
              return _commentTextEntry();
            }
          }, childCount: 26)),
        ],
      ),
    );
  }

  final random = Random();

  /// Returns a random color, with minumim brightness level
  Color getRandomColor({int minBrightness = 50}) {
    assert(minBrightness >= 0 && minBrightness <= 255);
    return Color.fromARGB(
      0xFF,
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
    );
  }

  Widget _drawPostDetails() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(widget.post.content,style: TextStyle(
        fontSize: 17,
        letterSpacing: 1.2,
        height: 1.4,
      ),),
    );
  }

  Widget _comments() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: ExactAssetImage("assets/images/placeholder_bg.png"),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Yassine',style: TextStyle(fontWeight: FontWeight.w600),),
                  SizedBox(
                    height: 2,
                  ),
                  Text('5 min ago',style: TextStyle(fontSize: 12,color: Colors.grey.shade700),),
                ],
              )
            ],
          ),
          SizedBox(height: 16,),
          Text('This a test Comment for the post content into the new app that using news rest api!')
        ],
      ),
    );
  }

  Widget _commentTextEntry() {
    return Container(
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16,left: 8,top: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Write Comment here...',
                ),
              ),
            ),
            FlatButton(onPressed: () {}, child: Text('SEND',style: TextStyle(color: Colors.blue),))
          ],
        ),
      ),
    );
  }
}
