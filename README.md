# Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model).

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place:

    git clone https://github.com/bricksdont/pytorch-rnn-lm
    cd pytorch-rnn-lm

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

    ./scripts/install_packages.sh

Download and preprocess data:

    ./scripts/download_data.sh

Train a model:

    ./scripts/train.sh

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Table for training parameter changes:

Number of epochs    Embedding size  Hidden size Dropout     Test loss   PPL         Time
 40                 200             200         0.5         4.66        105.69      433 sec
 40                 100             100         0.5         4.69        108.58      228 sec
 40                 200             200         0.6         4.67        106.58      425 sec
 40                 300             300         0.5         4.62        101.79      714 sec
 40                 400             400         0.5         4.63        102.32      1091 sec
 40                 500             500         0.5         4.66        105.9       1694 sec
 40                 300             300         0.7         4.65        104.29      777 sec
 40                 300             300         0.4         4.65        104.39      717 sec
 
 
 The best parameters are: 40-300-0.5
 
 


Generate (sample) some text from a trained model with:

    ./scripts/generate.sh
