CHARTS := charts/generic-chart charts/sites
OUT := out

.PHONY: all lint clean package

all: package

lint:
	helm lint $(CHARTS)

package: $(CHARTS)
	mkdir -p $(OUT)
	for chart in $^; do \
		helm package $$chart -d $(OUT); \
	done
	helm repo index $(OUT) --url https://tarhvar-dev.github.io/helm-charts

clean:
	rm -rf $(OUT)
