import 'package:coinbase_clone/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainAppContainer extends StatefulWidget {
  const MainAppContainer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainAppContainerState();
}

class _MainAppContainerState extends State<MainAppContainer> {
  int _selectedItemIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardBody(),
    Text(
      '"Ativos" is working!',
    ),
    Text(
      '"Negociar" is working!',
    ),
    Text(
      '"Pagar" is working!',
    ),
  ];

  refreshChild(childIndex) {
    setState(() {
      _selectedItemIndex = childIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(const Icon(Icons.menu), () => {}),
      body: AppBody(child: _widgetOptions.elementAt(_selectedItemIndex)),
      bottomNavigationBar: BottomNavBar(callbackOnUpdate: refreshChild),
    );
  }
}

class TopBar extends AppBar {

  final Icon icon;
  final Function leftIconPressed; 

  TopBar(this.icon, this.leftIconPressed, {Key? key})
      : super(
            key: key,
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            automaticallyImplyLeading: false,
            backgroundColor: ThemeData.light().scaffoldBackgroundColor,
            elevation: 0.0,
            actions: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: IconButton(
                  icon: icon,
                  onPressed: () => leftIconPressed()
                ),
              ),
              const Spacer(),
              Row(children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 245, 248, 254),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: const Color.fromARGB(255, 245, 248, 254)),
                  child: const Text(
                    'Receber 9.0€',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 82, 254),
                        fontWeight: FontWeight.bold),
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

class AppBody extends StatelessWidget {
  final Widget child;

  const AppBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10), child: child);
  }
}

class BottomNavBar extends StatefulWidget {
  final Function callbackOnUpdate;
  const BottomNavBar({Key? key, required this.callbackOnUpdate})
      : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.callbackOnUpdate(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
                    color: Color.fromARGB(255, 180, 180, 180), width: .5))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedItemColor: Colors.black,
          unselectedFontSize: 10,
          selectedFontSize: 10,
          enableFeedback: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Página Inicial',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart_outline),
              label: 'Ativos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart),
              label: 'Negociar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              label: 'Pagar',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 0, 82, 254),
          onTap: _onItemTapped,
        ));
  }
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(MaterialApp(
    theme: ThemeData.light(),
    themeMode: ThemeMode.light,
    home: const MainAppContainer(),
  ));
}
