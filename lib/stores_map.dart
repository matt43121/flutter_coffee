import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
// import 'package:location/location.dart';
// import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'stores.dart';

class GoogleMapContainer extends StatefulWidget {
  @override
  _GoogleMapContainerState createState() => _GoogleMapContainerState();
}

class _GoogleMapContainerState extends State<GoogleMapContainer> with WidgetsBindingObserver {

  List<Store> stores = [
    Store(id: 1, country: "England", name: "Costa Coffee Shop", address: "4 Church Close Exning CB8 7EJ"),
    Store(id: 1, country: "England", name: "Costa Coffee Shop", address: "4 Church Close Exning CB8 7EJ"),
    Store(id: 1, country: "England", name: "Costa Coffee Shop", address: "4 Church Close Exning CB8 7EJ"),
    Store(id: 1, country: "England", name: "Costa Coffee Shop", address: "4 Church Close Exning CB8 7EJ"),
    Store(id: 1, country: "England", name: "Costa Coffee Shop", address: "4 Church Close Exning CB8 7EJ"),
  ];

  String _darkMapStyle;
  String _normalMapStyle;

  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/dark_map_style.json').then((string) {
     _darkMapStyle = string;
    });
    rootBundle.loadString('assets/normal_map_style.json').then((string) {
     _normalMapStyle = string;
    });
     WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    final Brightness brightness = WidgetsBinding.instance.window.platformBrightness;
    print(brightness);
    build(context);
    //inform listeners and rebuild widget tree
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    if (mapController != null ) {
     if (isDark) {
        mapController.setMapStyle(_darkMapStyle);
     }
     else {
        mapController.setMapStyle(_normalMapStyle);
     }
  }
    return Container(
        child: SlidingUpPanel(
          backdropEnabled: true,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
          color: isDark ? Colors.grey[900] : Colors.white,
          panel: slideUpDisplay(),
          body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          ),
        );
  }

  Container slideUpDisplay() {
    return Container(
      child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.maximize,
                  size: 30.0,
                ),
                Text("Stores",
                style: TextStyle(
                  fontSize: 50.0,
                ),
                ),
                Divider(
                ),
                Expanded(
                  child: ListView.builder(
                  itemCount: stores.length,
                  itemBuilder: (context, index) {
                    final store = stores[index];
                    return ListTile(
                      title: Text(store.name),
                      subtitle: Text(store.address),
                      onTap: () {

                      },
                      trailing: Icon(
                        Icons.directions,
                      ),
                    );
                  },),
                ),
              ],
            ),
          ),
    );
  }
}
