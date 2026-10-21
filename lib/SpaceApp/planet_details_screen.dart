import 'package:flutter/material.dart';
import 'package:space_app/SpaceApp/planet_model.dart';
import 'package:space_app/SpaceApp/custom_header.dart';

class PlanetDetailsScreen extends StatelessWidget {
  static const String routeName = 'planet_details_screen';

  const PlanetDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final planet = ModalRoute.of(context)!.settings.arguments as Planet;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(
              imagePath: planet.headerImagePath,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFFEE403D),
                  shape: const CircleBorder(),
                ),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              topTitle: Text(
                planet.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottomTitle: Text(
                planet.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  height: 250,
                  child: Image.asset(planet.imagePath),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    planet.about,
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  _buildDetailRow('Distance from Sun (km)', planet.distanceFromSun),
                  _buildDetailRow('Length of Day (hours)', planet.lengthOfDay),
                  _buildDetailRow('Orbital Period (Earth years)', planet.orbitalPeriod),
                  _buildDetailRow('Radius (km)', planet.radius),
                  _buildDetailRow('Mass (kg)', planet.mass),
                  _buildDetailRow('Gravity (m/s²)', planet.gravity),
                  _buildDetailRow('Surface Area (km²)', planet.surfaceArea),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Colors.white),
          children: [
            TextSpan(
              text: '$title : ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}