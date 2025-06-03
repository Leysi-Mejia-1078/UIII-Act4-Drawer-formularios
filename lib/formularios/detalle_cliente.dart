import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details({
    Key? key,
    required this.clienteId,
    required this.clienteName,
    required this.clienteApellidos,
    required this.clienteDireccion,
    required this.clienteTelefono,
    required this.clienteCorreo,
    required this.clienteMembresia,
  }) : super(key: key);

  final String clienteId;
  final String clienteName;
  final String clienteApellidos;
  final String clienteDireccion;
  final String clienteTelefono;
  final String clienteCorreo;
  final String clienteMembresia;

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(vertical: -2),
      contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0),
      leading: Icon(icon, color: Color.fromARGB(255, 131, 83, 215), size: 20.0),
      title: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12.0,
          color: Colors.grey,
        ),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.black87,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Detalles Cliente",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 152, 124, 229),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.all(12.0),
        child: Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Nombre del cliente
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.person_rounded, color: Color.fromARGB(255, 141, 52, 200), size: 28.0),
                  title: Text(
                    clienteName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                const Divider(),

                // Detalles del cliente
                _buildDetailRow(Icons.map_rounded, 'Apellidos:', clienteApellidos),
                _buildDetailRow(Icons.badge_rounded, 'ID Cliente:', clienteId),
                _buildDetailRow(Icons.location_on_rounded, 'Dirección:', clienteDireccion),
                _buildDetailRow(Icons.call_rounded, 'Teléfono:', clienteTelefono),
                _buildDetailRow(Icons.alternate_email_rounded, 'Correo:', clienteCorreo),
                _buildDetailRow(Icons.card_membership_rounded, 'Membresía:', clienteMembresia),

                const SizedBox(height: 12.0),

                // Botón eliminar
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      print('Delete button pressed');
                    },
                    icon: const Icon(Icons.delete_forever_rounded, color: Colors.white),
                    label: const Text(
                      'Eliminar Cliente',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 67, 20, 92),
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 2.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
