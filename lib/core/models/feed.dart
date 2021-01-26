class Feed {
  String avatar, userName, content;
  List<String> images;
  bool isLiked;
  int likeNumber, commentNumber;
  DateTime createdAt;

  Feed(
      {this.avatar,
      this.userName,
      this.content,
      this.isLiked,
      this.likeNumber,
      this.commentNumber,
      this.images,
      this.createdAt});
}

List<Feed> getFeedList() {
  return [
    new Feed(
        avatar: 'assets/images/avt1.jpg',
        userName: 'Tanh Nguyen',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        isLiked: true,
        likeNumber: 213,
        commentNumber: 25,
        createdAt: DateTime.now(),
        images: [
          'https://images.iphonephotographyschool.com/18022/560/Instagram-Photo-Editing.jpg',
          'https://images.iphonephotographyschool.com/18027/560/Instagram-Photo-Editing.jpg',
          'https://images.iphonephotographyschool.com/18045/560/Instagram-Photo-Editing.jpg'
        ]),
    new Feed(
        avatar: 'assets/images/avt2.jpeg',
        userName: 'Cristiano Ronaldo',
        content: 'Lorem ipsum dolor sit amet',
        isLiked: true,
        likeNumber: 213,
        commentNumber: 25,
        createdAt: new DateTime(2021, 1, 20, 17, 30),
        images: [
          'https://onextrapixel.com/wp-content/uploads/2012/03/instagram-cover.jpg',
        ]),
    new Feed(
        avatar: 'assets/images/avt3.jpeg',
        userName: 'Dang Le',
        content:
            'Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        isLiked: true,
        likeNumber: 213,
        commentNumber: 25,
        createdAt: new DateTime(2021, 1, 20, 2, 30),
        images: [
          'https://spic.one/wp-content/uploads/2018/08/4679299d934ec04aca10.jpg',
          'https://spic.one/wp-content/uploads/2018/08/034740ba07a441f4e6c5.jpg',
        ]),
  ];
}
