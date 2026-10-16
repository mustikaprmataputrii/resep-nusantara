import 'package:flutter/material.dart';

void main() => runApp(const ResepNusantaraApp());

class Recipe {
  const Recipe({
    required this.id,
    required this.name,
    required this.region,
    required this.category,
    required this.duration,
    required this.difficulty,
    required this.rating,
    required this.emoji,
    required this.color,
    required this.description,
    required this.ingredients,
    required this.steps,
  });

  final String id;
  final String name;
  final String region;
  final String category;
  final String duration;
  final String difficulty;
  final double rating;
  final String emoji;
  final Color color;
  final String description;
  final List<String> ingredients;
  final List<String> steps;
}

// Sumber data lokal sengaja dipisahkan dari widget agar mudah diganti API.
const recipes = <Recipe>[
  Recipe(
    id: 'rendang', name: 'Rendang Padang', region: 'Sumatera Barat',
    category: 'Makan Siang', duration: '2 jam 30 mnt', difficulty: 'Menengah',
    rating: 4.9, emoji: '🍛', color: Color(0xFFB85B36),
    description: 'Daging sapi empuk yang dimasak perlahan bersama santan dan rempah pilihan hingga bumbunya meresap sempurna.',
    ingredients: ['500 g daging sapi, potong kotak', '800 ml santan kental', '2 batang serai, memarkan', '4 lembar daun jeruk', 'Bumbu halus: cabai, bawang, jahe, lengkuas, kunyit'],
    steps: ['Tumis bumbu halus bersama serai dan daun jeruk hingga harum.', 'Masukkan daging, aduk sampai berubah warna.', 'Tuang santan. Masak dengan api kecil sambil sesekali diaduk.', 'Lanjutkan memasak hingga kuah mengering dan daging empuk.'],
  ),
  Recipe(
    id: 'soto', name: 'Soto Ayam', region: 'Jawa Timur',
    category: 'Makan Siang', duration: '55 menit', difficulty: 'Mudah',
    rating: 4.8, emoji: '🍲', color: Color(0xFFD39A42),
    description: 'Soto ayam berkuah bening yang hangat dengan suwiran ayam, soun, dan taburan bawang goreng.',
    ingredients: ['1 ekor ayam, belah dua', '1,5 liter air', '2 batang serai dan 3 lembar daun jeruk', 'Soun, kol, dan telur rebus secukupnya', 'Bawang goreng dan jeruk nipis'],
    steps: ['Rebus ayam hingga matang, lalu suwir dan sisihkan kaldunya.', 'Tumis bumbu halus bersama serai hingga harum.', 'Masukkan tumisan ke dalam kaldu dan didihkan.', 'Sajikan bersama soun, kol, ayam suwir, telur, dan bawang goreng.'],
  ),
  Recipe(
    id: 'gado', name: 'Gado-Gado', region: 'Jakarta',
    category: 'Vegetarian', duration: '35 menit', difficulty: 'Mudah',
    rating: 4.7, emoji: '🥗', color: Color(0xFF63855B),
    description: 'Paduan sayuran segar dan matang dengan saus kacang gurih, kerupuk, dan taburan bawang.',
    ingredients: ['1 ikat bayam dan 100 g tauge', '2 buah kentang, rebus', '1 buah mentimun dan tahu goreng', '150 g kacang tanah goreng', 'Gula merah, asam jawa, cabai, dan garam'],
    steps: ['Rebus bayam dan tauge sebentar, tiriskan.', 'Haluskan kacang bersama bumbu, tambahkan air hangat hingga kental.', 'Tata sayuran, kentang, mentimun, dan tahu di piring.', 'Siram saus kacang dan sajikan dengan kerupuk.'],
  ),
  Recipe(
    id: 'pancake', name: 'Pancake Pisang', region: 'Kreasi Rumahan',
    category: 'Sarapan', duration: '20 menit', difficulty: 'Mudah',
    rating: 4.6, emoji: '🥞', color: Color(0xFFC67F55),
    description: 'Pancake pisang lembut dengan bahan sederhana, pas untuk sarapan santai bersama keluarga.',
    ingredients: ['2 buah pisang matang', '150 g tepung terigu', '1 butir telur', '180 ml susu cair', '1 sdt baking powder dan madu'],
    steps: ['Lumatkan pisang, campur dengan telur dan susu.', 'Masukkan tepung serta baking powder, aduk rata.', 'Tuang adonan ke wajan anti lengket dengan api kecil.', 'Balik saat muncul gelembung. Sajikan dengan madu.'],
  ),
  Recipe(
    id: 'sate', name: 'Sate Ayam', region: 'Jawa Tengah',
    category: 'Makan Malam', duration: '45 menit', difficulty: 'Menengah',
    rating: 4.8, emoji: '🍢', color: Color(0xFFA7603C),
    description: 'Potongan ayam berbumbu yang dibakar harum dan disajikan dengan saus kacang gurih.',
    ingredients: ['500 g dada ayam, potong dadu', '20 tusuk sate', '100 g kacang tanah goreng', 'Kecap manis dan jeruk limau', 'Bawang putih, cabai, garam'],
    steps: ['Tusuk potongan ayam, lumuri sedikit kecap.', 'Haluskan kacang dan bumbu, encerkan dengan air.', 'Bakar sate sambil dibolak-balik hingga matang.', 'Sajikan dengan saus kacang, kecap, dan jeruk limau.'],
  ),
];

