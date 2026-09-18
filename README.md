# sellvex-marketplace-contracts

Artefatos **gerados e aprovados** do core (`01-ARQUITETURA-E-REPOSITORIOS.md §Repositórios`). Nada aqui é editado à mão: cada arquivo é produzido por `go generate ./...` em `sellvex-marketplace-core` e copiado por `sync.sh`, que também grava os checksums.

| Pasta | Conteúdo | Origem |
|---|---|---|
| `openapi/` | OpenAPI 3.1 de cada deployable (`control-plane-api`, `commerce-api`, `transaction-api`) | `sellvex-marketplace-core/api/openapi/` |
| `events/` | Catálogo de eventos publicados, por módulo, com versão | `sellvex-marketplace-core` (`composition.PublishedEvents`) |
| `CHECKSUMS.sha256` | SHA-256 de todo artefato | `sync.sh` |
| `COMPATIBILITY.md` | Política de compatibilidade e depreciação | política |

Versão de contrato de cada deployable está no próprio OpenAPI (`info.version`). Um `operationId`, um `code` de Problem Details ou um nome de evento nunca é renomeado nem reaproveitado (`13-CONVENCOES-E-NOMENCLATURA.md`).
