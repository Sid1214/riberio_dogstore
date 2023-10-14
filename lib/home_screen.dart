import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riberio_dogstore/Theme/color.dart';
import 'package:riberio_dogstore/constat.dart';
import 'package:riberio_dogstore/data_model.dart';
import 'package:riberio_dogstore/favourite.dart';
import 'package:riberio_dogstore/getapi.dart';
import 'package:riberio_dogstore/setting_screen.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  StateProvider homeloaderProvider = StateProvider((ref) => true);

  List<Data>? apidata;
  Future callApi() async {
    apidata = await fetchData().whenComplete(() {
      ref.watch(homeloaderProvider.notifier).state = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loader = ref.watch(homeloaderProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text("RIBERIO",
              style: TextStyle(
                  fontSize: 25,
                  color: primary1Color,
                  fontWeight: FontWeight.w500)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const FavouriteScreen()),
                      );
                    },
                    child: SvgPicture.asset("assets/icons/favourite.svg")),
                const SizedBox(width: 10),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const SettingScreen()),
                      );
                    },
                    child: SvgPicture.asset("assets/icons/setting.svg")),
              ],
            ),
          )
        ],
      ),
      body: loader
          ? Center(
              child: Lottie.asset(
                "assets/loading.json",
                width: 200,
                height: 200,
                fit: BoxFit.fill,
              ),
            )
          : SingleChildScrollView(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: apidata!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
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
                                          "Name : ${apidata![index].name}",
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
                                        "Breed Group :  ${apidata![index].breedGroup}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: secondaryColor),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Life Span :  ${apidata![index].lifeSpan}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: secondaryColor),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Origin :  ${apidata![index].origin}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: secondaryColor),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Temperament :  ${apidata![index].temperament}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: secondaryColor),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Bred For :  ${apidata![index].bredFor}",
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
                                                " Metric :  ${apidata![index].weight!.metric}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: secondaryColor),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                " Imperial :  ${apidata![index].weight!.imperial}",
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
                                                " Metric :  ${apidata![index].height!.metric}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: secondaryColor),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                " Imperial :  ${apidata![index].height!.imperial}",
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
                                  if (favouritedata.length != 5) {
                                    //remove
                                    favouritedata.add(apidata![index]);
                                    Fluttertoast.showToast(
                                        msg: "Added to Favourite",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Limit Exceeded",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                },
                                child: Icon(
                                    //fill color
                                    Icons.favorite_border_outlined,
                                    color: secondaryColor)),
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
