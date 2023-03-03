#!/bin/bash
# rootPath=$(dirname $(readlink -f $0))
# echo $rootPath
# while read requirement; do conda install --yes $requirement || pip install $requirement; done < requirements.txt
get bert-large-uncased
get sharded_training_shards_256_test_shards_256_fraction_0.0/books_wiki_en_corpus
python3 -u pregenerate_training_data.py \
        --train_corpus books_wiki_en_corpus/ \
        --output_dir  pretraining_bert_data/ \
        --bert_model bert-large-uncased/ \
        --reduce_memory \
        --do_lower_case \
        --num_workers 16 \
        --epochs_to_generate 3 \
        --max_seq_len 128 \
        --short_seq_prob 0.1 \
        --masked_lm_prob 0.0 \
        --max_predictions_per_seq 20 
