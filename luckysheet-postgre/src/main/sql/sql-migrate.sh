docker run --rm -it \
  -v $(pwd):/migrations \
  migrate/migrate -database postgres://splitgraph:splitgraph@splitgraph.splitgraph-example:5432/luckysheetdb?sslmode=disable -path=/migrations/ $@
