import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _glassNoTEController =
      TextEditingController(text: "1");

  List<WaterTrack> waterTrackList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Water Tracker"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            GetTotalGlassCount().toString(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text("Glass"),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: TextField(
                  controller: _glassNoTEController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(onPressed: _addwaterTrack, child: const Text('Add')),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Time"),
                    subtitle: Text("Date"),
                    leading: Text("1"),
                    trailing:
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  );
                },
                separatorBuilder: (contex, index) {
                  return Divider();
                },
                itemCount: 3),
          )
        ],
      ),
    );
  }

  int GetTotalGlassCount() {
    int counter = 0;
    for (WaterTrack t in waterTrackList) {
      counter += t.noOfGlasses;
    }
    return counter;
  }

  void _addwaterTrack() {
    if (_glassNoTEController.text.isEmpty) {
      _glassNoTEController.text = '1';
    }
    final int noOfGlasses = int.parse(_glassNoTEController.text) ?? 1;
    WaterTrack waterTrack = WaterTrack(
      noOfGlasses: noOfGlasses,
      dateTime: DateTime.now(),
    );
    waterTrackList.add(waterTrack);
    setState(() {});
  }
}

class WaterTrack {
  final int noOfGlasses;
  final DateTime dateTime;

  WaterTrack({required this.noOfGlasses, required this.dateTime});
}
