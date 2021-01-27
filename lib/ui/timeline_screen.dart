import 'package:flutter/material.dart';
import 'package:yollo_behance/core/models/feed.dart';
import 'package:yollo_behance/ui/create_post.dart';
import 'package:yollo_behance/ui/story_screen.dart';

import 'package:yollo_behance/ui/widgets/feed_widget.dart';

class TimeLineScreen extends StatefulWidget {
  TimeLineScreen({Key key}) : super(key: key);

  @override
  _TimeLineScreenState createState() => _TimeLineScreenState();
}

class _TimeLineScreenState extends State<TimeLineScreen> {
  List<Feed> feedList = getFeedList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          // _buildAppBar(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refesh,
              child: ListView.builder(
                shrinkWrap: true,
                // padding: EdgeInsets.only(top: 10),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: feedList.length,
                itemBuilder: (BuildContext context, int index) => Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  margin: EdgeInsets.only(bottom: 20),
                  child: FeedWidget(
                    feedList[index],
                    key: ObjectKey(feedList[index]),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  _buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0.85),
      leading: Icon(
        Icons.search,
        color: Colors.black87,
      ),
      title: Text(
        'Explore',
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreatePostScreen()),
            );
          },
        )
      ],
    );
  }

  Future<void> _refesh() {
    return Future<void>.value();
  }
}
