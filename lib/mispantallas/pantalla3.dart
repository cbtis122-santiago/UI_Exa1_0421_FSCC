import 'package:flutter/material.dart';

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  final List<Map<String, String>> chefs = const [
    {'nombre': 'Chef Carlos R.', 'especialidad': 'Carbón & Brasa', 'rating': '★★★★★'},
    {'nombre': 'Chef María G.', 'especialidad': 'Vegana & Fresca', 'rating': '★★★★☆'},
    {'nombre': 'Chef Luis P.', 'especialidad': 'BBQ Master', 'rating': '★★★★★'},
    {'nombre': 'Chef Ana T.', 'especialidad': 'Quesos & Salsas', 'rating': '★★★★☆'},
    {'nombre': 'Chef Pedro S.', 'especialidad': 'Combos Especiales', 'rating': '★★★★★'},
    {'nombre': 'Chef Rosa M.', 'especialidad': 'Postres & Malteadas', 'rating': '★★★★☆'},
    {'nombre': 'Chef Jorge V.', 'especialidad': 'Doble & Triple', 'rating': '★★★★★'},
    {'nombre': 'Chef Diana L.', 'especialidad': 'Ensaladas & Aros', 'rating': '★★★★☆'},
    {'nombre': 'Chef Marco F.', 'especialidad': 'Picantes & Extras', 'rating': '★★★★★'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D0000),
        title: const Text(
          'Nuestros Chefs',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Filtrar chefs...')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Compartir...')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.75,
              ),
              itemCount: chefs.length,
              itemBuilder: (context, index) {
                final chef = chefs[index];
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFF3D0000)),
                  ),
                  child: Column(
                    children: [
                      // Icono de persona
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xFF3D0000),
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10)),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Color(0xFFFF6F00),
                            size: 45,
                          ),
                        ),
                      ),
                      // Info del chef
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                chef['nombre']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                chef['especialidad']!,
                                style: const TextStyle(
                                    color: Colors.white54, fontSize: 8),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                chef['rating']!,
                                style: const TextStyle(
                                    color: Color(0xFFFF6F00), fontSize: 8),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Botón Regresar
          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFFB71C1C)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('← Regresar', style: TextStyle(fontSize: 15)),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1A1A1A),
        selectedItemColor: const Color(0xFFB71C1C),
        unselectedItemColor: Colors.white38,
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, '/');
          if (index == 1) Navigator.pushNamed(context, '/menu');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Talk'),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quiz'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Menú'),
        ],
      ),
    );
  }
}