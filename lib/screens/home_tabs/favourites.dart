import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Color> colorsList = [
    Colors.red,
    Colors.green,
    Colors.lightBlue,
    Colors.amber,
    Colors.purpleAccent,
    Colors.pink
  ];

  Random random = Random();

  Color _getRandomColor() {
    return colorsList[random.nextInt(colorsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                _authorRow(),
                SizedBox(height: 16,),
                _newsItemRow(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _authorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/images/placeholder_bg.png"),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              width: 40,
              height: 40,
              margin: EdgeInsets.only(right: 12),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Yassine El haitar",
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "22 min .",
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 12),
                    ),
                    Text(
                      "Sport",
                      style: TextStyle(
                          color: _getRandomColor(),
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.bookmark_border,
            color: Colors.grey,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _newsItemRow() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: ExactAssetImage("assets/images/placeholder_bg.png"),
            fit: BoxFit.cover,
          )),
          width: 100,
          height: 100,
          margin: EdgeInsets.only(right: 16),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Where does it come from noWhere!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                textAlign: TextAlign.start,
              ),
              Text(
                "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
