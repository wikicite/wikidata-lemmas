lemmas.ndjson:
	./getLemmas > $@

labels.tsv: lemmas.ndjson
	jq -r -f extractLabels.jq $< > $@
