import 'package:flutter/material.dart';
import 'package:space_app/SpaceApp/planet_model.dart';
import 'package:space_app/SpaceApp/custom_header.dart';
import 'package:space_app/SpaceApp/custom_button.dart';
import 'planet_details_screen.dart';

class SpaceHomeScreen extends StatefulWidget {
  static const String routeName = 'space_home_screen';

  const SpaceHomeScreen({super.key});

  @override
  State<SpaceHomeScreen> createState() => _SpaceHomeScreenState();
}

class _SpaceHomeScreenState extends State<SpaceHomeScreen> {
  late PageController _pageController;
  int _currentIndex = 0;
  final List<Planet> planets = Planet.planets;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _changePlanet(int direction) {
    int newIndex = _currentIndex + direction;
    if (newIndex >= 0 && newIndex < planets.length) {
      _pageController.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Planet currentPlanet = planets[_currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          CustomHeader(
            imagePath: 'assets/Rectangle 4.png',
            topTitle: const Text(
              'Explore',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottomTitle: const Text(
              'Which planet\nwould you like to explore?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
          ),

          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: planets.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    planets[index].imagePath,
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => _changePlanet(-1),
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFFEE403D),
                    shape: const CircleBorder(),
                  ),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                Text(
                  currentPlanet.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => _changePlanet(1),
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFFEE403D),
                    shape: const CircleBorder(),
                  ),
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: CustomButton(
              text: 'Explore ${currentPlanet.name}',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  PlanetDetailsScreen.routeName,
                  arguments: currentPlanet,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}