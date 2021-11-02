docker run --rm -it \
  -v $(pwd):/migrations \
  -e POSTGRESQL_URL=postgres://splitgraph:splitgraph@splitgraph.splitgraph-example:5432/luckysheetdb?sslmode=disable \
  migrate/migrate create -ext sql -dir /migrations $@
