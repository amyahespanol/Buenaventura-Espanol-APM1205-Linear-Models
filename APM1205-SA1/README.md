# APM1205 Summative Assessment 1: Comprehensive Linear Modeling Analysis

## Student Information
* **Students:** Bonn Andrei M. Buenaventura | Amyah Espanol[cite: 36]
* **Course:** APM1205 Linear Models[cite: 36]

## Assessment Title
* Summative Assessment 1: Comprehensive Linear Modeling Analysis[cite: 36]

## Dataset Source
* **Dataset:** Seoul Bike Sharing Demand Dataset[cite: 36]
* **Repository:** UCI Machine Learning Repository[cite: 36]
* **URL:** [UCI ML Repository - Seoul Bike Sharing Demand](https://archive.ics.uci.edu/ml/machine-learning-databases/00560/SeoulBikeData.csv)[cite: 38]

## Research Question
To investigate how environmental conditions and seasonal shifts drive hourly bicycle rental demand using the General Linear Model (GLM) framework, specifically addressing:
1. **Simple Linear Regression (Marginal Thermal Effect):** Does ambient air temperature significantly explain variations in hourly rented bike counts?[cite: 1]
2. **Multiple Linear Regression (Partial Meteorological Effects):** To what extent do temperature, relative humidity, wind speed, solar radiation, and rainfall jointly explain demand when controlling for one another?[cite: 1, 2]
3. **Categorical / ANOVA (Seasonal Regimes):** Does mean hourly bike demand differ significantly across the four meteorological seasons, both unconditionally and after adjusting for weather covariates?[cite: 2]

## Software Used
* **Python** (Google Colab / Local Jupyter Environment)[cite: 36]

## Brief Description of the Analysis
This study performs a rigorous linear modeling analysis across $n = 8,760$ hourly records spanning all four meteorological seasons[cite: 2, 39]. The workflow covers data inspection, exploratory data analysis (EDA) with LOWESS smoothers and correlation heatmaps[cite: 6], simple and multiple linear regression modeling[cite: 10, 13], matrix formulation and least-squares theory validation via manual $X^T X$ matrix algebra[cite: 19], dummy-variable coding and ANCOVA for seasonal regimes[cite: 21, 22], two-way holiday-season interaction models[cite: 27], and comprehensive Gauss-Markov diagnostic checks (linearity, homoscedasticity, normality, and independence)[cite: 32].

## Required Packages / Libraries
To run this analysis successfully, ensure the following Python libraries are installed in your environment:
* `pandas`[cite: 36]
* `numpy`
* `matplotlib`[cite: 36]
* `seaborn`[cite: 36]
* `scipy`
* `statsmodels`[cite: 36]

You can install all dependencies via pip:
```bash
pip install pandas numpy matplotlib seaborn scipy statsmodels