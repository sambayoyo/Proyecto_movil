import 'package:flutter/material.dart';
import 'loginpage.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context)
              .size
              .width, // Ajustar el ancho según el tamaño de la pantalla
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
                        CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage('assets/images/cliente.png'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Nombre de Usuario',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFEF315D)),
                        ),
                        SizedBox(height: 10),
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
                    _buildIconButton(Icons.logout, 'Salir', () {
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
                    OptionItem(title: 'SMS Email'),
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

class OptionItem extends StatefulWidget {
  final String title;

  OptionItem({required this.title});

  @override
  _OptionItemState createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(fontSize: 20),
          ),
          Switch(
            value: _isEnabled,
            activeColor: Color(0xFFEF315D),
            onChanged: (value) {
              setState(() {
                _isEnabled = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class ManualUsuarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manual de Usuario'),
      ),
      body: Center(
        child: Text(
          '¡Bienvenido al manual de usuario de nuestra aplicación!\n\n'
          'Esta aplicación te proporciona herramientas para mantener tu '
          'seguridad y comunicación en línea.\n\n'
          'Funcionalidades principales:\n\n'
          '- Mensajes por Email: Envía mensajes a través de correo electrónico.\n'
          '- SMS Redes Sociales: Envía mensajes a través de SMS o redes sociales.\n'
          '- Alerta SMS: Recibe alertas importantes a través de SMS.\n'
          '- Automática: Configura opciones de comunicación automáticas.\n'
          '- Mensaje por Email: Configura mensajes automáticos por correo electrónico.\n'
          '- GPS: Utiliza el GPS para compartir tu ubicación con amigos o familiares.\n\n'
          '¡Disfruta de todas las funcionalidades y mantente seguro en línea!',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class ContactosEScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contactos de emergencia'),
      ),
      body: Center(
        child: Text(
          '¡Registra, edita y elimina contactos de emergencia\n'
          '\t\t0/5',
          style: TextStyle(fontSize: 16),
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
              'Verifica la autenticidad de las páginas web antes de ingresar información confidencial.'),
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
