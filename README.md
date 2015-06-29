# Assignments
DS assignments in R and Python

#Project structure
 Project is divided into three parts
  1. R - R source
  2. Python - Python -source
  3. data - input files

Outputs are stored into R/results and Python/results for R and Python resp. 

# Analysis - 3rd Assignment

1. Entries plotted against hour of the day with points with factorised on rain
   Motivation: To analyse which time of the day is most crowded. Further how crowd varies when there is rain and                    no-rain
   Plots - hexbin(using ggplot) factored on rain, q plot with geom=points factored on rain, q plot geom=points with             separated graphs for rain and no-rain
   Conclusions - 
      a. I started with hex bin plotting using ggplot. I observed that there are few peak hours when there is crowd.          Crowd is less in early morning until evening. Though there is an observation that entries go up slightly in          late morning. There are lot of entries observed during general commuting time for work. Effect of rain               wasn't very clear in hexbin.
      b. To analyse the effect of rain, I plotted points using qplot with points. It shows entries decrease       
         significantly in rainy times. One data point also caught my attention showing very different behaviour from          rest of the data points. This particular data point witnesses large number of entries inspite of rain. This          is a definite outlier.

2. Entries plotted against week of the day
   Motivation: To analyse how entries vary according to the day of the week.
   Plots: I plotted a line plot (Entries against weekdays).
   Conclusion: Line plot clearly shows that entries are less in numbers in weekends and they rise in weekdays.   
               Specially entries are consistently more from Tuesday till Friday
       
