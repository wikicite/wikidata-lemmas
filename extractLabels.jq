# extract labels from lemma data

.id as $id |
.lemmas |
.[] |
[ $id, .language, .value ] |
@tsv
