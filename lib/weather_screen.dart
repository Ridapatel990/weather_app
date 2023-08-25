import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/forecast_data.dart' hide Text;
import 'package:weather_app/forecast_item.dart';
import 'package:weather_app/more_info.dart';
import 'package:weather_app/weather_data.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    // getWeather();
  }

  Future<WeatherData> getWeather() async {
    final response = await http.get(
      Uri.parse(
          'http://api.weatherapi.com/v1/current.json?q=19.29684100428824,73.051495791&key=b0edc0a03a654285bac111805232208'),
    );
    if (response.statusCode == 200) {
      return WeatherData.fromRawJson(response.body);
    }
    throw 'No Data Found';
  }

  Future<WeatherData> getMoreInfo() async {
    final response = await http.get(
      Uri.parse(
          'http://api.weatherapi.com/v1/current.json?q=19.29684100428824,73.051495791&key=b0edc0a03a654285bac111805232208'),
    );
    if (response.statusCode == 200) {
      return WeatherData.fromRawJson(response.body);
    }
    throw 'No Data Found';
  }

  Future<ForecastData> getForecastItem() async {
    final response = await http.get(
      Uri.parse(
          'http://api.weatherapi.com/v1/forecast.json?q=19.29684100428824,73.05149579181219&key=b0edc0a03a654285bac111805232208'),
    );
    if (response.statusCode == 200) {
      return ForecastData.fromRawJson(response.body);
    }
    throw 'No ForeCast Data';
  }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data refreshed!'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _refreshData();
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //main card
              FutureBuilder(
                  future: getWeather(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('this is an error');
                    }
                    if (snapshot.hasData) {
                      return SizedBox(
                        width: double.infinity,
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '${snapshot.data?.current?.tempC}°C',
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 16),
                                    Image.network(
                                        'http:${snapshot.data!.current!.condition!.icon!}'),
                                    SizedBox(height: 16),
                                    Text(
                                      '${snapshot.data?.current?.condition?.text}',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  }),

              const SizedBox(height: 20),

              const Text(
                'Weather Forecast',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              FutureBuilder(
                  future: getForecastItem(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error Found');
                    }
                    if (snapshot.hasData) {
                      SizedBox(height: 16);
                      return Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(

                                ///In Flutter  => this also means return
                                children: snapshot
                                    .data!.forecast!.forecastday!.first.hour!
                                    .map((e) => ForecastItem(
                                          time: e.time!.split(' ').last,
                                          icon: Image.network(
                                              'http:${e.condition!.icon}'),
                                          temperature: e.tempC!.toString(),
                                        ))
                                    .toList()),
                          ),
                        ],
                      );
                    }
                    return CircularProgressIndicator();
                  }),

              const SizedBox(height: 20),

              const Text(
                'Additional Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              SizedBox(
                height: 8,
              ),

              FutureBuilder(
                future: getMoreInfo(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('There is an error');
                  }
                  if (snapshot.hasData) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MoreInfo(
                          icon: Icons.water_drop,
                          label: "Humdity",
                          value: '${snapshot.data!.current!.humidity!}',
                        ),
                        MoreInfo(
                          icon: Icons.air,
                          label: "Wind Speed",
                          value: '${snapshot.data!.current!.windKph!}',
                        ),
                        MoreInfo(
                          icon: Icons.beach_access,
                          label: 'Pressure',
                          value: '${snapshot.data!.current!.pressureIn!}',
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
