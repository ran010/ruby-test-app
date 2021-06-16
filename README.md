# Desafio Ruby on Rails

## Domínio

É comum a quez lidar com projetos em que o domínio do sistema requer várias camadas de visibilidades. Seja isso a nível de policiamento de acesso a páginas por completo ou diferenciação do que é mostrado numa seção da página a depender do nível de acesso do usuário ao sistema.

Um usuário com um **papel** de administrador pode ter acesso a todas as páginas desde que contenha link para ela, mas ele mesmo também tem sua dashboard e lista de páginas nas quais tem acesso.

Por outro lado, há funcionários (Employees) com restrições variadas onde todo employee tem acesso a **mesma** dashboard e lista de recursos, mas a forma como cada um interage varia conforme sua função na empresa. Para esse desafio, considere dois tipos (ou funções) de employees: gerente (manager) e representante (agent).

## Recursos

Estes são os recursos a serem implementados para esse dominio:

* Purchase (atributos básicos e obrigatórios):
  * buyer_name
  * email
  * created_at
  * updated_at
  * status (atual estado da compra: requested, processing, cancelled, closed)
  * updated_by (quem atualizou o record)
  * notes

* Employee (atributos básicos)
  * name
  * role


Fique a vontade para variar na implementação destes recursos, mas atente-se que o teste é construído com esses modelos básicos em mente. Sugiremos manter o básico e caso precise extenda, mas não omita o que é requisitado.

## Features

O objetivo deste desafio é testar sua capacidade de aplicar padrões e melhores formas na implementação de um sistema cujas responsabilidades estão divididas conforme os usuários do sistema.

Para isso é sugerido:

* Implementar **autenticação**. Sugerimos usar a gem `devise` para isso;
* Implementar **autorização**. Pick one: pundit / cancancan;
* Implementar **visualizações**. Lidar com variações de informação numa seção da página a depender do nível do funcionário. Há padrões comuns (design patterns, como `decorators/presenters` e `adapters` que podem ser úteis ) para lidar com esse tipo de expectativa de forma que isso te ajude a gerenciar seu próprio código quando uma eventual mudança for necessária.

É esperado que o projeto contenha pelo menos 2 páginas/rotas (não necessariamente definidas com esta nomenclatura):

* '/admin'
 * Restrita **apenas** ao administrador.
 * Nesta "dashboard" você irá **listar** as compras realizadas até o momento com nome do comprador, data da compra e o atual estado dela (ver abaixo).
 * Além da página de listagem é esperado que contenha informações mais detalhadas da compra realizada e uma opção para adicionar notas
 * O campo de status será mostrado para o administrador conforme este modelo: "#{status} #{uploaded_by}" onde status é o valor do estado atual da compra e uploaded_by pode ser o nome do próprio admin ou do funcionário. Este valor assumirá o default de nome do criador da compra (i.e. o administrador)

* '/employee'
 * Restrito a funcionários e administradores
 * O funcionário **manager** poderá ver a lista de compras contendo nome do comprador, data da compra e atual estado dela.
 * O funcionário **manager** também poderá ver todos os detalhes da compra
 * O funcionário **manager** poderá alterar *apenas* o status da compra
 * O funcionário **manager** não poderá excluir a compra
 * O funcionário **agent** poderá apenas visualizar a lista de compras

#### Feature extras (situações hipotéticas e não obrigatórias):

1. O cliente gostaria que o admin fosse informado (pode ser uma simples seção na área de admin) se quantidade de compras em processamento excede pelo menos 2 vezes a quantidade de compras sendo realizadas. Esta informação será acessada com certa frequência pelo administrador.

2. Oops. Cliente tá pedindo uma mudança. Ele gostaria que o funcionário "manager" também possa *adicionar* notas as compras. Isso deve ser feito de forma que as notas existentes (na coluna 'notes') não sejam perdidas. E agora? Como lidar com essa mudança sem comprometer o que já temos? UI terá que ser revisto para permitir não apenas alteração de notas mas também adição de notas? A entitidade Purchase não mais terá um atributo de notes mas sim uma relação com outra entidade chamada notes?

## Avaliações

* Iremos avaliar a sua senioridade técnica totalmente com base na forma como você codifica, portanto, esteja atento a Clean Code, princípios SOLID, aplicações de técnicas separações de responsabilidade, coesão e desacoplamento.

* Também iremos avaliar sua experiência com base nos detalhes da forma como sua solução ao problema em questão é dado. Por exemplo: você viu a oportunidade de aplicar uma técnica que melhora alguma performance do teste e a faz de forma "legível". Ótimo. O ponto é que vocẽ tem abertura para implementar as soluções ao domínio conforme achar conveniente, mas lembre-se que você fará parte de um time e seu código precisará ser entendível por eles.

* Atente para a sua escrita de commits. Não esperamos encontrar um gerenciamento completo de flow de commits, como o uso de `git glow`, mas esperamos commits concisos e que você demonstre conhecer o essencial da ferramenta. Esperamos não ver um *push forçado* numa branch principal (`main` ou `master`) entre os commits.

* Você não será cobrado por sua habilidade no frontend (o que implica sua capacidade de lidar com javascript, jquery ou qualquer biblioteca específica ou mesmo boas técnicas para construir UX ou UI), porém conhecer html e erb template engines será útil, e pode contribuir na comparação do seu processo com outro candidato, pois isso é o básico que usamos no dia a dia dos projetos da empresa.

* Suas entregas contínuas na empresa passarão por processo de revisão de código o que implica que durante a avaliação da sua submissão a esse teste podemos avaliar como você lida com sugestões

* Queremos entender você como pessoa! Somos uma empresa de muita parceria e queremos aumentar o nosso ciclo de amigos. Buscamos manter um ambiente descontraído e com liberdade para trocas de opiniões, porém evitamos quando possível criar situações constrangedoras, o que comumente recaim sobre posições políticas. Se vocẽ se encaixa nesse perfil, também contamos com isso como *positivo* na sua avaliação!

## Testes

* Nós trabalhamos com cobertura de testes em todos os projetos. Portanto é importante que essas funcionalides sejam cobertas por testes de integração junto com testes unitários.
* Damos preferência para uso de rspec e capybara em testes de sistema e de features.

## Extras (não obrigatório)

* Represente no código uma estrutura que identifique que uma alteração de status da compra foi feito e assim algum process extra (como um email) poderia ser executado neste momento a depender da ação realizada na atualização (i.e. status mudeo de requested para processing)

* Aplique algum filtro de compras conforme o status do atributo ou nome do comprador.

* Exemplique a execução em background de algum processo. Usamos com frequência redis e sidekiq para prossassar nossas tarefas.

* Diferencie bem as responsabilidades sempre que possível. Você costuma usar os *concerns* do Rails? Eles ajudam? ActiveRecord models são realmente responsáveis por validação?


## Entrega do teste

1. [Fork](https://docs.github.com/en/github/getting-started-with-github/quickstart/fork-a-repo) esse projeto

2. Recomendamos que torne seu projeto privado e envie o convite de acesso ao avaliador;

3. Submeta uma [pull request](https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests) para a branch principal (`main`) deste repositório.

4. Nos notifique via e-mail a data do término do projeto. Iremos conferir com o commit utilizado, mas caso haja alguma divergência nos notifique.
