import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextTheme textTheme;
  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: Column(
          children: [_buildProfileInfo(), Expanded(child: _builAllPost())],
        ));
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

  _builAllPost() {
    return Container(
      child: DefaultTabController(
        length: 3,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Container(
                    height: 25,
                    child: Text(
                      '38 Posts',
                      style: textTheme.button.copyWith(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 25,
                    child: Text(
                      '104 Saved',
                      style: textTheme.button.copyWith(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 25,
                    child: Text(
                      '3 Other',
                      style: textTheme.button.copyWith(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Icon(Icons.directions_car),
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_bike),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
