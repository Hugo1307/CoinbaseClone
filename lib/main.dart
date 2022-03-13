import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: const DashboardBody(),
    );
  }
}

class TopBar extends AppBar {
  TopBar({Key? key}) : super(
    key: key,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    backgroundColor: ThemeData.light().scaffoldBackgroundColor,
    elevation: 0.0,
    actions: [
      Container(
        margin: const EdgeInsets.only(left: 10),
        child: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => {},
        ),
      ),
      const Spacer(),
      Row(children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255,245,248,254),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: const Color.fromARGB(255,245,248,254)
            ),
          child: const Text(
            'Receber 9.0€', 
            style: TextStyle(
              color: Color.fromARGB(255, 0, 96, 246),
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => {},
          ),
        )
      ])
    ]);
}

class BalanceBar extends StatelessWidget {
  
  const BalanceBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          children: [
            Column(
              children: const [
                Text(
                    'O seu saldo',
                    style: TextStyle(
                      color: Color.fromARGB(255, 93, 97, 109),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                Text(
                  '••••••••',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 32
                  )
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: 80,
              height: 40,
              margin: const EdgeInsets.only(bottom: 10),
              child: Image.asset('assets/images/Balance_Graph.png')
            )
            
          ],
        ));
  }


}

class DashboardBody extends StatelessWidget {
  
  const DashboardBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: const [BalanceBar()],
        )
      );
  }
  
}

void main() {

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(MaterialApp(
    theme: ThemeData.light(),
    themeMode: ThemeMode.light,
    home: const Dashboard(),
  ));

}
