import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> with TickerProviderStateMixin {
  TextTheme textTheme;
  bool isVisible = true;
  Animation<int> _characterCount;

  String _currentString;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    _currentString = '25,452';
    int duration = 70 * (!isVisible ? _currentString.length : 4);
    AnimationController controller = new AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );
    _characterCount = new StepTween(begin: 0, end: _currentString.length)
        .animate(new CurvedAnimation(parent: controller, curve: Curves.easeIn));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).accentColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              GestureDetector(
                onTap: () async {
                  int duration = 70 * (!isVisible ? _currentString.length : 4);
                  controller = new AnimationController(
                    duration: Duration(milliseconds: duration),
                    vsync: this,
                  );

                  setState(() {
                    isVisible = !isVisible;
                    _currentString = isVisible ? '25,452' : '. . . .';
                    _characterCount =
                        new StepTween(begin: 0, end: _currentString.length)
                            .animate(new CurvedAnimation(
                                parent: controller, curve: Curves.easeIn));
                  });
                  await controller.forward();
                  controller.dispose();
                },
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xff1e37db),
                  child: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedBuilder(
                animation: _characterCount,
                builder: (BuildContext context, Widget child) {
                  String text =
                      _currentString.substring(0, _characterCount.value);
                  return Text(
                    text,
                    style: textTheme.headline4.copyWith(color: Colors.white),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Debit Card (4480)',
                      style: TextStyle(color: Colors.white70, fontSize: 12)),
                  Image.asset('assets/images/mastercard-logo.png', height: 20),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
