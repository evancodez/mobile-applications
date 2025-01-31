// Key Learning Points: Variables and Data Types
// Control Flows and Looping
// Functions and Methods
void main() {
    greeting();
    print(addTwo(100));
    print(addTwo(30));
    var inferredString = "William";

    String explicitString = "Jattin";

    print(inferredString + " " + explicitString);

  //null  
    int? someNumber;
    print(someNumber);
    someNumber = 12;
    print(someNumber);

    int age = 21;
    double temp = 29.9;
    bool isReady = false;
    String school = "University of Miami";



    print("My school is ${school.length} characters");

    if(school.length < 20){
      print("This school has a short name");
    } else{
      print("this name is way too long");
    }

    // <= 
    // !=
    // % modulus
    // >=
    // +=
    

  }


// custom function

void greeting(){
  print('hi');
}

int addTwo(int number){
  return number + 2;
}
