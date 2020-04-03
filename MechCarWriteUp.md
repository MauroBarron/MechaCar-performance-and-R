# Module 15 Challenge - Improving MechaCar performance.	
Statistical analysis of fictional automaker production data, using R, to run an MPG regression, a Suspension Coil Summary, and a Suspension Coil T-Test, *and a study of my own,*.

### Contents. 

1. MPG Regression. Assessing degree to which design features affect MPG.
2. Suspension Coil Summary. Summary statistics for suspension coil pounds per inch measure (PSI).
3. Suspension Coil T-test. Comparison of the PSI mean to a given population mean of 1,500 PSI.
4. MechaCar performance and car color. Design of a study to help MechaCar refine its prototype color options.

### MPG Regression

*Requirement:* Design a linear model that predicts the mpg of the MechaCar prototype using  four design features of length, weight, spoiler angle and ground clearance.

*Data cleaning and transformations:* 

- Variable names required removal of spaces in order for the geom_density function to  draw the distribution line in plots. Replaced spaced with underscores.
- Vehicle length required a mutation to log10 for normalization, which was added to dataset as new computed variable.

*Distribution of five numerical variables in analysis:*

- Vehicle Length: Shapiro test shows data is not normally distributed with right skew and a p value of 0.008003.   Shapiro test p value with log10 calculated at 0. 07, which makes it useful, so for regression analysis this variable is used with a log10 adjustment.
- Vehicle weight, spoiler angle, ground clearance,  and mpg all have distributions that pass the Shapiro test and distribution curves appear to be relatively normal. 

*Correlation Matrix:*   The correlation matrix shows a moderate relationship between vehicle length and mpg. Ground clearance also appears to be a slightly moderate factor while the weight and spoiler angle relationships are weak.  

                             mpg
vehicle_length_log10  	0.60556816
vehicle_weight        		 0.09068314
spoiler_angle                  -0.02083999
ground_clearance           0.32874886



*Multiple Linear Regression and Linear Model:* Given the above analysis, it seems reasonable that a a linear model for predicting mpg based on these four variables really needs to include only vehicle length and ground_clearance as they appear to be the only two significant factors. Vehicle weight included in the model for sake of curiosity.

Of the three variables in the model both ground clearance and vehicle length had significantly high probability values of  3.40e-08 and 4.15e-12 respectively, while weight was significant only at the tenth degree.

*MPG Linear Model Conclusion:*  With a Multiple R-Squared of 0.69 this model appears to account for a large degree of the variance in mpg. This effectively means that approximately half of the variance in mpg is accounted for by this model. The accompanying  p-value of 8.675e-12 obliterates the null hypothesis.  The slope is not considered to be zero because zero implies the model is weak and  does not predict anything. 

Overall the model does moderately predict mpg effectively, in particular length and ground clearance combine to account for a large amount of the variance. It would be interesting to have other measures that can help improve this model.

### Suspension Coil Summary (PSI)

*Requirement:* Calculate summary statistics for a suspension coil PSI measure.  Does the variance of the suspension coils stay within 100 PSI as per design specifications?

*PSI Analysis:*  

The  Shapiro test for normalcy and a plotted distribution curve show an even distribution with a narrow bell, indicating the majoring of data is within a narrow range.  The 1st and 3rd quartiles are within two points of the mean and median, while the Min and Max values are about fifty points from the mean which again reflects a very narrow distribution for most of the data.  This distribution is visually confirmed with a density plot as well as a box plot.	

> Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
> 1452    1498    1500    1499    1501    1542 

> Min_PSI 	Mean_PSI 	Median_PSI	Max_PSI  Std_Dev 		Variance
> 1452			1498.78       1500    			1542     	7.892627 	  62.29356

Review of the summary statistics confirms a wide data range caused by a fair amount of outliers on both sides of the distribution. The minimum and maximum measures are both far beyond the mean and medium by 7-8 multiples of the standard deviation. 

While mathematically, visually, and statistically, there is large variance in the distribution, the variance of 62.3 does fall below the quality control standard of 100 lbs PSI as per design specifications, but something is not right obviously as indicated by the outliers.   

Exploring further we can see the large variance is due to one bad lot, Lot3.

######   Lot 		Min 		Mean 	Median 	Max_PSI 	Std_Dev Variance

 Lot1        1498      1500       1500     	1502        	0.990    0.980
 Lot2        1494      1500       1500     	1506        	2.73   	 7.47 
 Lot3        1452      1496       1498    	 1542       	13.0    	170. 

*PSI Summary:*  When comparing variance by Manufacturing Lot, its clear the high variance is coming from Lot 3.   Based on the design specifications, Lots 1 and 2 are well within the Variance allowance of 100, but Lot 3's variance of 170 obviously indicates a problem with the lot, and probably a problem in the manufacturing process that will be seen in subsequent lots if not corrected.

### Suspension Coil T-test

*Requirement:* Compare the PSI mean to a given population mean of 1,500 PSI.

*Analysis:* A single sample two-sided t-test returns a p-value of .06.  This effectively means that the coil PSI mean of 1498.8 is not statistically significant from a given mean of 1,500 at a normal acceptance level of .05.  

*Summary:*  This finding should raise a bit of an alarm over a problem with this sample.  It may be that MechaCar has .01 or even a .005 standard for their specifications, in which case this sample would alarmingly fail. In the real world I believe these results would quickly grab the attention of a QA engineer.

### MechaCar performance and car color.

*Requirement:* Write a short description of a statistical study that can quantify how the MechaCar outperforms the competition .

*Overall Study Design*  Execute a survey containing a short questionnaire that inquires as to the customer's current vehicle's color, their favorite car color,  and the importance of color as a factor when purchasing a car using a rank scale. 

*Study Population*  Recommend a random sample survey that includes all MechaCar markets. At a 95% confidence level we would need to sample approximately 400 respondents. 

*Question 1* . To what degree is the actual distribution of car colors related to preferred car colors?

- Null hypothesis: Actual distribution of car colors is unrelated to distribution of color preferences.
- Alternative hypothesis: Distribution of car colors is related to distribution of color preference.
- Statistical Test: Chi-squared test to measure difference of color distributions between actual color distributions and stated color preference distributions.

*Question 2* . How does actual distribution of car colors compare with preferred color distribution with regards to importance of color?

- Null hypothesis: There is no difference in color importance ranking  between actual car color distributions and preferred car color distributions.
- Alternative hypothesis: There is a difference in color importance rankings between actual car color distributions and preferred car color distributions.
- Statistical Tests: A two-sample t-test can be used to compare the color importance rankings between actual color distributions and preferred color distributions.

*Expected Summary of Analysis* .  This study should help MechaCar refine its color options in its new car.  With study completed, we should know the current distribution of car colors, preferred car colors, and the importance of color in selecting a car. We also will be able to determine the degree to which stated color preference relates to actual color distribution. In short, we'll know actual and preferred car colors among the general population, and we'll also know how much people really care about color when purchasing a car.