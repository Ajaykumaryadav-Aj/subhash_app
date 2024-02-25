import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StationaryPages extends StatefulWidget {
  const StationaryPages({super.key});

  @override
  State<StationaryPages> createState() => _StationaryPagesState();
}

class _StationaryPagesState extends State<StationaryPages> {
  String _selectedObject = 'Dropdown';

  final List<String> _object = ['Dropdown', 'High', 'Medium', 'Low'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subhash Stationary'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Column(
                children: [
                  Text(
                    'Particular',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 35),
                  Text('Pen'),
                  SizedBox(height: 35),
                  Text('Pencil'),
                  SizedBox(height: 35),
                  Text('Books'),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Inventory',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 35),
                  Container(
                    height: 25,
                    width: 110,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: DropdownButton<String>(
                      underline: const SizedBox(),
                      value: _selectedObject,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedObject = newValue!;
                          Intl.defaultLocale = _selectedObject;
                        });
                      },
                      items:
                          _object.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Container(
                    height: 25,
                    width: 110,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: DropdownButton<String>(
                      underline: const SizedBox(),
                      value: _selectedObject,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedObject = newValue!;
                          Intl.defaultLocale = _selectedObject;
                        });
                      },
                      items:
                          _object.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Container(
                    height: 25,
                    width: 110,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: DropdownButton<String>(
                      underline: const SizedBox(),
                      value: _selectedObject,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedObject = newValue!;
                          Intl.defaultLocale = _selectedObject;
                        });
                      },
                      items:
                          _object.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 185),
          InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Container(
                height: 55,
                width: 345,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color.fromRGBO(248, 55, 88, 1)),
                child: const Text(
                  'Log out',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }
}
