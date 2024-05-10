import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BloodRequestPageViewWidget extends StatelessWidget {
  const BloodRequestPageViewWidget({super.key, required this.bloodType, required this.patientName, required this.unitsOfBlood, required this.Address, required this.day, required this.month, required this.date});
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
      height: 200,
      margin: EdgeInsets.only(right: 12,),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
      color: Theme.of(context).colorScheme.primary,
      ),
      child:Padding(
        padding: const EdgeInsets.all(20),
        //padding: EdgeInsets.only(left: 20),
        child: Row(children: [Text(bloodType,style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontSize: 50),),SizedBox(width: 20,),Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(patientName,style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.w700,fontSize: 16),),
            SizedBox(height: 10,),
            Text("${unitsOfBlood} Units (Blood)",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.w700,fontSize: 16),),
            SizedBox(height: 10,),
            Text(Address,style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
            SizedBox(height: 10,),
            Text("${day}, ${month} ${date}",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.w700,fontSize: 16),),
            Row(children: [],),
          ],
        )],),
      ),
    );
  }
}