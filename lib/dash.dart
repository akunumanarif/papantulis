import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:papantulis/login.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {

  int _selectedPage = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButton: _fab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      backgroundColor: Colors.amber[700],
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop(MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.filter_list),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Selamat',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Datang',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: ListView(children: [
                          _buildIcon('assets/uk.png', '   Bahasa Inggris',
                              '    English Language'),
                          _buildIcon('assets/arab.png', '   Bahasa Arab',
                              '               اللغة العربية'),
                          _buildIcon('assets/hp.png', '   Tutorial',
                              '    Learning Path')
                        ]))),
              ],
            ),
          )
        ],
      ),
    );
  }

  mediaQueryHeightPercentage(double percentage) =>
      (MediaQuery.of(context).size.height / 100) * percentage;

  mediaQueryWidthPercentage(double percentage) =>
      (MediaQuery.of(context).size.width / 100) * percentage;

  _bottomNavigationBar() => BottomNavigationBar(
    currentIndex: _selectedPage,
    onTap: (selection) {
      setState(() {
        _selectedPage = selection;
      });
    },
    items: [
      BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.facebookMessenger,
          color: _selectedPage == 0 ? Colors.black : Colors.grey[500],
        ),
        title: Text(
          'Messages',
          style: TextStyle(
            color: _selectedPage == 0 ? Colors.black : Colors.grey[500],
          ),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.solidBell,
          color: _selectedPage == 1 ? Colors.black : Colors.grey[500],
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: _selectedPage == 1 ? Colors.black : Colors.grey[500],
          ),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.houseUser,
          color: Colors.amberAccent[700],
        ),
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.amberAccent[700],
          ),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.solidUser,
          color: _selectedPage == 3 ? Colors.black : Colors.grey[500],
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            color: _selectedPage == 3 ? Colors.black : Colors.grey[500],
          ),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
          color: _selectedPage == 4 ? Colors.black : Colors.grey[500],
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: _selectedPage == 4 ? Colors.black : Colors.grey[500],
          ),
        ),
      ),
    ]
  );


  _fab() => AnimatedContainer(
    duration: Duration(milliseconds: 250),
    margin: _selectedPage != 2
        ? EdgeInsets.only(
            top: mediaQueryHeightPercentage(5),
            right: _selectedPage > 2 ? mediaQueryWidthPercentage(8) : 0.0,
            left: _selectedPage < 2 ? mediaQueryWidthPercentage(8) : 0.0,
          )
        : EdgeInsets.only(top: mediaQueryHeightPercentage(3)),
    height: _selectedPage == 2
        ? mediaQueryHeightPercentage(8)
        : mediaQueryHeightPercentage(7),
    width: _selectedPage == 2
        ? mediaQueryHeightPercentage(8)
        : mediaQueryHeightPercentage(7),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(mediaQueryHeightPercentage(2.5)),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: ColorPalette.appThemedGradientColors),
        boxShadow: _selectedPage == 2
            ? [
                BoxShadow(
                    color: ColorPalette.appThemedGradientColors[1]
                        .withOpacity(0.6),
                    blurRadius: 25,
                    offset: Offset(0, 10))
              ]
            : null),
    child: InkWell(
      borderRadius: BorderRadius.circular(mediaQueryHeightPercentage(2.5)),
      onTap: () {
        setState(() {
          _selectedPage = 2;
        });
      },
      child: Icon(
        FontAwesomeIcons.simplybuilt,
        size: mediaQueryHeightPercentage(3),
        color: Colors.white,
      ),
    )
  );
}

class ColorPalette {
  static Color backgroundColor = Colors.amberAccent[700];

  static Color boldTitleColor = Colors.grey[900];
  static Color subtitleColor = Colors.grey[600];
  static Color subtitleColorLight = Colors.grey[400];

  static List<Color> appThemedGradientColors = [
    Colors.amber,
    Colors.yellowAccent,
  ];
}

  Widget _buildIcon(String imgPath, String foodName, String price) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 40.0),
        child: InkWell(
            onTap: () {
              
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(children: [
                  Hero(
                      tag: imgPath,
                      child: Image(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0)),
                  SizedBox(width: 10.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(foodName,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold)),
                        Text(price,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                color: Colors.grey))
                      ])
                ])),
                IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Colors.black,
                    onPressed: () {})
              ],
            )));
  }

