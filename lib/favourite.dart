import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riberio_dogstore/Theme/color.dart';
import 'package:riberio_dogstore/constat.dart';
import 'package:riberio_dogstore/data_model.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<Data>? apidata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: primary1Color,
            )),
        backgroundColor: Colors.white,
        title: Text(
          "Favourites",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: primary1Color,
          ),
        ),
        centerTitle: true,
      ),
      body: favouritedata.isEmpty
          ? Center(
              child: Lottie.asset(
                "assets/favouriteloading.json",
                width: 200,
                height: 200,
                fit: BoxFit.fill,
              ),
            )
          : SingleChildScrollView(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: favouritedata.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Stack(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(150, 104, 210, 255),
                                // gradient: LinearGradient(
                                //     colors: [
                                //       primary1Color,
                                //       const Color(0xFF00D4FF),
                                //     ],
                                //     begin: Alignment.topLeft,
                                //     end: Alignment.bottomRight,
                                //     stops: const [0.1, 0.8],
                                //     tileMode: TileMode.clamp),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          "Name : ${favouritedata[index].name}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: "Overpass",
                                              fontWeight: FontWeight.w900,
                                              color: primary1Color),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Breed Group :  ${favouritedata[index].breedGroup}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: secondaryColor),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Life Span :  ${favouritedata[index].lifeSpan}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: secondaryColor),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Origin :  ${favouritedata[index].origin}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: secondaryColor),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Temperament :  ${favouritedata[index].temperament}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: secondaryColor),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Bred For :  ${favouritedata[index].bredFor}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: secondaryColor),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Weight: ",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: primary1Color),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                " Metric :  ${favouritedata[index].weight!.metric}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: secondaryColor),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                " Imperial :  ${favouritedata[index].weight!.imperial}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: secondaryColor),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Height ",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: primary1Color,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                " Metric :  ${favouritedata[index].height!.metric}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: secondaryColor),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                " Imperial :  ${favouritedata[index].height!.imperial}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: secondaryColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ]),
                              )),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: InkWell(
                                onTap: () {
                                  favouritedata.remove(favouritedata[index]);
                                  Fluttertoast.showToast(
                                      msg: "Removed from Favourite",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  // if (favouritedata.length != 5) {
                                  //   //remove
                                  //   favouritedata.remove(favouritedata[index]);
                                  //   Fluttertoast.showToast(
                                  //       msg: "Removed from Favourite",
                                  //       toastLength: Toast.LENGTH_SHORT,
                                  //       gravity: ToastGravity.CENTER,
                                  //       timeInSecForIosWeb: 1,
                                  //       backgroundColor: Colors.black,
                                  //       textColor: Colors.white,
                                  //       fontSize: 16.0);
                                  // } else {
                                  //   Fluttertoast.showToast(
                                  //       msg: " ",
                                  //       toastLength: Toast.LENGTH_SHORT,
                                  //       gravity: ToastGravity.CENTER,
                                  //       timeInSecForIosWeb: 1,
                                  //       backgroundColor: Colors.black,
                                  //       textColor: primaryColor,
                                  //       fontSize: 16.0);
                                  // }
                                },
                                child: SvgPicture.asset(
                                    "assets/icons/favourite.svg")),
                          )
                        ],
                      ),
                    );
                    // Column(
                    //   children: [
                    //     Text(apidata![index].height!.imperial.toString()),
                    //     Text(apidata![index].name.toString()),
                    //   ],
                    // );
                  }),
            ),
    );
  }
}
