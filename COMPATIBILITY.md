# Política de compatibilidade

- Contratos seguem SemVer por deployable. Adicionar operação, campo opcional ou evento é compatível; remover, renomear ou tornar obrigatório é incompatível e exige versão maior e ADR no core.
- Toda operação, campo e evento removido passa por depreciação declarada no OpenAPI (`deprecated: true`) por ao menos uma versão menor antes da remoção.
- `type` de Problem Details aponta para a documentação do código e é estável para sempre; `code` nunca é reaproveitado.
- Eventos são versionados por sufixo `.v<N>`; uma versão nova convive com a anterior até que nenhum consumidor a use.
- Módulos externos declaram no manifesto as versões de contrato que suportam; o core não é liberado se quebrar módulos dentro da política de suporte (`05-SDK-MODULOS-E-EQUIPES-EXTERNAS.md`).
