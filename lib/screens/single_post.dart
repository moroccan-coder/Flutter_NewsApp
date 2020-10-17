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
    return CustomScrollView(
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
            delegate: SliverChildBuilderDelegate(
          (context, index) => Container(
            color: getRandomColor(),
            height: 150.0,
          ),
        )),
      ],
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
}
