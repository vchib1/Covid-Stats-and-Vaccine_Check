import 'dart:convert';
import 'package:covid19app/home_page.dart';
import 'package:covid19app/widgets/customTile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DataResults extends StatefulWidget {
  const DataResults({Key? key}) : super(key: key);

  @override
  State<DataResults> createState() => _DataResultsState();
}

class _DataResultsState extends State<DataResults> {

  var data = [];
  var pinCode = "";


  @override
  void initState() {
    // TODO: implement initState
    pinCode = HomePage.pinCode;
    callingApi();
    super.initState();
  }

  Future<void> callingApi()async{
    //Uses Current Date in API Link
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);

    String url = "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=$pinCode&date=$formattedDate";
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    var body = response.body;

    var json = jsonDecode(body);

    if(response.statusCode == 200){
      if(response.body.isNotEmpty){
        Future.delayed(const Duration(seconds: 1),(){
          setState(() {
            data = json['sessions'];
          });
          //print(json);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context,index){
          //Date: 29-12-2022, the API used to fetch Vaccine Availability is not working (IDK Why)
          //I'll update the code as soon as the API get Fixed
          return const CustomTile(
            name: "District General Hostpital",
            address: "45 M G Road, Jaoli ,Satara ,Maharashtra (413608)",
            vaccine: "COVISHIELD",
          );
        },
      )
    );
  }
}
