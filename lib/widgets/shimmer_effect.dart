import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              height: 210,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Constants.firstColor,
                borderRadius: Constants.borderRadius2,
                border: Border.all(color: Constants.thirdColor,width: 3),
              ),
              child: const CircularProgressIndicator(
                color: Colors.white,
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
                ),
                Container(
                    height: 100,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Constants.yellowColor,
                      borderRadius: Constants.borderRadius,
                    ),
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
                ),
                Container(
                    height: 100,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Constants.redColor,
                      borderRadius: Constants.borderRadius,
                    ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Container(
              height: 75,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Constants.secondColor,
                borderRadius: Constants.borderRadius,
                border: Border.all(color: Constants.thirdColor,width: 3),
              ),
              child: const Text("Loading",style: Constants.boxStyle,),
            )
          ],
        ),
      ),
    );
  }
}
