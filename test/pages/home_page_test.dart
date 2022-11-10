import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:name_the_price/pages/home_page.dart';

void main() {
  group('Home page test', () {

    Finder checkBtt() => find.text('Check');
    Finder nextBt() => find.text('Next');
    Finder priceInput() => find.byKey(const Key('priceInput'));


    testWidgets(
      'Change product name after each click',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: HomePage(),
        ));

        expect(find.text(products[0].name), findsOneWidget);

        for (int i = 1; i < 5; i++) {
          await tester.tap(checkBtt());
          await tester.enterText(priceInput(), '0');
          await tester.pump();
          await tester.tap(nextBt());
          await tester.pump();
          expect(find.text(products[i].name), findsOneWidget);
        }

        await tester.tap(checkBtt());
        await tester.pump();
        await tester.tap(nextBt());
        await tester.pump();
        expect(find.text(products[4].name), findsOneWidget);
      },
    );

    testWidgets('Check result and next product', 
    (WidgetTester tester) async { 
      await tester.pumpWidget(const MaterialApp(
          home: HomePage(),
        ));

      expect(nextBt(), findsNothing);
      expect(find.byKey(const Key('result')), findsNothing);
      await tester.enterText(priceInput(), '500');
      await tester.tap(checkBtt());
      await tester.pump();
      expect(nextBt(), findsOneWidget);
      expect(find.byKey(const Key('result')), findsOneWidget);
      expect(find.text('pass'), findsOneWidget);

      await tester.tap(nextBt());
      await tester.pump();

      expect(nextBt(), findsNothing);
      expect(find.byKey(const Key('result')), findsNothing);
      await tester.enterText(priceInput(), '600');
      await tester.tap(checkBtt());
      await tester.pump();
      expect(nextBt(), findsOneWidget);
      expect(find.byKey(const Key('result')), findsOneWidget);
      expect(find.text('fail'), findsOneWidget);


      await tester.enterText(priceInput(), '800');
      await tester.tap(checkBtt());
      await tester.pump();
      expect(find.text('pass'), findsOneWidget);

    });
  });
}
