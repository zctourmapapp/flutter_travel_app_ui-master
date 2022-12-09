import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/activity_model.dart';
import '../models/restaurant_model.dart';


const LatLng currentLocation = LatLng(6.9136, 122.0614);
const LatLng dest1 = LatLng(6.9006, 122.0614);
  class MapPage extends StatelessWidget {
  const MapPage({
    Key? key,
    required this.activity,
  }) : super(key: key);
  final Activity activity;

@override
Widget build(BuildContext context){
  return Column(
      children: [
        _MapPageState(activity: activity),
      ]
  );
}


}
class RestaurantPage extends StatelessWidget {
  const RestaurantPage({
    Key? key,
    required this.restaurant,
  }) : super(key: key);
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context){
    return Column(
        children: [
          _RestoMapPageState(restaurant: restaurant),

        ]
    );
  }

}
class _MapPageState extends StatelessWidget{
  _MapPageState({
    Key? key,
    required this.activity,
  }) : super(key: key);
  final Activity activity;

  _MapPageState createState() => _MapPageState(activity: activity);

  late LatLng location1 = activity.location;
  late GoogleMapController _mapController;
  Map<String, Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: Scaffold(
            appBar: AppBar(title: const Text("Map Page"),
            backgroundColor:const Color(0xFF231955),),
            body: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentLocation,
                zoom: 16,
              ) ,
              onMapCreated: (controller){
                _mapController: controller;

                addMarker('test',currentLocation);
              },
              markers: _markers.values.toSet(),
            ),
          ),

    ),
    );
  }
  addMarker(String id, LatLng location){
    var marker = Marker(
      markerId: MarkerId(id),
      position: location,
      infoWindow: const InfoWindow(
        title: 'Shet',
        snippet: 'Description of the Place',
      )
    );
    _markers[id] = marker;
    _MapPageState(activity: activity);
  }

}

class _RestoMapPageState extends StatelessWidget{
  _RestoMapPageState({
    Key? key,
    required this.restaurant,
  }) : super(key: key);
  final Restaurant restaurant;

  _RestoMapPageState createState() => _RestoMapPageState(restaurant: restaurant);

  late LatLng? location1 = restaurant.location;
  late GoogleMapController _mapController;
  Map<String, Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Scaffold(
          appBar: AppBar(title: const Text("Map Page"),
            backgroundColor:const Color(0xFF231955),),
          body: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: currentLocation,
              zoom: 16,
            ) ,
            onMapCreated: (controller){
              _mapController: controller;

              addMarker('test',currentLocation);
            },
            markers: _markers.values.toSet(),
          ),
        ),

      ),
    );
  }
  addMarker(String id, LatLng location){
    var marker = Marker(
        markerId: MarkerId(id),
        position: location,
        infoWindow: const InfoWindow(
          title: 'Shet',
          snippet: 'Description of the Place',
        )
    );
    _markers[id] = marker;
    _RestoMapPageState(restaurant: restaurant);
  }

}