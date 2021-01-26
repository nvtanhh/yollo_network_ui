import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  CreatePostScreen({Key key}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _messageController = TextEditingController();
  FocusNode _passwordFocusNode;

  String _validateMessage(String text) {
    return "Haha";
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTopBar(),
            _buildTextField(),
            _buildTextContent(),
          ],
        ))),
        bottomSheet: _buildOption());
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
            }),
        Column(
          children: [
            Text("CreatePost",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0)),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width * 0.15,
                  color: Colors.blue,
                ),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width * 0.07,
                  color: Colors.yellow,
                ),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width * 0.07,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
        IconButton(
          icon: Icon(Icons.check_outlined),
          onPressed: () {
            print("Back to main page");
          },
        )
      ],
    );
  }

  Widget _buildTextField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //image\
        Container(
          margin: EdgeInsets.only(
            right: 15,
            left: 15,
          ),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("assets/images/avt1.jpg"),
          ),
        ),
        //textfield
      ],
    );
  }

  Widget _buildTextContent() {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Row(children: <Widget>[
                new Expanded(
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: _messageController,
                        validator: _validateMessage,
                        decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 15.0),
                            labelText: "Add a caption ...",
                            errorMaxLines: 3),
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (v) => FocusScope.of(context)
                            .requestFocus(_passwordFocusNode),
                      )),
                ),
              ]),
            ),
          ],
        ));
  }

  void getImage() {}
  void getFromGallery() {}
  void getMultiFromGallery() {}
  void pickFiles() {}
  Widget _buildOption() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.photo,
                      color: Colors.grey,
                      size: 20.0,
                    )),
                onTap: getImage,
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(Icons.add_link, size: 20.0, color: Colors.grey),
                ),
                onTap: getFromGallery,
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(Icons.add, size: 20.0, color: Colors.grey),
                ),
                onTap: getMultiFromGallery,
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child:
                      Icon(Icons.control_point, size: 20.0, color: Colors.grey),
                ),
                onTap: pickFiles,
              ),
            ]));
  }
}
