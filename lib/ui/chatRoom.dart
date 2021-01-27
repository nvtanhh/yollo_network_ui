import 'another.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chatterScreen.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with AutomaticKeepAliveClientMixin {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        text: "Jane Russel",
        secondaryText: "Awesome Setup",
        image: "assets/image/lll.jpg",
        time: "Now"),
    ChatUsers(
        text: "Glady's Murphy",
        secondaryText: "That's Great",
        image: "assets/image/lll.jpg",
        time: "Yesterday"),
    ChatUsers(
        text: "Jorge Henry",
        secondaryText: "Hey where are you?",
        image: "assets/image/lll.jpg",
        time: "31 Mar"),
    ChatUsers(
        text: "Philip Fox",
        secondaryText: "Busy! Call me in 20 mins",
        image: "assets/image/lll.jpg",
        time: "28 Mar"),
    ChatUsers(
        text: "Debra Hawkins",
        secondaryText: "Thankyou, It's awesome",
        image: "assets/image/lll.jpg",
        time: "23 Mar"),
    ChatUsers(
        text: "Jacob Pena",
        secondaryText: "will update you in evening",
        image: "assets/image/lll.jpg",
        time: "17 Mar"),
    ChatUsers(
        text: "Andrey Jones",
        secondaryText: "Can you please share the file?",
        image: "assets/image/lll.jpg",
        time: "24 Feb"),
    ChatUsers(
        text: "John Wick",
        secondaryText: "How are you?",
        image: "assets/image/lll.jpg",
        time: "18 Feb"),
  ];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
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
                  hintText: "Search...",
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
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ChatUsersList(
                  text: chatUsers[index].text,
                  secondaryText: chatUsers[index].secondaryText,
                  image: chatUsers[index].image,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ChatUsersList extends StatefulWidget {
  String text;
  String secondaryText;
  String image;
  String time;
  bool isMessageRead;
  ChatUsersList(
      {@required this.text,
      @required this.secondaryText,
      @required this.image,
      @required this.time,
      @required this.isMessageRead});
  @override
  _ChatUsersListState createState() => _ChatUsersListState();
}

class _ChatUsersListState extends State<ChatUsersList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatterScreen();
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.image),
                    maxRadius: 30,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.text),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.secondaryText,
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: 12,
                  color: widget.isMessageRead
                      ? Colors.deepPurple
                      : Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }
}