const ink = Color(0xFF292D25);
const muted = Color(0xFF888A80);
const paper = Color(0xFFFAF8F2);
const olive = Color(0xFF687354);

class ResepNusantaraApp extends StatefulWidget {
  const ResepNusantaraApp({super.key});
  @override
  State<ResepNusantaraApp> createState() => _ResepNusantaraAppState();
}

class _ResepNusantaraAppState extends State<ResepNusantaraApp> {
  final Set<String> _saved = {'gado'};
  int _tab = 0;
  void _toggleSaved(Recipe recipe) => setState(() {
    _saved.contains(recipe.id) ? _saved.remove(recipe.id) : _saved.add(recipe.id);
  });

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Rasa Nusantara',
    theme: ThemeData(useMaterial3: true, scaffoldBackgroundColor: paper,
      colorScheme: ColorScheme.fromSeed(seedColor: olive, surface: paper),
      fontFamily: 'Roboto', appBarTheme: const AppBarTheme(backgroundColor: paper, foregroundColor: ink)),
    home: Scaffold(
      body: SafeArea(child: IndexedStack(index: _tab, children: [
        HomePage(saved: _saved, onToggleSaved: _toggleSaved, onSelect: _openRecipe, onBrowse: () => setState(() => _tab = 1)),
        ExplorePage(saved: _saved, onToggleSaved: _toggleSaved, onSelect: _openRecipe),
        SavedPage(saved: _saved, onToggleSaved: _toggleSaved, onSelect: _openRecipe),
      ])),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (index) => setState(() => _tab = index),
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFE8EBDD),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'Beranda'),
          NavigationDestination(icon: Icon(Icons.explore_outlined), selectedIcon: Icon(Icons.explore_rounded), label: 'Jelajah'),
          NavigationDestination(icon: Icon(Icons.bookmark_border_rounded), selectedIcon: Icon(Icons.bookmark_rounded), label: 'Tersimpan'),
        ],
      ),
    ),
  );

  void _openRecipe(Recipe recipe) => Navigator.of(context).push(MaterialPageRoute<void>(
    builder: (_) => RecipeDetailPage(recipe: recipe, isSaved: _saved.contains(recipe.id), onToggleSaved: () => _toggleSaved(recipe)),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.saved, required this.onToggleSaved, required this.onSelect, required this.onBrowse});
  final Set<String> saved; final ValueChanged<Recipe> onToggleSaved; final ValueChanged<Recipe> onSelect; final VoidCallback onBrowse;
  @override
  Widget build(BuildContext context) {
    final featured = recipes.first;
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.fromLTRB(22, 18, 22, 0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(width: 42, height: 42, decoration: BoxDecoration(color: const Color(0xFFE8EBDD), borderRadius: BorderRadius.circular(15)), child: const Icon(Icons.restaurant_menu_rounded, color: olive)),
          const SizedBox(width: 11), const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('RASA NUSANTARA', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, letterSpacing: 1.5, color: olive)), Text('Dapur penuh cerita', style: TextStyle(fontSize: 12, color: muted))]),
          const Spacer(), CircleAvatar(radius: 21, backgroundColor: const Color(0xFFF0E7D9), child: const Text('👩🏻‍🍳', style: TextStyle(fontSize: 21))),
        ]),
        const SizedBox(height: 28), const Text('Mau masak apa', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700, color: ink, height: 1.1)),
        const Text('hari ini?', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700, color: ink, height: 1.1)),
        const SizedBox(height: 8), const Text('Temukan rasa rumahan dari seluruh Indonesia.', style: TextStyle(color: muted, fontSize: 13)),
        const SizedBox(height: 20),
        InkWell(onTap: onBrowse, borderRadius: BorderRadius.circular(16), child: Container(padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFECEAE2))), child: const Row(children: [Icon(Icons.search, color: muted), SizedBox(width: 10), Text('Cari resep atau bahan...', style: TextStyle(color: muted, fontSize: 14)), Spacer(), Icon(Icons.tune_rounded, color: olive)]))),
        const SizedBox(height: 24),
        Container(height: 180, decoration: BoxDecoration(color: const Color(0xFFE9E4D5), borderRadius: BorderRadius.circular(24)), clipBehavior: Clip.antiAlias, child: Stack(children: [
          Positioned(right: -14, top: 7, child: Text(featured.emoji, style: const TextStyle(fontSize: 142))),
          Container(width: 230, decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFE9E4D5), Color(0x00E9E4D5)], begin: Alignment.centerLeft, end: Alignment.centerRight))),
          Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: Colors.white.withValues(alpha: .75), borderRadius: BorderRadius.circular(30)), child: const Text('RESEP PILIHAN', style: TextStyle(fontSize: 9, letterSpacing: 1, fontWeight: FontWeight.w800, color: olive))),
            const SizedBox(height: 11), const SizedBox(width: 165, child: Text('Hangatnya Rendang Padang', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: ink, height: 1.15))),
            const SizedBox(height: 12), FilledButton.tonal(onPressed: () => onSelect(featured), style: FilledButton.styleFrom(backgroundColor: olive, foregroundColor: Colors.white, visualDensity: VisualDensity.compact), child: const Text('Lihat resep')),
          ])),
        ])),
        const SizedBox(height: 25),
        Row(children: [const Expanded(child: Text('Jelajahi kategori', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: ink))), TextButton(onPressed: onBrowse, child: const Text('Lihat semua', style: TextStyle(color: olive)))]),
        const SizedBox(height: 8),
        SizedBox(height: 88, child: ListView(scrollDirection: Axis.horizontal, children: const [CategoryChip(icon: '🍳', label: 'Sarapan'), CategoryChip(icon: '🍱', label: 'Makan Siang'), CategoryChip(icon: '🌙', label: 'Makan Malam'), CategoryChip(icon: '🥬', label: 'Vegetarian')])),
        const SizedBox(height: 21),
        Row(children: [const Expanded(child: Text('Lagi populer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: ink))), TextButton(onPressed: onBrowse, child: const Text('Lihat semua', style: TextStyle(color: olive)))]),
      ]))),
      SliverPadding(padding: const EdgeInsets.fromLTRB(22, 3, 22, 20), sliver: SliverList(delegate: SliverChildBuilderDelegate((context, index) => RecipeCard(recipe: recipes[index + 1], isSaved: saved.contains(recipes[index + 1].id), onTap: () => onSelect(recipes[index + 1]), onSave: () => onToggleSaved(recipes[index + 1])), childCount: recipes.length - 1))),
    ]);
  }
}

