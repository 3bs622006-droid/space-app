import 'package:flutter/material.dart';
import 'package:space_app/SpaceApp/space_home_screen.dart';

class FirstScreen extends StatelessWidget{
  static const String routeName = 'first_screen';

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.black,
          body:
          Stack(
            children: [
              Image.asset('assets/Frame 1.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Explore\nThe\nUniverse',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    height: 1.2
                  ),
                ),
               ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 30,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SpaceHomeScreen()));
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Color(0xFFEE403D),
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Explore',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      ),
                      Icon(
                        size: 22,
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                 ),
               ),
            ],
          ),
    );
  }
}