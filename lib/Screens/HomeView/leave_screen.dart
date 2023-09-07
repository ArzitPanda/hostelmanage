import 'dart:math';

import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {


  String a= "start date";
  String b ="end date";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Text("Leave")),
        Column(
          children: [
            FilledButton(
                onPressed: () async {
                  DateTime? pickedDate =   await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100));

                      if(pickedDate!=null)
                        {

                          print(pickedDate);

                          setState(() {
                            a=pickedDate.toString();
                          });
                        }



                },
                child: Text("start date")),
            FilledButton(
                onPressed: () async {
                  DateTime? pickedDate =   await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100));

                  if(pickedDate!=null)
                  {

                    print(pickedDate);

                    setState(() {
                      b=pickedDate.toString();
                    });
                  }



                },
                child: Text("end date")),
            TextButton(onPressed: (){

                showTimePicker(context: context, initialTime: TimeOfDay.now());



            }, child: Text("time"))
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async {
                Uri phoneno = Uri.parse('tel:+97798345348734');
                bool data = await launchUrl(phoneno);

                if (data) {
                  //dialer opened
                  print("opened");
                } else {
                  //dailer is not opened
                }
              },
              child: Text("call warden"),
            ),
            ElevatedButton(
              onPressed: () async {

                Iterable<CallLogEntry> entries = await CallLog.get();
                for(CallLogEntry item in entries)
                  {
                       print(item.callType);
                  }



              },
              child: Text("call parent"),
            ),
          ],
        )
      ],
    ));
  }
}
