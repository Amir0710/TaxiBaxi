import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialZoom: 13,
              initialCenter: LatLng(51.5, -0.09),
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 40.0,
                    ),
                    width: 80.0,
                    height: 80.0,
                    point: const LatLng(51.5, -0.09),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 36),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),borderRadius: BorderRadius.circular(16)
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Location',
                  hintStyle: Theme.of(context).textTheme.headlineSmall,
                  contentPadding: const EdgeInsets.only(left: 12, right: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
