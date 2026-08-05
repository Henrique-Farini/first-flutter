import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const ControleFinanceiroApp());

class ControleFinanceiroApp extends StatelessWidget {
  const ControleFinanceiroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Controle Financeiro',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF155EEF),
          primary: const Color(0xFF155EEF),
          secondary: const Color(0xFF12B76A),
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F8FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF6F8FC),
          foregroundColor: Color(0xFF172B4D),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      home: const TelaPrincipal(),
    );
  }
}

class Lancamento {
  Lancamento({
    required this.descricao,
    required this.valor,
    required this.ehReceita,
    this.pago = false,
  });

  final String descricao;
  final double valor;
  final bool ehReceita;
  bool pago;
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _indiceAtual = 0;
  final List<Lancamento> _lancamentos = [
    Lancamento(descricao: 'Salário', valor: 3500, ehReceita: true, pago: true),
    Lancamento(descricao: 'Mercado', valor: 250, ehReceita: false, pago: true),
    Lancamento(descricao: 'Internet', valor: 99, ehReceita: false),
    Lancamento(descricao: 'Energia', valor: 180, ehReceita: false),
  ];

  double get _totalReceitas => _lancamentos
      .where((l) => l.ehReceita)
      .fold(0, (sum, l) => sum + l.valor);

  double get _totalDespesas => _lancamentos
      .where((l) => !l.ehReceita)
      .fold(0, (sum, l) => sum + l.valor);

  String _moeda(double valor) {
    return 'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  Future<void> _adicionarLancamento() async {
    final novoLancamento = await Navigator.push<Lancamento>(
      context,
      MaterialPageRoute(builder: (_) => const TelaAdicionarLancamento()),
    );

    if (novoLancamento != null && mounted) {
      setState(() => _lancamentos.add(novoLancamento));
    }
  }

