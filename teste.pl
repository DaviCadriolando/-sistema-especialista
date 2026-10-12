local(caminhada, ao_ar_livre).
local(corrida, ao_ar_livre).
local(ciclismo, ao_ar_livre).
local(musculacao, ambiente_fechado).

intensidade(caminhada, leve).
intensidade(corrida, intensa).
intensidade(musculacao, intensa).
intensidade(ciclismo, intensa).

objetivo_atividade(corrida, condicionamento).
objetivo_atividade(musculacao, fortalecimento).
objetivo_atividade(ciclismo, condicionamento).
objetivo_atividade(futebol, lazer).
objetivo_atividade(caminhada, lazer).

tipo_atividade(futebol, grupo).
tipo_atividade(caminhada, individual).
tipo_atividade(corrida, individual).
tipo_atividade(ciclismo, individual).
tipo_atividade(musculacao, individual).

recomendar(caminhada, PrefLocal, _, _, PrefIntensidade) :-
    local(caminhada, LocalAtividade),
    LocalAtividade == PrefLocal,
    intensidade(caminhada, IntensidadeAtividade),
    IntensidadeAtividade == PrefIntensidade.

recomendar(corrida, PrefLocal, _, PrefObjetivo, _) :-
    local(corrida, LocalAtividade),
    LocalAtividade == PrefLocal,
    objetivo_atividade(corrida, ObjAtividade),
    ObjAtividade == PrefObjetivo.

recomendar(musculacao, PrefLocal, _, PrefObjetivo, _) :-
    local(musculacao, LocalAtividade),
    LocalAtividade == PrefLocal,
    objetivo_atividade(musculacao, ObjAtividade),
    ObjAtividade == PrefObjetivo.

recomendar(futebol, _, PrefTipo, PrefObjetivo, _) :-
    tipo_atividade(futebol, TipoAtividade),
    TipoAtividade == PrefTipo,
    objetivo_atividade(futebol, ObjAtividade),
    ObjAtividade == PrefObjetivo.

recomendar(ciclismo, PrefLocal, _, PrefObjetivo, _) :-
    local(ciclismo, LocalAtividade),
    (LocalAtividade == PrefLocal ; PrefObjetivo == condicionamento).

iniciar :-
    writeln('=== Sistema Especialista de Recomendacao de Exercicios ==='),
    writeln('Informe a preferencia de local (ao_ar_livre ou ambiente_fechado):'),
    read(Local),
    writeln('Informe o tipo (individual ou grupo):'),
    read(Tipo),
    writeln('Informe o objetivo principal (condicionamento, lazer ou fortalecimento):'),
    read(Objetivo),
    writeln('Informe a intensidade (leve ou intensa):'),
    read(Intensidade),
    writeln('--------------------------------------------------'),
    writeln('Atividades recomendadas para voce:'),
    (recomendar(caminhada, Local, Tipo, Objetivo, Intensidade) -> writeln('- Caminhada'); true),
    (recomendar(corrida, Local, Tipo, Objetivo, Intensidade) -> writeln('- Corrida'); true),
    (recomendar(musculacao, Local, Tipo, Objetivo, Intensidade) -> writeln('- Musculacao'); true),
    (recomendar(futebol, Local, Tipo, Objetivo, Intensidade) -> writeln('- Futebol'); true),
    (recomendar(ciclismo, Local, Tipo, Objetivo, Intensidade) -> writeln('- Ciclismo'); true),
    writeln('--------------------------------------------------').