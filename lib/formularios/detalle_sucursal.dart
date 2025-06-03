import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details({
    Key? key,
    required this.sucursalId,
    required this.sucursalName,
    required this.sucursalDescription,
    required this.sucursalTel,
    required this.sucursalCorreo,
    required this.sucursalHora,
    required this.sucursalEmp,
  }) : super(key: key);

  final String sucursalId;
  final String sucursalName;
  final String sucursalDescription;
  final String sucursalTel;
  final String sucursalCorreo;
  final String sucursalHora;
  final String sucursalEmp;

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(vertical: -2),
      contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0),
      leading: Icon(icon, color: Color.fromARGB(255, 132, 95, 196), size: 20.0),
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
          "Detalles Sucursal",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 153, 133, 207),
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
                // Nombre de la sucursal
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.storefront_rounded, color: Color.fromARGB(255, 155, 95, 212), size: 28.0),
                  title: Text(
                    sucursalName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                const Divider(),
                // Detalles
                _buildDetailRow(Icons.map_rounded, 'Dirección:', sucursalDescription),
                _buildDetailRow(Icons.badge_rounded, 'ID Sucursal:', sucursalId),
                _buildDetailRow(Icons.call_rounded, 'Teléfono:', sucursalTel),
                _buildDetailRow(Icons.alternate_email_rounded, 'Correo:', sucursalCorreo),
                _buildDetailRow(Icons.schedule_rounded, 'Horario de atención:', sucursalHora),
                _buildDetailRow(Icons.supervisor_account_rounded, 'Encargado:', sucursalEmp),
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
                      'Eliminar Sucursal',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 91, 28, 114),
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
