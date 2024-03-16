# Football Viz and Modelling (UNDER WORK)

Welcome to Football Viz and Modelling! This repository contains functions for visualizing football data and creating scatter plots.

# Function Overview

## scatter_viz_players

I've developed a versatile function that generates scatter plots using football data. Simply select the league, variables for the axes, and the season to get started!


### How to Use
1. **Get Your Football Data**: Obtain your football data with the required variables(player_id,player_name,team_name,league_id, season).
2. **Choose the League**: Select the league of interest.
3. **Select Axes Variables**: Choose the variables for the X and Y axes.
4. **Specify the Season**: Define the season you want to analyze.
5. *(Optional)* **Customize Outliers**: Adjust the multiplier value for standard deviation to identify outliers.
   

### Example: Ligue 1 22/23
Here's an example from Ligue 1's 2022/2023 season, featuring the variables xG (Expected Goals) and xAG (Expected Assists Goals). 

- The red dots indicate outliers in the data
- There is hover-over information on all points in the created HTML 

## Visualization

<div style="text-align:center">
  <img src="https://github.com/Johhed15/Football/blob/main/test_plot.png" alt="Test Image" width="800" titel='Ligue 1 2022/2023 xG-xAG Scatter Plot'/>
</div>

*Note*: README files on GitHub can't display interactive HTML content, so the Plotly image has been saved as a PNG. If you'd like to interact with the plot and explore its functionalities, you can watch the HTML file from the link below:

[Link to Ligue 1 2022/2023 xG-xAG Scatter Plot HTML(Created with Raw.githack.com)](https://raw.githack.com/Johhed15/Football/main/ligue1_22_23_xg_xag.html)

Or download it from this repository:

[Download Ligue 1 2022/2023 xG-xAG Scatter Plot HTML](https://github.com/Johhed15/Football/blob/main/ligue1_22_23_xg_xag.html)
