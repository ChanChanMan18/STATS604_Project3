# ---- Paths ----
RMD=src/STATS604_Project3_Report.Rmd
OUT_DIR=out
OUT_PDF=$(OUT_DIR)/STATS604_Project3_Report.pdf
DATA_FILES=$(shell find data -type f 2>/dev/null)

.PHONY: all setup render clean

# Default target
all: render

# One-time environment setup (locked by renv)
setup:
	Rscript -e "install.packages(c('renv','rmarkdown','tinytex'), repos='https://cran.rstudio.com'); \
	            renv::restore(prompt=FALSE); \
	            if (!tinytex::is_tinytex()) tinytex::install_tinytex()"

# Knit the report (re-run when data or Rmd changes)
render: renv.lock $(RMD) $(DATA_FILES)
	mkdir -p $(OUT_DIR)
	Rscript -e "renv::restore(prompt=FALSE); \
	            rmarkdown::render('$(RMD)', \
	              output_format='pdf_document', \
	              output_file='STATS604_Project3_Report.pdf', \
	              output_dir='$(OUT_DIR)', \
	              knit_root_dir=getwd())"

# Clean build artifacts
clean:
	rm -f $(OUT_PDF) \
	      $(OUT_DIR)/STATS604_Project3_Report.tex \
	      $(OUT_DIR)/STATS604_Project3_Report.utf8.md
