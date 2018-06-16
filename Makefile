.PHONY: plabels.tsv

lemmas.ndjson:
	./getLemmas > $@

all: labels.tsv properties.tsv plabels.tsv languages.csv base-languages.csv

labels.tsv: lemmas.ndjson
	jq -r -f extractLabels.jq $< > $@

properties.tsv: lemmas.ndjson
	jq -r '.id as $$id | .claims | keys[] | [$$id,.] | @tsv' $< > $@
	jq -r -f extractProperties.jq $< >> $@

plabels.tsv:
	wd p -l en | jq -r 'to_entries[]|[.key,.value]|@tsv' | sort > $@

languages.csv: labels.tsv
	awk '{print $$2}' labels.tsv | ./histogram | sort -nr | \
		awk '{print $$2","$$1}' > $@

base-languages.csv: labels.tsv
	awk '{sub(/-.*/,""); print $$2}' labels.tsv | ./histogram | sort -nr | \
		awk '{print $$2","$$1}' > $@
