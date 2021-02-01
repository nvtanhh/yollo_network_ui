import 'another.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chatter_screen.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with AutomaticKeepAliveClientMixin {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        text: "Jane Russel",
        secondaryText:
            "Awesome Setup hi my name is Lam Phan Dam Tung Heloo helloooooo",
        image: "assets/images/avt4.jpeg",
        time: "Now",
        countUnread: 1),
    ChatUsers(
        text: "Glady's Murphy",
        secondaryText: "That's Great",
        image: "assets/images/avt5.jpeg",
        time: "Yesterday",
        countUnread: 23),
    ChatUsers(
        text: "Jorge Henry",
        secondaryText: "Hey where are you?",
        image: "assets/images/avt6.jpeg",
        time: "31 Mar",
        countUnread: 12),
    ChatUsers(
        text: "Philip Fox",
        secondaryText: "Busy! Call me in 20 mins",
        image: "assets/images/pic5.jpeg",
        time: "28 Mar",
        countUnread: 0),
    ChatUsers(
        text: "Debra Hawkins",
        secondaryText: "Thankyou, It's awesome",
        image: "assets/images/avt7.jpeg",
        time: "23 Mar",
        countUnread: 3),
    ChatUsers(
        text: "Jacob Pena",
        secondaryText: "will update you in evening",
        image: "assets/images/avt8.jpg",
        time: "17 Mar",
        countUnread: 11),
    ChatUsers(
        text: "Andrey Jones",
        secondaryText: "Can you please share the file?",
        image: "assets/images/avt9.jpeg",
        time: "24 Feb",
        countUnread: 0),
    ChatUsers(
        text: "John Wick",
        secondaryText: "How are you?",
        image: "assets/images/avt10.jpg",
        time: "18 Feb",
        countUnread: 0),
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
                  countUnread: chatUsers[index].countUnread,
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
  int countUnread;
  ChatUsersList(
      {@required this.text,
      @required this.secondaryText,
      @required this.image,
      @required this.time,
      @required this.isMessageRead,
      this.countUnread});
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
        padding: EdgeInsets.only(left: 20, right: 16, top: 13, bottom: 13),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(widget.image),
                        maxRadius: 30,
                      ),
                      (widget.countUnread > 0)
                          ? CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.red,
                              child: Text("${widget.countUnread}",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white)))
                          : Container()
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.text,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      (widget.countUnread > 0) ? 17 : 15)),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            (widget.secondaryText.length < 25)
                                ? widget.secondaryText
                                : widget.secondaryText.substring(0, 25),
                            style: TextStyle(
                                fontSize: (widget.countUnread > 0) ? 15 : 13,
                                color: widget.countUnread == 0
                                    ? Colors.grey.shade500
                                    : Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.time,
                  style: TextStyle(
                      fontSize: 12,
                      color: widget.isMessageRead
                          ? Colors.deepPurple
                          : Colors.grey.shade500),
                ),
                (widget.countUnread == 0)
                    ? CircleAvatar(
                        radius: 8,
                        backgroundImage: AssetImage(widget.image),
                      )
                    : Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}
