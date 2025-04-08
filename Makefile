
.PHONY: clean answer test index upload_QAgen download_QAgen parse


# BI EE
TEST_FIELD = BI
# Qwen-VL-3B Qwen-VL-7B Qwen-VL-32B
MODEL = Qwen-VL-3B
# True False
RAG_EN = True
# sbatch cmd

answer:
	./run_cmd/run_demo.sh --model_type $(MODEL) --rag_en $(RAG_EN) --test_field $(TEST_FIELD)

test:
	./run_cmd/test.sh

index:
	./run_cmd/build_index.sh

# local cmd

PYTHON = /home/liusiyuan/.conda/envs/VisRAG/bin/python
BUILD_SCRIPT = scripts/demo/visrag_pipeline/build_QA.py
PARSE_SCRIPT = scripts/demo/visrag_pipeline/parse_QA.py

upload_QAgen:
	$(PYTHON) $(BUILD_SCRIPT) --action upload --test_field $(TEST_FIELD)

download_QAgen:
	$(PYTHON) $(BUILD_SCRIPT) --action download --test_field $(TEST_FIELD)
parse:
	$(PYTHON) $(PARSE_SCRIPT)

clean:
	rm slurm-*.out