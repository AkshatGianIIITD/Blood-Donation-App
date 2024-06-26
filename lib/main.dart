import 'package:blood_donation_app/achievements_page.dart';
import 'package:blood_donation_app/blood_request_page_view_widget.dart';
import 'package:blood_donation_app/connect_page.dart';
import 'package:blood_donation_app/donate_page.dart';
import 'package:blood_donation_app/home_page.dart';
import 'package:blood_donation_app/request_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'blood_donation_center_list_view_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:blood_donation_app/blood_request_page_view_widget.dart';
//import 'package:location/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(249, 150, 31, 10)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-33.86, 151.20);
  final LatLng _home = const LatLng(28.69, 77.29);
  final LatLng _college = const LatLng(28.543, 77.271);

  int _selectedBottomBarIndex = 0;
  final ScrollController _scrollController = ScrollController();

// Flag to track whether to allow scrolling
  bool _allowScrolling = true;
  var selectedIndex=0;
  var achievementsOpen=false;

  //late Location location=Location();
  //late LatLng _currentLocation;

  // Future<void> getCurrentLocation() async {
  //   try{
  //     var currentLocation=await location.getLocation();
  //     setState(() {
  //       _currentLocation=LatLng(currentLocation.latitude!, currentLocation.longitude!);
  //     });
  //   }
  //   catch(e){
  //     print("Error getting location:${e}");
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getCurrentLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedBottomBarIndex = index;
    });
  }

  ScrollPhysics _scrollPhysics = ScrollPhysics();
  Icon achievementsIcon=Icon(Icons.emoji_events_outlined);

  @override
  Widget build(BuildContext context) {
    Widget page=HomePage();
    if(selectedIndex==-1){
      page=AchievementsPage();
    }
    else{switch(_selectedBottomBarIndex){
      case 0:
        page=HomePage();
        break;
      case 1:
      //_selectedBottomBarIndex=-1;
        page=DonatePage();
        break;
      case 2:
        page=RequestPage();
        break;
      case 3:
        page=ConnectPage();
        break;    
      default:
        //page=HomePage();  
        break;
    }}
    // if(achievementsOpen){
    //   page=AchievementsPage();
    // }
    //bool _isInteracting = false;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: Text(
          "BloodPal",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if(!achievementsOpen){
                  page=AchievementsPage();
                achievementsIcon=Icon(Icons.emoji_events);
                achievementsOpen=!achievementsOpen;
                selectedIndex=-1;
                }
                else{
                  page=HomePage();
                  achievementsIcon=Icon(Icons.emoji_events_outlined);
                  achievementsOpen=!achievementsOpen;
                  selectedIndex=0;
                }
              });
            },
            icon: achievementsIcon,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined),
            color: Theme.of(context).colorScheme.onPrimary,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBottomBarIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bloodtype), label: "Donate"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital), label: "Request"),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: "Connect"),
        ],
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
      ),
      resizeToAvoidBottomInset: false,
      body: page,
    );
  }
}
