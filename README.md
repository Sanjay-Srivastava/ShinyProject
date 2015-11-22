# ShinyProject
## Bonus Cost Estimator
### Context

Many organizations pay their sales personnel bonus or incentive based on their performance. These employees are assigned a sales territory and an expectation of how much sales the organization expects from that sales territory. This 'expectation of sales' is called a Sales Target. At the end of the period, actual sales achieved by the salesperson is measured, and the Attainment % is calculated as 'Actual Sales' / 'Sales Target'. 

### Simulation of Attainment
No real Sales Target or Actual Sales data has been used here. Instead, the Attainment % is simulated using user's inputs.  
The following assumptions are made:

1. The Attainment % by the salespersonnel is completely random and independent of each other
2. Attainment % is normally distributed with a standard deviation of 30% (fixed, for simplicity)
3. Using the Mean Attainment and the number of sales personnel provided by the user, a random normal distribution of Attainment is simulated

### Calculation Methodology
This Attainment % is then used for calculating the bonus amount. The following bonus rules have been used for this project:

1. If the Attainment is 0% - 50%, the salesperson is not eligible for any bonus
2. If the Attainment is > 50% <= 100%, bonus is calculated as (Attainment % - 50%) * 2.5 * Base Pay
3. If the Attainment is = 100%, bonus exactly equals the Base Pay (user input)
4. If the Attainment is > 100% <= 150%, bonus is calculated as (100% + (Attainment % - 100%) * 4) * Base Pay
5. If the Attainment is > 150%, the saleperson gets the maximum bonus of 3 x Base Pay



### Calculation of Bonus

1. The calculation steps mentioned above are applied to the simulated attainment to calculate the bonus for each employee
2. The bonus amount is summed up and shown as the Total Bonus $ in UI
