import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatDetailPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    String name = "Phan Dam Tung Lam";
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.only(right: 16),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 2,
              ),
              CircleAvatar(
                backgroundImage: AssetImage("assets/image/lll.jpg"),
                maxRadius: 20,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      (name.length > 15) ? "${name.substring(0, 14)}" : "$name",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Online",
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  ],
                ),
              ),
              IconButton(
                  icon: Icon(Icons.phone, color: Colors.deepPurple),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.video_call, color: Colors.deepPurple),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.more_vert, color: Colors.deepPurple),
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
