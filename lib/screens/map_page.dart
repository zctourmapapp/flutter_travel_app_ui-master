/*import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';


const LatLng currentLocation = LatLng(6.9136, 122.0614);
class MapPage extends StatefulWidget {
  const MapPage({Key?, key}) : super(key: key);

@override
State<MapPage> createState() => _MapPageState();}


class _MapPageState extends State<MapPage>{
  late GoogleMapController _mapController;
  Map<String, Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: currentLocation,
          zoom: 14,
        ) ,
        onMapCreated: (controller){
          _mapController: controller;
          addMarker('test',currentLocation);
        },
        markers: _markers.values.toSet(),
      ),
    );
  }
  addMarker(String id, LatLng location){
    var marker = Marker(
      markerId: MarkerId(id),
      position: location,
      infoWindow: const InfoWindow(
        title: 'Western Mindanao State University',
        snippet: 'Description of the Place',
      )
    );
    _markers[id] = marker;
    setState((){});
  }
}*/

