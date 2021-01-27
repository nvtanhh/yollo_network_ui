import 'package:flutter/material.dart';

class Noti {
  final String msg;
  final String time;
  Noti({@required this.msg, @required this.time});
}

class NotificationPage extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Noti> _listNoti = [
      Noti(
          msg:
              "New noti is comingbiugriguhighslhgrghiviofgioehgirehtuahf4yyhgwnkls",
          time: "1-1-2021"),
      Noti(msg: "Old noti is coming", time: "1-1-2021"),
      Noti(msg: "New year is coming", time: "1-1-2021"),
      Noti(msg: "dont forget about us", time: "1-1-2021"),
      Noti(msg: "New noti is coming", time: "1-1-2021"),
      Noti(msg: "New noti is coming", time: "1-1-2021"),
      Noti(msg: "New noti is coming", time: "1-1-2021"),
      Noti(msg: "New noti is coming", time: "1-1-2021"),
      Noti(msg: "New noti is coming", time: "1-1-2021"),
      Noti(msg: "New noti is coming", time: "6-1-2021"),
      Noti(msg: "New noti is coming", time: "1-1-2021"),
      Noti(msg: "New noti is coming", time: "1-1-2021"),
      Noti(msg: "New noti is coming", time: "1-1-2021"),
    ];
    return Scaffold(
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //search
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
                  itemCount: _listNoti.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 16),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage("assets/image/lll.jpg"),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      onTap: () {},
                      title: Text("${_listNoti[index].msg}", maxLines: 2),
                      subtitle: Text("${_listNoti[index].time}"),
                      trailing: IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {},
                      ),
                    );
                  },
                ),
                //notis
              ],
            )));
  }
}
