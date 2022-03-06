import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMaps extends StatefulWidget {
  @override
  _FullScreenMapsState createState() => _FullScreenMapsState();
}

class _FullScreenMapsState extends State<FullScreenMaps> {
  MapboxMapController mapController;

  final center = LatLng(-25.15406, -57.27375);

  String selectedStyle = 'mapbox://styles/odafra/ckow37zo8075y18pbs0hlgv16';

  final oscuroStyle = 'mapbox://styles/odafra/ckow37zo8075y18pbs0hlgv16';

  final streetStyle = 'mapbox://styles/odafra/ckow32jsl06xh17nvws240xei';

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: crearMapas(),
      floatingActionButton: botonesFlotantes(),
    );
  }

  Column botonesFlotantes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // FloatingActionButton(
        //   child: Icon(Icons.system_update_tv_outlined),
        //   onPressed: () {
        //     mapController.addSymbols(

        //       SymbolOptions(
        //         geometry: center, textField: 'Montna'),
        //     );
        //   },
        // ),
        // SizedBox(
        //   height: 5,
        // ),
        FloatingActionButton(
          child: Icon(Icons.zoom_in),
          onPressed: () {
            mapController.animateCamera(CameraUpdate.zoomIn());
          },
        ),
        SizedBox(
          height: 5,
        ),
        FloatingActionButton(
          child: Icon(Icons.zoom_out),
          onPressed: () {
            mapController.animateCamera(CameraUpdate.zoomOut());
          },
        ),
        SizedBox(
          height: 5,
        ),
        FloatingActionButton(
          child: Icon(Icons.add_to_home_screen),
          onPressed: () {
            if (selectedStyle == oscuroStyle) {
              selectedStyle = streetStyle;
            } else {
              selectedStyle = oscuroStyle;
            }
            setState(() {});
          },
        ),
      ],
    );
  }

  MapboxMap crearMapas() {
    return MapboxMap(
      styleString: selectedStyle,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        zoom: 14,
        target: center,
      ),
    );
  }
}
