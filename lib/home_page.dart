import 'package:blood_donation_app/blood_request_page_view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'blood_donation_center_list_view_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:blood_donation_app/blood_request_page_view_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  
  @override
  Widget build(BuildContext context) {
    late GoogleMapController mapController;

  final LatLng _center = const LatLng(-33.86, 151.20);
  final LatLng _home = const LatLng(28.69, 77.29);
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
                  itemCount: 7,
                  itemBuilder: ((context, index) {
                    return const BloodDonationCenterListViewWidget(
                        centerName: "Center-1",
                        address: "State, city ,street",
                        bloodTypes: ["A", "B", "A+"],
                        patientName: "Raghav Shukla");
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
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _home,
                      zoom: 11.0,
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
              padding: EdgeInsets.only(left: 23,bottom: 15),
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
                          return BloodRequestPageViewWidget(bloodType: "B+",patientName: "Kuljit Kumar Walia",unitsOfBlood: 1 ,Address: "State-1, city-1, state-1",day:  "Thrusday", month: "Apr",date:  18);
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