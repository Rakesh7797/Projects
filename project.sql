-- 	Q1 
SELECT 
	YEAR(issue_d) as years, 
    sum(loan_amnt) as loans_given
FROM 
    finance_1
GROUP BY YEAR(issue_d)
ORDER BY YEAR(issue_d);

-- Q2
SELECT
    grade, sub_grade, sum(revol_bal) as revol_Bal
FROM
   finance_1 INNER JOIN finance_2
    ON finance_1.id = finance_2.ï»¿id
    group by sub_grade
      order by sub_grade;

-- Q3
select 
verification_status, count(verification_status) as count_of_status,
concat((count(verification_status)*100)/39644,"%") as percentage,
 sum(total_pymnt) as total_payment
from 
finance_1 INNER JOIN finance_2
    ON finance_1.id = finance_2.ï»¿id
    group by verification_status;
    
-- Q4
select addr_state,max(last_credit_pull_d) as last_credit_pull_d, loan_status, count(loan_status), sum(total_pymnt) as total_payment
  from 
finance_1 INNER JOIN finance_2
    ON finance_1.id = finance_2.ï»¿id
    group by loan_status,addr_state,last_credit_pull_d
    order by addr_state,last_credit_pull_d desc;

-- Q5 
select 
home_ownership, max(last_pymnt_d) as last_pymnt_d, sum(loan_amnt) as total_loan_amt
from 
finance_1 INNER JOIN finance_2
    ON finance_1.id = finance_2.ï»¿id
    group by home_ownership
    order by home_ownership;