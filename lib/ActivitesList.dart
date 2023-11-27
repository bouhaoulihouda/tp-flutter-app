import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Activite.dart';
import 'ActiviteDetailPage.dart';

class ActivitesList extends StatefulWidget {
  const ActivitesList({super.key});

  @override
  State<ActivitesList> createState() => _ActivitesListState();
}

class _ActivitesListState extends State<ActivitesList> {
  late List<String> categories;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('activities').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Erreur : ${snapshot.error}'));
        }

        // Collecter les catégories uniques depuis Firestore
        categories = ['Toutes']; // Initialiser avec 'Toutes'
        categories.addAll(Set<String>.from(snapshot.data!.docs.map((doc) => doc['category'] as String)));

        return _construireBarreOngletsCategories(snapshot.data!.docs);
      },
    );
  }

  Widget _construireBarreOngletsCategories(List<QueryDocumentSnapshot<Object?>> documents) {
    return DefaultTabController(
      length: categories.length,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBar(
              isScrollable: true,
              labelColor: Color(0xFFE5D4FF),
              unselectedLabelColor: Colors.grey,
              tabs: _construireOngletsBarre(),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: _construireVuesBarreOnglets(documents),
            ),
          ),
        ],
      ),
    );
  }

  List<Tab> _construireOngletsBarre() {
    return categories.map((String category) {
      return Tab(
        text: category,
      );
    }).toList();
  }

  List<Widget> _construireVuesBarreOnglets(List<QueryDocumentSnapshot<Object?>> documents) {
    return categories.map((String category) {
      List<Activite> activitesFiltrees = documents
          .where((doc) => category == 'Toutes' ? true : doc['category'] == category)
          .map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Activite(
          title: data['title'],
          location: data['location'],
          price: data['price'].toDouble(),
          imageUrl: data['imageUrl'],
          category: data['category'],
          minParticipants: data['minParticipants'],
        );
      }).toList();

      Widget _construireImageActivite(String? imageUrl) {
        if (imageUrl != null && imageUrl.isNotEmpty) {
          // S'il y a une URL d'image pour l'activité, utilisez Image.network
          return Image.network(
            imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          );
        } else {
          // Image de secours ou icône par défaut
          return Icon(Icons.image, size: 60);
        }
      }

      return ListView.builder(
        itemCount: activitesFiltrees.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5.0,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: _construireImageActivite(activitesFiltrees[index].imageUrl),
              title: Text(activitesFiltrees[index].title),
              subtitle: Text(
                '${activitesFiltrees[index].location} - ${activitesFiltrees[index].price} €',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ActiviteDetailPage(activite: activitesFiltrees[index]),
                  ),
                );
              },
            ),
          );
        },
      );
    }).toList();
  }
}
