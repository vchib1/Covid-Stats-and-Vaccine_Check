import 'dart:convert';
import 'package:covid19app/widgets/shimmer_effect.dart';

import 'constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {

  var statsData = [];

  bool _isLoading = true;

  @override
  void initState() {
    gettingStats();
    super.initState();
  }

  Future<void> gettingStats()async{
    var baseUrl = "https://covid-193.p.rapidapi.com/statistics?country=india";
    var headers = {
      'X-RapidAPI-Host': 'covid-193.p.rapidapi.com',
      'X-RapidAPI-Key': '46a84c73femsh37ef9e3dfe3228cp1d38a4jsne93eff3ef394'
    };

    var result = await http.get(Uri.parse(baseUrl), headers: headers);
    var resultBody = result.body;

    var json = jsonDecode(resultBody);

    if(result.statusCode == 200){
      Future.delayed(const Duration(seconds: 3),(){
        setState(() {
          statsData = json['response'];
          _isLoading = false;
        });
      });

    }
  }

  //statsData[0]['continent']

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.firstColor,
        title: const Text("Statistics",style: Constants.boxStyle3,),
        centerTitle: true,
      ),
      backgroundColor: Constants.firstColor,
      body: _isLoading ? const ShimmerEffect()
      :
      RefreshIndicator(
        onRefresh: ()async{
          setState(() {
            _isLoading = true;
          });
          gettingStats();
        },
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Constants.firstColor,
                      borderRadius: Constants.borderRadius2,
                      border: Border.all(color: Constants.thirdColor,width: 3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Continent: ${statsData[0]['continent']}",style: Constants.headerStyle),
                          Text("Country: ${statsData[0]['country']}",style: Constants.headerStyle),
                          Text("Population: ${statsData[0]['population']}",style: Constants.headerStyle),
                          Text("Cases: ${statsData[0]['cases']['total']}",style: Constants.headerStyle),
                          Text("Updated: ${statsData[0]['day']}",style: Constants.headerStyle),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Constants.blueColor,
                          borderRadius: Constants.borderRadius,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("Active: ",style: Constants.boxStyle,),
                            Text("${statsData[0]['cases']['active']}",style: Constants.boxStyle,),
                          ],
                        )
                      ),
                      Container(
                        height: 100,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Constants.yellowColor,
                          borderRadius: Constants.borderRadius,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("Critical: ",style: Constants.boxStyle2,),
                            Text("${statsData[0]['cases']['critical']}",style: Constants.boxStyle2,),
                          ],
                        )
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Constants.greenColor,
                          borderRadius: Constants.borderRadius,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("Recovered: ",style: Constants.boxStyle,),
                            Text("${statsData[0]['cases']['recovered']}",style: Constants.boxStyle,),
                          ],
                        )
                      ),
                      Container(
                        height: 100,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Constants.redColor,
                          borderRadius: Constants.borderRadius,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("Deaths: ",style: Constants.boxStyle,),
                            Text("${statsData[0]['deaths']['total']}",style: Constants.boxStyle,),
                          ],
                        )
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, 'pinPage');
                    },
                    child: Container(
                      height: 75,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Constants.secondColor,
                        borderRadius: Constants.borderRadius,
                        border: Border.all(color: Constants.thirdColor,width: 3),
                      ),
                      child: const Text("Check Vaccine Availability",style: Constants.boxStyle,),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
