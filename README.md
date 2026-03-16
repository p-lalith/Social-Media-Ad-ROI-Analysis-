# Social Media Ad ROI Analysis

R project analyzing social media advertising campaigns to identify key factors driving ROI and clicks. Includes regression models, insights, and actionable recommendations for optimizing ad strategies.

---

## Dataset

Social Media Advertising dataset with campaign-level records including:
- `ROI`, `Clicks`, `Impressions`, `Conversion_Rate`
- `Target_Audience`, `Channel_Used`, `Campaign_Goal`, `Duration`
- `Location`, `Customer_Segment`, `Language`

Place your dataset files in the project root as `og_media.csv` before running.

---

## Analysis

The script runs a series of linear regression models to isolate what actually drives ROI:

| Factor             | Finding                                              |
|--------------------|------------------------------------------------------|
| Clicks             | Strongest predictor of ROI — maximize clicks        |
| Target Audience    | Young men (18–24) and older women drive more clicks  |
| Channel Used       | Pinterest campaigns yield **negative ROI** — avoid  |
| Campaign Goal      | No significant impact on ROI                        |
| Duration           | No significant impact on ROI                        |
| Location           | No significant impact on ROI                        |
| Language           | No significant impact on ROI                        |

**Key takeaway:** Focus budget on click-driving audiences and avoid Pinterest.

---

## Setup

```r
source("packages.R")   # install dependencies
source("social_media_roi_analysis.R")
```

---

## Structure

```
social_media_roi_analysis.R   # Main analysis script
packages.R                    # Dependency installer
```
