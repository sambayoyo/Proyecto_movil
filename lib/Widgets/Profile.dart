import 'package:flutter/material.dart';

class porfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),

        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black, // Fondo negro
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width *
                        0.3, // Ajustar el ancho según el tamaño de la pantalla
                    height: MediaQuery.of(context).size.width *
                        0.3, // Ajustar el alto según el tamaño de la pantalla
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/example_profile.jpg'), // Coloca tu imagen de ejemplo aquí
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add,
                          size: 20), // Icono para cambiar la foto
                      onPressed: () {
                        // Lógica para cargar nueva foto
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Nombre de Usuario',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        // Botones
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.book),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ManualUsuarioScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.security),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConsejosSeguridadScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.logout), // Icono de logout
              onPressed: () {
                // Lógica para cerrar sesión
              },
            ),
          ],
        ),
        SizedBox(height: 20),
        // Opciones
        Column(
          children: <Widget>[
            OptionItem(title: 'Mensajes por Email'),
            OptionItem(title: 'Mensajes por Redes Sociales'),
            OptionItem(title: 'Alerta SMS'),
            SizedBox(height: 20),
            OptionItem(title: 'Automática'),
            OptionItem(title: 'Mensaje por Email'),
            OptionItem(title: 'GPS'),
          ],
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
          Text(widget.title),
          Switch(
            value: _isEnabled,
            activeColor: Color(0xFFEF315D), // Color del botón de encendido
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
              'Mantén tus contraseñas seguras y cambia regularmente.'),
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
        title: Text(texto),
      ),
    );
  }
}
