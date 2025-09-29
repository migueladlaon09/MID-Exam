import 'package:flutter/material.dart';

/// Defines the main entry point for the application.
void main() {
  runApp(const MyApp());
}

/// The root widget of the application.
///
/// This widget sets up the MaterialApp, which provides essential functionalities
/// like navigation, theming, and the app's home screen.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GRC Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          color: Colors.blue,
        ),
      ),
      home: const HomePage(),
    );
  }
}

/// A data model to represent a navigation link.
class AppLink {
  final String title;
  final IconData? icon; // Optional icon for the link
  final VoidCallback? onPressed; // Callback when the link is pressed

  const AppLink({
    required this.title,
    this.icon,
    this.onPressed,
  });
}

/// The home page of the GRC application, displaying a logo and navigation links.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Data-driven list of application links.
  List<AppLink> get _appLinks => [
    AppLink(
      title: 'CCS',
      icon: Icons.school,
      onPressed: () {
        // Placeholder for Admission action
        debugPrint('Admission link tapped');
      },
    ),
    AppLink(
      title: 'COE',
      icon: Icons.school,
      onPressed: () {
        // Placeholder for Academics action
        debugPrint('Academics link tapped');
      },
    ),
    AppLink(
      title: 'COC',
      icon: Icons.school,
      onPressed: () {
        // Placeholder for Student Services action
        debugPrint('Student Services link tapped');
      },
    ),
    AppLink(
      title: 'Events',
      icon: Icons.info,
      onPressed: () {
        // Placeholder for About GRC action
        debugPrint('About GRC link tapped');
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('GRC Home'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // GRC Logo Container
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue,
                    width: 4,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://grc.edu.ph/wp-content/uploads/2020/08/LOGO_ORIGINAL-removebg-preview.png',
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                    // Provide an error builder for robustness in case image fails to load.
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey,
                      child: const Icon(Icons.broken_image, size: 80, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48), // Spacing below the image

              // Dynamically generated navigation links
              ..._appLinks.map<Widget>((link) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  width: 280, // Fixed width for consistent button size
                  child: ElevatedButton.icon(
                    onPressed: link.onPressed,
                    icon: Icon(link.icon),
                    label: Text(
                      link.title,
                      style: const TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 5,
                      minimumSize: const Size(double.infinity, 50), // Ensure minimum height
                    ),
                  ),
                ),
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
