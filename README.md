Command line scripts for processing of [lexicographical data] from Wikidata.

[lexicographical data]: https://www.wikidata.org/wiki/Wikidata:Lexicographical_data

## Usage examples

[![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/wikicite/wikidata-lemmas/master?filepath=notebook.ipynb)

Which labels contain spaces?

```shell
$ make labels.tsv
$ awk -F $'\t' '$3 ~ / / {print}' labels.tsv
```

Which properties are used how frequently on lexemes and forms?

```shell
$ make properties.tsv
$ awk '{print $2}' properties.tsv | ./histogram
```

Which language codes are used how often?

```
$ make languages.tsv
```

The following extended processings requires to [install wikidata-cli].

Which properties are used how frequently, with property labels:

```
$ make properties.tsv plabels.tsv
$ awk '{print $2}' properties.tsv | sort | join plabels.tsv - | ./histogram
```

[install wikidata-cli]: https://www.npmjs.com/package/wikidata-cli#installation
