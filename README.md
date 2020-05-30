# FallRisk_RAMS2017
## About
This is a demo to demonstrate the work of fall risk assessment, from one of the research projects listed in [Suiyao Chen's Homepage](https://sites.google.com/mail.usf.edu/suiyaochen-professional/publication?authuser=0). The related paper is "Personalized Fall Risk Assessment for Long-term Care Service Improvement". The related presentation slides are "Bayesian Fall Risk Assessment For Older Adults In Assisted Living Facilities".

The paper [Personalized Fall Risk Assessment for Long-term Care Services Improvement](https://www.researchgate.net/publication/315849472_Personalized_fall_risk_assessment_for_long-term_care_services_improvement) has been published in [2017 Annual Reliability and Maintainability Symposium (RAMS)](https://ieeexplore.ieee.org/document/7889692). To cite this paper, please use 
> Suiyao Chen, William D. Kearns, James L. Fozard, Mingyang Li, "Personalized Fall Risk Assessment for Long-term Care Service Improvement", IEEE Annual Proceedings in Reliability and Maintainability Symposium (RAMS), January 23-26, 2017.

## Instructions
- **Plot.R** is used to generate the visualizaiton plot for the time-to-event data **daystofall_Plot.csv** in the **Data** folder. 

#### The plot is shown as below:
![](Plot.png)

- **Demo.R** is used to build the model and run through Openbugs. The demo illustrates the model with covariates. The full report from Openbugs is in **OutputLog_Demo.pdf**. 

#### The sample output is shown as below:
![](OpenbugsScreenshot_Demo.png)
