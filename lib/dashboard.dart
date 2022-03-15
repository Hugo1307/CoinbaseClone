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
          child: const ActionsBar(),
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
