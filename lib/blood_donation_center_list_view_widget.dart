import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class BloodDonationCenterListViewWidget extends StatelessWidget {
  const BloodDonationCenterListViewWidget(
      {super.key,
      required this.centerName,
      required this.address,
      required this.bloodTypes,
      required this.patientName, required this.markerId, required this.title, this.lat, this.lng, required this.completer});
  final String centerName;
  final String address;
  final List<String> bloodTypes;
  final String patientName;
  final Completer<GoogleMapController> completer;
  final String markerId;
  final String title;
  final lat;
  final lng;
  Future<void> _goToMarker() async{
    final GoogleMapController controller=await completer.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat,lng),zoom: 17)));
  }

  @override
  Widget build(BuildContext context) {
    var bloodTypesJoined=bloodTypes.join(', ');
    var textColor = Theme.of(context).colorScheme.onPrimary;
    return Container(
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.only(left: 15, right: 20, top: 15),
      //alignment: Alignment.topLeft,
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primary),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          centerName,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          address,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: textColor.withOpacity(0.9)),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Blood Type:',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: textColor.withOpacity(0.9)),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                '${bloodTypesJoined}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: textColor.withOpacity(0.9),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "Patient Name: ${patientName}",
          style: TextStyle(color: textColor.withOpacity(0.9)),
          overflow: TextOverflow.ellipsis,
        ),
        // Text(
        //   patientName,
        //   overflow: TextOverflow.ellipsis,
        //   style: TextStyle(fontWeight: FontWeight.w500, color: textColor),
        // ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(1), minimumSize: Size(55, 25)),
              onPressed: () {
                _goToMarker();
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "View",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 12,
                    weight: 25,
                  )
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(1), minimumSize: Size(77, 25)),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Schedule",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                    ),
                    Icon(
                      Icons.add,
                      size: 12,
                    )
                  ],
                )),
          ],
        )
      ]),
    );
  }
}
