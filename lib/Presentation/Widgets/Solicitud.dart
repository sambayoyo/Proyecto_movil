import 'package:flutter/material.dart';

class SolicitudPage extends StatefulWidget {
  @override
  _SolicitudPageState createState() => _SolicitudPageState();
}

class _SolicitudPageState extends State<SolicitudPage> {
  final TextEditingController descripcionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController tarifaController = TextEditingController();
  List<String> pedidos = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  void _solicitarPedido() {
    String solicitud = "Descripción: ${descripcionController.text}\n"
        "Fecha: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}\n"
        "Hora: ${selectedTime.hour}:${selectedTime.minute}\n"
        "Tarifa de Servicio: ${tarifaController.text}";

    setState(() {
      pedidos.add(solicitud);
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PedidosPage(pedidos)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Solicitud'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: descripcionController,
              maxLength: 150,
              decoration: InputDecoration(
                labelText: 'Descripción (máx. 150 caracteres)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Fecha: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  ),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    'Seleccionar Fecha',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Hora: ${selectedTime.hour}:${selectedTime.minute}',
                  ),
                ),
                TextButton(
                  onPressed: () => _selectTime(context),
                  child: Text(
                    'Seleccionar Hora',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: tarifaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tarifa de Servicio',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _solicitarPedido,
              child: Text(
                'Solicitar',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PedidosPage extends StatelessWidget {
  final List<String> pedidos;

  PedidosPage(this.pedidos);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
      ),
      body: ListView.builder(
        itemCount: pedidos.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(pedidos[index]),
            ),
          );
        },
      ),
    );
  }
}
