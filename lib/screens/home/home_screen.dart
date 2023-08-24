import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_event/constants/constants.dart';
import 'package:tech_event/widgets/drawer_body.dart';
import 'package:tech_event/widgets/home_widgets/future_events.dart';
import 'package:tech_event/widgets/home_widgets/home_tabbar_view.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tech_event/widgets/home_widgets/past_events.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    Constants constantsColor = Constants();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFF35E24), // <-- SEE HERE
        statusBarIconBrightness:
            Brightness.light, //<-- For Android SEE HERE (dark icons)
        statusBarBrightness:
            Brightness.light, //<-- For iOS SEE HERE (dark icons)
      ),
    );
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            constantsColor.primaryGradient,
            constantsColor.primary,
            constantsColor.third,
          ],
        ),
      ),
      child: Scaffold(
        key: _key,
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(30.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text('Tech Event'),
            actions: const [
              IconButton(
                icon: Icon(
                  Icons.notifications_active,
                  color: Color(0xEFFFFFFF),
                ),
                onPressed: null,
              )
            ],
            leading: GestureDetector(
              onTap: () => _key.currentState!.openDrawer(),
              child: Image.asset(
                "asset/icones/menu-bar.png",
                // fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        drawer: const Drawer(child: DrawerBody()),
        body: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFf2f2f2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12,
                      left: 10,
                      right: 10,
                    ),
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: TabBar(
                          isScrollable: false,
                          controller: tabController,
                          tabs: const [
                            Tab(
                              text: "Événements à venir",
                            ),
                            Tab(
                              text: "Événements passés",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: HomeTabBarView(
                      tabController: tabController,
                      futureEvents: const FutureEvents(),
                      pastEvents: const PastEvents(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
