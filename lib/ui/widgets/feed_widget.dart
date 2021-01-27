import 'package:flutter/material.dart';
import 'package:yollo_behance/core/models/feed.dart';
import 'package:timeago/timeago.dart' as timeago;

class FeedWidget extends StatefulWidget {
  final Feed feed;
  const FeedWidget(this.feed, {Key key}) : super(key: key);

  @override
  _FeedWidgetState createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  var _currentImageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              _buildhHeader(context),
              Expanded(child: _buildImages()),
              _buildContent(context),
              _buildLikeCommentWrapper(context)
            ],
          )),
    );
  }

  _buildhHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(children: [
        Container(
          margin: EdgeInsets.only(right: 15),
          child: CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(widget.feed.avatar),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.feed.userName,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(fontWeight: FontWeight.bold)),
              Text(timeago.format(widget.feed.createdAt),
                  style: Theme.of(context).textTheme.caption),
            ],
          ),
        ),
        Icon(
          Icons.more_vert,
          color: Colors.grey,
        ),
      ]),
    );
  }

  _buildContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 10, bottom: 20),
      child: Text(widget.feed.content,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.grey[700]),
          maxLines: 2),
    );
  }

  _buildLikeCommentWrapper(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Icon(
              Icons.favorite,
              color: widget.feed.isLiked ? Colors.red : Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Text(widget.feed.likeNumber.toString(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontWeight: FontWeight.bold))
          ]),
          Row(children: [
            Icon(Icons.comment, color: Colors.grey),
            SizedBox(width: 5),
            Text(widget.feed.commentNumber.toString(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontWeight: FontWeight.bold))
          ]),
          Row(children: [
            Text('Share',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontWeight: FontWeight.bold)),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.arrow_forward_sharp)
          ]),
        ],
      ),
    );
  }

  _buildImages() {
    int imageLenght = widget.feed.images.length;
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Stack(
        children: [
          PageView(
              onPageChanged: onChangeImage,
              physics: BouncingScrollPhysics(),
              children: widget.feed.images
                  .map((avatarUrl) => _feedImage(avatarUrl))
                  .toList()),
          if (imageLenght > 1)
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 30),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: Colors.black87.withOpacity(.5),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      '$_currentImageIndex/$imageLenght',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
              ),
            )
        ],
      ),
    );
  }

  Widget _feedImage(String url) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(url),
        ),
      ),
    );
  }

  void onChangeImage(int index) {
    setState(() {
      _currentImageIndex = index + 1;
    });
  }
}
