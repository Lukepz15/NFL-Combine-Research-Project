# NFL Combine Draft Study:  
Do Height, Weight, and Combine Success Lead to Higher Draft Selection?  
📊 A regression-based analysis of positional performance using 2024 NFL Combine data

---

## 📋 Overview  
This project investigates the relationship between NFL Combine performance metrics and NFL Draft outcomes, using the 2024 Combine class. Players are grouped by position to assess whether measurable traits like speed, explosiveness, and size statistically predict draft round placement.

Unlike previous studies that only examined drafted vs. undrafted outcomes, this project uses multiple linear regression to analyze draft round as a continuous variable, providing deeper insights for decision making.

---

## 📌 Research Objective  
To determine whether NFL Combine performance and physical stature meaningfully influence draft position.

**Key components:**  
- Independent Variables: Height, Weight, 40-yard Dash, Vertical Jump, Broad Jump, Bench Press, 3-Cone Drill, Shuttle  
- Dependent Variable: Draft Round (1–7, with 8 = undrafted)  
- Model Used: Multiple Linear Regression (by position)

---

## 📚 Background  
Past research (Tucker et al., 2024; Robbins, 2010; McGee & Burkett, 2003) generally found limited predictive value in Combine drills, but often excluded key factors like height/weight and relied on binary drafted/undrafted outcomes.

This study updates and expands the scope by:  
- Including 2024 Combine data  
- Modeling draft round placement  
- Incorporating both Combine results and physical stature  
- Running models by position, since predictors may differ by role

---

## 🧪 Methodology  
- Data Source: Pro Football Reference – 2024 Combine  
- Sample Size: 321 players  
- Tools Used: R (dplyr, purrr, broom, ggplot2)  
- Grouping: Players grouped by Pos (e.g., WR, QB, TE)  
- Filtering: Predictor variables with ≥50% missing data were excluded per group  
- Modeling Criteria: Minimum of 3 complete cases per position

---

## 📈 Regression Format  
Draft Round = β0 + β1*(Predictor 1) + β2*(Predictor 2) + ... + ε

---

## 📊 Results Summary  

| Position | Significant Predictors           | Adj. R² | p-value |
|----------|---------------------------------|---------|---------|
| TE       | Height, Weight, Vertical, Broad | 0.663   | 0.136   |
| CB       | 40-Yard Dash, Broad Jump        | 0.408   | 0.011   |
| WR       | 40-Yard Dash                   | 0.111   | 0.174   |
| DT       | Weight, 40-Yard Dash           | 0.364   | 0.058   |
| LB       | Vertical Jump (marginal)       | 0.468   | 0.085   |
| Others   | No significant predictors       | —       | —       |

---

## ✅ Findings  
- Athleticism is a strong predictor at skill positions like TE, WR, and CB  
- Tight Ends were the most predictable position group  
- Size (height/weight) mattered less than explosive traits overall  
- Some positions (QB, OT, EDGE) showed no significant relationships

---

## 📌 Key Takeaways  
- Combine metrics have position-dependent value in predicting draft status  
- Speed and explosiveness matter more than raw size for most positions  
- Modeling by position is essential to avoid misleading generalizations  
- Insights may inform Combine training, scouting strategy, and draft risk assessments

---

## ⚠️ Limitations & Future Work  
- Small sample size (one draft class)  
- Missing data in several agility drills  
- Results could be strengthened with 5–10 years of Combine data  
- Future models could include college stats, team needs, or draft order context

