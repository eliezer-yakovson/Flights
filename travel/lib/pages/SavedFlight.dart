import 'dart:async';
import 'package:flutter/material.dart';
import 'package:travel/models/Flight.dart';
import '../widgets/card.dart';
import '../services/localStore.dart';

class SavedFlight extends StatefulWidget {
  const SavedFlight({super.key,});

  @override
  State<SavedFlight> createState() => _SavedFlightState();
  List<Flight> get favoriteList => _SavedFlightState.SavedList;
}

class _SavedFlightState extends State<SavedFlight> {
  
  static List<Flight> SavedList = [];
  bool isLoading = true;

  Future<void> getAllSaved() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      final faivort = await LocalStore().getAllStrings();

      setState(() {
        SavedList = faivort;
      });
      isLoading = false;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
   // getAllFaviort();
   
  }

  @override
  Widget build(BuildContext context) {
    getAllSaved();
    if (isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: CircularProgressIndicator(),
        ), 
      );
    }
     else if (SavedList.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "There are no items in your favorite list",
                ),
              ],
            ),
          ),
        ),
      );
    }
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: 50,
               
              ),
              if(!SavedList.isEmpty)
              const Text(
                "Saved Flights:",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height - 60,
                child: ListView.builder(
               
                  scrollDirection: Axis.vertical,
                  itemCount:SavedList.length,
                  itemBuilder: (context, index) {
                    return CustomCard(flight: SavedList[index],  );
                  },
                ),
              ),
            ],
        ),
      ),
    );
  }
}
