#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools

mkdir -p $models

num_threads=4
device=""

SECONDS=0

for embedding_size in 100 200 300; do
  (cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/trump \
        --epochs 40 \
        --emsize $embedding_size --nhid 200 --dropout 0.5 --tied \
        --save $models/model.$embedding_size.pt
  )
done

echo "time taken:"
echo "$SECONDS seconds"
