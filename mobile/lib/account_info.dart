import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
            SliverAppBar(
              floating: false,
              pinned: true,
              title: Text("Settings"),
            ),
            SliverFillRemaining(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: CircleAvatar(
                      radius: 100.0,
                      backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png')
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Settings",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 12,
                    separatorBuilder: (BuildContext context, int index) => Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('item $index'),
      //                  onTap: () {Navigator.push(
      //                    context,
      //                    MaterialPageRoute(builder: (context) => DetailScreen(drink: drink)),
      //                  );},
                          onTap: () {print("{$index} has been pressed");},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
      ]
    );
  }
}