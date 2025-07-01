# Load libraries 
library(readr)   
library(psych)    
library(dplyr)    
library(purrr)    
library(broom)    
library(ggplot2)  

# Load 2024 NFL Combine dataset
Combine <- read_csv("2024_Combine.csv")

# Explore position variety in the data
unique(Combine$Pos)       # List all unique positions
length(unique(Combine$Pos))  # Count number of unique positions
table(Combine$Pos)        # Frequency table of each position

# Define a function to run a regression model flexibly for each position group
run_flexible_model <- function(df) {
  # Remove columns with too many missing values (keep columns with >=50% non-NA values)
  threshold <- 0.5
  valid_cols <- sapply(df, function(col) mean(!is.na(col))) >= threshold
  
  # Identify predictors: keep only columns not labeled Pos, Player, or Draft_round
  predictor_vars <- names(df)[valid_cols & !(names(df) %in% c("Pos", "Player", "Draft_round"))]
  
  # If no valid predictors remain, exit the function
  if (length(predictor_vars) == 0) return(NULL)
  
  # Safely build the regression formula with backticks around variable names
  formula <- as.formula(paste("Draft_round ~", paste(paste0("`", predictor_vars, "`"), collapse = " + ")))
  
  # Keep only rows with complete data for outcome and selected predictors
  df_model <- df[, c("Draft_round", predictor_vars)] %>%
    filter(complete.cases(.))
  
  # If there are fewer than 3 rows, skip the model (not enough data)
  if (nrow(df_model) < 3) return(NULL)
  
  # Fit a linear regression model
  lm(formula, data = df_model)
}

# Apply the regression function to each position group
position_models <- Combine %>%
  group_by(Pos) %>%          # Group players by position
  group_split() %>%          # Split data into a list by position
  set_names(map_chr(., ~ unique(.$Pos))) %>%  # Name each list element with the position name
  map(run_flexible_model) %>%                 # Run the modeling function for each group
  discard(is.null)          # Remove any NULL results

# View regression summaries for each specified position
summary(position_models$CB)    # Cornerback
summary(position_models$G)     # Guard
summary(position_models$RB)    # Running Back
summary(position_models$TE)    # Tight End
summary(position_models$OT)    # Offensive Tackle
summary(position_models$SAF)   # Safety
summary(position_models$WR)    # Wide Receiver
summary(position_models$LB)    # Linebacker
summary(position_models$C)     # Center
summary(position_models$EDGE)  # Edge Rusher
summary(position_models$DT)    # Defensive Tackle
summary(position_models$QB)    # Quarterback
