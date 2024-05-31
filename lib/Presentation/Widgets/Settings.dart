import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/Widgets/OptionsManager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginpage.dart';
import 'setting_cont/contacts.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Material(
                  color: Color(0xFF101010),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(250),
                    bottomRight: Radius.circular(250),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 35),
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: _image != null
                                        ? FileImage(_image!)
                                        : AssetImage(
                                                'assets/images/cliente.png')
                                            as ImageProvider,
                                    backgroundColor: Colors.grey,
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Color(0xFFEF315D),
                                    child: IconButton(
                                      icon: Icon(Icons.add_a_photo,
                                          color: Colors.white, size: 24),
                                      onPressed: _pickImage,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Title(
                                color: Color(0xFFEF315D),
                                child: Text(
                                  'User Name',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFFEF315D),
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 24),
                            Icon(Icons.star, color: Colors.yellow, size: 24),
                            Icon(Icons.star, color: Colors.yellow, size: 24),
                            Icon(Icons.star, color: Colors.yellow, size: 24),
                            Icon(Icons.star, color: Colors.yellow, size: 24),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                // Botones
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildIconButton(Icons.book, 'Manual', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ManualUsuarioScreen()));
                    }),
                    _buildIconButton(Icons.security, 'Seguridad', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConsejosSeguridadScreen()));
                    }),
                    _buildIconButton(Icons.contact_phone, 'Contactos', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactosEScreen()));
                    }),
                    _buildIconButton(Icons.logout, 'Salir', () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.remove('emergency_contacts');
                      await prefs.remove('userData');

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }),
                  ],
                ),
                SizedBox(height: 40),
                // Opciones
                Column(
                  children: <Widget>[
                    OptionItem(title: 'SMS Email'),
                    OptionItem(title: 'SMS Redes Sociales'),
                    OptionItem(title: 'Alerta SMS'),
                    OptionItem(title: 'Automática'),
                    OptionItem(title: 'GPS'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String text, Function()? onPressed) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 40),
          onPressed: onPressed,
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

Widget _buildIconButton(IconData icon, String text, Function()? onPressed) {
  return Column(
    children: [
      IconButton(
        icon: Icon(icon, size: 40),
        onPressed: onPressed,
      ),
      SizedBox(height: 10),
      Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    ],
  );
}

class ManualUsuarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manual de Usuario'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _buildConsejo(
              '¡Bienvenido al manual de usuario de nuestra aplicación!'),
          _buildConsejo(
              'Esta aplicación te proporciona herramientas para mantener tu seguridad y comunicación en línea.'),
          _buildConsejo('Funcionalidades principales:'),
          _buildConsejo(
              '- Mensajes por Email: Envía mensajes a través de correo electrónico.'),
          _buildConsejo(
              '- SMS Redes Sociales: Envía mensajes a través de SMS o redes sociales.'),
          _buildConsejo(
              '- Alerta SMS: Recibe alertas importantes a través de SMS.'),
          _buildConsejo(
              '- Automática: Configura opciones de comunicación automáticas.'),
          _buildConsejo(
              '- Mensaje por Email: Configura mensajes automáticos por correo electrónico.'),
          _buildConsejo(
              '- GPS: Utiliza el GPS para compartir tu ubicación con amigos o familiares.'),
          _buildConsejo(
              '¡Disfruta de todas las funcionalidades y mantente seguro en línea!'),
        ],
      ),
    );
  }

  Widget _buildConsejo(String texto) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          texto,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class ConsejosSeguridadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consejos de Seguridad'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _buildConsejo(
              'Mantén tus contraseñas seguras y cámbialas regularmente.'),
          _buildConsejo(
              'No compartas información personal en redes sociales públicas.'),
          _buildConsejo('Actualiza tu software y antivirus regularmente.'),
          _buildConsejo(
              'Ten cuidado al hacer clic en enlaces o adjuntos de correos electrónicos desconocidos.'),
          _buildConsejo(
              'Protege tus dispositivos con contraseñas o biometría.'),
          _buildConsejo(
              'Evita conectarte a redes Wi-Fi públicas sin protección.'),
          _buildConsejo(
              'Sé cauteloso al compartir detalles financieros en línea.'),
          _buildConsejo(
              'Verifica la autenticidad de las páginas web antes de ingresar informaciónconfidencial.'),
          _buildConsejo(
              'No reveles información sensible por teléfono a menos que estés seguro de quién está al otro lado.'),
          _buildConsejo(
              'Mantén tus dispositivos físicamente seguros y no los pierdas de vista en lugares públicos.'),
        ],
      ),
    );
  }

  Widget _buildConsejo(String texto) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          texto,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class _UserNameWidget extends StatefulWidget {
  @override
  __UserNameWidgetState createState() => __UserNameWidgetState();
}

class __UserNameWidgetState extends State<_UserNameWidget> {
  String _username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? 'Nombre de Usuario';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _username,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFFEF315D),
      ),
    );
  }
}
