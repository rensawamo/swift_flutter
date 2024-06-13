import 'package:flutter/material.dart';
import 'package:gms_places_api/gms_places_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            //
            await GmsPlaces.ensureInitialized();
            String query = 'Tokyo';
            PlacesFilterType type = PlacesFilterType.city;
            List<Prediction> predictions =
                await GmsPlaces.autocomplete(query, type: type);
            print(predictions);

            if (predictions.isNotEmpty) {
              List<PlaceFields> fields = [
                PlaceFields.name,
                PlaceFields.formattedAddress
              ];
              PlaceItem? placeItem =
                  await GmsPlaces.getDetailById("20", fields);
              print(placeItem);
            }
          },
        ),
      ),
    );
  }
}
