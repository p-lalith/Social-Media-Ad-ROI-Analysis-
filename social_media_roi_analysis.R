library(data.table)

# Cleaning data
df <- fread("Social_Media_Advertising_Dummies.csv")
head(df)

# Only touch logical or character columns
cols_to_fix <- names(df)[sapply(df, function(x) is.logical(x) || is.character(x))]

# Replace TRUE/FALSE with 1/0 only in those columns
for (col in cols_to_fix) {
  df[[col]] <- ifelse(df[[col]] == TRUE | df[[col]] == "TRUE", 1,
                      ifelse(df[[col]] == FALSE | df[[col]] == "FALSE", 0, df[[col]]))
}

head(df)

# Saving into new csv file
fwrite(df, "cleaned_social_media_data.csv")

# Opening new dataframe
df2 = fread("cleaned_social_media_data.csv")

head(df2)

# running linear regression to find ROI related to continous varibale
model_linear_regress = lm(ROI ~ Clicks + Impressions + Conversion_Rate, data=df2)
summary(model_linear_regress)

# Checking with orignial dataset
og_df = fread("og_media.csv")
head(og_df)

# Checking ROI distrubution
hist(og_df$ROI, 
     main = "Histogram of ROI",       # Title of the plot
     xlab = "ROI",                    # Label for x-axis
     ylab = "Frequency",              # Label for y-axis
     col = "lightblue",               # Color of the bars
     border = "black",                # Color of the borders of the bars
     breaks = 10)  

# More data cleaning
og_df$ROI <- as.numeric(og_df$ROI)

# Handle zero or negative ROI values before applying log transformation
# Here, I'm adding 1 to each ROI value to avoid taking log(0) or log of negative values.
og_df$log_ROI <- log(og_df$ROI + 1)

# Check the updated data frame
head(og_df)

# Checking ROI distrubution
hist(og_df$log_ROI, 
     main = "Histogram of ROI",       # Title of the plot
     xlab = "ROI",                    # Label for x-axis
     ylab = "Frequency",              # Label for y-axis
     col = "lightblue",               # Color of the bars
     border = "black",                # Color of the borders of the bars
     breaks = 10) 

# Creating linear regression models

# Looking at continous varibles
model1 = lm(log_ROI ~ Conversion_Rate + Clicks + Impressions, data = og_df)
summary(model1)

# Clicks are the most important factor with ROI, WE WANT MORE CLICKS

# Checking Target Audience
model_audiance = lm(Clicks ~ Target_Audience, data = og_df)
summary(model_audiance)

#Target_AudienceMen 25-34: Significantly lower log(ROI) than the baseline group.
#Target_AudienceMen 35-44: Significantly lower log(ROI) than the baseline group.
#Target_AudienceMen 45-60: Significantly lower log(ROI) than the baseline group.
#Target_AudienceWomen 18-24: Significantly lower log(ROI) than the baseline group.

# Key take away: Focus campaigns on young men and older women 

# Model for channel Used
model_channel = lm(log_ROI ~ Campaign_Goal, data = og_df)
summary(model_channel)

# Type of campaign we running make no impact on ROI

# Model for duration of campaign
model_duration = lm(log_ROI ~ Duration, data = og_df)
summary(model_duration)

# Duration of campaign makes no impact

# Model for social media used
model_channel = lm(log_ROI ~ Channel_Used, data = og_df)
summary(model_channel)

# Pinterest campaign is causing money to be lost, not worth using pinterest

# Model for Location
model_location = lm(log_ROI ~ Location, data = og_df)
summary(model_location)

# location makes no difference

# Model for customer segment
model_segment = lm(log_ROI ~ Customer_Segment, data = og_df)
summary(model_segment)

# Customer segment makes no impact

# Model for language
model_laguage = lm(log_ROI ~ Language, data = og_df)
summary(model_laguage)

# Language make no difference

# Interaction effect between clicks and channel used
model_click = lm( log(Clicks) ~ Channel_Used, data = og_df)
summary(model_click)

# Another model
model4 = lm(Clicks ~ Target_Audience , data = og_df)
summary(model4)
