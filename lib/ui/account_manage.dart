import 'package:flutter/material.dart';

class AccountManagerScreen extends StatefulWidget {
  AccountManagerScreen({Key key}) : super(key: key);
  @override
  _AccountManagerScreenState createState() => _AccountManagerScreenState();
}

class _AccountManagerScreenState extends State<AccountManagerScreen> {
  TextTheme textTheme;
  bool toggleValue;
  bool checkPress;

  @override
  void initState() {
    toggleValue = false;
    checkPress = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0.85),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Text("Account",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0)),
                Text("Manager",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0))
              ],
            ),
            _buildQRcode(),
            _buildOptions(),
            Center(child: _buildButtonOption()),
            SizedBox(height: 20)
          ],
        ))));
  }

  Widget _buildQRcode() {
    var image1 = "https://img.icons8.com/bubbles/2x/qr-code.png";
    var image2 = "https://img.icons8.com/clouds/2x/qr-code.png";
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildQRitem(image1, "Pay", "by QR code"),
        _buildQRitem(image2, "Skan", "QR code")
      ],
    ));
  }

  Widget _buildQRitem(String image, String text, String subtitle) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          children: [
            Image.network(image, width: 80, height: 80),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(subtitle, style: TextStyle(fontSize: 15))
          ],
        ));
  }

  Widget _buildOptions() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            _buildTileOption(
                Icon(Icons.person, size: 40, color: Colors.grey[400]),
                "Real Name Authencation",
                "",
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey)),
            _buildTileOption(
                Icon(Icons.event_note_rounded,
                    size: 40, color: Colors.grey[400]),
                "Change Payment Password",
                "",
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey)),
            _buildTileOption(
                Icon(Icons.fact_check_outlined,
                    size: 40, color: Colors.grey[400]),
                "Forgot Payment Password",
                "",
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey)),
            _buildTileOption(
                Icon(Icons.leaderboard_rounded,
                    size: 40, color: Colors.grey[400]),
                "Face ID Pay",
                "When enable you can use id verification to make payment faster",
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey)),
            _buildTileOption(
                Icon(Icons.fullscreen, size: 40, color: Colors.grey[400]),
                "Recieve Transfers",
                "Other users can transfer money to your mobile number linked to Yollo (186***4608) in Money",
                Column(children: [anotherToggle(), _buildToggleButton()]))
          ],
        ));
  }

  Widget _buildTileOption(
      Icon leading, String title, String subtitle, Widget trailing) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 20, bottom: 20, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: leading,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      (subtitle.length > 0)
                          ? Text(subtitle,
                              maxLines: 3,
                              style: TextStyle(color: Colors.grey[400]))
                          : Container()
                    ],
                  ))
                ],
              ),
            ),
            trailing
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton() {
    return GestureDetector(
        onTap: () {
          toggleButton();
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            height: 30.0,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: toggleValue
                    ? Colors.green[100]
                    : Colors.grey.withOpacity(0.5)),
            child: Stack(children: [
              AnimatedPositioned(
                child: AnimatedSwitcher(
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(child: child, scale: animation);
                    },
                    child: toggleValue
                        ? Icon(Icons.check_circle,
                            color: Colors.green, key: UniqueKey(), size: 30)
                        : Icon(Icons.remove_circle_outline,
                            color: Colors.grey, size: 30, key: UniqueKey()),
                    duration: Duration(milliseconds: 100)),
                duration: Duration(milliseconds: 100),
                curve: Curves.easeIn,
                left: toggleValue ? 30.0 : 0.0,
                right: toggleValue ? 0.0 : 30.0,
              )
            ])));
  }

  toggleButton() {
    setState(() {
      toggleValue = !toggleValue;
      print("jaha");
    });
  }

  anotherToggle() {
    return Switch(
      value: toggleValue,
      onChanged: (value) {
        setState(() {
          toggleValue = value;
          print(toggleValue);
        });
      },
      activeTrackColor: Colors.lightGreen,
      activeColor: Colors.green,
    );
  }

  Widget _buildButtonOption() {
    return RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        color: checkPress ? Colors.green : Colors.grey[200],
        //color: Colors.green,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
        onPressed: () {
          setState(() {
            checkPress = !checkPress;
          });
        },
        child: Text("Cancel Yollo Pay",
            style: TextStyle(
                color: checkPress ? Colors.white : Colors.grey[700])));
  }
}
