import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'customcard.dart';
import 'academicspage.dart';

void main() {
  runApp(const MyUm());
}

class MyUm extends StatelessWidget {
  const MyUm({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyUmApp(),
    );
  }
}

class MyUmApp extends StatefulWidget {
  const MyUmApp({super.key});

  @override
  State<MyUmApp> createState() => _MyUmAppState();
}

class _MyUmAppState extends State<MyUmApp> {
  int currentIndex = 0;

  var images = [
    "https://news.miami.edu/_assets/images-stories/2025/03/first-year-admitted-student-program-hero-940x529.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/03/field-hockey-video-hero-940x529.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/02/early-chicken-development-hero-940x529.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/01/cormac-obrien-distance-running-hero-940x529.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/01/moon-telescope-hero-940x529.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/01/boiling-river-peru-hero-940x529.jpg"
  ];
  var titles = [
    "Global start for University students",
    "A Winning Formula",
    "Cellular Clues to Body Symmetry",
    "Running With Heart",
    "Eyes on the Moon",
    "Amazon Under Threat"
  ];
  var bodies = [
    "The Start Abroad program offered to spring-admitted students at the University of Miami provides a unique and exciting first-year international experience.",
    "More than just a team, the University of Miami's Field Hockey Club fosters camaraderie and teamwork through travel, competition, and a shared passion.",
    "New biophysics research at the University of Miami sheds light on how cellular flows shape the body's left-right asymmetry, using early chicken development as a model.",
    "University of Miami senior Cormac O’Brien is achieving personal bests in distance running, driven by team spirit and passion for the sport.",
    "A University of Miami astrophysicist helped develop an X-ray telescope bound for the Moon to capture unprecedented views of Earth’s magnetosphere.",
    "UM scientists model future Amazon rainforest changes under climate stress, offering a sobering glimpse into ecological transformations ahead."
  ];

  // Page 3 content
  var articleImages = [
    "https://news.miami.edu/_assets/images-stories/2024/12/holiday-anxiety-hero-940x529.jpg",
    "https://news.miami.edu/_assets/images-stories/2024/12/recycle-video-hero-940x529.jpg",
    "https://news.miami.edu/_assets/images-stories/2024/12/contrasting-views-american-frontierism-hero-940x529.jpg",
    "https://news.miami.edu/_assets/images-stories/2024/12/december-commencement-speakers-2024-hero-940x529.jpg",
    "https://news.miami.edu/_assets/images-stories/2024/12/sart-story-hero-940x529.jpg",
    "https://news.miami.edu/_assets/images-stories/2024/12/sharks-vs-flamingos-hero-940x529.jpg",
    "https://news.miami.edu/_assets/images-stories/2024/12/gema-sanchez-dragon-boat-racing-hero-940x529.jpg"
  ];
  var articleTitles = [
    "Managing Holiday Anxiety",
    "Bye Bye, Plastic",
    "Reframing Frontier History",
    "Fall 2024 Commencement Speakers",
    "Volunteers Needed for SART",
    "Flamingos, Fish, and Instincts",
    "Paddling Toward Healing"
  ];
  var articleBodies = [
    "UM researchers offer guidance for dealing with heightened anxiety during the holidays—America’s most stressful time of year.",
    "The University of Miami made a bold sustainability move in 2019, eliminating plastic on campus. Here's how you can help.",
    "AI is helping uncover the contrasting views Native and non-Native authors have toward American frontierism.",
    "Michael Irvin and Alina T. Hudak will deliver keynote speeches at the December 2024 commencement ceremonies.",
    "The University’s Sexual Assault Resource Team is recruiting new volunteers to support its 32-year-old anonymous hotline.",
    "A creative College of Arts and Sciences course helps students simulate survival instincts through inflatable role-play.",
    "UM professor Gema Sánchez shares how dragon boat racing played a key role in her recovery after breast cancer surgery."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyUM"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: <Widget>[
          Dashboard(),

          // Page 2
          ListView(
            children: List.generate(
              images.length,
              (index) => CustomCard(images[index], titles[index], bodies[index]),
            ),
          ),

          // Page 3
          ListView(
            children: List.generate(
              articleImages.length,
              (index) => CustomCard(
                  articleImages[index], articleTitles[index], articleBodies[index]),
            ),
          ),

          const AcademicsPage() // Placeholder for Page 4
        ][currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          NavigationDestination(
            icon: Icon(Icons.pages),
            label: "Page 2",
          ),
          NavigationDestination(
            icon: Icon(Icons.pages),
            label: "Page 3",
          ),
          NavigationDestination(
            icon: Icon(Icons.school),
            label: "Page 4",
          ),
        ],
      ),
    );
  }
}

