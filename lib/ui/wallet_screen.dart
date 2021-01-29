import 'package:flutter/material.dart';
import 'package:yollo_behance/core/models/payment_history.dart';
import 'package:yollo_behance/ui/widgets/card_widget.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({Key key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  TextTheme textTheme;
  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            ListView(
              children: [
                _buildHeader(),
                _buildCardsWrapper(),
                _buildSentActions(),
                // _buildPaymentHistory()
              ],
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.4,
              expand: true,
              builder: (context, scrollController) =>
                  _buildPaymentHistory(scrollController),
            )
          ],
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
              Icons.timelapse,
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
              Icons.more_vert,
              color: Colors.grey[600],
              size: 18,
            ),
          ),
          onPressed: () {},
        )
      ],
    );
  }

  _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello',
                style: textTheme.headline5,
              ),
              SizedBox(width: 5),
              Text(
                'Tanh',
                style:
                    textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            'You earned \$2000 USD April so far',
            style: textTheme.bodyText2,
          )
        ],
      ),
    );
  }

  _buildCardsWrapper() {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 30, 16, 10),
      child: Row(
        children: [
          new Expanded(
            flex: 1,
            child: Column(
              children: [
                Icon(
                  Icons.add,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          new Expanded(
            flex: 4,
            child: CardWidget(),
          )
        ],
      ),
    );
  }

  _buildSentActions() {
    List<List<String>> stories = [
      ['assets/images/avt6.jpeg', 'Lona'],
      ['assets/images/avt8.jpg', 'Emilly'],
      ['assets/images/avt4.jpeg', 'Jeny'],
    ];
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 10),
          padding: EdgeInsets.only(left: 20, right: 16),
          height: 90,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              _storyItem(),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) => _storyItem(
                    avatar: stories[index][0], name: stories[index][1]),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 45, right: 25, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SUBSCRIPTIONS',
                style: textTheme.subtitle2.copyWith(
                    color: Colors.grey[400], fontWeight: FontWeight.bold),
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor: Color(0xff1e37db),
                child: Text(
                  '3',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _buildPaymentHistory(ScrollController scrollController) {
    List<PaymentHistory> paymentHistory = getPaymentHistory();
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 20),
              width: 30,
              height: 2.5,
              color: Colors.grey[300],
            ),
            Row(
              children: [
                Text(
                  'PAYMENT HISTORY',
                  style: textTheme.subtitle2.copyWith(
                      color: Colors.grey[400], fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: paymentHistory.length,
              itemBuilder: (context, index) =>
                  _paymentHistoryItem(paymentHistory[index]),
            )
          ],
        ),
      ),
    );
  }

  _storyItem({String avatar, String name}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(left: 20),
        child: avatar != null
            ? Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(avatar),
                  ),
                  SizedBox(height: 8),
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold))
                ],
              )
            : Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).accentColor,
                    child: Icon(Icons.arrow_forward_sharp, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text('Sent', style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
      ),
    );
  }

  _paymentHistoryItem(PaymentHistory p) {
    String date = p.time.day.toString() + ' ' + getMonth(p.time.month);
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          CircleAvatar(radius: 20, backgroundImage: AssetImage(p.image)),
          SizedBox(width: 20),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(p.storeName,
                  style:
                      textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              SizedBox(height: 3),
              Text(date,
                  style: textTheme.bodyText2.copyWith(color: Colors.grey))
            ],
          )),
          Text('-\$' + p.amount.toString(),
              style: textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  String getMonth(int month) {
    List months = [
      'january',
      'february',
      'march',
      'april',
      'may',
      'june',
      'july',
      'august',
      'septemper',
      'octoper',
      'novemper',
      'decemper'
    ];
    return months[month + 1];
  }
}
