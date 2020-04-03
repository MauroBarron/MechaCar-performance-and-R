#### Module 15 Challenge.

### Part One: MPG Regression

## Dependencies
library(tidyverse)

## Read the MechaCar MPG  Dataset. A CSV file.
mpg_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

## Check shape and distribution variables

## Vehicle Length Analysis

# Rename var
mpg_table <- mpg_table %>% rename(vehicle_length = "vehicle length") 


# Shapiro test
shapiro.test(mpg_table$vehicle_length)
shapiro.test(log10(mpg_table$vehicle_length))

# plot the distribution curve
pltvl <- ggplot(mpg_table,aes(x=vehicle_length)) #import dataset into ggplot2
pltvl + geom_density() #visualize distribution using density plo

# plot a log distribution curve.
pltvlog <- ggplot(mpg_table,aes(x=log(vehicle_length))) #import dataset into ggplot2
pltvlog + geom_density() #visualize distribution using density plo

# Create a new column using mutate that is the log 10 of vehicle length for further usage.
mpg_table <- mpg_table %>% mutate(vehicle_length_log10=log10(vehicle_length)) #add columns to original data frame

## Vehicle Weight Analysis

# Rename var  
colnames(mpg_table)
mpg_table <- mpg_table %>% rename(vehicle_weight = "vehicle weight") 

# Shapiro test
shapiro.test(mpg_table$vehicle_weight)

# plot the distribution curve
pltwt <- ggplot(mpg_table,aes(x=vehicle_weight)) #import dataset into ggplot2
pltwt + geom_density() #visualize distribution using density plot

## Spoiler Angle Analysis

# Rename var  
mpg_table <- mpg_table %>% rename(spoiler_angle = "spoiler angle") 
colnames(mpg_table)

# Shapiro test
shapiro.test(mpg_table$spoiler_angle)

# plot the distribution curve
pltsp <- ggplot(mpg_table,aes(x=spoiler_angle)) #import dataset into ggplot2
pltsp + geom_density() #visualize distribution using density plot

## Ground Clearance Analysis

# Rename var  
mpg_table <- mpg_table %>% rename(ground_clearance = "ground clearance") 
colnames(mpg_table)

# Shapiro test
shapiro.test(mpg_table$ground_clearance)

# plot the distribution curve
pltsp <- ggplot(mpg_table,aes(x=ground_clearance)) #import dataset into ggplot2
pltsp + geom_density() #visualize distribution using density plot

## MPG Analysis

# Shapiro test
shapiro.test(mpg_table$mpg)

# plot the distribution curve
pltsp <- ggplot(mpg_table,aes(x=mpg)) #import dataset into ggplot2
pltsp + geom_density() #visualize distribution using density plot

## Correlation Matrix
mpg_matrix <- as.matrix(mpg_table[,c("vehicle_length_log10", "vehicle_weight","spoiler_angle","ground_clearance","mpg")]) #convert data frame into numeric matrix
cor(mpg_matrix)

# Linear Model
lm(mpg ~ vehicle_length_log10 + ground_clearance + vehicle_weight,data=mpg_table) #generate multiple linear regression model
summary(lm(mpg ~ vehicle_length_log10 + ground_clearance + vehicle_weight,data=mpg_table)) #generate multiple linear regression model


### Part Two: Suspension Coil Summary
##  Create a summary statistics table for the suspension coil's pounds-per-inch continuous variable.
##  Be sure to include the following metrics: Mean, Median, Variance, Standard deviation.

# Read the MechaCar MPG  Dataset. A CSV file.
coil_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# Shapiro test 
shapiro.test(coil_table$PSI)

# plot the distribution
pltpsi <- ggplot(coil_table,aes(x=PSI)) #import dataset into ggplot2
pltpsi + geom_density() #visualize distribution using density plot
pltpsi + geom_boxplot(outlier.colour = "red") #add boxplot

# summarize data in table. Two ways to do this.
psi_summary <- coil_table %>% group_by(Manufacturing_Lot) %>% summarize(Min_PSI=min(PSI), Mean_PSI=mean(PSI), Median_PSI=median(PSI), Max_PSI=max(PSI), Standard_Dev=sd(PSI), Variance=var(PSI))
psi_summary
summary(coil_table$PSI) 


### Part Three: Suspension T-Test
##  PSI mean vs given population mean of 1,500

t.test(coil_table$PSI, mu=1500) #compare sample versus population means

