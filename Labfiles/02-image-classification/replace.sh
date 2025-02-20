#!/bin/sh
storageAcct='<storageAcct>'
sed -i "s/<storageAcct>/$storageAcct/g" training-images/training_labels.json