class CategoryChip extends StatelessWidget {
  const CategoryChip({super.key, required this.icon, required this.label}); final String icon; final String label;
  @override
  Widget build(BuildContext context) => Container(width: 105, margin: const EdgeInsets.only(right: 10), padding: const EdgeInsets.symmetric(vertical: 10), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(17), border: Border.all(color: const Color(0xFFECEAE2))), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(icon, style: const TextStyle(fontSize: 23)), const SizedBox(height: 6), Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: ink))]));
}

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key, required this.saved, required this.onToggleSaved, required this.onSelect});
  final Set<String> saved; final ValueChanged<Recipe> onToggleSaved; final ValueChanged<Recipe> onSelect;
  @override State<ExplorePage> createState() => _ExplorePageState();
}
class _ExplorePageState extends State<ExplorePage> {
  String _query = ''; String _category = 'Semua';
  @override
  Widget build(BuildContext context) {
    final categories = ['Semua', 'Sarapan', 'Makan Siang', 'Makan Malam', 'Vegetarian'];
    final filtered = recipes.where((r) => (_category == 'Semua' || r.category == _category) && ('${r.name} ${r.region} ${r.category}'.toLowerCase().contains(_query.toLowerCase()))).toList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(22, 24, 22, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Jelajahi resep', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: ink)),
              const SizedBox(height: 5),
              const Text('Ide masakan untuk setiap suasana.', style: TextStyle(color: muted)),
              const SizedBox(height: 17),
              TextField(
                onChanged: (value) => setState(() => _query = value),
                decoration: InputDecoration(
                  hintText: 'Cari nama atau daerah...',
                  prefixIcon: const Icon(Icons.search, color: muted),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(0xFFECEAE2))),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(0xFFECEAE2))),
                ),
              ),
              const SizedBox(height: 13),
              SizedBox(
                height: 38,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: categories.map((category) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: _category == category,
                      onSelected: (_) => setState(() => _category = category),
                      selectedColor: const Color(0xFFE8EBDD),
                      labelStyle: TextStyle(color: _category == category ? olive : muted, fontSize: 12, fontWeight: FontWeight.w600),
                      side: BorderSide(color: _category == category ? const Color(0xFFE8EBDD) : const Color(0xFFECEAE2)),
                      backgroundColor: Colors.white,
                    ),
                  )).toList(),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: filtered.isEmpty
              ? const EmptyState(icon: Icons.search_off_rounded, title: 'Resep tidak ditemukan', message: 'Coba kata kunci atau kategori lain.')
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(22, 4, 22, 20),
                  itemCount: filtered.length,
                  itemBuilder: (_, index) {
                    final recipe = filtered[index];
                    return RecipeCard(
                      recipe: recipe,
                      isSaved: widget.saved.contains(recipe.id),
                      onTap: () => widget.onSelect(recipe),
                      onSave: () => widget.onToggleSaved(recipe),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class SavedPage extends StatelessWidget {
  const SavedPage({super.key, required this.saved, required this.onToggleSaved, required this.onSelect}); final Set<String> saved; final ValueChanged<Recipe> onToggleSaved; final ValueChanged<Recipe> onSelect;
  @override Widget build(BuildContext context) {
    final items = recipes.where((r) => saved.contains(r.id)).toList();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Padding(padding: EdgeInsets.fromLTRB(22, 24, 22, 4), child: Text('Resep tersimpan', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: ink))), const Padding(padding: EdgeInsets.fromLTRB(22, 0, 22, 17), child: Text('Kumpulan ide masakan favoritmu.', style: TextStyle(color: muted))), Expanded(child: items.isEmpty ? const EmptyState(icon: Icons.bookmark_border_rounded, title: 'Belum ada resep tersimpan', message: 'Tekan ikon bookmark pada resep yang kamu suka.') : ListView.builder(padding: const EdgeInsets.symmetric(horizontal: 22), itemCount: items.length, itemBuilder: (_, i) => RecipeCard(recipe: items[i], isSaved: true, onTap: () => onSelect(items[i]), onSave: () => onToggleSaved(items[i]))))]);
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe, required this.isSaved, required this.onTap, required this.onSave}); final Recipe recipe; final bool isSaved; final VoidCallback onTap; final VoidCallback onSave;
  @override
  Widget build(BuildContext context) => Card(
    color: Colors.white,
    elevation: 0,
    margin: const EdgeInsets.only(bottom: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19), side: const BorderSide(color: Color(0xFFECEAE2))),
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: onTap,
      child: Row(children: [
        Container(width: 104, height: 104, color: recipe.color.withValues(alpha: .13), alignment: Alignment.center, child: Text(recipe.emoji, style: const TextStyle(fontSize: 55))),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(13, 11, 5, 11),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(recipe.category.toUpperCase(), style: const TextStyle(color: olive, fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: .8)),
              const SizedBox(height: 4),
              Text(recipe.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: ink)),
              const SizedBox(height: 4),
              Text('📍 ${recipe.region}', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11, color: muted)),
              const SizedBox(height: 7),
              Row(children: [
                const Icon(Icons.star_rounded, color: Color(0xFFE2A545), size: 16),
                const SizedBox(width: 3),
                Text(recipe.rating.toString(), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: ink)),
                const SizedBox(width: 10),
                const Icon(Icons.schedule_rounded, color: muted, size: 14),
                const SizedBox(width: 3),
                Flexible(child: Text(recipe.duration, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 10, color: muted))),
              ]),
            ]),
          ),
        ),
        IconButton(onPressed: onSave, icon: Icon(isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded, color: isSaved ? olive : muted, size: 21)),
      ]),
    ),
  );
}

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({super.key, required this.recipe, required this.isSaved, required this.onToggleSaved}); final Recipe recipe; final bool isSaved; final VoidCallback onToggleSaved;
  @override Widget build(BuildContext context) => Scaffold(backgroundColor: paper, body: CustomScrollView(slivers: [
    SliverAppBar(expandedHeight: 310, pinned: true, backgroundColor: recipe.color.withValues(alpha: .18), leading: Padding(padding: const EdgeInsets.all(7), child: IconButton(onPressed: () => Navigator.pop(context), style: IconButton.styleFrom(backgroundColor: Colors.white), icon: const Icon(Icons.arrow_back_rounded, color: ink))), actions: [Padding(padding: const EdgeInsets.all(7), child: IconButton(onPressed: onToggleSaved, style: IconButton.styleFrom(backgroundColor: Colors.white), icon: Icon(isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded, color: olive)))], flexibleSpace: FlexibleSpaceBar(background: Container(color: recipe.color.withValues(alpha: .15), alignment: Alignment.center, child: Text(recipe.emoji, style: const TextStyle(fontSize: 155))))),
    SliverToBoxAdapter(child: Container(transform: Matrix4.translationValues(0, -22, 0), padding: const EdgeInsets.fromLTRB(23, 25, 23, 35), decoration: const BoxDecoration(color: paper, borderRadius: BorderRadius.vertical(top: Radius.circular(27))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(recipe.category.toUpperCase(), style: const TextStyle(color: olive, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.2)), const SizedBox(height: 7), Text(recipe.name, style: const TextStyle(fontSize: 27, fontWeight: FontWeight.w700, color: ink)), const SizedBox(height: 7), Text('📍 ${recipe.region}', style: const TextStyle(color: muted, fontSize: 13)), const SizedBox(height: 16), Text(recipe.description, style: const TextStyle(color: Color(0xFF66685F), height: 1.55, fontSize: 14)), const SizedBox(height: 20), Row(children: [InfoPill(icon: Icons.schedule_rounded, value: recipe.duration), const SizedBox(width: 9), InfoPill(icon: Icons.signal_cellular_alt_rounded, value: recipe.difficulty), const SizedBox(width: 9), InfoPill(icon: Icons.star_rounded, value: recipe.rating.toString())]), const SizedBox(height: 27), const Text('Bahan-bahan', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: ink)), const SizedBox(height: 11), ...recipe.ingredients.map((ingredient) => Padding(padding: const EdgeInsets.only(bottom: 10), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [const Icon(Icons.check_circle_rounded, color: olive, size: 18), const SizedBox(width: 9), Expanded(child: Text(ingredient, style: const TextStyle(color: Color(0xFF55574F), height: 1.4, fontSize: 13)))]))), const SizedBox(height: 18), const Text('Cara membuat', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: ink)), const SizedBox(height: 12), ...recipe.steps.asMap().entries.map((entry) => Padding(padding: const EdgeInsets.only(bottom: 14), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(width: 27, height: 27, alignment: Alignment.center, decoration: BoxDecoration(color: const Color(0xFFE8EBDD), borderRadius: BorderRadius.circular(10)), child: Text('${entry.key + 1}', style: const TextStyle(color: olive, fontSize: 12, fontWeight: FontWeight.w700))), const SizedBox(width: 10), Expanded(child: Padding(padding: const EdgeInsets.only(top: 3), child: Text(entry.value, style: const TextStyle(color: Color(0xFF55574F), height: 1.45, fontSize: 13))))]))),
    ]))),
  ]));
}

class InfoPill extends StatelessWidget {
  const InfoPill({super.key, required this.icon, required this.value}); final IconData icon; final String value;
  @override Widget build(BuildContext context) => Expanded(child: Container(padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: const Color(0xFFECEAE2))), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, size: 15, color: olive), const SizedBox(width: 5), Flexible(child: Text(value, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: ink)))])));
}

class EmptyState extends StatelessWidget {
  const EmptyState({super.key, required this.icon, required this.title, required this.message}); final IconData icon; final String title; final String message;
  @override Widget build(BuildContext context) => Center(child: Padding(padding: const EdgeInsets.all(36), child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 47, color: const Color(0xFFADB29F)), const SizedBox(height: 13), Text(title, textAlign: TextAlign.center, style: const TextStyle(color: ink, fontSize: 17, fontWeight: FontWeight.w700)), const SizedBox(height: 6), Text(message, textAlign: TextAlign.center, style: const TextStyle(color: muted, fontSize: 13, height: 1.4))])));
}
