import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whetherapp/modal/whetherModal.dart';
import 'package:whetherapp/provider/providerScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  Widget build(BuildContext context) {
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          title: Text(
            "Surat",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text("Surat"),
                      onTap: () {
                        homeProviderTrue!.change("21.1702", "72.8311");
                      },
                    ),
                    PopupMenuItem(
                      child: Text("Amreli"),
                      onTap: () {
                        homeProviderTrue!.change("21.6015", "71.2204");
                      },
                    ),
                    PopupMenuItem(
                      child: Text("Ahmdabad"),
                      onTap: () {
                        homeProviderTrue!.change("23.0225", "72.5714");
                      },
                    ),
                    PopupMenuItem(
                      child: Text("Vadodra"),
                      onTap: () {
                        homeProviderTrue!.change("22.3072", "73.1812");
                      },
                    ),
                    PopupMenuItem(
                      child: Text("Bhavnagar"),
                      onTap: () {
                        homeProviderTrue!.change("21.7645", "72.1519");
                      },
                    ),
                    PopupMenuItem(
                      child: Text("U.K"),
                      onTap: () {
                        homeProviderTrue!.change("55.3781", "3.4360");
                      },
                    ),
                    PopupMenuItem(
                      child: Text("Australia"),
                      onTap: () {
                        homeProviderTrue!.change("25.2744", "133.775");
                      },
                    ),
                    PopupMenuItem(
                      child: Text("United Arab Emirates"),
                      onTap: () {
                        homeProviderTrue!.change("23.4241", "53.8478");
                      },
                    ),
                    PopupMenuItem(
                      child: Text("Dubai"),
                      onTap: () {
                        homeProviderTrue!.change("25.2048", "55.2708");
                      },
                    ),
                    PopupMenuItem(
                      child: Text("United States"),
                      onTap: () {
                        homeProviderTrue!.change("37.0902", "95.7129");
                      },
                    ),
                  ];
                }),
          ],
        ),
        backgroundColor: Colors.tealAccent,
        body: FutureBuilder<WhetherModal>(
          future: homeProviderFalse!
              .apiCalling(homeProviderTrue!.lan, homeProviderTrue!.lon),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              WhetherModal whetherModal = snapshot.data!;
              return Column(
                children: [
                  Column(
                    children: [
                      Text(
                        "🌤️ 31 Jan",
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        "Friday",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${whetherModal.clouds!.all}",
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.teal,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "🌡️ ${whetherModal!.clouds!.all}\nTemperature",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                "🌥️ 0\nClouds",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "🎐 ${whetherModal.wind!.speed} km/h\nWinde Speed",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                "🌇 ${whetherModal.wind!.deg}\nWind Degree",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 50),
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Humidity\n💧\n${whetherModal.main!.humidity}%",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Visibillity\n👁️\n${whetherModal.visibility}",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Sunrise\n☀️\n${whetherModal.sys!.sunrise}",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
