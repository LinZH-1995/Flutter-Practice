import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    // double deviceWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100,
          padding: EdgeInsets.all(5.0),
          child: const Expanded(
            child: Card(
              elevation: 5.0,
              child: Center(
                child: Text(
                  'I Am Image Title',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        );
      },
    );

    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Scaffold(appBar: AppBar(title: const Text('data')));
          }));
        },
        child: const Text('首頁'),
      ),
    );
  }
}
