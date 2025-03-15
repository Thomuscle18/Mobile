import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String weight = '';
  String email = '';
  String province = 'Bangkok';
  bool acceptTerms = false;
  bool pack = false;
  bool confirm = false;
  String ship = "ปกติ";

  final List<String> provinces = [
    'Bangkok',
    'Chiang Mai',
    'Phuket',
    'Kanchanaburi',
    'Khon Kaen'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("คำนวณค่าจัดส่ง")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: "น้ำหนัก(กก.)"),
                    onChanged: (value) {
                      setState(() {
                        weight = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField(
                    decoration:
                        const InputDecoration(labelText: "เลือกระยะทาง"),
                    value: province,
                    items: provinces.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        province = value.toString();
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text("บริการอื่นๆ"),
                  CheckboxListTile(
                    title: const Text('แพ็คกิ้งพิเศษ +20 บาท'),
                    value: pack,
                    onChanged: (value) {
                      setState(() {
                        pack = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text("ประกันพัสดุ +50 บาท"),
                    value: confirm,
                    onChanged: (value) {
                      setState(() {
                        confirm = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Column(children: [
                    RadioListTile(
                      title: const Text("ปกติ"),
                      value: "ปกติ",
                      groupValue: ship,
                      onChanged: (value) {
                        setState(() {
                          ship = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text("ด่วน"),
                      value: "ด่วน",
                      groupValue: ship,
                      onChanged: (value) {
                        setState(() {
                          ship = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text("ด่วนพิเศษ"),
                      value: "ด่วนพิเศษ",
                      groupValue: ship,
                      onChanged: (value) {
                        setState(() {
                          ship = value.toString();
                        });
                      },
                    ),
                  ]),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: acceptTerms
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                // Handle form submission
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("ค่าจัดส่ง")),
                                );
                              }
                            }
                          : null,
                      child: const Text("คำนวณค่าจัดส่ง"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
