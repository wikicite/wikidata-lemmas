Command line scripts for processing of [lexicographical data] from Wikidata.

[lexicographical data]: https://www.wikidata.org/wiki/Wikidata:Lexicographical_data

## Usage examples

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
