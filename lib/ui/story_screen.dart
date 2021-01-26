import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class StoryScreen extends StatefulWidget {
  StoryScreen({Key key}) : super(key: key);

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  int _currentIndex;
  int _currentUserView;
  @override
  void initState() {
    _currentIndex = 0;
    _currentUserView = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onDoubleTap: () {},
          onHorizontalDragStart: (DragStartDetails details) {
            print("start");
          },
          onHorizontalDragEnd: (DragEndDetails details) {
            print("end");
          },
          onHorizontalDragUpdate: (DragUpdateDetails details) {
            print("update");
          },
          child: SafeArea(
              child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/beach-quotes-1559667853.jpg"),
                        fit: BoxFit.cover)),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(),
                  SizedBox(height: 30),
                  _buildSliding(),
                  _buildInteract(),
                ],
              ),
              _buildSwipeInteract(),
            ],
          ))),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            }),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Yollo",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0)),
            ),
            Row(
              children: [
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width * 0.15,
                  color: Colors.blue,
                ),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width * 0.07,
                  color: Colors.yellow,
                ),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width * 0.07,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
        IconButton(
          icon: Icon(Icons.clear, color: Colors.white),
          onPressed: () {
            print("clear");
          },
        )
      ],
    );
  }

  Widget _buildSliding() {
    List<List<String>> stories = [
      ['assets/images/avt6.jpeg', 'Lona'],
      ['assets/images/avt8.jpg', 'Emilly'],
      ['assets/images/avt9.jpeg', 'Jane'],
      ['assets/images/avt7.jpeg', 'Justin'],
      ['assets/images/avt5.jpeg', 'Martha'],
      ['assets/images/avt4.jpeg', 'Jeny'],
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 110,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              _storyItem(),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) => _storyItem(
                    avatar: stories[index][0],
                    name: stories[index][1],
                    index: index),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _storyItem({String avatar, String name, int index}) {
    return Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(left: 16),
        child: avatar != null
            ? Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: (_currentIndex == index)
                                    ? Colors.white
                                    : Colors.grey[100],
                                width: 4),
                            color: Colors.transparent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(45.0))),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(avatar),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(name)
                ],
              )
            : Container(
                height: 60,
                width: 40,
                child: Icon(Icons.add, color: Colors.white),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8,
                          0.0), // 10% of the width, so there are ten blinds.
                      colors: [
                        const Color(0xffb3e5fc),
                        const Color(0xfffffde7)
                      ], // red to yellow
                      tileMode: TileMode
                          .clamp, // repeats the gradient over the canvas
                    ),
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
              ));
  }

  Widget _buildInteract() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 15, top: 100),
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Icon(Icons.favorite, color: Colors.red),
                      Text(
                        "1.4k",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Icon(Icons.share, color: Colors.white),
                      Text("1.4k", style: TextStyle(color: Colors.white))
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Icon(Icons.comment, color: Colors.white),
                      Text("1.4k", style: TextStyle(color: Colors.white))
                    ],
                  ))
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSwipeInteract() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            margin: EdgeInsets.all(15.0),
            child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                style: TextStyle(color: Colors.white))),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.0),
          height: 3,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: (MediaQuery.of(context).size.width - 40.0) / 4,
                    color:
                        (index == _currentIndex) ? Colors.blue : Colors.white);
              }),
        ),
        SizedBox(height: 20)
      ],
    );
  }
}
