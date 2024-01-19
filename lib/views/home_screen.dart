import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/components/round_button.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_model/controller/home_view_model.dart';
import 'package:getx_mvvm/view_model/user_preference/user_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeViewModel = Get.put(HomeViewModel());
  UserPreferences userPreferences = UserPreferences();
  bool isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.fetchHomeApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () {
                    userPreferences
                        .removeUser()
                        .then((value) => Get.toNamed(RouteName.loginScreen));
                  },
                  icon: const Icon(Icons.login_outlined))
            ],
          ),
          body: Obx(() {
            switch (homeViewModel.rxRequestStatus.value) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                if (homeViewModel.error.value == 'null') {
                  return Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Something went wrong',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RoundButton(
                            title: 'Retry',
                            loading: isloading,
                            onPressed: () {
                              setState(() {
                                isloading =
                                    true; // Set loading to true before the API call
                              });

                              // Make the API call
                              homeViewModel.fetchHomeApi();

                              setState(() {
                                isloading =
                                    false; // Set loading to false after the API call completes
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(child: Text(homeViewModel.error.toString()));
                }

              case Status.COMPLETED:
                return Card(
                  child: ListView.builder(
                      itemCount: homeViewModel.homeList.value.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(homeViewModel
                                  .homeList.value.data![index].avatar
                                  .toString()),
                            ),
                            title: Text(homeViewModel
                                .homeList.value.data![index].firstName
                                .toString()),
                            subtitle: Text(homeViewModel
                                .homeList.value.data![index].email
                                .toString()),
                          ),
                        );
                      }),
                );
            }
          })),
    );
  }
}
