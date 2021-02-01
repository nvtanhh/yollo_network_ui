import 'package:flutter/material.dart';
import 'dart:math';

class MainProfileScreen extends StatefulWidget {
  MainProfileScreen({Key key}) : super(key: key);

  @override
  _MainProfileScreenState createState() => _MainProfileScreenState();
}

class _MainProfileScreenState extends State<MainProfileScreen>
    with SingleTickerProviderStateMixin {
  TextTheme textTheme;
  int _currentIndex;
  TabController _tabController;
  var rng = new Random();
  @override
  void initState() {
    _currentIndex = 0;
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ListView(
              children: [
                _buildHeader(),
                // _buildPaymentHistory()
              ],
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.8,
              minChildSize: 0.5,
              expand: true,
              builder: (context, scrollController) =>
                  _buildPaymentHistory(scrollController),
            )
          ],
        ));
  }

  _buildHeader() {
    return Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Stories",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    )),
                Container(
                  //  height: 30,
                  //  width: 30,
                  padding: EdgeInsets.all(6),
                  child: Text("12", style: TextStyle(color: Colors.white)),
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_buildSliding(), _buildSliding()],
              ))
            ])
          ],
        ));
  }

  Widget _buildSearch() {
    return Padding(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey.shade100)),
          hintText: "Search your content",
          hintStyle: TextStyle(color: Colors.grey.shade400),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade400,
            size: 20,
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: EdgeInsets.all(8),
        ),
      ),
    );
  }

  Widget _buildSliding() {
    List<List<String>> stories = [
      ['assets/images/download (1).jpeg', 'Beach'],
      ['assets/images/download (2).jpeg', 'Funny'],
      ['assets/images/download (3).jpeg', 'Anime'],
      ['assets/images/download (4).jpeg', 'Wibu'],
      ['assets/images/download.jpeg', 'USUK'],
      ['assets/images/images (1).jpeg', 'POP'],
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
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
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage(avatar)),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
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

  _buildPaymentHistory(ScrollController scrollController) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            controller: scrollController,
            child: Column(
              //  mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildAppBar(),
                _buildProfileInfo(),
                _buildSearch(),
                _buildAllPost()
                //_builAllPost()
              ],
            )));
  }

  _buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0.85),
      leading: Container(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey[200],
            child: Icon(
              Icons.menu,
              color: Colors.grey[600],
              size: 18,
            ),
          )),
      actions: [
        IconButton(
          icon: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[200],
            child: Icon(
              Icons.add,
              color: Colors.grey[600],
              size: 18,
            ),
          ),
          onPressed: () {},
        )
      ],
    );
  }

  _buildProfileInfo() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/avt8.jpg'),
        ),
        SizedBox(height: 10),
        Text(
          'Maria',
          style: textTheme.headline4
              .copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        SizedBox(height: 5),
        Text(
          '8 Following | 9500 Followers',
          style: textTheme.subtitle1
              .copyWith(fontWeight: FontWeight.normal, color: Colors.black87),
        )
      ],
    );
  }

  _buildAllPost() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabController,
          tabs: [
            Tab(
                child: Container(
              height: 25,
              child: Text(
                '38 Posts',
                style: textTheme.button.copyWith(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            )),
            Tab(
                child: Container(
              height: 25,
              child: Text(
                '104 Saved',
                style: textTheme.button.copyWith(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            )),
            Tab(
                child: Container(
              height: 25,
              child: Text(
                '3 Other',
                style: textTheme.button.copyWith(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            )),
          ],
        ),
        Container(
            height: 4000,
            child: Column(
              children: [
                Expanded(
                    child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildFallingWidget(),
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_bike),
                  ],
                ))
              ],
            )),
      ]),
    );
  }

  Widget _buildFallingWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              itemCount: 10,
              itemBuilder: (_, i) {
                var height = rng.nextInt(150) + 150;
                var new_h = height.toDouble();
                if (new_h > 250) {
                  new_h = 200.0;
                }
                return Container(
                    margin: EdgeInsets.all(10.0),
                    width: 50,
                    height: new_h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: const AssetImage(
                                "assets/images/download (1).jpeg")),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))));
              }),
        ),
        Flexible(
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              itemCount: 10,
              itemBuilder: (_, i) {
                var height = rng.nextInt(150) + 150;
                var new_h = height.toDouble();
                if (new_h > 250) {
                  new_h = 200.0;
                }
                return Container(
                    margin: EdgeInsets.all(10.0),
                    width: 50,
                    height: new_h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/images.jpeg")),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))));
              }),
        ),
      ],
    );
  }
}
