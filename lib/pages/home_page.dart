import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 180)),
            const Text('G102 Mouse'),
            const Padding(padding: EdgeInsets.only(top: 38)),
            SizedBox(
              width: 200,
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 38)),
            ElevatedButton(
              onPressed: () {}, 
              child: const Text('check box')
              )
          ],
        ),
      ),
    );
  }
}
