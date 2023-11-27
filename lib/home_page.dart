import 'package:flutter/material.dart';
import 'ActivitesList.dart';
import 'AjoutPage.dart';
import 'ProfilPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activités'),
        backgroundColor: Color(0xFFD0A2F7), // Couleur d'arrière-plan de l'app Bar
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Activités',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Ajouter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        selectedItemColor: Color(0xFFE5D4FF), // Couleur de l'élément sélectionné dans la barre de navigation
      ),
    );
  }

  Widget _buildBody() {
    if (_currentIndex == 0) {
      return ActivitesList();
    } else if (_currentIndex == 1) {
      return AjoutPage();
    } else {
      return ProfilPage();
    }
  }
}
