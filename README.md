# STATS604 Project 3 — Green Onion Experiment

**Team:** An Pho · Dhruba Nandi · Chandler Nielsen

**Goal:** Assess effects of **water**, **sunlight**, and **storage** on green onions.  
- Freshness (partner): stratified permutation tests on proportions  
- Height (this report): stratified permutation tests on **median** day-9 length

**Data & Drive:** analysis reads from `data/`; raw images, spreadsheets, PAP, and notes:  
<https://drive.google.com/drive/folders/1-StQrIecuYIMJ1vbBB0jFSHr5SwQLyid?usp=drive_link>

## Reproducible Build
```bash
make setup   # restore R packages + TinyTeX
make         # knit src/STATS604_Proj3_Report.Rmd -> out/STATS604_Proj3_Report.pdf
```

## Repo
```
src/STATS604_Proj3_report.Rmd  # main report
data/                          # inputs (e.g., final_dataset.csv)
out/                           # outputs (created by Makefile)
Makefile, renv.lock, renv/     # reproducibility
.gitignore                     # ignores caches/build artifacts
```
