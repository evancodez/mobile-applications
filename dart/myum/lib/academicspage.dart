import 'package:flutter/material.dart';

class AcademicsPage extends StatefulWidget {
  const AcademicsPage({super.key});

  @override
  State<AcademicsPage> createState() => _AcademicsPageState();
}

class _AcademicsPageState extends State<AcademicsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          const Text(
            "Academics at The U",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Explore a vibrant academic environment where discovery, innovation, and education come together to shape the future.",
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  "https://welcome.miami.edu/_assets/images/academics/Han-Tran-1240x550.jpg",
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  "https://www.frost.miami.edu/_assets/images/homepage/full-width-slider/admissions-virtual-sessions-1600x550.jpg",
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    Text(
                      "Academic Excellence",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "The University of Miami offers over 180 majors and programs, empowering students to make an impact through research, innovation, and scholarship.",
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