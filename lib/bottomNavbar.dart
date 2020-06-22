import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarYaaa extends StatefulWidget {
  @override
  _BottomNavBarYaaaState createState() => _BottomNavBarYaaaState();
}

class _BottomNavBarYaaaState extends State<BottomNavBarYaaa> {
  
  int _selectedPage = 2;

  @override
  Widget build(BuildContext context) => Scaffold(
    bottomNavigationBar: _bottomNavigationBar(),
    floatingActionButton: _fab(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );

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
          FontAwesomeIcons.home,
          color: ColorPalette.backgroundColor,
        ),
        title: Text(
          'Home',
          style: TextStyle(
            color: ColorPalette.backgroundColor,
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
  static Color backgroundColor = Color(0xFFFCFCFC);

  static Color boldTitleColor = Colors.grey[900];
  static Color subtitleColor = Colors.grey[600];
  static Color subtitleColorLight = Colors.grey[400];

  static List<Color> appThemedGradientColors = [
    Color(0xFFAD5389),
    Color(0xFF3C1053),
  ];
}