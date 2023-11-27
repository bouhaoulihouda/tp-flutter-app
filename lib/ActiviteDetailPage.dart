import 'package:flutter/material.dart';
import 'Activite.dart';

class ActiviteDetailPage extends StatelessWidget {
  final Activite activite;

  ActiviteDetailPage({required this.activite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de l\'activité'),
        backgroundColor: Color(0xFFF1EAFF),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              activite.imageUrl,
              fit: BoxFit.cover,
              height: 300.0,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activite.title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE5D4FF),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('Catégorie: ${activite.category}', style: TextStyle(color: Color(0xFFDCBFFF))),
                  SizedBox(height: 8.0),
                  Text('Lieu: ${activite.location}', style: TextStyle(color: Color(0xFFDCBFFF))),
                  SizedBox(height: 8.0),
                  Text('Participants Min: ${activite.minParticipants}', style: TextStyle(color: Color(0xFFDCBFFF))),
                  SizedBox(height: 8.0),
                  Text('Prix: ${activite.price} €', style: TextStyle(color: Color(0xFFDCBFFF))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
