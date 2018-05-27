.PHONY: plabels.tsv

lemmas.ndjson:
	./getLemmas > $@

labels.tsv: lemmas.ndjson
	jq -r -f extractLabels.jq $< > $@

properties.tsv: lemmas.ndjson
	jq -r '.id as $$id | .claims | keys[] | [$$id,.] | @tsv' $< > $@
	jq -r -f extractProperties.jq $< >> $@

plabels.tsv:
	wd p -l en | jq -r 'to_entries[]|[.key,.value]|@tsv' | sort > $@
