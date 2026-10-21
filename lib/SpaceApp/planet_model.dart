class Planet {
   String name;
   String title;
   String imagePath;
   String headerImagePath;
   String about;
   String distanceFromSun;
   String lengthOfDay;
   String orbitalPeriod;
   String radius;
   String mass;
   String gravity;
   String surfaceArea;

  Planet({
    required this.name,
    required this.title,
    required this.imagePath,
    required this.headerImagePath,
    required this.about,
    required this.distanceFromSun,
    required this.lengthOfDay,
    required this.orbitalPeriod,
    required this.radius,
    required this.mass,
    required this.gravity,
    required this.surfaceArea,
  });

  static List<Planet> planets = [
    Planet(
      name: 'Earth',
      title: 'Earth: Our Blue Marble',
      imagePath: 'assets/earth.png',
      headerImagePath: 'assets/Rectangle 4.png',
      about: 'Earth is the only known planet in the universe that supports life...',
      distanceFromSun: '149598026',
      lengthOfDay: '23.93',
      orbitalPeriod: '1',
      radius: '6371',
      mass: '5.972 × 10²⁴',
      gravity: '9.81',
      surfaceArea: '5.10 × 10⁸',
    ),
    Planet(
      name: 'Mercury',
      title: 'Mercury: The Swift Planet',
      imagePath: 'assets/mercury.png',
      headerImagePath: 'assets/Rectangle 4.png',
      about: 'Mercury is the smallest planet in the Solar System and the closest to the Sun...',
      distanceFromSun: '57909050',
      lengthOfDay: '4222.6',
      orbitalPeriod: '0.24',
      radius: '2439.7',
      mass: '3.3011 × 10²³',
      gravity: '3.7',
      surfaceArea: '7.48 × 10⁷',
    ),
  ];
}