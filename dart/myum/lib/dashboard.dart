import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Image.network(
            "https://news.miami.edu/_assets/images-stories/2025/01/provost-search-hero-940x529.jpg",
            width: 1000,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          const Text(
            "University of Miami",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "The University of Miami is one of the most beautiful schools in America! From its academics to its tropical campus, it’s a place where excellence and sunshine go hand in hand.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    Text(
                      "Did You Know?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.school, color: Colors.deepOrange),
                        Icon(Icons.beach_access, color: Colors.teal),
                        Icon(Icons.science, color: Colors.blueGrey),
                        Icon(Icons.public, color: Colors.green),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Known for its stunning location in Coral Gables, UM boasts top-ranked programs in marine science, business, medicine, and more.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}