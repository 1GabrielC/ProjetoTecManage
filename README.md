# ProjetoTecManage

## Participantes

<div align="center">
  <table>
    <tr>
      <td align="center">
        <a href="https://github.com/ThaylonST">
          <img src="https://avatars.githubusercontent.com/u/136936975?v=4" width="75px;" alt="Foto de Thaylon"/>
          <br />
          <sub><b>Thaylon</b></sub>
        </a>
      </td>
      <td align="center">
        <a href="https://github.com/1GabrielC">
          <img src="https://avatars.githubusercontent.com/u/130706226?v=4" width="75px;" alt="Foto de Gabriel"/>
          <br />
          <sub><b>Gabriel</b></sub>
        </a>
      </td>
    </tr>
  </table>
</div>

<h1>Documentação da Pasta <code>br.com.DAO</code></h1>

<h2>Visão Geral</h2>
<p>A pasta <code>br.com.DAO</code> contém classes que interagem diretamente com o banco de dados, sendo responsáveis pela execução de operações de CRUD (Create, Read, Update, Delete) para diferentes entidades do sistema. Ela inclui a conexão com o banco de dados e métodos que manipulam os dados de controle de peças, gerenciamento de máquinas, gerenciamento de laboratório e usuários.</p>

### Objetivo
O **ProjetoTecManage** é uma plataforma de gerenciamento de hardware voltada para laboratórios de tecnologia, ciência e engenharia. O objetivo do sistema é centralizar o controle das máquinas, peças de reposição e manutenções realizadas, facilitando o monitoramento e manutenção preventiva de equipamentos e o controle de estoque.

<h2>Estrutura de Classes:</h2>
<ul>
    <li><code>ConexaoDAO</code>: Responsável por estabelecer a conexão com o banco de dados.</li>
    <li><code>UsuarioDAO</code>: Gerencia as operações relacionadas à tabela de usuários.</li>
    <li><code>GerenciamentoConcertosDAO</code>: Responsável pelas operações relacionadas ao registro e histórico de consertos e manutenções das máquinas.</li>
    <li><code>GerenciamentoLaboratorioDAO</code>: Controla as operações relacionadas aos dados dos laboratórios, como cadastro, atualização e consulta de informações.</li>
    <li><code>ControlePecasDAO</code>: Gerencia as operações relacionadas ao estoque de peças, incluindo o cadastro, controle de quantidade e atualização de inventário.</li>
    <li><code>CadastroMaquinasDAO</code>: Responsável pelas operações de cadastro, atualização e consulta das máquinas presentes nos laboratórios.</li>
</ul>

<h2>Classes e Métodos</h2>

<h3>1. <code>ConexaoDAO</code></h3>
<p>Esta classe é responsável por estabelecer a conexão com o banco de dados MySQL.</p>

<h4>Métodos:</h4>
<ul>
    <li><code>conector()</code>: Estabelece e retorna uma conexão com o banco de dados MySQL. Utiliza o driver JDBC <code>com.mysql.cj.jdbc.Driver</code>, com parâmetros para fuso horário e timezone. Caso ocorra um erro, ele exibe uma mensagem e retorna <code>null</code>.</li>
</ul>

<h4>Exemplo de Conexão:</h4>
<pre><code>Connection conexao = ConexaoDAO.conector();
if (conexao != null) {
    System.out.println("Conexão estabelecida com sucesso!");
} else {
    System.out.println("Erro ao conectar ao banco de dados.");
}
</code></pre>

<h3>2. <code>UsuarioDAO</code></h3>
<p>Esta classe contém métodos para gerenciar os dados de usuários, como login, inserção, edição, exclusão e pesquisa de usuários.</p>

