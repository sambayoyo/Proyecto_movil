import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactosEScreen extends StatefulWidget {
  @override
  _ContactosEScreenState createState() => _ContactosEScreenState();
}

class _ContactosEScreenState extends State<ContactosEScreen> {
  List<Map<String, String>> _emergencyContacts = [];

  @override
  void initState() {
    super.initState();
    _loadEmergencyContacts();
  }

  Future<void> _loadEmergencyContacts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? contacts = prefs.getStringList('emergency_contacts');
    if (contacts != null) {
      setState(() {
        _emergencyContacts = contacts.map((contact) {
          final parts = contact.split(':');
          return {'name': parts[0], 'phoneNumber': parts[1], 'email': parts[2]};
        }).toList();
      });
    }
  }

  Future<void> _addEmergencyContact(
      String name, String phoneNumber, String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final newContact = {
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email
    };
    _emergencyContacts.add(newContact);
    final List<String> contacts = _emergencyContacts
        .map((contact) =>
            '${contact['name']}:${contact['phoneNumber']}:${contact['email']}')
        .toList();
    await prefs.setStringList('emergency_contacts', contacts);
    setState(() {});
  }

  Future<void> _deleteEmergencyContact(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _emergencyContacts.removeAt(index);
    final List<String> contacts = _emergencyContacts
        .map((contact) =>
            '${contact['name']}:${contact['phoneNumber']}:${contact['email']}')
        .toList();
    await prefs.setStringList('emergency_contacts', contacts);
    setState(() {});
  }

  Future<void> _editEmergencyContact(
      int index, String newName, String newPhoneNumber, String newEmail) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final editedContact = {
      'name': newName,
      'phoneNumber': newPhoneNumber,
      'email': newEmail
    };
    _emergencyContacts[index] = editedContact;
    final List<String> contacts = _emergencyContacts
        .map((contact) =>
            '${contact['name']}:${contact['phoneNumber']}:${contact['email']}')
        .toList();
    await prefs.setStringList('emergency_contacts', contacts);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Contactos de emergencia'),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final contact = _emergencyContacts[index];
                return Dismissible(
                  key: Key(contact['name'] ?? ''),
                  child: ListTile(
                    title: Text(contact['name'] ?? ''),
                    subtitle: Text(contact['phoneNumber'] ?? ''),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _showEditContactDialog(
                                context,
                                index,
                                contact['name'] ?? '',
                                contact['phoneNumber'] ?? '',
                                contact['email'] ?? '');
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteEmergencyContact(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: _emergencyContacts.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddContactDialog(context),
        label: Text('Agregar contacto'),
        icon: Icon(Icons.add),
        backgroundColor: Color(0xFFEF315D),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _showAddContactDialog(BuildContext context) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Agregar Contacto de Emergencia'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(labelText: 'Número de Teléfono'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Correo Electrónico'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                _addEmergencyContact(nameController.text,
                    phoneNumberController.text, emailController.text);
                Navigator.of(context).pop();
              },
              child: Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showEditContactDialog(BuildContext context, int index,
      String name, String phoneNumber, String email) async {
    TextEditingController nameController = TextEditingController(text: name);
    TextEditingController phoneNumberController =
        TextEditingController(text: phoneNumber);
    TextEditingController emailController = TextEditingController(text: email);

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Contacto de Emergencia'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(labelText: 'Número de Teléfono'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Correo Electrónico'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                _editEmergencyContact(index, nameController.text,
                    phoneNumberController.text, emailController.text);
                Navigator.of(context).pop();
              },
              child: Text('Actualizar'),
            ),
          ],
        );
      },
    );
  }
}
