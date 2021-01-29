import 'package:flutter/material.dart';
import 'chat_room.dart';
import "notification.dart";

class ContentCard extends StatefulWidget {
  @override
  _ContentCardState createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tab(),
      appBar: AppBar(
        title: Text("Contact",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold, color: Colors.grey)),
        backgroundColor: Colors.white,
        bottom: TabBar(
          onTap: (index) {},
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.deepPurple,
          tabs: [
            Tab(
              child: Text(
                "Chats",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            Tab(
              child: Text(
                "Notifications",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
    );
  }

  Widget _tab() {
    return Container(
      child: TabBarView(
        controller: _tabController,
        children: [
          ChatPage(),
          NotificationPage(),
        ],
      ),
    );
  }
}
