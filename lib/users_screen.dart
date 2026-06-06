import 'package:flutter/material.dart';

class DataModel {
  final String id;
  final String name;
  final String phone;

  const DataModel({required this.id, required this.name, required this.phone});
}

class UsersScreen extends StatelessWidget {

  final List<DataModel> users = const [
    DataModel(id: '1', name: 'Sami Abdelhaleem', phone: '+201027564791'),
    DataModel(id: '2', name: 'Ahmed Mohamed', phone: '+201055644791'),
    DataModel(id: '3', name: 'Ali Osama', phone: '+201244564791'),
    DataModel(id: '4', name: 'Mohsen Adel', phone: '+201255964791'),
    DataModel(id: '5', name: 'Alaa Ragab', phone: '+201099484791'),
    DataModel(id: '6', name: 'Ahmed Mohamed', phone: '+201055644791'),
    DataModel(id: '7', name: 'Ali Osama', phone: '+201244564791'),
    DataModel(id: '8', name: 'Mohsen Adel', phone: '+201255964791'),
    DataModel(id: '9', name: 'Alaa Ragab', phone: '+201099484791'),
  ];
  const UsersScreen({super.key});

  Widget buildUserItem(DataModel users) => Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 25,
          child: Text(users.id, style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(


            users.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(users.phone, style: TextStyle(color: Colors.grey)),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(titleSpacing: 20, title: Text('Users')),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: users.length,
      ),
    );
  }
}
