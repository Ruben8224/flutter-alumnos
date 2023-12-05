import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_one/features/auth/presentation/pages/user_data_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0; // Índice actual para la barra de navegación

  @override
  Widget build(BuildContext context) {
    // Obtén los datos del usuario utilizando Provider
    String userName = Provider.of<UserDataProvider>(context).userName ?? '';
    String userMatricula = Provider.of<UserDataProvider>(context).userMatricula ?? '';
    String userCarrera = Provider.of<UserDataProvider>(context).userCarrera ?? '';

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [Colors.grey, Colors.white],
            ).createShader(bounds);
          },
          child: const Text(
            'Bienvenido',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: _buildBody(currentIndex, userName, userMatricula, userCarrera), // Pasa los datos del usuario
    );
  }

  Widget _buildBody(int index, String userName, String userMatricula, String userCarrera) {
    switch (index) {
      case 0:
        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [Colors.grey, Colors.white],
                  ).createShader(bounds);
                },
                child: Text(
                  'Credencial',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ),
            ),
            // Muestra la credencial sin necesidad de un botón adicional
            _buildCredentialCard(userName, userMatricula, userCarrera),
          ],
        );
      case 1:
        return _buildAccountTab();
      default:
        return const SizedBox.shrink();
    }
  }
  Widget _buildCredentialCard(String userName, String userMatricula, String userCarrera) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Credencial',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Nombre: $userName'),
            ),
            ListTile(
              leading: Icon(Icons.confirmation_number),
              title: Text('Matrícula: $userMatricula'),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Carrera: $userCarrera'),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildAccountTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ... (Otros campos de cuenta)
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Realiza la acción cuando se presiona el botón "Guardar"
              // Puedes guardar los datos del usuario aquí
            },
            child: Text("Guardar"),
          ),
        ],
      ),
    );
  }
}
