import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pagemodel.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<PageModel> pages;

  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);

  void _addPages() {
    pages = List<PageModel>();
    pages.add(PageModel(Icons.live_tv, 'assets/images/bg.png', "Welcome",
        "Welcome the the WorldWide news app, the best news app in the play store"));
    pages.add(PageModel(Icons.wifi_tethering, 'assets/images/bg2.jpg', "On air",
        "Watch new live from everywhere around the glob"));
    pages.add(PageModel(Icons.airplay, 'assets/images/bg3.jpg', "Tv Casting",
        "Casting the news to your smart tv and enjoy hot news"));
    pages.add(PageModel(Icons.score, 'assets/images/bg4.jpg', "Trending News",
        "Receive the latest hot news in your city and country!"));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();
    return Stack(
      children: [
        Scaffold(
          body: PageView.builder(
            onPageChanged: (index) {
              _pageViewNotifier.value = index;
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(pages[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform.translate(
                        child: Icon(
                          pages[index].icon,
                          size: 100,
                          color: Colors.white,
                        ),
                        offset: Offset(0, -120),
                      ),
                      Text(
                        pages[index].title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 16),
                        child: Text(
                          pages[index].description,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
            itemCount: pages.length,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Transform.translate(
            offset: Offset(0, 130),
            child: _displayPageIndicators(pages.length),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24, left: 12, right: 12),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                color: Colors.blue.shade700,
                child: Text(
                  "GET STARTED",
                  style: TextStyle(color: Colors.white, letterSpacing: 1.5),
                ),
                onPressed: () {
                  /*Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                   return HomeScreen();
                 },));*/

                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      //save inside SharedPreference seen
                      _updateSeen();
                      return HomeScreen();
                    },
                  ));
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  // view indicator plugin
  Widget _displayPageIndicators(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.blue,
        ),
      ),
    );
  }

  //Save inside shared preferences
  void _updateSeen() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('seen', true);
  }
}
