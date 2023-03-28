import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class VaccineScreen extends StatelessWidget {
  VaccineScreen({Key? key, required this.searchRecord, required this.index}) : super(key: key);
  final List<dynamic> searchRecord;
  final int index;

  

  @override
  Widget build(BuildContext context) {
    String name = searchRecord[index]['name'];
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width * 0.3,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'mentor name',
                          textAlign: TextAlign.left,
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Age :',
                          textAlign: TextAlign.left,
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Phone : ',
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Organisation',
                          textAlign: TextAlign.right,
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Selected Class :',
                          textAlign: TextAlign.right,
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Selected Subject : ',
                          textAlign: TextAlign.right,
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Email : ',
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}