  // A exclusão pode ser desfeita sem perder o lançamento por engano.
  void _removerLancamento(Lancamento lancamento) {
    final indice = _lancamentos.indexOf(lancamento);
    if (indice == -1) return;

    setState(() => _lancamentos.removeAt(indice));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    duration: const Duration(seconds: 2),
    content: Text('${lancamento.descricao} foi removido.'),
    action: SnackBarAction(
      label: 'DESFAZER',
      onPressed: () => setState(() => _lancamentos.insert(indice, lancamento)),
    ),
  ),
);
  }

  @override
  Widget build(BuildContext context) {
    final conteudos = [
      _buildHome(),
      _buildLancamentos(),
      _buildPerfil(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Controle Financeiro'),
        centerTitle: true,
      ),
      drawer: _buildDrawer(),
      body: SafeArea(child: conteudos[_indiceAtual]),
      floatingActionButton: _indiceAtual != 2
          ? FloatingActionButton(
              onPressed: _adicionarLancamento,
              child: const Icon(Icons.add),
              tooltip: 'Adicionar lançamento',
            )
          : null,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indiceAtual,
        onDestinationSelected: (indice) => setState(() => _indiceAtual = indice),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.receipt_long_outlined), selectedIcon: Icon(Icons.receipt_long), label: 'Lançamentos'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }

  Widget _buildHome() {
    final saldo = _totalReceitas - _totalDespesas;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Visão financeira', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        _buildResumoFinanceiro(saldo),
        const SizedBox(height: 24),
        Text('Lançamentos recentes', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        ..._lancamentos.reversed.take(4).map(_buildLancamentoCard),
      ],
    );
  }

  // Um único cartão reúne os três valores mais importantes da conta.
  Widget _buildResumoFinanceiro(double saldo) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Saldo disponível', style: TextStyle(color: Color(0xFF667085))),
          const SizedBox(height: 4),
          Text(_moeda(saldo), style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800, color: const Color(0xFF155EEF))),
          const Padding(padding: EdgeInsets.symmetric(vertical: 18), child: Divider(height: 1)),
          Row(children: [
            Expanded(child: _buildItemResumo('Receitas', _moeda(_totalReceitas), Icons.trending_up_rounded, Colors.green)),
            Container(width: 1, height: 48, color: const Color(0xFFE4E7EC)),
            Expanded(child: _buildItemResumo('Despesas', _moeda(_totalDespesas), Icons.trending_down_rounded, Colors.redAccent)),
          ]),
        ]),
      ),
    );
  }

  Widget _buildItemResumo(String titulo, String valor, IconData icone, Color cor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(titulo, style: const TextStyle(fontSize: 12, color: Color(0xFF667085))),
        const SizedBox(height: 2),
        Text(valor, style: TextStyle(color: cor, fontWeight: FontWeight.w800)),
      ]),
    );
  }

  Widget _buildResumoCard(String title, String val, IconData icon, Color color) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        leading: Container(width: 46, height: 46, decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(15)), child: Icon(icon, color: color)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Text(val, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
      ),
    );
  }

  Widget _buildLancamentos() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _lancamentos.length,
      itemBuilder: (_, i) => _buildLancamentoCard(_lancamentos[i]),
    );
  }

  Widget _buildLancamentoCard(Lancamento l) {
    final color = l.ehReceita ? Colors.green : Colors.redAccent;
    return Dismissible(
      key: ObjectKey(l),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => _removerLancamento(l),
      background: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.only(right: 24),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(20)),
        child: const Icon(Icons.delete_outline_rounded, color: Colors.white),
      ),
      child: Card(
        margin: const EdgeInsets.only(bottom: 8),
        child: ListTile(
          onTap: () => setState(() => l.pago = !l.pago),
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          leading: Container(width: 42, height: 42, decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(14)), child: Icon(l.ehReceita ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded, color: color)),
          title: Text(l.descricao, style: const TextStyle(fontWeight: FontWeight.w700)),
          subtitle: Text(l.pago ? 'Pago' : 'Aguardando pagamento'),
          trailing: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(_moeda(l.valor), style: TextStyle(color: color, fontWeight: FontWeight.bold)),
              Checkbox(value: l.pago, onChanged: (v) => setState(() => l.pago = v ?? false)),
              IconButton(tooltip: 'Remover lançamento', icon: const Icon(Icons.delete_outline_rounded), color: Colors.redAccent, onPressed: () => _removerLancamento(l)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPerfil() {
    return ListView(padding: const EdgeInsets.all(24), children: [
      const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 60)),
      const SizedBox(height: 20),
      const Center(child: Text('Henrique Farini', style: TextStyle(fontSize: 24))),
      const SizedBox(height: 40),
      const ListTile(leading: Icon(Icons.email), title: Text('henrique.farini@senaisp.org.br')),
      const ListTile(leading: Icon(Icons.info), title: Text('Versão 4.3.9')),
    ]);
  }

  Widget _buildDrawer() {
    return Drawer(child: ListView(children: [
      const DrawerHeader(decoration: BoxDecoration(color: Colors.blue), child: Center(child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)))),
      ListTile(leading: const Icon(Icons.home), title: const Text('Início'), onTap: () { setState(() => _indiceAtual = 0); Navigator.pop(context); }),
      ListTile(leading: const Icon(Icons.receipt_long_outlined), title: const Text('Lançamentos'), onTap: () { setState(() => _indiceAtual = 1); Navigator.pop(context); }),
      ListTile(leading: const Icon(Icons.bar_chart_outlined), title: const Text('Relatórios'), onTap: () => Navigator.pop(context)),
      ListTile(leading: const Icon(Icons.settings_outlined), title: const Text('Configurações'), onTap: () => Navigator.pop(context)),
      ListTile(leading: const Icon(Icons.info_outline), title: const Text('Sobre'), onTap: () => Navigator.pop(context)),
    ]));
  }
}

class TelaAdicionarLancamento extends StatefulWidget {
  const TelaAdicionarLancamento({super.key});
  @override
  State<TelaAdicionarLancamento> createState() => _TelaAdicionarLancamentoState();
}

class _TelaAdicionarLancamentoState extends State<TelaAdicionarLancamento> {
  final _desc = TextEditingController();
  final _val = TextEditingController();
  bool _receita = true;

  @override
  void dispose() {
    _desc.dispose();
    _val.dispose();
    super.dispose();
  }

  void _salvar() {
    final descricao = _desc.text.trim();
    final textoValor = _val.text.trim();
    final valor = double.tryParse(textoValor.replaceAll(',', '.'));

    if (descricao.isEmpty || textoValor.isEmpty || valor == null || valor <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha uma descrição e um valor válido antes de salvar.')),
      );
      return;
    }

    Navigator.pop(context, Lancamento(descricao: descricao, valor: valor, ehReceita: _receita));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Lançamento')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: _desc, decoration: const InputDecoration(labelText: 'Descrição', border: OutlineInputBorder())),
          const SizedBox(height: 16),
          TextField(
            controller: _val,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9,.]'))],
            decoration: const InputDecoration(labelText: 'Valor', prefixText: 'R\$ ', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          RadioListTile<bool>(value: true, groupValue: _receita, onChanged: (v) => setState(() => _receita = v!), title: const Text('Receita'), secondary: const Icon(Icons.trending_up, color: Colors.green)),
          RadioListTile<bool>(value: false, groupValue: _receita, onChanged: (v) => setState(() => _receita = v!), title: const Text('Despesa'), secondary: const Icon(Icons.trending_down, color: Colors.redAccent)),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _salvar, child: const Text('Salvar'))
        ]),
      ),
    );
  }
}
