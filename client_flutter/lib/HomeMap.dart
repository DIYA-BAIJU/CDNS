import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class HomeMap extends StatefulWidget {
  const HomeMap({Key? key}) : super(key: key);

  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  LatLng point = LatLng(49.5, -0.09);
  Color theme1 = Colors.black;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              accountName: Text("Clement Mathew",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              accountEmail: Text("clementmathew@gmail.com",
                  style: TextStyle(color: Colors.black)),
              currentAccountPicture:
                  CircleAvatar(backgroundColor: Colors.black),
            ),
            ListTile(
              leading: Icon(Icons.person, color: theme1),
              title: Text("Profile",
                  style: TextStyle(
                      color: theme1,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.chat, color: theme1),
              title: Text("Feedback",
                  style: TextStyle(
                      color: theme1,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings, color: theme1),
              title: Text("Settings",
                  style: TextStyle(
                      color: theme1,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: theme1),
              title: Text("Signout",
                  style: TextStyle(
                      color: theme1,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              onTap: () {},
            )
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
                height: constraints.maxHeight * 80,
                child: FlutterMap(
                  options: MapOptions(
                      onTap: (p) {
                        setState(() {
                          point = p;
                        });
                      },
                      center: LatLng(49.5, -0.09),
                      zoom: 10),
                  layers: [
                    TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c']),
                    MarkerLayerOptions(markers: [
                      Marker(
                          width: 100,
                          height: 100,
                          point: point,
                          builder: (ctx) => const Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 30,
                              )),
                    ])
                  ],
                ));
          }),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.gps_fixed,
                            size: 30,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          DraggableScrollableSheet(
              maxChildSize: .80,
              initialChildSize: 0.05,
              minChildSize: 0.05,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5, spreadRadius: .1, color: Colors.grey)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                                height: 3,
                                width: 75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.grey,
                                )),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 35, 0, 10),
                              child: Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Landslide",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.verified,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 15),
                                    child: Text(
                                      "Verified",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Icon(Icons.edit),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 13),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    height: 40,
                                    width: 150,
                                    child: Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(left: 30),
                                          child: Icon(
                                            Icons.thumb_up,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 30),
                                          child: Text(
                                            "328",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    height: 40,
                                    width: 150,
                                    child: Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(left: 30),
                                          child: Icon(
                                            Icons.thumb_down,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 30),
                                          child: Text(
                                            "5",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: ListTile(
                                title: Text("John Smith",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                                leading: Icon(
                                  Icons.person_pin,
                                  size: 40,
                                ),
                                trailing: Text("45 minutes ago"),
                              ),
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 10, 15, 5),
                                  child: Text("Encountered a sudden landslide"),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextField(
                                decoration: InputDecoration(
                                    labelText: "Comments",
                                    suffixIcon: Icon(Icons.done)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset("assets/images/1.png",height: 75,width: 75,),
                                  ),
                                  Image.asset("assets/images/2.png",height: 75,width: 75,),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Icon(Icons.add,size: 40,
                                  )
                                  )],
                              ),
                            ),

                          ],
                        );
                      }),
                );
              }),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
            child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: .1,
                        blurRadius: 5,
                      )
                    ]),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: IconButton(
                      onPressed: () => scaffoldKey.currentState?.openDrawer(),
                      icon: const Icon(Icons.menu),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Search",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person_pin,
                          size: 30,
                        )),
                  )
                ])),
          ),
        ],
      ),
    );
  }
}
