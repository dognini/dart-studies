# Dart Studies 🎯

Este repositório contém meus estudos e práticas na linguagem Dart. Aqui você encontrará exemplos, exercícios e projetos desenvolvidos durante meu aprendizado, incluindo conceitos básicos, programação assíncrona, comunicação com APIs e gerenciamento de streams.

## 📚 Estrutura do Projeto

### `lib/dart_basico/`
Conceitos fundamentais da linguagem Dart organizados por tema:

- **`fundamentos/`** - Tipos básicos, variáveis, operadores, constantes, generics e interpolação
- **`controle/`** - Estruturas de controle de fluxo (if/else, for, while, switch)
- **`funcao/`** - Funções básicas, parâmetros nomeados/opcionais, funções como parâmetros, map/reduce, generics
- **`poo/`** - Programação Orientada a Objetos com exemplos de classes (Animal, Cliente, Conta)

### `lib/models/`
Modelos de dados para o sistema de contas e transações:
- **`account.dart`** - Modelo de conta bancária com serialização JSON
- **`transaction.dart`** - Modelo de transação financeira com cálculo de taxas

### `lib/services/`
Camada de serviços e lógica de negócio:
- **`account_service.dart`** - Gerenciamento de contas com integração HTTP e Streams
- **`transaction_service.dart`** - Processamento de transações com validações e cálculo de taxas

### `lib/helpers/`
Funções auxiliares e utilitários:
- **`helper_taxes.dart`** - Cálculo de taxas por tipo de conta (Ambrosia, Canjica, Pudim, Brigadeiro)

### `lib/exceptions/`
Tratamento de exceções customizadas:
- **`transaction_exceptions.dart`** - Exceções para transações (remetente inexistente, destinatário inexistente, fundos insuficientes)

### `lib/screens/`
Interface do usuário:
- **`account_screen.dart`** - Tela de gerenciamento de contas com chatbot interativo

### `bin/`
Ponto de entrada da aplicação (`main.dart`)

### `test/`
Testes unitários

## 🚀 Como Executar

Para executar a aplicação principal (sistema de contas com chatbot):

```bash
dart run bin/main.dart
```

Para executar exemplos específicos de conceitos básicos:

```bash
dart run lib/dart_basico/fundamentos/tipos_basicos_1.dart
dart run lib/dart_basico/funcao/map_reduce_1.dart
dart run lib/dart_basico/poo/classe_conta.dart
```

## 📖 Tópicos Estudados

### Fundamentos
- ✅ Tipos básicos e variáveis
- ✅ Operadores e expressões
- ✅ Estruturas de controle
- ✅ Funções e programação funcional
- ✅ Programação Orientada a Objetos
- ✅ Generics
- ✅ Map, Filter e Reduce

### Avançado
- ✅ Programação Assíncrona (Future, async/await)
- ✅ Streams e StreamController
- ✅ Requisições HTTP (GET, POST, PATCH)
- ✅ Serialização e Deserialização JSON
- ✅ Tratamento de Exceções Customizadas
- ✅ Integração com APIs externas
- ✅ Padrões de Arquitetura (Models, Services, Screens)

## 🏦 Sistema de Contas Bancárias

O projeto inclui um sistema completo de gerenciamento de contas bancárias com:

### Funcionalidades
- 📝 Criação e gerenciamento de contas
- 💸 Processamento de transações entre contas
- 💰 Cálculo automático de taxas por tipo de conta
- 🔄 Sincronização com API externa
- ⚠️ Validações e tratamento de erros
- 📊 Monitoramento em tempo real via Streams

### Tipos de Conta
- **Ambrosia** - Taxa de 0,5% para transações acima de R$ 5.000
- **Canjica** - Taxa de 0,33% para transações acima de R$ 5.000
- **Pudim** - Taxa de 0,25% para transações acima de R$ 5.000
- **Brigadeiro** - Taxa de 0,01% para transações acima de R$ 5.000

### Exceções Tratadas
- `SenderNotExistsException` - Remetente não encontrado
- `ReceiverNotExistsException` - Destinatário não encontrado
- `InsufficientFundsException` - Saldo insuficiente para transação

## 🛠️ Tecnologias

- **Dart**: Linguagem de programação
- **Dart SDK**: Kit de desenvolvimento
- **HTTP Package**: Comunicação com APIs REST
- **Streams**: Programação reativa e assíncrona
- **JSON**: Serialização e deserialização de dados

## 📦 Dependências

Para instalar as dependências do projeto:

```bash
dart pub get
```

## 📝 Notas

Este é um projeto de aprendizado pessoal, onde exploro diferentes recursos e padrões da linguagem Dart, desde conceitos básicos até tópicos avançados como programação assíncrona, comunicação com APIs e arquitetura de software.
