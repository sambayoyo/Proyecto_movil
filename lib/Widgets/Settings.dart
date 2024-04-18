import 'package:flutter/material.dart';
import 'loginpage.dart'; 

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/LoginPage': (context) => LoginPage(), // Registra la ruta de LoginPage
      },
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context)
              .size
              .width, // Ajustar el ancho según el tamaño de la pantalla
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 20),
                // Foto de perfil
                Material(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage('assets/example_profile.jpg'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Nombre de Usuario',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    _buildIconButton(Icons.logout, 'Cerrar Sesión', () {
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
        child: Text('Aquí va el contenido del manual de usuario'),
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