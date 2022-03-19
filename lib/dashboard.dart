import 'package:coinbase_clone/charts_utils.dart';
import 'package:coinbase_clone/currency_details.dart';
import 'package:coinbase_clone/utils.dart';
import 'package:flutter/material.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BalanceBar(),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(children: [
            const ActionsBar(),
            Container(
                margin: const EdgeInsets.only(top: 30), child: InterestsList())
          ]),
        )
      ],
    );
  }
}

class BalanceBar extends StatelessWidget {
  const BalanceBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          children: [
            Expanded(
                child: Column(
              children: const [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'O seu saldo',
                      style: TextStyle(
                          color: Color.fromARGB(255, 93, 97, 109),
                          fontWeight: FontWeight.bold),
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('••••••••',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 34))),
              ],
            )),
            const Spacer(),
            Container(
                width: 80,
                height: 40,
                margin: const EdgeInsets.only(bottom: 10),
                child: Image.asset('assets/images/Balance_Graph.png'))
          ],
        ));
  }
}

class ActionsBar extends StatelessWidget {
  const ActionsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              const Icon(
                Icons.add_circle,
                color: Color.fromARGB(255, 0, 82, 254),
                size: 45,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text('Comprar'),
              )
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.remove_circle,
                color: Color.fromARGB(255, 0, 82, 254),
                size: 45,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text('Vender'),
              )
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.arrow_circle_left_rounded,
                color: Color.fromARGB(255, 0, 82, 254),
                size: 45,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text('Enviar'),
              )
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.arrow_circle_right_rounded,
                color: Color.fromARGB(255, 0, 82, 254),
                size: 45,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text('Receber'),
              )
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.pending_rounded,
                color: Color.fromARGB(255, 0, 82, 254),
                size: 45,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text('Mais'),
              )
            ],
          ),
        ]);
  }
}

class InterestsList extends StatelessWidget {
  const InterestsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Lista de interesse',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10),
              children: [
                CurrencyListItem(
                  Currency(
                    'Bitcoin',
                    'BTC',
                    35643.82,
                    -3.54,
                    'assets/images/BC_Logo.png',
                    const Color.fromARGB(255, 224, 90, 28))),
                CurrencyListItem(
                  Currency(
                      'Ethereum',
                      'ETH',
                      1643.82,
                      -0.54,
                      'assets/images/ETH_Logo.png',
                      const Color.fromARGB(255, 98, 126, 232)),
                )
              ],
            ),
          ],
        ));
  }
}

class CurrencyListItem extends StatefulWidget {
  final Currency currency;

  const CurrencyListItem(this.currency, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CurrencyListItemState();
}

class _CurrencyListItemState extends State<CurrencyListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        horizontalTitleGap: 20,
        contentPadding: EdgeInsets.zero,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CurrencyDetailsAppContainer(widget.currency)),
          );
        },
        leading: SizedBox(
            width: 35,
            height: 35,
            child: Image.asset(widget.currency.currencyImagePath)),
        title: Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Text(widget.currency.currencyName,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 17))),
        subtitle: Text(widget.currency.currencyAlias,
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
        trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: LineChart(widget.currency.currencyAlias,
                    widget.currency.currencyColor),
                height: 50,
                width: 80,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  widget.currency.currentPrice.toString() + ' €',
                  style: const TextStyle(fontSize: 17),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 2),
                    child: Text(
                      widget.currency.variation.toString() + '%',
                      style: const TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 206, 32, 47)),
                    )),
              ]),
            ]));
  }
}
