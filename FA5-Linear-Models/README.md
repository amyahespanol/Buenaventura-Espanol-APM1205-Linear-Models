
# FA 5 Linear Models: Palmer Penguins

## Group Members
- Bonn Andrei M. Buenaventura
- Amyah Espanol

## Research Question
Does penguin body mass differ according to species and sex, and does the effect of species on body mass depend on sex?

## Dataset Description
- **Dataset:** Palmer Archipelago Penguins (`penguins.csv`)
- **Source:** [Allison Horst Palmer Penguins Github](https://github.com/allisonhorst/palmerpenguins)
- **Response Variable:** `body_mass_g` (Body mass in grams)
- **Explanatory Factors:** `species` (Adelie, Chinstrap, Gentoo), `sex` (female, male)
- **Cleaned Sample Size:** N = 333

## Statistical Methods
1. **One-Way ANOVA:** Testing body mass variation across species.
2. **Dummy-Variable Regression:** OLS treatment coding equivalent to One-Way ANOVA.
3. **Two-Way Factorial ANOVA:** Testing species and sex main effects alongside their interaction.
4. **Interaction Analysis:** Interaction plots and full regression model coefficient interpretations.

## Summary of Findings
- Species ($p < 2.2 \times 10^{-16}$) and sex ($p < 2.2 \times 10^{-16}$) are statistically significant predictors of body mass.
- Gentoo penguins have the highest average body mass.
- A significant interaction ($F = 3.03, p = 0.0498$) demonstrates that male weight superiority is amplified in Gentoo penguins relative to Adelie and Chinstrap.

## Instructions for Reproducing
Run `R/FA5_Linear_Models.R` in any R environment or execute the Google Colab notebook.

