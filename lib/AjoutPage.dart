import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class AjoutPage extends StatefulWidget {
  @override
  _AjoutPageState createState() => _AjoutPageState();
}

class _AjoutPageState extends State<AjoutPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController minParticipantsController = TextEditingController();

  BuildContext? get context => null;

  String _predictedCategory = '';

  Future<void> classifyImage(String imageUrl) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:5000/predict'),
        body: jsonEncode({'image_url': imageUrl}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final predictedCategory = json['class'];
        setState(() {
          _predictedCategory = predictedCategory;
          categoryController.text = _predictedCategory;
        });
      } else {
        print('Error classifying image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error classifying image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Activity'),
        backgroundColor: Color(0xFFD0A2F7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField(titleController, 'Title'),
            buildTextField(locationController, 'Location'),
            buildTextField(priceController, 'Price', keyboardType: TextInputType.number),
            buildTextField(imageUrlController, 'Image URL'),
            buildTextField(categoryController, 'Category', enabled: false),
            buildTextField(minParticipantsController, 'Min Participants', keyboardType: TextInputType.number),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                saveActivity();
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE5D4FF),
              ),
              child: Text('Save Activity', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      TextEditingController controller,
      String label, {
        TextInputType keyboardType = TextInputType.text,
        bool enabled = true,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: label,
          hintText: 'Enter $label',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Color(0xFFFEFAE0),
        ),
        enabled: enabled,
      ),
    );
  }

  void saveActivity() async {
    await classifyImage(imageUrlController.text);

    await FirebaseFirestore.instance.collection('activities').add({
      'title': titleController.text,
      'location': locationController.text,
      'price': double.parse(priceController.text),
      'imageUrl': imageUrlController.text,
      'category': _predictedCategory,
      'minParticipants': int.parse(minParticipantsController.text),
    });

    titleController.clear();
    locationController.clear();
    priceController.clear();
    imageUrlController.clear();
    categoryController.clear();
    minParticipantsController.clear();

    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        content: Text('Activity added successfully!'),
        backgroundColor: Color(0xFFE5D4FF),
      ),
    );
  }
}
