import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/utilities/data_utilitis.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  PostsAPI postApi = new PostsAPI();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _drawHeader(),
          _drawTopStories(),
          _drawRecentUpdates(),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _headerTitle = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );

    TextStyle _headerDescription = TextStyle(
      color: Colors.white,
      fontSize: 14,
    );

    return FutureBuilder(
      future: postApi.fetchPostsByCategory("9"),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return connectionError();
            break;

          case ConnectionState.active:
            return loading();
            break;
          case ConnectionState.waiting:
            return loading();
            break;
          case ConnectionState.done:
            if (snapshot.hasError) {
              return error(snapshot.error);
            } else {
              if (snapshot.hasData) {
                List<Post> posts = snapshot.data;
                Random random = Random();
                int randomIndex = random.nextInt(posts.length);
                Post post = posts[randomIndex];

                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.26,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(post.featuredImage),
                    fit: BoxFit.cover,
                  )),
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.black.withOpacity(0.4),
                      )
                      ,
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  post.title,
                                  style: _headerTitle,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  post.content.substring(0, 150),
                                  style: _headerDescription,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return noData();
              }
            }

            break;
        }

        return Container(
          width: 0,
          height: 0,
        );
      },
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: _drawSectionTitle("Top Stories"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: FutureBuilder(
                future: postApi.fetchPostsByCategory("19"),
                builder: (context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return loading();
                      break;

                    case ConnectionState.active:
                      return loading();
                      break;

                    case ConnectionState.none:
                      return connectionError();
                      break;

                    case ConnectionState.done:
                      if (snapshot.error != null) {
                        return error(snapshot.error);
                      } else {
                        if (snapshot.hasData) {
                          List<Post> posts = snapshot.data;

                          if (posts.length >= 3) {
                            Post post1 = snapshot.data[0];
                            Post post2 = snapshot.data[1];
                            Post post3 = snapshot.data[2];

                            return Column(
                              children: [
                                _drawSingleRow(post1),
                                _drawDivider(),
                                _drawSingleRow(post2),
                                _drawDivider(),
                                _drawSingleRow(post3),
                              ],
                            );
                          } else {
                            return noData();
                          }
                        } else {
                          return noData();
                        }
                      }
                      break;
                  }

                  return Container(
                    height: 0,
                    width: 0,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawSingleRow(Post post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            height: 90,
            width: 90,
            child: Image.network(
              post.featuredImage,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 18,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  post.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'yassine el haitar',
                      style: TextStyle(fontSize: 12),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 14,
                        ),
                        Text(
                          parseDateHuman(post.dateWritten),
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      height: 1,
      color: Colors.grey.shade300,
    );
  }

  Widget _drawSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade800,
          fontSize: 16),
    );
  }

  Widget _drawRecentUpdates() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: postApi.fetchPostsByCategory("4"),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return connectionError();
              break;

            case ConnectionState.active:
              return loading();
              break;

            case ConnectionState.waiting:
              return loading();
              break;

            case ConnectionState.done:
              if (snapshot.hasError) {
                return error(snapshot.error);
              } else {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8, left: 8),
                        child: _drawSectionTitle("Recent Updates"),
                      ),
                      _DrawRecentUpdatesCard(Colors.red, snapshot.data[0]),
                      _DrawRecentUpdatesCard(Colors.green, snapshot.data[1]),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  );
                } else {
                  return noData();
                }
              }

              break;
          }

          return Container(
            width: 0,
            height: 0,
          );
        },
      ),
    );
  }

  Widget _DrawRecentUpdatesCard(Color color, Post post) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(post.featuredImage),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.26,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 90,
            padding: EdgeInsets.only(top: 2, bottom: 2),
            child: Text(
              "Sport",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(4)),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            post.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(
                Icons.access_time,
                size: 18,
              ),
              SizedBox(
                width: 4,
              ),
              Text(parseDateHuman(post.dateWritten)),
            ],
          ),
        )
      ],
    ));
  }
}
