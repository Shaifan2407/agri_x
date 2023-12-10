import 'package:firebase_database/firebase_database.dart';

class MyData {
  late double floatValue; // Assuming this is the float value
  late int intValue; // Assuming this is the int value

  MyData({
    required this.floatValue,
    required this.intValue,
  });

  // Factory method to create an instance of MyData from a Map
  factory MyData.fromMap(Map<String, dynamic> map) {
    return MyData(
      floatValue: map['floatValue'].toDouble(), // Convert to double
      intValue: map['intValue'],
    );
  }
}

class FirebaseService {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  Future<List<MyData>> getMyData() async {
    DatabaseEvent snapshotEvent = await _database.child('myData').once();
    DataSnapshot snapshot = snapshotEvent.snapshot;

    List<MyData> myDataList = [];

    if (snapshot.value != null) {
      // Explicitly cast to Map<String, dynamic>
      Map<String, dynamic> data = snapshot.value as Map<String, dynamic>;

      data.forEach((key, value) {
        MyData myData = MyData.fromMap({
          'floatValue': value['floatValue'].toDouble(), // Convert to double
          'intValue': value['intValue'],
        });
        myDataList.add(myData);
      });
    }

    return myDataList;
  }
}
