import 'package:flutter/material.dart';
import 'package:new_list_api/api.dart';

import 'model/album.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Api List Callings')),
      body: Column(
        children: [
          FutureBuilder<List<Album>>(
              future: fetchAlbum(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else if (snapshot.hasData) {
                  final data = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                              child: ListTile(
                                  leading: Text('${data[index].userId}'),
                                  title: Text('${data[index].id}'),
                                  subtitle: Text('${data[index].body}'),
                                  trailing: SizedBox(
                                    width: 150,
                                    height: 200,
                                    child: Text('${data[index].title}'),
                                  )));
                        }),
                  );
                } else {
                  return Text('Unable to fetch data');
                }
              })
        ],
      ),
    );
  }
}