<h4>Métodos Principais:</h4>
<ul>
    <li><code>logar(UsuarioDTO objusuarioDTO, TelaUsuario telaUsuario)</code>: Valida o login do usuário com base no login e senha fornecidos. Abre a interface <code>TelaPrincipal</code> dependendo do perfil do usuário (admin ou comum) e permite o acesso a funcionalidades específicas.</li>
    <li><code>inserirUsuario(UsuarioDTO objUsuarioDTO, TelaUsuario telaUsuario)</code>: Insere um novo usuário no banco de dados e atualiza a tabela de usuários na interface.</li>
    <li><code>pesquisar(UsuarioDTO objUsuarioDTO, TelaUsuario telaUsuario)</code>: Pesquisa um usuário pelo ID e preenche os campos de entrada na <code>TelaUsuario</code>.</li>
    <li><code>editar(UsuarioDTO objUsuarioDTO, TelaUsuario telaUsuario)</code>: Edita as informações de um usuário existente no banco de dados.</li>
    <li><code>deletar(UsuarioDTO objUsuarioDTO, TelaUsuario telaUsuario)</code>: Exclui um usuário da tabela com base no ID fornecido.</li>
    <li><code>pesquisaAuto()</code>: Preenche automaticamente a tabela de usuários na interface <code>TelaUsuario</code>.</li>
</ul>

### Funcionalidades e Necessidades do Sistema
O sistema foi desenvolvido para atender às seguintes necessidades de laboratórios:

- **Número de Máquinas**: O laboratório possui um número variável de máquinas, desde computadores a equipamentos especializados, necessitando de controle detalhado de cada um.
- **Volume de Peças**: O estoque de peças de reposição também é um ponto importante, com controle rigoroso de quantidade e disponibilidade.
- **Frequência de Manutenções**: A frequência de manutenção pode variar dependendo do tipo de equipamento, necessitando de registros detalhados para garantir a saúde do parque de máquinas.

### Funcionalidades Principais
- Cadastro e controle de **máquinas e peças**.
- Registro de **consertos e manutenções** realizadas.
- **Controle de estoque** de peças e componentes.
- **Multi laboratório**: o sistema deve suportar múltiplos laboratórios com dados segregados.
- **Controle de acesso de usuários** com diferentes perfis e permissões.

---

## 2. Modelagem do Banco de Dados

### Modelo Conceitual
O banco de dados será estruturado em torno das seguintes entidades principais:

- **Máquinas**: Contém informações sobre cada equipamento no laboratório, como modelo, número de série, status, e local.
- **Peças**: Informações sobre as peças de reposição disponíveis no estoque, com dados sobre quantidade, tipo e fornecedor.
- **Usuários**: Detalhes sobre os usuários do sistema, incluindo professores, administradores e técnicos.
- **Histórico de Manutenção**: Registros sobre todas as manutenções realizadas, incluindo data, tipo de manutenção e responsável.
- **Laboratórios**: Dados sobre cada laboratório, permitindo gerenciar diferentes unidades e seus equipamentos.

### Modelo Lógico
Serão utilizadas tabelas inter-relacionadas para garantir a integridade e a eficiência nas consultas e manipulação de dados. As principais tabelas incluirão:

- **Máquinas** (id, nome, tipo, status, laboratório_id)
- **Peças** (id, nome, quantidade, fornecedor)
- **Usuários** (id, nome, tipo, laboratório_id)
- **Histórico de Manutenção** (id, máquina_id, data, tipo, descrição, técnico_id)
- **Laboratórios** (id, nome, localização)

  <h2>Como Executar e Conectar ao Banco de Dados</h2>

<h3>1. Configuração da Conexão</h3>
<p>As classes utilizam o <code>ConexaoDAO</code> para se conectar ao banco de dados MySQL. Certifique-se de que as configurações de URL, usuário e senha estão corretas.</p>

<ul>
    <li><strong>Driver</strong>: <code>com.mysql.cj.jdbc.Driver</code></li>
    <li><strong>URL de Conexão</strong>: <code>jdbc:mysql://localhost:3306/bdaulaprojeto?useTimezone=true&serverTimezone=UTC</code></li>
    <li><strong>Usuário</strong>: <code>root</code></li>
    <li><strong>Senha</strong>: <code>root</code></li>
</ul>

<h3>2. Criação do Banco de Dados</h3>
<p>Use o seguinte script para criar e popular o banco de dados.</p>

<pre><code>-- Criação do banco de dados
create database projetotecmanage;        
USE projetotecmanage;

