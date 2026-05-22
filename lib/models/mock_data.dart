class DemoUser {
  final String name;
  final String email;
  final String image;
  final String bloodGroup;
  final int age;
  final String gender;
  final String condition;
  final String status;
  final String risk;
  final int heartRate;
  final int oxygen;
  final String location;

  DemoUser({
    required this.name,
    required this.email,
    required this.image,
    required this.bloodGroup,
    required this.age,
    required this.gender,
    required this.condition,
    required this.status,
    required this.risk,
    required this.heartRate,
    required this.oxygen,
    required this.location,
  });
}

List<DemoUser> demoUsers = [

  DemoUser(
    name:"Sibiragavan D",
    email:"sibiragavan@gmail.com",
    image:"https://i.pravatar.cc/300?img=3",
    bloodGroup:"O+",
    age:28,
    gender:"Male",
    condition:"Asthma",
    status:"SAFE",
    risk:"LOW RISK",
    heartRate:76,
    oxygen:98,
    location:"New York",
  ),

  DemoUser(
    name:"Nitesh R P",
    email:"nitesh@gmail.com",
    image:"https://i.pravatar.cc/300?img=5",
    bloodGroup:"O+",
    age:24,
    gender:"Male",
    condition:"Diabetes",
    status:"MONITORING",
    risk:"MEDIUM RISK",
    heartRate:84,
    oxygen:96,
    location:"California",
  ),

  DemoUser(
    name:"Ava Smith",
    email:"ava@gmail.com",
    image:"https://i.pravatar.cc/300?img=9",
    bloodGroup:"AB+",
    age:26,
    gender:"Female",
    condition:"Allergies",
    status:"ALERT",
    risk:"HIGH RISK",
    heartRate:110,
    oxygen:92,
    location:"Florida",
  ),

  DemoUser(
    name:"Nithiyan S",
    email:"nithiyan@gmail.com",
    image:"https://i.pravatar.cc/300?img=11",
    bloodGroup:"B+",
    age:29,
    gender:"Male",
    condition:"Hypertension",
    status:"SAFE",
    risk:"LOW RISK",
    heartRate:80,
    oxygen:97,
    location:"Chicago",
  ),

  DemoUser(
    name:"Brian Lee",
    email:"brian@gmail.com",
    image:"https://i.pravatar.cc/300?img=8",
    bloodGroup:"O-",
    age:31,
    gender:"Male",
    condition:"None",
    status:"SAFE",
    risk:"LOW RISK",
    heartRate:72,
    oxygen:99,
    location:"Texas",
  ),
];

DemoUser currentUser = demoUsers[0];