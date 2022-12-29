import 'package:covid19app/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({Key? key,
    required this.name,
    required this.vaccine,
    required this.address,
  }) : super(key: key);

  final String name;
  final String address;
  final String vaccine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Constants.secondColor,
            borderRadius: Constants.borderRadius,
            border: Border.all(color: Constants.thirdColor,width: 3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name: $name",style: Constants.headerStyle2,),
              const Divider(thickness: 3,),
              Text("Address: $address",style: Constants.headerStyle2,),
              const Divider(thickness: 3,),
              Text("Vaccine Type: $vaccine",style: Constants.headerStyle2,),
            ],
          ),
        ),
      ),
    );
  }
}
