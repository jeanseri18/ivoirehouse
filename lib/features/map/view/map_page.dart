import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:house/features/profile/view/profile_page.dart';
import 'package:house/features/theme/colors.dart';
import 'package:house/features/widget/widget_body.dart';
import 'dart:ui' as ui;

import 'package:ionicons/ionicons.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(5.316667, -4.033333),
    zoom: 11.5,
  );

  bool _mapCreated = false;
  late GoogleMapController mapController;

  Set<Marker> markers = Set(); //markers for google map

  LatLng startLocation = LatLng(5.316667, -4.033333);
  LatLng endLocation = LatLng(5.316667, -4.033333);
  LatLng carLocation = LatLng(5.316667, -4.033333);

  @override
  void initState() {
    addMarkers();
    super.initState();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  addMarkers() async {
    //  BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
    //       ImageConfiguration(size:Size(50, 50) ),
    //       "images/women.png",
    //  );
    final Uint8List markerIcon =
        await getBytesFromAsset('images/women.png', 70);

    markers.add(Marker(
      //add start location marker
      markerId: MarkerId(startLocation.toString()),
      position: startLocation, //position of marker
      // infoWindow: InfoWindow( //popup info
      //   title: 'Starting Point ',
      //   snippet: 'Start Marker',
      // ),
      icon: BitmapDescriptor.fromBytes(markerIcon), //Icon for Marker
      onTap: () {
        print(4);
        showModalBottomSheet<void>(
          // context and builder are
          // required properties in this widget
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            // we set up a container inside which
            // we create center column and display text

            // Returning SizedBox instead of a Container
            return Container(

              decoration: BoxDecoration( color: Colors.white,
                 borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20))),
              height: 300,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'images/women.png',
                        height: 250,
                      ),
                    ),
                    Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                      const  SizedBox(height: 20,),
                      const  ListTile(contentPadding: EdgeInsets.all(0),
                          leading:   Icon(Ionicons.caret_forward),
                        title: Text('Nom',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                               
                        ),
                         const  ListTile(contentPadding: EdgeInsets.all(0),
                          leading:   Icon(Ionicons.location_outline),
                        title: Text('Nom',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                               
                        ),
                       const ListTile(contentPadding: EdgeInsets.all(0),
                          leading:   Icon(Ionicons.call_outline),
                        title: Text('Nom',
                            style: TextStyle(
                                fontSize: 16,
                              
                                color: greyBlue)),
                               
                        ),const ListTile(contentPadding: EdgeInsets.all(0),
                          leading:   Icon(Ionicons.logo_whatsapp),
                        title: Text('Nom',
                            style: TextStyle(
                                fontSize: 16,
                              
                                color: greyBlue)),
                        ),
                         GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: primary_one,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Center(
                          child: Text(
                        'Voir le profile',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
             
                              
                      ],
                    ))
                  ],
                ),
              ),
            );
          },
        );
      },
    ));

    // markers.add(
    //   Marker( //add start location marker
    //     markerId: MarkerId(endLocation.toString()),
    //     position: endLocation, //position of marker
    //     rotation:-45,
    //     infoWindow: InfoWindow( //popup info
    //       title: 'End Point ',
    //       snippet: 'End Marker',
    //     ),
    //     icon: BitmapDescriptor.fromBytes(markerIcon), //Icon for Marker
    //   )
    // );

    String imgurl = "https://www.fluttercampus.com/img/car.png";
// Uint8List bytes = (await NetworkAssetBundle(Uri.parse(imgurl))
//       .load(imgurl))
//       .buffer
//       .asUint8List();
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(imgurl)).load(imgurl))
        .buffer
        .asUint8List();

// markers.add(
//   Marker( //add start location marker
//     markerId: MarkerId(carLocation.toString()),
//     position: carLocation, //position of marker
//     infoWindow: InfoWindow( //popup info
//       title: 'Car Point ',
//       snippet: 'Car Marker',
//     ),
//     icon: BitmapDescriptor.fromBytes(bytes), //Icon for Marker
//   )
// );

    setState(() {
      //refresh UI
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            markers: markers
            //        Marker(
            // markerId: MarkerId('place_name'),
            // position: ,
            // // icon: BitmapDescriptor.,
            // infoWindow: InfoWindow(
            //   title: 'title',
            //   snippet: 'address',
            // ),)

            ));
  }

  _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _mapCreated = true;
    });
    // get current position here and use mapController when it is completed
  }
}
