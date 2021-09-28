import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/screens/destination_screen.dart';

class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text('Top Destination', style: TextStyle(fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,),
                ),
                GestureDetector(
                  onTap: () => print('See all'),
                  child: Text('See all', style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                  ),
                  ),
                ),
              ],
          ),
        ),
        Container(height: 300.0,
        child: ListView.builder(
          itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index){
            Destination destination = destinations[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => DestinationScreen(
                destination: destination,
              ),
              ),
              ),
              child: Container(
                width: 210.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                children: [
                  Positioned(
                      child: Container(
                      height: 120.0,
                      width: 200.0,
                        decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${destination.activities.length} activities',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                            ),

                            Text(destination.description,
                            style: TextStyle(
                                color: Colors.grey
                            ),
                            ),
                          ],
                        ),
                ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Hero(
                          tag:destination.imageUrl,
                          child: ClipRRect(borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            height: 180.0,
                            width: 180.0,
                            image: AssetImage(destination.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          ),
                        ),
                        Positioned(
                          left: 10.0,
                            right: 10.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(destination.city,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                              ),
                              Row(children: [
                                Icon(FontAwesomeIcons.locationArrow,
                                size: 10.0,
                                color: Colors.white,),
                                SizedBox(width: 5.0,),
                                Text(destination.country,
                                style: TextStyle(color: Colors.white),)
                              ],)
                            ],
                            ),),
                      ],
                    ),
                  ),

                ],),
              ),
            );

        }),
        ),
      ],
    );
  }
}
