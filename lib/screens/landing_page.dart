import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapdemo/logic/business_logic.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget{
  @override
  State createState() =>LandingPageState();

}

class LandingPageState extends State
{
  @override
  Widget build(BuildContext context) {
  
    final appState=Provider.of<AppState>(context);
      print(" appState.initialPosition  appState.initialPosition:${ appState.initialPosition}");
    return SafeArea(
        child: appState.initialPosition==null?Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ):Stack(
          children: [
            GoogleMap(
                initialCameraPosition: CameraPosition(target: appState.initialPosition,zoom: 11),
                onMapCreated: appState.onCreated,
                onCameraMove: appState.onCameraMove,
              markers: appState.markers,
              polylines: appState.polyLines,
            ),
            Positioned(
              top: 50.0,
              right: 15.0,
              left: 15.0,

              child: Material(
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: getBoxShadow(),
                  child: TextField(
                    controller: appState.sourceController,
                    textInputAction: TextInputAction.next,
                    cursorColor: Colors.black,
                    decoration:getInoutDecoration("pick up Location?",Icon(
                      Icons.location_on,
                      color: Colors.green,
                    ),),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 105.0,
              right: 15.0,
              left: 15.0,
              child: Material(
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration:getBoxShadow(),
                  child: TextField(
                    controller: appState.destController,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.go,
                    onSubmitted: (value) {
                     
                    },
                    decoration: getInoutDecoration("destination?",Icon(
                      Icons.local_taxi,
                      color: Colors.black,
                    )),
                  ),
                ),
              ),
            ),
            (appState.isLoading)?Center(child: CircularProgressIndicator(),):Container(width: 0,height: 0,),
          ],
        )

    );
  }

  getInoutDecoration(hint,icon)
  {
    return InputDecoration(
      icon: Container(
        margin: EdgeInsets.only(left: 20, top: 5),
        width: 10,
        height: 10,
        child:icon ,
      ),
      hintText: hint,
      border: InputBorder.none,
      contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
    );
  }
  getBoxShadow(){
    return BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0, 5.0),
              blurRadius: 10,
              spreadRadius: 3)
        ]);

  }
}