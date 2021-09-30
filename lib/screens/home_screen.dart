import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/screens/destination_screen.dart';
import 'package:travel_app/widget/destination_carousel.dart';
import 'package:travel_app/widget/hotel_carousel.dart';

class HomeScreenState extends StatefulWidget {

  @override
  _HomeScreenStateState createState() => _HomeScreenStateState();
}

class _HomeScreenStateState extends State<HomeScreenState> {

  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,

  ];


  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex = index;
        });
        print(_selectedIndex);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Theme.of(context).accentColor : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(_icons[index], size: 25.0,
            color: _selectedIndex == index ? Theme.of(context).primaryColor : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text('What would you like to find!',
              style: TextStyle(fontSize: 30.0,
              fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons.asMap().entries.map(
                    (MapEntry map) => _buildIcon(map.key),
            ).toList(),
            ),
            SizedBox(height: 20.0,),

            DestinationCarousel(),
            SizedBox(height: 20.0,),
            HotelCarousel(),
            SizedBox(height: 20.0,),

          ],
        ),
      ),
bottomNavigationBar: BottomNavigationBar(
  currentIndex: _currentTab,
  onTap: (int value){
    setState(() {
      _currentTab = value;
    });
  },
  items: [
    BottomNavigationBarItem(
      icon: Icon(
    Icons.search, size: 30.0,
      ),
    title: SizedBox.shrink(),
  ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.local_pizza, size: 30.0,
      ),
      title: SizedBox.shrink(),
    ),
    BottomNavigationBarItem(
      icon: CircleAvatar(
        radius: 15.0,
        backgroundImage: NetworkImage('https://i.pinimg.com/564x/0f/05/50/0f05505b9b17b03f1fc4f629d1ec4f86.jpg'),
      ),
      title: SizedBox.shrink(),
    ),
  ],
),
    );
  }
}

