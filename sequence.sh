#! /usr/bin/env bash

echo "Create sequence file"
echo ">seq1" > seq.fasta
cat /dev/urandom | tr -dc "ATCG" | head -c 80 | fold -w 60 >> seq.fasta
echo -e "\n" >> seq.fasta
echo ">seq2" >> seq.fasta
cat /dev/urandom | tr -dc "ATCG" | head -c 110 | fold -w 60 >> seq.fasta
echo -e "\n" >> seq.fasta

# Use seqtk: https://github.com/lh3/seqtk
echo "Get reverse complement with seqtk"
seqtk seq -r -l 60 seq.fasta > seq_r.fasta

echo -e "\nOriginal file:"
cat seq.fasta

echo -e "\nFinal file:"
cat seq_r.fasta
