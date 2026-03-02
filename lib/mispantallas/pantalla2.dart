import 'package:flutter/material.dart';

class Pantalla2 extends StatefulWidget {
  const Pantalla2({super.key});

  @override
  State<Pantalla2> createState() => _Pantalla2State();
}

class _Pantalla2State extends State<Pantalla2> {
  final Map<String, bool> opciones = {
    'Carne & Pollo': false,
    'Transporte gratis': false,
    'Vegana': false,
    'Para llevar': false,
    'Ultra Queso': false,
    'Combos': false,
  };

  final List<Map<String, String>> chefs = const [
    {
      'nombre': 'Chef Carlos',
      'info': 'Especialista en carbón\n★★★★★',
      'imagen': 'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/hcarbon.jfif',
    },
    {
      'nombre': 'Chef María',
      'info': 'Repostera & Vegana\n★★★★☆',
      'imagen': 'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/hdoblefuego.jfif',
    },
    {
      'nombre': 'Chef Luis',
      'info': 'BBQ Master\n★★★★★',
      'imagen': 'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/hbbqmaster.jfif',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6F00),
        title: const Text(
          'Personaliza tu Orden',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            const Text(
              'Antes de continuar...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Selecciona las categorías de tu preferencia para personalizar tu experiencia AlaBurger.',
              style: TextStyle(color: Colors.white54, fontSize: 13),
            ),
            const SizedBox(height: 20),

            // Checkboxes en 2 columnas
            const Text(
              'Categorías',
              style: TextStyle(
                  color: Color(0xFFFF6F00),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 4,
              children: opciones.keys.map((opcion) {
                return Row(
                  children: [
                    Checkbox(
                      value: opciones[opcion],
                      activeColor: const Color(0xFFB71C1C),
                      checkColor: Colors.white,
                      side: const BorderSide(color: Colors.white38),
                      onChanged: (val) {
                        setState(() => opciones[opcion] = val!);
                      },
                    ),
                    Flexible(
                      child: Text(
                        opcion,
                        style: const TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            // Botón Let's Go
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB71C1C),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () => Navigator.pushNamed(context, '/contacto'),
                child: const Text(
                  '¡Ordenar ahora!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 28),

            // Browse Chefs
            const Text(
              'Nuestros Chefs',
              style: TextStyle(
                  color: Color(0xFFFF6F00),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Conoce a los maestros del carbón que preparan tu hamburguesa.',
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            const SizedBox(height: 12),

            // Row de chefs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: chefs.map((chef) {
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2C2C),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFF3D0000)),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            chef['imagen']!,
                            height: 60,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (c, e, s) => Container(
                              height: 60,
                              color: const Color(0xFF3D0000),
                              child: const Icon(Icons.person,
                                  color: Color(0xFFFF6F00), size: 30),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          chef['nombre']!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          chef['info']!,
                          style: const TextStyle(
                              color: Colors.white54, fontSize: 9),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // See more
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFFF6F00),
                  side: const BorderSide(color: Color(0xFFFF6F00)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () => Navigator.pushNamed(context, '/contacto'),
                child: const Text('Ver más chefs'),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1A1A1A),
        selectedItemColor: const Color(0xFFFF6F00),
        unselectedItemColor: Colors.white38,
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, '/');
          if (index == 2) Navigator.pushNamed(context, '/contacto');
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