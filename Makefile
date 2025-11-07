# ---- Paths ----
RMD=src/STATS604_Project3_Report.Rmd
OUT_DIR=src
OUT_PDF=$(OUT_DIR)/STATS604_Project3_Report.pdf
DATA_FILES=$(shell find data -type f 2>/dev/null)

.PHONY: all setup render clean

# Default target
all: render

# One-time environment setup (without renv)
setup:
	Rscript -e "install.packages(c('rmarkdown','tinytex','dplyr','tidyr','ggplot2','stringr','forcats','rlang','scales','knitr'), repos='https://cran.rstudio.com'); \
	            if (!tinytex::is_tinytex()) tinytex::install_tinytex(); \
	            if (!rmarkdown::pandoc_available()) rmarkdown::find_pandoc(cache=FALSE)"
	@echo "Checking pandoc installation..."
	@if ! command -v pandoc &> /dev/null; then \
		echo "Pandoc not found. Installing via Homebrew..."; \
		if command -v brew &> /dev/null; then \
			brew install pandoc; \
		else \
			echo "ERROR: Please install pandoc manually:"; \
			echo "  Option 1: Install Homebrew, then run 'brew install pandoc'"; \
			echo "  Option 2: Download from https://pandoc.org/installing.html"; \
			exit 1; \
		fi \
	else \
		echo "Pandoc found: $$(pandoc --version | head -n1)"; \
	fi

# Knit the report (re-run when data or Rmd changes)
render: $(RMD) $(DATA_FILES)
	mkdir -p $(OUT_DIR)
	Rscript -e "rmarkdown::render('$(RMD)', \
	              output_format='pdf_document', \
	              output_file='STATS604_Project3_Report.pdf', \
	              output_dir='$(OUT_DIR)')"

# Clean build artifacts
clean:
	rm -f $(OUT_PDF) \
	      $(OUT_DIR)/STATS604_Project3_Report.tex \
	      $(OUT_DIR)/STATS604_Project3_Report.utf8.md

