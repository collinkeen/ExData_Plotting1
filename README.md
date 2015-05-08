## Introduction

This project uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set". 

* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data

* We will only be using data from the dates 2007-02-01 and
2007-02-02. 

* Please note - the original text file containing the data needs to be in the users <b>working directory</b> in order to run the R scripts.

## Making Plots
Four plots were constructed for this project, named Plot1, Plot2, Plot3 and Plot4.  Each plot has a corresponding R script file, and a PNG image of the plot.

### <a href="https://github.com/collinkeen/ExData_Plotting1/blob/master/plot1.png">Plot 1</a>
This bar graph shows active power usage over the period of the two days we evaluated (2/1/2007 and 2/2/2007).

### <a href="https://github.com/collinkeen/ExData_Plotting1/blob/master/plot2.png">Plot 2</a>
This line chart shows global active power in kilowatts during the two day period.

### <a href="https://github.com/collinkeen/ExData_Plotting1/blob/master/plot3.png">Plot 3</a>
This line chart shows energy sub-metering for three different metering areas, also over the two day period.

### <a href="https://github.com/collinkeen/ExData_Plotting1/blob/master/plot4.png">Plot 4</a>
This graph is a combination of 4 graphs; first is the chart from plot1, next is voltage shown over the two day period.  On the second row is the chart from plot 3 and finally a chart showing global reactive power usage in the same two day period.
