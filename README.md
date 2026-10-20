# Land, Labor, and Maize Production in R

This repository contains my R code for an ARE 106 homework assignment at the University of California, Davis. The assignment examines the relationship between land, labor, and maize production using a course dataset described as farm observations from Michoacan, Mexico, in 1983 and 1989.

## Analysis

The script:

- Estimates a linear regression of maize output on land and labor.
- Plots residuals against land and labor inputs.
- Tests for heteroskedasticity using an auxiliary specification with squared inputs and their interaction.
- Calculates heteroskedasticity-robust standard errors and approximate 95% confidence intervals for the linear model.
- Estimates a log-log regression, plots its residuals, tests for heteroskedasticity, and calculates conventional 95% confidence intervals.

The regressions describe associations and do not establish causal effects.

## Data

The course file is named `ARE106_HW3_S2025.RData` and contains a dataset called `D` with these variables:

- `Q`: Maize output in metric tons.
- `K`: Land input in hectares.
- `L`: Labor input in person-days.
- `year`: Observation year.

The course dataset is not included in this repository.

## How to run

1. Obtain an authorized copy of the course dataset.
2. Put `analysis.R` and `ARE106_HW3_S2025.RData` in the same folder.
3. Open RStudio and set that folder as the working directory.
4. Open `analysis.R` and run the code in order. The first lines install the required packages: `car`, `lmtest`, and `sandwich`.

Model output appears in the console, and graphs appear in the Plots pane. The script does not automatically save graphs or results to files.

## Acknowledgment

This is coursework, not an independent research project. The executable code is unchanged from my original submission; homework question comments have been replaced with descriptive section headings.
