import 'package:flutter/material.dart';
import 'package:travel/pages/Full_details_flight.dart';
import 'package:travel/pages/SavedFlight.dart';
import 'package:travel/pages/firstPage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget with RouteAware {
  MainApp({super.key});

  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/secondPage': (context) => const FullDetails(),
        '/saved': (context) => const SavedFlight(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('רדאר מטוסים'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'תפריט',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('דף הבית'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.pushNamed(context, '/'); 
              },
            ),
            ListTile(
              title: const Text('טיסות שמורים'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.pushNamed(context, '/saved'); 
              },
            ),
          ],
        ),
      ),
      body: const SafeArea(
          child: SingleChildScrollView(
        child: FirstPage(),
      )),
    );
  }
}
