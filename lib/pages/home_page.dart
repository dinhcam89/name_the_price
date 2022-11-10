import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductInfo{
  final String name;
  final int price;

  ProductInfo(this.name, this.price);
}

final products = [
  ProductInfo('Mouse', 500),
  ProductInfo('Keyboard', 800),
  ProductInfo('Screen', 4500),
  ProductInfo('Mouse Pad', 50),
  ProductInfo('Ear Phone', 200),
];




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) :super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentProductIndex = 0;
  int? _inputtedPrice;
  String _result = '';
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 180)),
            Text(products[_currentProductIndex].name),
            const Padding(padding: EdgeInsets.only(top: 38)),
            SizedBox(
              width: 200,
              child: TextField(
                key: const Key('priceInput'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  _inputtedPrice = int.tryParse(value);
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 38)),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _result = 
                    _inputtedPrice == products[_currentProductIndex].price
                      ? 'pass'
                      : 'fail';


                  // if(_currentProductIndex < 4)
                  // {
                  //   _currentProductIndex++;
                  // }
                });
              }, 
              child: const Text('Check'),
              ),
              Visibility(
                visible: _result.isNotEmpty,
                child: Text(
                  _result, 
                  key: const Key('result')
                ),
              ),
              Visibility(
                visible: _result.isNotEmpty,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _result = ''; 
                      if(_currentProductIndex < 4)
                      {
                        _currentProductIndex++;
                      }
                    });
                  }, 
                  child: const Text('Next'),
                  ),
              )
          ],
        ),
      ),
    );
  }
}


