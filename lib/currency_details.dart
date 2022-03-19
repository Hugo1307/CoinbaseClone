import 'package:coinbase_clone/charts_utils.dart';
import 'package:coinbase_clone/utils.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class CurrencyDetailsAppContainer extends StatefulWidget {
  final Currency currency;

  const CurrencyDetailsAppContainer(this.currency, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CurrencyDetailsAppContainerState();
}

class _CurrencyDetailsAppContainerState
    extends State<CurrencyDetailsAppContainer> {
  refreshChild(childIndex) {
    setState(() {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          TopBar(const Icon(Icons.arrow_back), () => Navigator.pop(context)),
      body: AppBody(child: CurrencyDetailsWidget(widget.currency)),
    );
  }
}

class CurrencyDetailsWidget extends StatelessWidget {
  final Currency currency;

  const CurrencyDetailsWidget(this.currency, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CurrencyDetailsBar(currency),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: CurrencyDetailsChart(currency)),
            CurrencyDetailsCard(currency)
          ],
        ));
  }
}

class CurrencyDetailsBar extends StatelessWidget {
  final Currency currency;

  const CurrencyDetailsBar(this.currency, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 8),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 3),
                    child: Text(currency.currencyName.toString() + ' preço',
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            color: Color.fromARGB(255, 120, 120, 120)))),
                Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Text(currency.currentPrice.toString() + '€',
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                            color: Colors.black))),
                const Text('- 472,80 € (1,01%)',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color.fromARGB(255, 206, 32, 47)))
              ],
            )
          ],
        ));
  }
}

class CurrencyDetailsChart extends StatelessWidget {
  final Currency currency;

  const CurrencyDetailsChart(this.currency, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: LineChart('Chart1', currency.currencyColor,
          dataSamples: 60, maxDelta: 100),
      height: 300,
    );
  }
}

class CurrencyDetailsCard extends StatelessWidget {
  final Currency currency;

  const CurrencyDetailsCard(this.currency, {Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      splashColor: Colors.grey,
      onTap: () => {},
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
          child: Row(
            children: [
              SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(currency.currencyImagePath)),
              Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Text(
                    currency.currencyName.toString(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  )),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '••••••••',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('••••••••',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          )),
    ));
  }
}
