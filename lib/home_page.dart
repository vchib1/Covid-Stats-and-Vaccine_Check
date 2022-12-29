import 'package:covid19app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String pinCode = "";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 50,),
                SvgPicture.asset('assets/vaccine.svg',fit: BoxFit.cover),

                //Text Field
                TextField(
                  onChanged: (data){
                    HomePage.pinCode = data;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Pin Code",
                    hintStyle: Constants.boxStyle4,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: Constants.borderRadius3,
                      borderSide: BorderSide(
                        color: Constants.firstColor,
                        width: 3
                      )
                    )
                  ),
                ),
                const SizedBox(height: 20,),

                //Submit Button
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, 'results');
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
                    child: const Text("Submit",style: Constants.boxStyle,),
                  ),
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
