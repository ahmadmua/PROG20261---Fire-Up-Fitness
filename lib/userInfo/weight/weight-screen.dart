import 'package:flutter/material.dart';
import 'package:project/userInfo/weight/weight.dart';
import 'weight.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({Key? key}) : super(key: key);

  @override
  State<WeightScreen> createState() => _WeightScreen();
}

class _WeightScreen extends State<WeightScreen> {

  final FixedExtentScrollController _controller = FixedExtentScrollController();

  int weight = 0;

  @override
  Widget build(BuildContext context) {

    Widget _buildButton() {
      return SizedBox(
        height: 64,
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.white,
              ),
              elevation: MaterialStateProperty.all(6),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            onPressed: () {  },
            child: const Text(
              'Continue',
              style: TextStyle(
                fontFamily: 'PT-Sans',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )));
    }


    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 130, 100, 1),
      body: Column(children: <Widget>[
        const SizedBox(
          width: 500,
          height: 120,
        ),
        const Flexible(
          child: Text(
            'Enter your weight',
            style: TextStyle(
              fontFamily: 'PT-Sans',
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        const SizedBox(
          height: 70,
        ),

        Flexible(
            child: SizedBox(
                width: 100,
                child: ListWheelScrollView.useDelegate(
                  onSelectedItemChanged: (index)=>
                  setState(() {
                    weight = index;
                  }),
                  controller: _controller,
                  itemExtent: 50,
                  perspective: 0.005,
                  diameterRatio: 1.1,
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 300,
                      builder: (context, index) {
                        return Weight(
                          weight: index,
                        );
                      }),
                ))),

        const SizedBox(
          height: 70,
        ),

         Flexible(child: Text(
          "Selected Weight: $weight lbs",
           style: const TextStyle(
             fontFamily: 'PT-Sans',
             fontSize: 35,
             color: Colors.white,
           )
         ),
        ),

        const SizedBox(
          height: 100,
        ),

        _buildButton()
      ]),
    );
  }
}
