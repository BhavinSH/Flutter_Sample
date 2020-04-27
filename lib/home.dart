import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/api/apiclient.dart';
import 'package:flutterapp/model/user.dart';

class HomeDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Container(
          child: new FutureBuilder<List<User>>(
            future: APIClient().getUserList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.data[index].name),
                        subtitle: Text(snapshot.data[index].email),
                        onTap: () =>
                            onItemClick(context, snapshot.data[index].name),
                      ),
                    );
                  },
                );
              }
              return Center(
                child: new CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}

onItemClick(BuildContext context, String item) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(item),
  ));
}
