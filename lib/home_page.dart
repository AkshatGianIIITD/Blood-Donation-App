import 'dart:async';
import 'dart:ffi';

import 'package:blood_donation_app/blood_request_page_view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'blood_donation_center_list_view_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:blood_donation_app/blood_request_page_view_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List centers = [
    {
      "centerName": "Holy Family Hospital Blood Bank",
      "address": "Okhla, New Delhi, Delhi 110025",
      "bloodTypes": ["A+", "A-", "B+"],
      "patientName": "Raghav Shukla",
      "markerId": "Holy Family Hospital Blood Bank",
      "title": "Holy Family Hospital Blood Bank",
      "lat": 28.561652,
      "lng": 77.274947
    },
    {
      "centerName": "Apollo Hospital Blood Bank",
      "address":
          "Indraprastha Medical Corporation, Pocket C, Sarita Vihar, New Delhi, Delhi 110044",
      "bloodTypes": ["AB-", "O+", "B-", "A+"],
      "patientName": "Ashok Jaiswal",
      "markerId": "Apollo Hospital Blood Bank",
      "title": "Apollo Hospital Blood Bank",
      "lat": 28.530780,
      "lng": 77.294002
    },
    {
      "centerName": "National Heart Institute Blood Bank",
      "address":
          "Community Center, National Heart Institute, 49, 50, D Block, East of Kailash, New Delhi, Delhi 110065",
      "bloodTypes": ["O-", "AB+", "A+", "B-", "A-"],
      "patientName": "Shorvi",
      "markerId": "National Heart Institute Blood Bank",
      "title": "National Heart Institute Blood Bank",
      "lat": 28.557453,
      "lng": 77.245679
    },
    {
      "centerName": "Hakeem Abdul Hameed Centenary Hospital Blood Bank",
      "address":
          "Guru Ravidas Marg, Kalkaji Extension, Block A 8, Block D, Hamdard Nagar, New Delhi, Delhi 110062",
      "bloodTypes": ["AB-", "O+", "A-", "B+", "AB+"],
      "patientName": "Ruksana",
      "markerId": "Hakeem Abdul Hameed Centenary Hospital Blood Bank",
      "title": "Hakeem Abdul Hameed Centenary Hospital Blood Bank",
      "lat": 28.527855,
      "lng": 77.257571
    },
    {
      "centerName": "Fortis Escort Heart Institute Blood Bank",
      "address": "New Friends Colony, New Delhi, Delhi 110025",
      "bloodTypes": ["AB-", "O+", "A-", "B+", "AB+"],
      "patientName": "Ritik",
      "markerId": "Fortis Escort Heart Institute Blood Bank",
      "title": "Fortis Escort Heart Institute Blood Bank",
      "lat": 28.560672,
      "lng": 77.273904
    }
  ];

  //late GoogleMapController mapController;
  Completer<GoogleMapController> _completer = Completer();

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Set<Marker> _buildMarkers() {
    Set<Marker> markers = {};
    final Marker _currentLocationMarker = Marker(
        markerId: MarkerId('_currentLocation'),
        infoWindow: InfoWindow(title: 'Current Location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        position: LatLng(28.5437598, 77.2719228));

    markers.add(_currentLocationMarker);    

    for (var center in centers) {
      final marker = Marker(
        markerId: MarkerId(center["markerId"]),
        position: LatLng(center["lat"], center["lng"]),
        infoWindow: InfoWindow(title: center["centerName"]),
        icon: BitmapDescriptor.defaultMarker,
        // Other properties as needed
      );

      markers.add(marker);
    }

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    late GoogleMapController mapController;

    final LatLng _center = const LatLng(-33.86, 151.20);
    final LatLng _home = const LatLng(28.69, 77.29);
    final LatLng _college = const LatLng(28.5437598, 77.2719228);
    return SafeArea(
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: const EdgeInsets.only(left: 24, top: 10),
            child: Row(
              children: [
                Text(
                  "Donate Blood",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 25,
            ),
            child: Row(
              children: [
                Text(
                  "Near you",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 134, 134, 134)),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            child: ListView.builder(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: ((context, index) {
                  return BloodDonationCenterListViewWidget(
                    centerName: centers[index]["centerName"],
                    address: centers[index]["address"],
                    bloodTypes: centers[index]["bloodTypes"],
                    patientName: centers[index]["patientName"],
                    markerId: centers[index]["markerId"],
                    title: centers[index]['title'],
                    lat: centers[index]["lat"],
                    lng: centers[index]["lng"],
                    completer: _completer,
                  );
                })),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              // ignore: sized_box_for_whitespace
              child: Container(
                height: 200,
                //decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),

                child: GoogleMap(
                  markers: _buildMarkers(),

                  onMapCreated: ((GoogleMapController controller) {
                    _completer.complete(controller);
                  }),
                  initialCameraPosition: CameraPosition(
                    target: _college,
                    zoom: 13,
                  ),
                  gestureRecognizers: Set()
                    ..add(Factory<PanGestureRecognizer>(
                        () => PanGestureRecognizer()))
                    ..add(Factory<ScaleGestureRecognizer>(
                        () => ScaleGestureRecognizer())),

                  //myLocationEnabled: true,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 23, bottom: 15),
            child: Text(
              "Blood Requests",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 225,
            child: Stack(children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 225,
                  child: PageView.builder(
                      controller: PageController(viewportFraction: 0.89),
                      itemCount: 5,
                      itemBuilder: (_, i) {
                        return BloodRequestPageViewWidget(
                            bloodType: "B+",
                            patientName: "Kuljit Kumar Walia",
                            unitsOfBlood: 1,
                            Address: "State-1, city-1, state-1",
                            day: "Thrusday",
                            month: "Apr",
                            date: 18);
                      }),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
