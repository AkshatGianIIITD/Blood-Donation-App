
import 'package:flutter/material.dart';


class AchievementsPage extends StatefulWidget {
  AchievementsPage({super.key});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  final PageController _pageController=PageController(viewportFraction: 0.9);

  List achievements=[
    {
        "img": "img/Achievement-1.png",
        "achievementName": "10 Times Donor",
        "achievementText": "Congrats Donor! You have successfully donated blood 10 times!"
    },
    {
        "img": "img/Achievement-2.png",
        "achievementName": "50 Times Donor",
        "achievementText": "There is no stopping a Champion! Congrats on completing 50 donations"
    },
    {
        "img": "img/Achievement-3.png",
        "achievementName": "100 Times Donor",
        "achievementText": "Wow! Dear Donor you have successfully saved 100 lives and on your way to saving more."
    },
    {
        "img": "img/Achievement-4.png",
        "achievementName": "250 Times Donor",
        "achievementText": "Congratulations on earning your 250 donations badge! Your generosity shines brightly."
    },
    {
        "img": "img/Achievement-5.png",
        "achievementName": "500 Times Donor",
        "achievementText": "Wow! 500 donations - your generosity is truly inspiring. Congratulations on this remarkable achievement!"
    },
    {
        "img": "img/Achievement-6.png",
        "achievementName": "1000 Times Donor",
        "achievementText": "Dear Donor you are a true hero and a saviour. Congratulations on saving 1000 lives and recieving the highest honorary badge"
    },
    {
        "img": "img/Achievement-7.png",
        "achievementName": "10 Connections Award",
        "achievementText": "Congrats Donor! You have successfully made 10 new Donor friends!"
    },
    {
        "img": "img/Achievement-8.png",
        "achievementName": "50 Connections Award",
        "achievementText": "There's no slowing down an excellent Socializer! Congratulations on forging 50 new friendships!"
    },
    {
        "img": "img/Achievement-9.png",
        "achievementName": "100 Connections Award",
        "achievementText": "Here's to your 100 Friendships: Building Bridges, One Connection at a Time!"
    }
];

  // Future<void> readData() async{
  //   await DefaultAssetBundle.of(context).loadString('json/achievements.json').then((value){
  //     setState(){
  //       achievements=json.decode(value);
  //       //print(achievements.length);
  //     }
  //   });
  // }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   readData();
  //   print(achievements);
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Column(
            children: [
              Stack(children: [
                Container(
                  height: 380,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary),
                ),
                Container(
                  height: 380,
                  child: PageView.builder(controller: _pageController,itemCount: achievements.length,itemBuilder: (_, i) {
                    return AchievementsPageViewWidget(
                      imgAdr: achievements[i]["img"],
                      achievementName: achievements[i]["achievementName"],
                      achievementText:
                          achievements[i]["achievementText"],
                    );
                  }),
                ),
              ]),
            ],
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "img/Achievement-${index + 1}.png"))),
                      ));
                })),
          ),
        ],
      ),
    );
  }
}

class AchievementsPageViewWidget extends StatelessWidget {
  const AchievementsPageViewWidget({
    super.key,
    required this.imgAdr,
    required this.achievementName,
    required this.achievementText,
  });
  final String imgAdr;
  final String achievementName;
  final String achievementText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgAdr),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                overflow: TextOverflow.ellipsis,
                achievementName,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              achievementText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