-- Tabela de Laboratórios
CREATE TABLE LABORATORIO (
    laboratorio_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

SELECT * FROM LABORATORIO;

-- Tabela de Máquinas
CREATE TABLE MAQUINA (
    maquina_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpu VARCHAR(50),
    ram VARCHAR(50),
    armazenamento VARCHAR(50),
    status ENUM('funcionando', 'em manutenção', 'fora de uso') NOT NULL DEFAULT 'funcionando',
    laboratorio_id INT,
    FOREIGN KEY (laboratorio_id) REFERENCES LABORATORIO(laboratorio_id) ON DELETE SET NULL
);

SELECT * FROM MAQUINA;

-- Tabela de Peças
CREATE TABLE PECAS (
    peca_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    fabricante VARCHAR(50),
    quantidade_estoque INT NOT NULL DEFAULT 0
);
SELECT * FROM PECAS;

-- Tabela de Consertos
CREATE TABLE CONSERTO (
    conserto_id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    tipo ENUM('corretiva', 'preventiva') NOT NULL,
    descricao TEXT
);
ALTER TABLE CONSERTO
ADD COLUMN peca_id INT,
ADD CONSTRAINT fk_peca_id FOREIGN KEY (peca_id) REFERENCES PECAS(peca_id) ON DELETE CASCADE;

SELECT * FROM CONSERTO;

-- Tabela de Manutenção
CREATE TABLE MANUTENCAO (
    manutencao_id INT AUTO_INCREMENT PRIMARY KEY,
    maquina_id INT NOT NULL,
    data_manutencao DATE NOT NULL,
    tipo ENUM('corretiva', 'preventiva') NOT NULL,
    descricao TEXT,
    FOREIGN KEY (maquina_id) REFERENCES MAQUINA(maquina_id) ON DELETE CASCADE
);

SELECT * FROM MANUTENCAO;

-- Tabela de Usuários
CREATE TABLE USUARIO (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo_usuario ENUM('técnico', 'administrador') NOT NULL,
    login VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL -- Armazenar hash da senha
);

-- Tabela de Logs de Ações
CREATE TABLE LOG_ACOES (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    data_acao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    descricao_acao TEXT,
    FOREIGN KEY (usuario_id) REFERENCES USUARIO(usuario_id) ON DELETE CASCADE
);

-- Tabela de Agendamentos de Manutenção
CREATE TABLE AGENDA_MANUTENCAO (
    agenda_id INT AUTO_INCREMENT PRIMARY KEY,
    maquina_id INT NOT NULL,
    data_agendada DATE NOT NULL,
    descricao TEXT,
    FOREIGN KEY (maquina_id) REFERENCES MAQUINA(maquina_id) ON DELETE CASCADE
);

-- Relacionamento entre Consertos e Peças (consertos utilizam peças)
CREATE TABLE CONSERTO_PECAS (
    conserto_id INT NOT NULL,
    peca_id INT NOT NULL,
    quantidade_usada INT NOT NULL DEFAULT 1,
    FOREIGN KEY (conserto_id) REFERENCES CONSERTO(conserto_id) ON DELETE CASCADE,
    FOREIGN KEY (peca_id) REFERENCES PECAS(peca_id) ON DELETE CASCADE,
    PRIMARY KEY (conserto_id, peca_id)
);

CREATE TABLE USUARIO (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo_usuario ENUM('técnico', 'administrador') NOT NULL,
    login VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL -- Armazenar hash da senha
);

INSERT INTO USUARIO (nome, tipo_usuario, login, senha)
VALUES ('João da Silva', 'administrador', 'root', 'root');

SELECT * FROM USUARIO;
</code></pre>

<h3>3. Execução</h3>
<p>Após garantir que o banco de dados está configurado corretamente, basta executar a aplicação através da interface gráfica (GUI). A aplicação se conectará automaticamente ao banco de dados e permitirá o gerenciamento de usuários e clientes.</p>

---

## 3. Desenvolvimento do Backend

### Funcionalidades Implementadas
O backend foi desenvolvido utilizando [tecnologias a ser especificadas], com as seguintes funcionalidades principais:

- **Cadastro de Máquinas e Peças**: Funcionalidade para adicionar, editar e remover máquinas e peças, com dados completos de cada item.
- **Registro de Consertos e Manutenções**: Permite registrar manutenções preventivas e corretivas realizadas nas máquinas, incluindo histórico detalhado.
- **Controle de Estoque**: Gerenciamento do estoque de peças e componentes, com alertas de baixo estoque e possibilidade de atualização do inventário.
- **Multi Laboratório**: Suporte para gerenciar múltiplos laboratórios, permitindo segregação de dados de acordo com cada laboratório.
- **Controle de Acesso de Usuários**: Implementação de autenticação e autorização, com diferentes permissões para usuários (administradores, técnicos).

### Tecnologias Utilizadas:
- Linguagem de Programação: [Java]
- Banco de Dados: [MySQL]

---

## 4. Desenvolvimento da Interface de Usuário

### Funcionalidades da Interface
A interface de usuário foi projetada para ser intuitiva e fácil de usar. As principais telas incluem:

- **Painel Principal**: Exibição geral do status do laboratório, incluindo máquinas em manutenção, estoque de peças e alertas de manutenção.
- **Cadastro de Máquinas e Peças**: Formulários simples para adicionar e editar máquinas e peças, com validação de dados.
- **Controle de Estoque**: Tela para visualização e atualização do estoque de peças, com filtros para localizar facilmente os itens.
- **Registro de Manutenções**: Interface para registrar novos consertos e manutenções realizadas nas máquinas.

### Tecnologias Utilizadas:
- Linguagem de Programação: [Java]

---


## 5. Controle de Acesso e Perfis de Usuário

### Perfis de Usuário Implementados
O sistema conta com diferentes níveis de acesso, garantindo a segurança e a organização das informações:

- **Administrador**: Acesso total ao sistema, podendo gerenciar usuários, laboratórios, máquinas, peças e manutenções.
- **Técnico**: Acesso para registrar manutenções, gerenciar o estoque de peças e visualizar máquinas.

---

## 6. Testes e Implementação Final

### Testes Realizados
Foram realizados testes unitários, de integração e de usabilidade para garantir a qualidade do sistema. Alguns dos testes incluem:

- **Testes de Funcionalidade**: Garantir que todas as funcionalidades do sistema estão funcionando corretamente, como cadastro de máquinas, manutenções e controle de estoque.
- **Testes de Performance**: Verificar a performance do sistema, especialmente com grandes volumes de dados, como muitas máquinas e peças.
- **Testes de Usabilidade**: Avaliar a experiência do usuário, garantindo que o sistema seja fácil de usar e intuitivo.

### Validação
Após os testes, o sistema foi validado por um grupo de usuários finais (técnicos e administradores de laboratórios), e ajustes foram feitos conforme necessário para a entrega final.

---

<h1>Documentação da Pasta <code>br.com.DTO</code></h1>

## Classe <code>UsuarioDTO</code>
A classe <code>UsuarioDTO</code> é utilizada para armazenar as informações de um usuário no sistema.

### Atributos:
- **usuario**: Nome do usuário (tipo <code>String</code>).
- **login**: Login do usuário (tipo <code>String</code>).
- **senha**: Senha do usuário (tipo <code>String</code>).
- **perfil**: Perfil do usuário (tipo <code>String</code>).

### Métodos:
- <code>getUsuario()</code>: Retorna o nome do usuário.
- <code>setUsuario(String usuario)</code>: Define o nome do usuário.
- <code>getLogin()</code>: Retorna o login do usuário.
- <code>setLogin(String login)</code>: Define o login do usuário.
- <code>getSenha()</code>: Retorna a senha do usuário.
- <code>setSenha(String senha)</code>: Define a senha do usuário.
- <code>getPerfil()</code>: Retorna o perfil do usuário.
- <code>setPerfil(String perfil)</code>: Define o perfil do usuário.

## Classe <code>CadastroMaquinaDTO</code>
A classe <code>CadastroMaquinaDTO</code> armazena as informações relacionadas ao cadastro de uma máquina no sistema.

### Atributos:
- **id**: Identificador único da máquina (tipo <code>int</code>).
- **nome**: Nome da máquina (tipo <code>String</code>).
- **modelo**: Modelo da máquina (tipo <code>String</code>).
- **dataCadastro**: Data de cadastro da máquina (tipo <code>LocalDate</code>).

### Métodos:
- <code>getId()</code>: Retorna o identificador da máquina.
- <code>setId(int id)</code>: Define o identificador da máquina.
- <code>getNome()</code>: Retorna o nome da máquina.
- <code>setNome(String nome)</code>: Define o nome da máquina.
- <code>getModelo()</code>: Retorna o modelo da máquina.
- <code>setModelo(String modelo)</code>: Define o modelo da máquina.
- <code>getDataCadastro()</code>: Retorna a data de cadastro da máquina.
- <code>setDataCadastro(LocalDate dataCadastro)</code>: Define a data de cadastro da máquina.

## Classe <code>ControlePecasDTO</code>
A classe <code>ControlePecasDTO</code> armazena informações sobre o controle de peças associadas às máquinas.

### Atributos:
- **id**: Identificador único do controle de peças (tipo <code>int</code>).
- **nomePeca**: Nome da peça (tipo <code>String</code>).
- **quantidade**: Quantidade disponível da peça (tipo <code>int</code>).
- **dataEntrada**: Data de entrada da peça (tipo <code>LocalDate</code>).

### Métodos:
- <code>getId()</code>: Retorna o identificador do controle de peças.
- <code>setId(int id)</code>: Define o identificador do controle de peças.
- <code>getNomePeca()</code>: Retorna o nome da peça.
- <code>setNomePeca(String nomePeca)</code>: Define o nome da peça.
- <code>getQuantidade()</code>: Retorna a quantidade de peças disponíveis.
- <code>setQuantidade(int quantidade)</code>: Define a quantidade de peças.
- <code>getDataEntrada()</code>: Retorna a data de entrada da peça.
- <code>setDataEntrada(LocalDate dataEntrada)</code>: Define a data de entrada da peça.

## Classe <code>GerenciamentoConsertosDTO</code>
A classe <code>GerenciamentoConsertosDTO</code> armazena informações sobre os consertos realizados nas máquinas.

### Atributos:
- **id**: Identificador único do conserto (tipo <code>int</code>).
- **descricao**: Descrição do conserto realizado (tipo <code>String</code>).
- **dataConserto**: Data em que o conserto foi realizado (tipo <code>LocalDate</code>).
- **maquinaId**: Identificador da máquina associada ao conserto (tipo <code>int</code>).

### Métodos:
- <code>getId()</code>: Retorna o identificador do conserto.
- <code>setId(int id)</code>: Define o identificador do conserto.
- <code>getDescricao()</code>: Retorna a descrição do conserto.
- <code>setDescricao(String descricao)</code>: Define a descrição do conserto.
- <code>getDataConserto()</code>: Retorna a data do conserto.
- <code>setDataConserto(LocalDate dataConserto)</code>: Define a data do conserto.
- <code>getMaquinaId()</code>: Retorna o identificador da máquina associada ao conserto.
- <code>setMaquinaId(int maquinaId)</code>: Define o identificador da máquina associada ao conserto.

## Classe <code>GerenciamentoLaboratorioDTO</code>
A classe <code>GerenciamentoLaboratorioDTO</code> armazena informações sobre os atendimentos realizados no laboratório de manutenção das máquinas.

### Atributos:
- **id**: Identificador único do atendimento no laboratório (tipo <code>int</code>).
- **descricao**: Descrição do atendimento realizado (tipo <code>String</code>).
- **dataAtendimento**: Data em que o atendimento foi realizado (tipo <code>LocalDate</code>).
- **maquinaId**: Identificador da máquina atendida no laboratório (tipo <code>int</code>).

### Métodos:
- <code>getId()</code>: Retorna o identificador do atendimento no laboratório.
- <code>setId(int id)</code>: Define o identificador do atendimento.
- <code>getDescricao()</code>: Retorna a descrição do atendimento.
- <code>setDescricao(String descricao)</code>: Define a descrição do atendimento.
- <code>getDataAtendimento()</code>: Retorna a data do atendimento.
- <code>setDataAtendimento(LocalDate dataAtendimento)</code>: Define a data do atendimento.
- <code>getMaquinaId()</code>: Retorna o identificador da máquina atendida no laboratório.
- <code>setMaquinaId(int maquinaId)</code>: Define o identificador da máquina atendida no laboratório.

---

## Conclusão
O projeto visa facilitar o gerenciamento de usuários, máquinas e serviços, integrando funcionalidades de CRUD em um sistema que interage com um banco de dados MySQL. A estrutura organizada em pacotes facilita a manutenção e a escalabilidade do sistema.

Para mais informações, consulte os comentários no código-fonte ou entre em contato com os desenvolvedores.
