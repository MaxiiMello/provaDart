import 'package:flutter/material.dart';

class paginaPrincipal extends StatefulWidget {
  @override
  paginaPrincipalState createState() => paginaPrincipalState();
}

class paginaPrincipalState extends State<paginaPrincipal> {
  final TextEditingController tarefaController = TextEditingController();

  List<Map<String, String>> items = [];

  void addItem() {
    if (tarefaController.text.isEmpty) return;

    setState(() {
      items.add({
        "title": tarefaController.text,
      });
    });

    tarefaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Tarefas")),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: tarefaController,
                    decoration: InputDecoration(
                      labelText: "Tarefa",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: addItem,
                    child: Text("Agregar"),
                  )
                ],
              ),
            ),
          ),

          VerticalDivider(width: 1),

          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]["title"]!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
