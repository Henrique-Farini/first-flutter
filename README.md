# Flutter: estudos e apps

Meus exercícios e apps de **Flutter/Dart** do curso técnico em Desenvolvimento de Sistemas (SENAI). Cada arquivo `lib/main_*.dart` é um exercício independente, e a pasta `appgps/` é um app separado de geolocalização.

## O que tem aqui

**Apps**
- **Carteira digital** e **cartão de banco** (`main_carteiradigital.dart`, `main_cartao.dart`)
- **Controle financeiro** com tela de novos lançamentos (`main_controlefinanceiro.dart`)
- **Localização / GPS** com o pacote `geolocator` (`main_gpsatividade.dart` e o app `appgps/`)
- **Tela de login** e cartão de identificação

**Fundamentos de layout e widgets**
- `Row`, `Column`, `Container`, `Expanded`, `Flexible`, `SafeArea`, `SingleChildScrollView`
- Responsividade com `MediaQuery`
- Formulários e teclados (`TextField`, `TextFormField`)
- Estado com `StatefulWidget`, controllers e `Provider`
- Navegação com `go_router` e dados salvos com `shared_preferences`

## Como rodar

```bash
flutter pub get
flutter run
```

Para rodar outro exercício, aponte para o arquivo dele:

```bash
flutter run -t lib/main_controlefinanceiro.dart
```

---

Feito por [Henrique Farini](https://github.com/Henrique-Farini).
