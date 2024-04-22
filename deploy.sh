#!/bin/bash

# IMPORTANT: this must match the chart version at `$CHART_PATH/Chart.yaml`
CHART_VERSION=0.2.3
CHART=fianu
CHART_PATH=charts/openfga
NAME=openfga

deploy() {
    helm package $CHART_PATH

    helm gcs push "$NAME-$CHART_VERSION.tgz" $CHART  --force=true

    rm -f "$NAME-$CHART_VERSION.tgz"

    sleep 5

    helm repo update $CHART
}

deploy