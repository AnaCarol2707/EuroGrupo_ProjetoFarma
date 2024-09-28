class Convidado {
  final String nome;
  final bool presente;

  Convidado({required this.nome, required this.presente});
}

final List<Map<String, dynamic>> dados = [
  {
    'tema': 'Segurança no Trabalho',
    'data': '23-06-2024',
    'conteúdo': 'Palestra',
    'qntPresentes': '4',
    'convidados': [
      {'nome': 'Ana Carolina Assis', 'presente': true},
      {'nome': 'Ana Luísa Bernardi Elias', 'presente': true},
      {'nome': 'Gabriel Rodrigues de Oliveira Castilho', 'presente': true},
      {'nome': 'Lucas Matteis Proença', 'presente': false},
      {'nome': 'Matheus Franchin Crivellaro', 'presente': true},
    ],
    'descricao': 'Discussão sobre melhores práticas e legislações relacionadas à segurança no ambiente de trabalho.',
  },
  {
    'tema': 'Inovação Tecnológica',
    'data': '15-07-2024',
    'conteúdo': 'Workshop',
    'qntPresentes': '7',
    'convidados': [
      {'nome': 'João Pedro Silva', 'presente': true},
      {'nome': 'Mariana Souza', 'presente': false},
      {'nome': 'Roberto Carlos', 'presente': true},
      {'nome': 'Patrícia Lima', 'presente': true},
      {'nome': 'Thiago Almeida', 'presente': false},
      {'nome': 'Fernanda Rocha', 'presente': true},
      {'nome': 'Clara Mendes', 'presente': true},
      {'nome': 'Nicolas Ferreira', 'presente': false},
      {'nome': 'Sérgio Costa', 'presente': true},
      {'nome': 'Verônica Dias', 'presente': true},
    ],
    'descricao': 'Exploração de novas tecnologias e suas aplicações no mercado.',
  },
  {
    'tema': 'Saúde Mental no Trabalho',
    'data': '10-08-2024',
    'conteúdo': 'Debate',
    'qntPresentes': '8',
    'convidados': [
      {'nome': 'Carla Mendes', 'presente': true},
      {'nome': 'Eduardo Pires', 'presente': true},
      {'nome': 'Sofia Martins', 'presente': false},
      {'nome': 'Lúcio Ribeiro', 'presente': true},
      {'nome': 'Bianca Lima', 'presente': true},
      {'nome': 'Felipe Costa', 'presente': false},
      {'nome': 'Mariana Tavares', 'presente': true},
      {'nome': 'Thiago Andrade', 'presente': true},
      {'nome': 'Patrícia Nunes', 'presente': false},
      {'nome': 'Rafael Oliveira', 'presente': true},
    ],
    'descricao': 'Reflexão sobre a importância da saúde mental e seu impacto no ambiente de trabalho.',
  },
  {
    'tema': 'Gestão de Projetos Ágeis',
    'data': '05-09-2024',
    'conteúdo': 'Seminário',
    'qntPresentes': '9',
    'convidados': [
      {'nome': 'Ricardo Gomes', 'presente': true},
      {'nome': 'Ana Paula Torres', 'presente': true},
      {'nome': 'Felipe Andrade', 'presente': true},
      {'nome': 'Vanessa Teixeira', 'presente': false},
      {'nome': 'Claudio Pereira', 'presente': true},
      {'nome': 'Mariana Tavares', 'presente': true},
      {'nome': 'Carlos Silva', 'presente': false},
      {'nome': 'Luciana Melo', 'presente': true},
      {'nome': 'Renato Sampaio', 'presente': true},
      {'nome': 'Juliana Rios', 'presente': false},
    ],
    'descricao': 'Discussão sobre metodologias ágeis e sua aplicação na gestão de projetos.',
  },
  {
    'tema': 'Sustentabilidade Corporativa',
    'data': '20-09-2024',
    'conteúdo': 'Palestra',
    'qntPresentes': '7',
    'convidados': [
      {'nome': 'Juliana Costa', 'presente': true},
      {'nome': 'Tiago Nascimento', 'presente': false},
      {'nome': 'Marcelinho Silva', 'presente': true},
      {'nome': 'Bianca Almeida', 'presente': true},
      {'nome': 'Lucas Ferreira', 'presente': false},
      {'nome': 'Laura Santos', 'presente': true},
      {'nome': 'Pedro Henrique', 'presente': true},
      {'nome': 'Fernanda Lopes', 'presente': true},
      {'nome': 'Gabriel Pinto', 'presente': false},
      {'nome': 'Tatiane Costa', 'presente': true},
    ],
    'descricao': 'Debate sobre práticas sustentáveis nas empresas e seu impacto ambiental.',
  },
];

List<Convidado> parseConvidados(List<dynamic> convidados) {
  return convidados.map((c) => Convidado(nome: c['nome'], presente: c['presente'])).toList();
}
