import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String email;

  const ProfileCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: newMethod,
        ),
      ),
    );
  }

  List<Widget> get newMethod {
    return [
      CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(imageUrl),
      ),
      const SizedBox(height: 10),
      Text(
        name,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 5),
          Text(email),
        ],
      ),
      ListTile(
        leading: Icon(Icons.settings, color: Colors.blue),
        title: Text("การตั้งค่า"),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.lock, color: Colors.blue),
        title: Text("รหัสผ่าน"),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.question_answer, color: Colors.blue),
        title: Text("ความเป็นส่วนตัว"),
        onTap: () {},
      ),
      ElevatedButton(
        onPressed: () {
          SnackBar(content: Text("ออกจากระบบ"));
        },
        child: const Text('การแก้ไข'),
      ),
      ElevatedButton(
        onPressed: () {
          SnackBar(content: Text("ออกจากระบบ"));
        },
        child: const Text('ออกจากระบบ'),
      )
    ];
  }
}

Widgetbuild(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                print('Button Pressed');
              },
              child: const Text('Click Me'),
            ),
          ),
        ],
      ),
    ),
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 207, 255, 187),
        appBar: AppBar(
          title: const Text('โปรไฟล์ผู้ใช้'),
          backgroundColor: const Color.fromARGB(255, 155, 255, 166),
          elevation: 0,
        ),
        body: Center(
          child: ProfileCard(
            imageUrl:
                'https://imgk.timesnownews.com/story/TomandJerry.PNG?tr=w-1200,h-900',
            name: 'Wachiravit Namjaisuk',
            email: 'namjaisuk_w@silpakorn.edu',
          ),
        ),
      ),
    );
  }
}
