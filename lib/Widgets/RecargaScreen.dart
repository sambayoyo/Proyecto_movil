import 'package:flutter/material.dart';
import 'dart:math';

class RecargaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recargar'),
      ),
      body: Container(
        color: Color.fromARGB(255, 178, 209, 216), // Fondo azul claro
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Recargue de forma segura y sencilla  ',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Text(
                'Seleccione el método de recarga que prefiera:',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: () {
                  _mostrarDialogoRecargaTarjeta(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                child: Column(
                  children: [
                    Icon(Icons.credit_card, size: 40.0),
                    SizedBox(height: 10.0),
                    Text('Recargar con tarjeta',
                        style: TextStyle(fontSize: 18.0)),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _generarNumeroAleatorio(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                child: Column(
                  children: [
                    Icon(Icons.money, size: 40.0),
                    SizedBox(height: 10.0),
                    Text('Recargar en efectivo',
                        style: TextStyle(fontSize: 18.0)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarDialogoRecargaTarjeta(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Recargar con tarjeta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Para recargar con tarjeta, por favor ingrese los siguientes detalles:',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Apellido'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Número de tarjeta'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Valor a recargar'),
                keyboardType: TextInputType.number,
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
                // Aquí podrías procesar la recarga con tarjeta
                // Por ahora, solo cerramos el diálogo
                Navigator.of(context).pop();
              },
              child: Text('Recargar'),
            ),
          ],
        );
      },
    );
  }

  void _generarNumeroAleatorio(BuildContext context) {
    // Genera un número aleatorio de 5 dígitos
    Random random = Random();
    int numeroAleatorio = random.nextInt(90000) + 10000;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Recarga en efectivo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Diríjase a la sucursal más cercana y proporcione el siguiente código para realizar la recarga en efectivo:',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10),
              Text(
                '$numeroAleatorio',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
