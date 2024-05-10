import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BloodRequestPageViewWidget extends StatelessWidget {
  const BloodRequestPageViewWidget(
      {super.key,
      required this.bloodType,
      required this.patientName,
      required this.unitsOfBlood,
      required this.Address,
      required this.day,
      required this.month,
      required this.date});
  final String bloodType;
  final String patientName;
  final int unitsOfBlood;
  final String Address;
  final String day;
  final String month;
  final int date;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      margin: EdgeInsets.only(
        right: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Padding(
        //padding: const EdgeInsets.all(20),
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Row(
          children: [
            Text(
              bloodType,
              style: TextStyle(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
                  fontSize: 60),
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  patientName,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${unitsOfBlood} Units (Blood)",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                Text(
                  Address,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${day}, ${month} ${date}",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.directions,
                            size: 30,
                          ),
                          onPressed: () {},
                          color: Theme.of(context).colorScheme.onPrimary,
                          highlightColor:
                              Theme.of(context).colorScheme.onPrimary,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share,
                            size: 30,
                          ),
                          color: Theme.of(context).colorScheme.onPrimary,
                          highlightColor:
                              Theme.of(context).colorScheme.onPrimary,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Accept",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(1),
                          minimumSize: Size(78, 28)),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
