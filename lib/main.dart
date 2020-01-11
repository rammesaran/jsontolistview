import 'package:flutter/material.dart';
import 'package:mediumexample/model/bear_model.dart';
import 'package:mediumexample/services/getservices.dart';

void main() => runApp(MyAPP());

class MyAPP extends StatefulWidget {
  @override
  _MyAPPState createState() => _MyAPPState();
}

class _MyAPPState extends State<MyAPP> {
  GetService service = GetService();
  List<BearModel> model = List<BearModel>();
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('list of details'),
        ),
        body: FutureBuilder<List<BearModel>>(
            future: service.fetchservice(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? BearList(model: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}

class BearList extends StatelessWidget {
  final List<BearModel> model;
  BearList({this.model});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: model.length,
        itemBuilder: (context, index) {
          return Image.network(model[index].imageUrl);
        });
  }
}
