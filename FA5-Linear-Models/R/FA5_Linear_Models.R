
# ==============================================================================
# APM1205 Linear Models Formative Assessment 5
# Group Members: Bonn Andrei M. Buenaventura | Amyah Espanol
# Dataset: Palmer Penguins
# ==============================================================================

# ------------------------------------------------------------------------------
# Part A: Data Preparation
# ------------------------------------------------------------------------------
url <- paste0(
  "https://raw.githubusercontent.com/",
  "allisonhorst/palmerpenguins/main/",
  "inst/extdata/penguins.csv"
)
penguins <- read.csv(url)

# Examine structure
str(penguins)
summary(penguins)

# Clean dataset
penguins_clean <- subset(
  penguins,
  !is.na(body_mass_g) & !is.na(species) & !is.na(sex)
)

penguins_clean$species <- factor(penguins_clean$species)
penguins_clean$sex <- factor(penguins_clean$sex)

cat("Final sample size:", nrow(penguins_clean), "
")

# ------------------------------------------------------------------------------
# Part B: Exploratory Data Analysis
# ------------------------------------------------------------------------------
cat("
--- Overall Body Mass (g) ---
")
print(c(Mean = mean(penguins_clean$body_mass_g),
        SD = sd(penguins_clean$body_mass_g),
        Min = min(penguins_clean$body_mass_g),
        Max = max(penguins_clean$body_mass_g)))

cat("
--- By Species ---
")
print(aggregate(body_mass_g ~ species, data = penguins_clean,
                FUN = function(x) c(mean = mean(x), sd = sd(x), n = length(x))))

cat("
--- By Sex ---
")
print(aggregate(body_mass_g ~ sex, data = penguins_clean,
                FUN = function(x) c(mean = mean(x), sd = sd(x), n = length(x))))

cat("
--- By Species x Sex ---
")
print(aggregate(body_mass_g ~ species + sex, data = penguins_clean,
                FUN = function(x) c(mean = mean(x), sd = sd(x), n = length(x))))

# Save Boxplot
if (!dir.exists("figures")) dir.create("figures")

png("figures/body_mass_by_species.png", width = 800, height = 500, res = 100)
par(mfrow = c(1, 2))
boxplot(body_mass_g ~ species, data = penguins_clean,
        main = "Body Mass by Species", col = c("darkorange", "purple", "cyan4"),
        ylab = "Body Mass (g)", xlab = "Species")
boxplot(body_mass_g ~ sex, data = penguins_clean,
        main = "Body Mass by Sex", col = c("pink", "lightblue"),
        ylab = "Body Mass (g)", xlab = "Sex")
dev.off()

# ------------------------------------------------------------------------------
# Part C: One-Way ANOVA
# ------------------------------------------------------------------------------
oneway_model <- aov(body_mass_g ~ species, data = penguins_clean)
summary(oneway_model)

# ------------------------------------------------------------------------------
# Part D: Dummy-Variable Regression
# ------------------------------------------------------------------------------
dummy_model <- lm(body_mass_g ~ species, data = penguins_clean)
summary(dummy_model)

# ------------------------------------------------------------------------------
# Part E: Two-Way ANOVA
# ------------------------------------------------------------------------------
twoway_model <- aov(body_mass_g ~ species * sex, data = penguins_clean)
summary(twoway_model)

# ------------------------------------------------------------------------------
# Part F: Interaction Analysis & Plot
# ------------------------------------------------------------------------------
png("figures/species_sex_interaction.png", width = 800, height = 500, res = 100)
interaction.plot(
  x.factor = penguins_clean$species,
  trace.factor = penguins_clean$sex,
  response = penguins_clean$body_mass_g,
  fun = mean,
  type = "b",
  col = c("darkorange", "cyan4"),
  pch = c(16, 17),
  leg.bty = "o",
  xlab = "Penguin Species",
  ylab = "Mean Body Mass (g)",
  trace.label = "Sex",
  main = "Interaction Plot: Species x Sex on Body Mass"
)
dev.off()

# ------------------------------------------------------------------------------
# Part G: Full Regression Model
# ------------------------------------------------------------------------------
full_model <- lm(body_mass_g ~ species * sex, data = penguins_clean)
summary(full_model)
anova(full_model)

