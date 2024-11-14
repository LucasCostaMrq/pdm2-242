// Agregação e Composição
import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }
}

void main() {
  // 1. Criar vários objetos Dependentes
  var dependente1 = Dependente('Maria');
  var dependente2 = Dependente('José');
  var dependente3 = Dependente('Ana');
  var dependente4 = Dependente('Pedro');

  // 2. Criar vários objetos Funcionario
  var funcionario1 = Funcionario('João', [dependente1, dependente2]);
  var funcionario2 = Funcionario('Carlos', [dependente3]);
  var funcionario3 = Funcionario('Fernanda', [dependente4]);

  // 3. Criar uma lista de Funcionarios
  var funcionarios = [funcionario1, funcionario2, funcionario3];

  // 4. Criar um objeto EquipeProjeto
  var equipeProjeto = EquipeProjeto('Projeto XYZ', funcionarios);

  // 5. Printar o objeto EquipeProjeto no formato JSON
  var jsonEquipeProjeto = jsonEncode(equipeProjeto.toJson());
  print(jsonEquipeProjeto);
}