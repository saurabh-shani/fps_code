import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weights/models/fpsListdataModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class CompliantListWidget extends StatefulWidget {
  final String zoneid;
  final String mobNumber;

  const CompliantListWidget({
    Key key,
    this.zoneid,
    this.mobNumber,
  }) : super(key: key);

  @override
  _CompliantListWidgetState createState() => _CompliantListWidgetState();
}

class _CompliantListWidgetState extends State<CompliantListWidget> {
  final List<FpsListDataModel> formListResponse = [];
  String compliantID;
  String zoneid;
  String mobileno;
  var resbody;

  @override
  void initState() {
    super.initState();
    zoneid = widget.zoneid;
    mobileno = widget.mobNumber;
    formList();
  }

  double currentLatitude;
  double currentLongitude;
  double lat, long;

  getcurrentLatLang() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);
    setState(() {
      currentLatitude = locData.latitude;
      currentLongitude = locData.longitude;
    });
  }

  // LatLng _center ;
  // Position currentLocation;
  // Future<Position> locateUser() async {
  //   return Geolocator
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  // }

  // getUserLocation() async {
  //   currentLocation = await locateUser();
  //   setState(() {
  //     _center = LatLng(currentLocation.latitude, currentLocation.longitude);
  //   });
  //   print('center $_center');
  // }

  Future<void> formList() async {
    final url = 'some api';

    Map data = {
      "circleno": "70",
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    print("${response.statusCode}");

    setState(() {
      resbody = json.decode(response.body);
    });
    print(resbody);

    for (var data in resbody) {
      formListResponse.add(new FpsListDataModel(
        fpsid: data["fpsid"],
        fpslicense: data["fpslicense"],
        fpsshopname: data["fpsshopname"],
        latitude: data["latitude"],
        longitude: data["longitude"],
        mobileno: data["mobileno"],
      )
          // new ComplantSummaryModel(
          //   complainantname: data["complainantname"],
          //   complaintid: data["complaintid"],
          //   localityname: data["localityname"],
          //   merchantname: data["merchantname"],
          //   mobileno: data["mobileno"],
          // ),
          );
    }
  }

  var leftSide = TextStyle(
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: formListResponse.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              print(index);
              getcurrentLatLang();

              // compliantID = formListResponse[index].complaintid;
              // zoneid = zoneid;
              // mobileno = mobileno;
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ComplaintDetailsScreen(
              //         compliantID: compliantID,
              //         zoneid: zoneid,
              //         mobileno: mobileno),
              //   ),
              // );

              // Navigator.of(context).pushNamed(
              //   ComplaintDetailsScreen.routeName,
              //   arguments: {
              //     "complaintid": ,
              //     "zoneid": zoneid,
              //     "mobileno": mobileno,
              //   },
              // );
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              // height: 120,
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Text('${formListResponse[index].fpsid}'),
                  Row(
                    children: <Widget>[
                      Text(
                        'License number: ',
                        style: leftSide,
                      ),
                      Text('${formListResponse[index].fpslicense}')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Shop Name: ',
                        style: leftSide,
                      ),
                      Text('${formListResponse[index].fpsshopname}')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Latitude: ',
                        style: leftSide,
                      ),
                      Text('${formListResponse[index].latitude}')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Longitude: ',
                        style: leftSide,
                      ),
                      Text('${formListResponse[index].longitude}')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Mobile Number: ',
                        style: leftSide,
                      ),
                      Text('${formListResponse[index].mobileno}')
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
