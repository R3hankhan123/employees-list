import 'package:flutter/material.dart';
import 'package:myq/model/employees.dart';
import 'package:myq/model/fetch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static Color TxtColor1 = Colors.black;
  static Color TxtColor2 = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Employees>>(
        future: Fetch().fetchEmployees(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Employees>? data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      data[index].name,
                      style: TextStyle(
                          color: int.parse(data[index].years) >= 5
                              ? TxtColor2
                              : TxtColor1,
                          fontSize: 20),
                    ),
                    subtitle: Text(
                      data[index].designation,
                      style: TextStyle(
                          color: int.parse(data[index].years) >= 5
                              ? TxtColor2
                              : TxtColor1,
                          fontSize: 18),
                    ),
                    trailing: Text(
                      data[index].years,
                      style: TextStyle(
                          color: int.parse(data[index].years) >= 5
                              ? TxtColor2
                              : TxtColor1,
                          fontSize: 20),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
