import 'package:bmi_starting/bmi_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reausable.dart';
import 'container_content.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';

enum gender {
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
 gender? sg ;
 int height =175;
 int weight =70;
 int age= 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('bmi CALCULATOR')),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                reusableWidget(
                  onpressed: () {
                    setState(() {
                      sg=gender.male;
                    });
                  },
                      color: (sg == gender.male) ? kActivecolor :kInactivecolor,
                      child: IconContent(iconData: FontAwesomeIcons.mars,
                      label: "Man",
                  ),
                ),
                reusableWidget(
                  onpressed: (){
                    setState(() {
                      sg=gender.female;
                    });
                  },
                      color: (sg == gender.female)? kActivecolor :kInactivecolor,
                      child: IconContent(iconData: FontAwesomeIcons.venus,
                      label: "Female"),
                ),
              ],
            )),
            reusableWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Height",style: kLabelstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kStylenumber,
                      ),
                      Text("cm",style: kLabelstyle,),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 1,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF888993),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x27EB1555),
                    ),
                    child: Slider(
                        value:height.toDouble(),
                        onChanged:(double value) {
                          setState(() {
                            height=value.round();
                          });
                        },
                        min: 120,
                        max: 220,
                    ),
                  ),
                ],
              ),
                color: kActivecolor
            ),
            Expanded(
                child: Row(
              children: [
                reusableWidget(
                    color: kActivecolor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("weight",style: kLabelstyle,
                        ),
                        Text(weight.toString(),style: kStylenumber,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icondata:Icons.remove,onpressed: (){
                              setState(() {
                                weight--;
                              });
                            }),
                            SizedBox(
                              width: 10,
                            ),
                           RoundIconButton(icondata: Icons.add,onpressed: (){
                             setState(() {
                               weight++;
                             });
                           },),
                          ],
                        ),
                      ],
                    ),
                ),
                reusableWidget(
                    color: kActivecolor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Age",style: kLabelstyle,
                ),
                Text(age.toString(),style: kStylenumber,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundIconButton(icondata:Icons.remove,onpressed: (){
                      setState(() {
                        age--;
                      });
                    }),
                    SizedBox(
                      width: 10,
                    ),
                    RoundIconButton(icondata: Icons.add,onpressed: (){
                      setState(() {
                        age++;
                      });
                    },),
                  ],
                ),
              ],
                ),
                ),
              ],
            ),
            ),
              bottombutton(onpressed:(){
              BMIBRAIN bmi= BMIBRAIN(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return ResultPage(
                      result: bmi.getresult(),
                      bmi: bmi.getBmi(),
                      interpretation: bmi.getinterpretation(),
                  );
                },
                ),
              );
            },
            label: "CALCULATE BMI",),
          ],
        ),
    );
  }
}






