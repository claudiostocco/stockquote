import 'package:flutter/material.dart';
import 'package:show_graph/constants/global.dart';
import 'package:show_graph/controllers/home_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = HomeController();
  int index = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
    print('initState');
    controller.getTickers();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listViews() {
      return controller.tickersList.map<Widget>((e) => Text(e.ticker)).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(kTitle),
        actions: [
          IconButton(
            onPressed: () => setState(() {
              controller.getTickers();
            }),
            icon: const Icon(Icons.abc),
          ),
        ],
      ),
      body: Center(
        child: controller.isLoading
            ? const CircularProgressIndicator()
            : Column(
                children: listViews(),
              ),
      ),
    );
  }
}
