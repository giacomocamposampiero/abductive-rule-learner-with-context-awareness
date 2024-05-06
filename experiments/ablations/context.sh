#!/bin/bash

CONFIG="distribute_four"
RUN="ablation_np_pn_superpos"
EXP_DIR="models"
EPOCHS=25
NTEST=10
NRULES=5

for SEED in $(seq 1 $NTEST);
do
    echo "Running training with seed $SEED"
    python main.py  --epochs $EPOCHS \
        --vsa_conversion --vsa_selection --shared_rules --config $CONFIG --data_dir /dccstor/saentis/data/I-RAVEN \
        --batch_size 8 --num_workers 1 --num_rules $NRULES --seed $SEED --run_name $RUN --num_term 6 --rule_type arlc \
        --exp_dir $EXP_DIR
done
python results.py --path $EXP_DIR/$RUN --seeds $NTEST
