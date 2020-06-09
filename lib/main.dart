import 'package:calculatortipapp/inkwell_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

void main() {
  runApp(MaterialApp(home: BillSplitter()));
}

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
//        alignment: Alignment.center,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              width: 150.0,
              height: 150.0,
              decoration: kContainer1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Total Per Person",
                    style: kTotalPerson,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "\$${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}",
                    style: kPerPersonAmount,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: kContainer2,
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(
                      color: Colors.purpleAccent,
                    ),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount",
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (e) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Split",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Row(
                        children: <Widget>[
                          InkWellButton(
                            text: "-",
                            onTapped: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                } else {
                                  //do nothing
                                }
                              });
                            },
                          ),
                          Text("$_personCounter", style: kTotalPerson),
                          InkWellButton(
                            text: "+",
                            onTapped: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Tip",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "\$${calculateTotalTip(_billAmount, _personCounter, _tipPercentage)}",
                          style: kTotalPerson,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "$_tipPercentage%",
                    style: kTotalPerson,
                  ),
                  Slider(
                    divisions: 10,
                    activeColor: Colors.black87.withOpacity(.5),
                    inactiveColor: Colors.amber.withOpacity(.4),
                    min: 0,
                    max: 100,
                    value: _tipPercentage.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        _tipPercentage = value.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  calculateTotalPerPerson(double billAmount, int splitBuy, int tipPercentage) {
    var totalPerPerson =
        calculateTotalTip(billAmount, splitBuy, tipPercentage) +
            billAmount / splitBuy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBuy, int tipPercentage) {
    double totalTip = 0.0;

    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}
