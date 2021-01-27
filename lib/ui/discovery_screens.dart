import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DiscoveryScreen extends StatefulWidget {
  DiscoveryScreen({Key key}) : super(key: key);

  @override
  _DiscoveryScreenState createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  TextTheme textTheme;
  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // _buildAppBar(),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                _buildStories(),
                _buildVideos(),
                _buildNews()
                // ListView.builder(
                //   shrinkWrap: true,
                //   itemBuilder: (ctx, int) {
                //     return Card(
                //       child: ListTile(
                //           title: Text('Motivation $int'),
                //           subtitle:
                //               Text('this is a description of the motivation')),
                //     );
                //   },
                // ),
              ],
            ),
          ),

          // _buildVideos(),
          // _buildNews(),
        ],
      ),
    ));
  }

  _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon(
          //   Icons.search,
          //   color: Colors.black87,
          // ),
          Text(
            'Discovery',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
          // Icon(
          //   Icons.add,
          //   color: Colors.black87,
          // )
        ],
      ),
    );
  }

  Future<void> _refesh() {
    return Future<void>.value();
  }

  _buildStories() {
    List<List<String>> stories = [
      ['assets/images/avt6.jpeg', 'Lona'],
      ['assets/images/avt8.jpg', 'Emilly'],
      ['assets/images/avt9.jpeg', 'Jane'],
      ['assets/images/avt7.jpeg', 'Justin'],
      ['assets/images/avt5.jpeg', 'Martha'],
      ['assets/images/avt4.jpeg', 'Jeny'],
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, left: 16, bottom: 12),
          child: Text('INSPIRING STORIES',
              style: textTheme.subtitle1.copyWith(color: Colors.grey[600])),
        ),
        Container(
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
      ],
    );
  }

  _buildVideos() {
    List<List<String>> videos = [
      [
        'https://images.iphonephotographyschool.com/18022/560/Instagram-Photo-Editing.jpg',
        'Five tips for low cost Holliday'
      ],
      [
        'https://images.iphonephotographyschool.com/18027/560/Instagram-Photo-Editing.jpg',
        'The sound of your heart'
      ],
      [
        'https://images.iphonephotographyschool.com/18045/560/Instagram-Photo-Editing.jpg',
        'How to make your life become happier'
      ],
      [
        'https://onextrapixel.com/wp-content/uploads/2012/03/instagram-cover.jpg',
        'Get rick of poor'
      ],
      [
        'https://res.cloudinary.com/twenty20/private_images/t_watermark-criss-cross-10/v1511386419000/photosp/ig-411655574655873836_46642827/stock-photo-beautiful-awesome-droplets-other-indigo-instagram-instaphoto-instagrammer-instahood-ig-411655574655873836_46642827.jpg',
        'Just a simple girl'
      ],
    ];
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 16, bottom: 10),
            child: Text('VIDEOS',
                style: textTheme.subtitle1.copyWith(color: Colors.grey[600])),
          ),
          Container(
            height: 300,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: videos.length,
              itemBuilder: (context, index) =>
                  _videoItem(videos[index][0], videos[index][1]),
            ),
          ),
        ],
      ),
    );
  }

  _buildNews() {
    List<List<String>> news = [
      [
        'https://spic.one/wp-content/uploads/2018/08/4679299d934ec04aca10.jpg',
        'Five tips for low cost Holliday',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In lacinia interdum lorem. Aenean et mattis quam. Phasellus quis blandit elit, quis tempus purus.'
      ],
      [
        'https://onextrapixel.com/wp-content/uploads/2012/03/instagram-cover.jpg',
        'The sounld of your heart',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In lacinia interdum lorem. Aenean et mattis quam. Phasellus quis blandit elit, quis tempus purus.'
      ],
      [
        'https://spic.one/wp-content/uploads/2018/08/034740ba07a441f4e6c5.jpg',
        'How to have your life become happier',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In lacinia interdum lorem. Aenean et mattis quam. Phasellus quis blandit elit, quis tempus purus.'
      ],
    ];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 16, bottom: 10),
            child: Text(
              'NEWS',
              style: textTheme.subtitle1.copyWith(color: Colors.grey[600]),
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: news.length,
              itemBuilder: (context, index) =>
                  _newItem(news[index][0], news[index][1], news[index][2]),
            ),
          ),
        ],
      ),
    );
  }

  _storyItem({String avatar, String name}) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(left: 16),
      child: avatar != null
          ? Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(avatar),
                ),
                SizedBox(height: 8),
                Text(name)
              ],
            )
          : CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[200],
              child: Icon(Icons.add, color: Colors.grey),
            ),
    );
  }

  _videoItem(String background, String title) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width * 0.7,
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(background),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            margin: EdgeInsets.only(left: 16),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('assets/images/youtube.png'),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.black87.withOpacity(.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          '0:54',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(title,
                      style: textTheme.subtitle1
                          .apply(color: Colors.white, fontWeightDelta: 700)),
                ),
                Text(
                  'Some secondery text',
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 2,
                  child: LinearProgressIndicator(
                    value: .6,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  _newItem(String iamge, String title, String subTitle) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Container(
            width: 100,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(iamge),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style:
                      textTheme.subtitle2.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10),
                Text(subTitle,
                    style: textTheme.bodyText1.copyWith(color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis)
              ],
            ),
          )
        ],
      ),
    );
  }
}
