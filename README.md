# sellvex-marketplace-contracts

Artefatos **gerados e aprovados** do core (`01-ARQUITETURA-E-REPOSITORIOS.md §Repositórios`). Nada aqui é editado à mão: cada arquivo é produzido por `go generate ./...` em `sellvex-marketplace-core` e publicado por `sellvex contracts-publish --local --reason "..."` a partir do core, que também grava os checksums. O core é quem manda: é lá que os contratos são gerados e que a decisão de audiência é imposta.

## Duas audiências

Cada deployable publica **dois** contratos, gerados da mesma fonte e separados pelo domínio em que respondem:

| Contrato | Domínio | Para quem |
|---|---|---|
| `openapi/public/` | `api.sellvex.com.br` | Integração com o mundo: o que uma extensão aprovada pode chamar, mais a vitrine, que não pede credencial |
| `openapi/` | `admin.sellvex.com.br` | Administração: a superfície inteira, incluindo o que só um operador ou membro de loja alcança |

O mesmo processo serve os dois; o que difere é o host. A restrição de `admin.` a chamadores permitidos é feita **na borda**, onde um endereço é confiável — e nada no backend depende disso: toda rota continua a exigir token e permissão próprios.

Quais operações entram no contrato público não é uma lista à parte: é derivado dos tipos de ator que cada rota já declara. Uma rota alcançável por `extension` é, por definição, uma que a plataforma decidiu que um terceiro pode chamar.

| Pasta | Conteúdo | Origem |
|---|---|---|
| `openapi/` | OpenAPI 3.1 administrativa de cada deployable | `sellvex-marketplace-core/api/openapi/` |
| `openapi/public/` | OpenAPI 3.1 pública de cada deployable | `sellvex-marketplace-core/api/openapi/public/` |
| `events/` | Catálogo de eventos publicados, por módulo, com versão | `sellvex-marketplace-core` (`composition.PublishedEvents`) |
| `CHECKSUMS.sha256` | SHA-256 de todo artefato | `sync.sh` |
| `COMPATIBILITY.md` | Política de compatibilidade e depreciação | política |

Versão de contrato de cada deployable está no próprio OpenAPI (`info.version`). Um `operationId`, um `code` de Problem Details ou um nome de evento nunca é renomeado nem reaproveitado (`13-CONVENCOES-E-NOMENCLATURA.md`).
