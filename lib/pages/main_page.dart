import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application/models/apod_data.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final String apodUrl = 'https://api.nasa.gov/planetary/apod';
  final String apiKey = dotenv.get('API_KEY');
  Future<ApodData?>? _data;

  @override
  void initState() {
    // 在頁面生成時取得APOD 資訊
    _data = _fetchDailyApodData();
    super.initState();
  }

  Future<ApodData?> _fetchDailyApodData() async {
    try {
      Uri url = Uri.parse('$apodUrl?api_key=$apiKey&thumbs=true');
      final response = await http.get(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      final parsedResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return ApodData.fromJson(parsedResponse);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size deviceScreen = MediaQuery.of(context).size;
    double deviceWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: FutureBuilder(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ApodData? data = snapshot.data;
            // Null data;
            print(data);
            return Column(
              children: <Widget>[
                Padding(
                  padding: data != null
                      ? const EdgeInsets.all(10.0)
                      : const EdgeInsets.all(1.0),
                  child: Text(
                    data != null ? data.title : '',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: deviceScreen.width,
                      child: data != null
                          ? Image.network(
                              data.url,
                              frameBuilder:
                                  (
                                    context,
                                    child,
                                    frame,
                                    wasSynchronouslyLoaded,
                                  ) {
                                    if (wasSynchronouslyLoaded) return child;
                                    return AnimatedOpacity(
                                      opacity: frame == null ? 0 : 1,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.easeOut,
                                      child: child,
                                    );
                                  },
                            )
                          : SizedBox(
                              width: deviceScreen.width,
                              height: deviceScreen.height,
                              child: const Center(
                                child: Text(
                                  '圖片載入錯誤',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Positioned(
                      top: 10.0,
                      right: 10.0,
                      child: ElevatedButton(
                        onPressed: () {
                          print('add to favorite');
                        },
                        child: const Text('加入最愛'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    data != null ? data.explanation : '',
                    style: const TextStyle(fontSize: 16, color: Colors.blueGrey),
                  ),
                ),
              ],
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                '頁面載入錯誤',
                style: TextStyle(color: Colors.red, fontSize: 30),
              ),
            );
          }

          return SizedBox(
            height: deviceScreen.height,
            width: deviceScreen.width,
            child: const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                constraints: BoxConstraints(minHeight: deviceWidth),
                width: deviceWidth,
                child: Image.network(
                  'https://apod.nasa.gov/apod/image/2209/WaterlessEarth2_woodshole_2520.jpg',
                  loadingBuilder:
                      (
                        BuildContext context,
                        Widget child,
                        ImageChunkEvent? loadingProgress,
                      ) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                ),
              ),
              Positioned(
                top: 10.0,
                right: 10.0,
                child: ElevatedButton(
                  onPressed: () {
                    print('123');
                  },
                  child: const Text('加入最愛'),
                ),
              ),
            ],
          ),
          const Text(
            '''How much of planet Earth is made of water? Very little, actually.
              Although oceans of water cover about 70 percent of Earth's surface, these oceans are
              shallow compared to the Earth's radius. The featured illustration shows what would happen
             if all of the water on or near the surface of the Earth were bunched up into a ball.
             The radius of this ball would be only about 700 kilometers, less than half the radius of
             the Earth's Moon, but slightly larger than Saturn's moon Rhea which, like many moons in
             our outer Solar System, is mostly water ice. The next smallest ball depicts all of
             Earth's liquid fresh water, while the tiniest ball shows the volume of all of Earth's
             fresh-water lakes and rivers. How any of this water came to be on the Earth and whether
             any significant amount is trapped far beneath Earth's surface remain topics of research.''',
            style: TextStyle(fontSize: 12, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}
