import 'package:flutter/material.dart';
import 'package:flutter_agenda/database_helper.dart';

class AgendaPantalla extends StatefulWidget {
  const AgendaPantalla({super.key});

  @override
  State<AgendaPantalla> createState() => _AgendaPantallaState();
}

class _AgendaPantallaState extends State<AgendaPantalla> {
  final textTitulo = TextEditingController();
  final textFecha = TextEditingController();
  final textDetalles = TextEditingController();


Future<void> guardaragenda(BuildContext context) async{
    //ingresamos nuestro primer registro
    Map<String, dynamic> nuevaagenda = {
      'fecha' : textFecha.text, 
      'titulo' : textTitulo.text,
      'detalles' : textDetalles.text,
      
    };
 try {
      // Llamamos al método que acabamos de crear en el Helper
      int idReg = await DatabaseHelper.instance.insertaragenda(nuevaagenda);

if (idReg > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('¡Agenda #$idReg guardada en local!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al guardar evento: $e'),
          backgroundColor: Colors.red,
        ),
      );

    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('AGENDA'),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 50,),

            Text('Nuevo Evento',style: TextStyle(fontWeight: FontWeight.bold),),
        
          SizedBox(height: 50,),
          TextField(
            controller: textFecha,
            readOnly: true,
             decoration: InputDecoration(
              border: OutlineInputBorder(),
            labelText: 'Fecha',
          ),
          onTap: () async{
            DateTime? fecha =await showDatePicker(
              context: context, 
              firstDate: DateTime(2024),
               lastDate: DateTime(2100),
               );
               if (fecha != null) {
                textFecha.text =
                  "${fecha.day}/${fecha.month}/${fecha.year}";
               }
          },
          ),
          SizedBox(height: 50,),
        
          TextField(
            controller: textTitulo,
             decoration: InputDecoration(
               border: OutlineInputBorder(),
            labelText: 'Titulo',
          ),
          ),
           SizedBox(height: 50,),
        
          TextField(
            controller: textDetalles,
             decoration: InputDecoration(
               border: OutlineInputBorder(),
            labelText: 'Detalles',
          ),
          ),
          SizedBox(height: 50,),
        

                 ElevatedButton(
                onPressed: () async {
                  await guardaragenda (context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 54, 131, 194),
                  foregroundColor: Colors.white
                ), 
                child: Icon(Icons.save)),
        
          ],
        ),
      ),
    );
  }
}