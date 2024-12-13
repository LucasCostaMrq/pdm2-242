import 'dart:io';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

void main() async {
  // Email do remetente
  final email = "lucascostamarques816@gmail.com";

  // Senha do remetente
  final senha = "";

  // Servidor SMTP do Gmail
  final smtServer = gmail(email, senha);

  // Cria a mensagem
  final mensagem = Message()
    ..from = Address(email, "Lucas Costa")
    ..recipients.add("lucas.marques62@aluno.ifce.edu.br")
    ..subject = "Teste de envio"
    ..text = "Este é um e-mail de teste";

  try {
    // Envia a mensagem
    final sendReport = await send(mensagem, smtServer);
    print("E-mail enviado com sucesso: ${sendReport.toString()}");
  } on MailerException catch (e) {
    // Tratamento de erro
    print("Erro ao enviar o e-mail: ${e.toString()}");
  }
}
