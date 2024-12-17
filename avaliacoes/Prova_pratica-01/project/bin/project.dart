//Lucas Costa Marques
import 'package:sqlite3/sqlite3.dart';

// Classe Aluno
class Aluno {
  int? id;
  String nome;
  int idade;

  Aluno({this.id, required this.nome, required this.idade});

  // Converte um Aluno para um mapa, para inserção no banco
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'idade': idade,
    };
  }

  // Converte um mapa para um Aluno
  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'],
      nome: map['nome'],
      idade: map['idade'],
    );
  }
}

// Função para criar o banco de dados e a tabela
Database initDatabase() {
  // Cria o banco de dados (se não existir)
  var db = sqlite3.open('alunos.db');
  
  // Cria a tabela TB_ALUNOS
  db.execute('''
    CREATE TABLE IF NOT EXISTS TB_ALUNOS(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      idade INTEGER
    )
  ''');

  return db;
}

// Função para inserir um aluno no banco
void inserirAluno(Database db, Aluno aluno) {
  db.execute(
    'INSERT INTO TB_ALUNOS (nome, idade) VALUES (?, ?)',
    [aluno.nome, aluno.idade],
  );
}

// Função para consultar todos os alunos
List<Aluno> consultarAlunos(Database db) {
  final ResultSet resultSet = db.select('SELECT * FROM TB_ALUNOS');
  
  return resultSet.map((row) {
    return Aluno.fromMap({
      'id': row['id'],
      'nome': row['nome'],
      'idade': row['idade'],
    });
  }).toList();
}

// Função para atualizar um aluno
void atualizarAluno(Database db, Aluno aluno) {
  db.execute(
    'UPDATE TB_ALUNOS SET nome = ?, idade = ? WHERE id = ?',
    [aluno.nome, aluno.idade, aluno.id],
  );
}

// Função para excluir um aluno
void excluirAluno(Database db, int id) {
  db.execute(
    'DELETE FROM TB_ALUNOS WHERE id = ?',
    [id],
  );
}

// Função principal para demonstrar as operações
void main() {
  var db = initDatabase();

  // Inserir novos alunos
  Aluno aluno1 = Aluno(nome: 'Lucas Costa', idade: 20);
  inserirAluno(db, aluno1);

  Aluno aluno2 = Aluno(nome: 'Vinicius Mango', idade: 22);
  inserirAluno(db, aluno2);

  // Consultar alunos
  List<Aluno> alunos = consultarAlunos(db);
  print('Lista de Alunos:');
  alunos.forEach((aluno) {
    print('ID: ${aluno.id}, Nome: ${aluno.nome}, Idade: ${aluno.idade}');
  });

  // Atualizar um aluno
  if (alunos.isNotEmpty) {
    Aluno alunoAtualizado = alunos.first;
    alunoAtualizado.nome = 'João Silva';
    alunoAtualizado.idade = 21;
    atualizarAluno(db, alunoAtualizado);

    // Consultar após atualização
    print('\nApós atualização:');
    alunos = consultarAlunos(db);
    alunos.forEach((aluno) {
      print('ID: ${aluno.id}, Nome: ${aluno.nome}, Idade: ${aluno.idade}');
    });
  }

  // Excluir um aluno
  if (alunos.isNotEmpty) {
    excluirAluno(db, alunos.first.id!);
    print('\nApós exclusão:');
    alunos = consultarAlunos(db);
    alunos.forEach((aluno) {
      print('ID: ${aluno.id}, Nome: ${aluno.nome}, Idade: ${aluno.idade}');
    });
  }

  // Fechar o banco de dados
  db.dispose();
}
