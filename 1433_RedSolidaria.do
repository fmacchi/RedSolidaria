cd "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308"

****************************************************************************
*Keep the same outcomes of interest across all the Latinobarometro datasets
****************************************************************************
use "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/2003_LatinoBarometro_ElSalvador.dta"
keep if idenpa==222
keep numinves idenpa numentre reg ciudad tamciud comdist p1st p6st p15st p60st p28n
rename p60st leftRight
rename p15st satisfacDemocracy
rename p6st futurePersonalEconomics
rename p28n taxes
rename p1st economicSituation
save "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2003_editedSurvey", replace

use "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/2004_LatinoBarometro_ElSalvador.dta", clear
keep if idenpa==222
keep numinves numentre idenpa reg ciudad tamciud comdist p2st p7st p14st p87st
rename p2st economicSituation
rename p7st futurePersonalEconomics
rename p14st satisfacDemocracy
rename p87st leftRight
save "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2004_editedSurvey", replace

use "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/2005_LatinoBarometro_ElSalvador.dta", clear
keep if idenpa==222
keep numinves idenpa numentre reg ciudad tamciud comdist p2st p7st p18st p34st p77st
rename p2st economicSituation
rename p7st futurePersonalEconomics
rename p18st satisfacDemocracy
rename p34st leftRight
rename p77st taxes
save "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2005_editedSurvey", replace

use "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/2006_LatinoBarometro_ElSalvador.dta", clear
keep if idenpa==222
keep numinves idenpa numentre reg ciudad tamciud comdist p2st p7st p21st p47st
rename p2st economicSituation
rename p7st futurePersonalEconomics
rename p21st satisfacDemocracy
rename p47st leftRight
save "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2006_editedSurvey", replace

use "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/2007_LatinoBarometro_ElSalvador.dta", clear
keep if idenpa==222
keep numinves idenpa numentre reg ciudad tamciud comdist p3st p99st p67st p12st p94st
rename p3st economicSituation
rename p99st futurePersonalEconomics
rename p12st satisfacDemocracy
rename p67st leftRight
rename p94st taxes
save "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2007_editedSurvey", replace
 
use "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/2008_LatinoBarometro_ElSalvador.dta", clear
keep if idenpa==222
keep numinves idenpa numentre reg ciudad tamciud comdist p4st p11st p22st_a p56st
rename p4st economicSituation
rename p11st futurePersonalEconomics
rename p22st_a satisfacDemocracy
rename p56st leftRight
save "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2008_editedSurvey", replace

use "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro_2009_datos_esp_v2014_06_27.dta", clear
keep if idenpa==222
keep numinves idenpa numentre reg ciudad tamciud comdist p3st_a p8st p12st_a p69st
rename p3st_a economicSituation
rename p8st futurePersonalEconomics
rename p12st_a satisfacDemocracy
rename p69st leftRight
save "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2009_editedSurvey", replace


use "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro_2010_datos_esp_v2014_06_27.dta", clear
keep if idenpa==222
keep numinves idenpa numentre reg ciudad tamciud comdist P3ST_A P8ST P11ST_A P60ST
rename P3ST_A economicSituation
rename P8ST futurePersonalEconomics
rename P11ST_A satisfacDemocracy
rename P60ST leftRight
save "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2010_editedSurvey", replace

// use "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2009_editedSurvey"
// decode ciudad, gen(str_ciudad)
// split str_ciudad, p("-")
// split str_ciudad1, p(":")
// rename str_ciudad12 department 
// rename str_ciudad2 municipality
// drop str_ciudad11 str_ciudad1 str_ciudad
// save "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2009_editedSurvey", replace



local files : dir "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308" files "*.dta"
//Cleaning municipality variable
foreach file of local files{
	use "`file'"
	decode ciudad, gen(str_ciudad)
	split str_ciudad, p("-")
	split str_ciudad1, p(":")
	rename str_ciudad12 department 
	rename str_ciudad2 municipality
	drop str_ciudad11 str_ciudad1 str_ciudad
	
	save `file', replace
	
}
****************************************************************************
*Create Panel Dataset
****************************************************************************
use "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2003_editedSurvey", clear
append using "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2004_editedSurvey"
append using "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2005_editedSurvey"
append using "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2006_editedSurvey"
append using "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2007_editedSurvey"
append using "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2008_editedSurvey"
append using "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2009_editedSurvey"
append using "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/Latinobarometro_2010_editedSurvey"

//Outcome variables: economicSituation futurePersonalEconomics satisfacDemocracy leftRight

rename numinves year
drop idenpa numentre
drop str_ciudad3

save "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/Latinobarometro0308/appendedSurveyData", replace
mdesc

****************************************************************************
*Run this part 
****************************************************************************
cd "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria"
//import delimited "TreatedHouseholdsByDepartment.csv", clear
use "Latinobarometro0308/appendedSurveyData.dta", clear
replace department = subinstr(department, " ", "", .) //get rid of spaces in the string

merge m:1 department year using  "TreatedHouseholdsByDepartment.dta" //this data set has all the relevant REA visits
drop numberofhouseholdsinmunicipality

//m:1 merge would indicate that state department can correspond to many 
//observations in the master dataset, but uniquely identifies individual observations in the using dataset


replace numberoftreatedhouseholdsindepar = 0 if missing(numberoftreatedhouseholdsindepar) 
rename numberofhouseholdsdepartment householdsDepartment
rename numberoftreatedhouseholdsindepar treatedHouseholdsDpt
rename oftotalhouseholdsindepartmenttre percentTreatedDpt

///Change labeling from Spanish to English
label define P1ST 1 "Very Good", modify
label define P1ST 2 "Good", modify
label define P1ST 3 "Regular", modify
label define P1ST 4 "Bad", modify
label define P1ST 5 "Very Bad", modify
label define P60ST 0 "Left", modify
label define P60ST 10 "Right", modify
label define P6ST 1 "A Lot Better", modify
label define P6ST 2 "Slightly Better", modify
label define P6ST 3 "Same", modify
label define P6ST 4 "Slightly Worse", modify
label define P6ST 5 "A Lot Worse", modify
label define P15ST 1 "Very Satisfied", modify
label define P15ST 2 "Satisfied", modify
label define P15ST 3 "Not Very Satisfied", modify
label define P15ST 4 "Very Dissatisfied", modify

bysort department (year): replace percentTreatedDpt=percentTreatedDpt[_n-1] if missing(percentTreatedDpt) & year==2009 & department !="SanSalvador"
bysort department (year): replace percentTreatedDpt=percentTreatedDpt[_n-1] if missing(percentTreatedDpt) & year==2010 & department !="SanSalvador"
replace percentTreatedDpt = 0 if missing(percentTreatedDpt)

save "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/editedDataset.dta", replace

****************************************************************************
*Start Analyzing Data
****************************************************************************

bysort department: replace householdsDepartment = householdsDepartment[1] if missing(householdsDepartment)

//Time treatment
gen relativeYear = year
gen yearTreatment = year if percentTreatedDpt != 0 
egen firstTreatment = min(yearTreatment), by(department)
generate prePostTreatmentPeriod = relativeYear - firstTreatment //this creates values from -2,-1,0,1,2,3!!!

**One hot encoding for the Relative Years
generate five_minus = 0 
replace five_minus = 1 if prePostTreatmentPeriod == -5

generate four_minus = 0 
replace four_minus = 1 if prePostTreatmentPeriod == -4

generate three_minus = 0 
replace three_minus = 1 if prePostTreatmentPeriod == -3

generate two_minus = 0 
replace two_minus = 1 if prePostTreatmentPeriod == -2

generate one_minus = 0 
replace one_minus = 1 if prePostTreatmentPeriod == -1

generate zero_minus = 0 
replace zero_minus = 1 if prePostTreatmentPeriod == 0
generate one_plus = 0 
replace one_plus = 1 if prePostTreatmentPeriod == 1
generate two_plus = 0 
replace two_plus = 1  if prePostTreatmentPeriod == 2
generate three_plus = 0 
replace three_plus = 1 if prePostTreatmentPeriod == 3
generate four_plus = 0 
replace four_plus = 1 if prePostTreatmentPeriod == 4
generate five_plus = 0 
replace five_plus = 1 if prePostTreatmentPeriod == 5


//i.relative year --> or one hot encode relativeYear, for values in relative year make generate variables, need positive and negative years
//cant use negatives, create negatives relativeYear_N1, _n2, n_3 and for aftewards and interact ALL of them with the share treated measure

//interact relative year dummy with share treated measure
****************************************************************************
*Create all the variables necessary for event study 
****************************************************************************
summarize percentTreatedDpt, detail

sort department year
by department: egen avgShareTreatedDpt = mean(percentTreatedDpt) if percentTreatedDpt != 0 //ie. only do it for post-periods for each geographic region
bysort department (avgShareTreatedDpt) : replace avgShareTreatedDpt = avgShareTreatedDpt[_n-1] if missing(avgShareTreatedDpt) //missing values get treated as really large numbers
replace avgShareTreatedDpt = 0 if missing(avgShareTreatedDpt) //San Salvador is the only untreated department
//sort default = ascending, gsort -var
bysort department: gen num = _n //counting observations within the department
sum avgShare if num == 1,d //avg share treated constant within department, each observation is unique to department 
local median = r(p50) 

gen highlyTreated = 1 if avgShare > `median'
replace highlyTreated = 0 if missing(highlyTreated)
tab highlyTreated //discretize this variable to look at pretrends


egen mean_post_treatment = mean(percentTreatedDpt) if highlyTreated, by(year) // plot "share treated" over calendar years separately
egen mean_post_control = mean(percentTreatedDpt) if !highlyTreated, by(year) //control
graph twoway line mean_post_treatment mean_post_control year, sort ytitle("Share of Department Treated") xtitle("Year") title("Differences between Highly and Non-Highly Treated Departments") ///
legend(label(1 "Highly Treated") label(2 "Not Highly Treated"))

//Need to encode department & municipality, can't use as string
encode department,gen(department1)
drop department
rename department1 department

encode municipality,gen(municipality1)
drop municipality
rename municipality1 municipality


//Interactions between highly treated dummy and the relative treatment year dummy
gen highlyTreated_five_minus = highlyTreated*five_minus
gen highlyTreated_four_minus = highlyTreated*four_minus
gen highlyTreated_three_minus = highlyTreated*three_minus
gen highlyTreated_two_minus = highlyTreated*two_minus
gen highlyTreated_one_minus = highlyTreated*one_minus

gen highlyTreated_zero_minus = highlyTreated*zero_minus
gen highlyTreated_one_plus = highlyTreated*one_plus
gen highlyTreated_two_plus = highlyTreated*two_plus
gen highlyTreated_three_plus = highlyTreated*three_plus
gen highlyTreated_four_plus = highlyTreated*four_plus
gen highlyTreated_five_plus = highlyTreated*five_plus



rename percentTreatedDpt shareTreatedDpt 
//Create interactions between share treated and the relative year dummies
gen shareTreatedDpt_zero_minus = shareTreatedDpt*zero_minus
gen shareTreatedDpt_one_plus = shareTreatedDpt*one_plus
gen shareTreatedDpt_two_plus = shareTreatedDpt*two_plus
gen shareTreatedDpt_three_plus = shareTreatedDpt*three_plus
gen shareTreatedDpt_four_plus = shareTreatedDpt*four_plus
gen shareTreatedDpt_five_plus = shareTreatedDpt*five_plus


drop if satisfacDemocracy ==  -1 //response was "i dont know" ... 5% of responses had this answer
drop if satisfacDemocracy ==  -2 //response was 'no answer'

drop if futurePersonalEconomics == -1 //"i dont know"
drop if futurePersonalEconomics == -2 //"no response"

drop if economicSituation == -1 //"i dont know"
drop if economicSituation == -2 //"no response"

drop if taxes == -1
drop if taxes == -2

//Scale all of the outcomes by a factor of -1 so that higher numbers indicate more satisfaction
replace futurePersonalEconomics = futurePersonalEconomics*-1
replace economicSituation = economicSituation*-1
replace satisfacDemocracy = satisfacDemocracy*-1


replace leftRight = leftRight*-1 //higher numbers = more left leaning 


//Standardize the outcome variables --> Z Score = Z has mean zero and standard deviation 1.
sum satisfacDemocracy
gen z1Democracy = (satisfacDemocracy-r(mean))/r(sd)
sum leftRight
gen z1LeftRight = (leftRight - r(mean))/r(sd)
sum futurePersonalEconomics
gen z1PersonalEcon = (futurePersonalEconomics - r(mean))/r(sd)
sum economicSituation
gen z1economic = (economicSituation - r(mean))/r(sd)

sum taxes
gen z1taxes = (taxes-r(mean))/r(sd)


save "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/editedDataset.dta", replace

****************************************************************************
*Event Study Regression: Pre-Trends
****************************************************************************
use "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/editedDataset.dta", clear



//Test for Pre-Trends between Highly treated and not?
regress satisfacDemocracy highlyTreated_five_minus highlyTreated_four_minus highlyTreated_three_minus highlyTreated_two_minus highlyTreated_one_minus  highlyTreated_zero_minus highlyTreated_one_plus highlyTreated_two_plus highlyTreated_three_plus highlyTreated_four_plus highlyTreated_five_plus i.year i.department, vce(cluster department)
//Plot event study coefficients
coefplot, xline(0)  xtitle("Coefficients", size(small)) xlabel(-5(1)5) drop(*.year *.department _cons highlyTreated_one_plus highlyTreated_two_plus highlyTreated_three_plus highlyTreated_four_plus highlyTreated_five_plus)  title("Pre-Trends in Satisfaction with Democracy: Comparing Highly Treated Departments to Low Treatment Departments", size(vsmall))

regress leftRight highlyTreated_five_minus highlyTreated_four_minus highlyTreated_three_minus highlyTreated_two_minus highlyTreated_one_minus  highlyTreated_zero_minus highlyTreated_one_plus highlyTreated_two_plus highlyTreated_three_plus highlyTreated_four_plus highlyTreated_five_plus i.year i.department, vce(cluster department)
coefplot, xline(0) ytitle("Regressors", size(small)) xtitle("Coefficients", size(small)) xlabel(-5(1)5) drop(*.year *.department _cons)  title("Parallel Trends Coefficients: Left-Right Ideologies", size(small))

regress futurePersonalEconomics highlyTreated_five_minus highlyTreated_four_minus highlyTreated_three_minus highlyTreated_two_minus highlyTreated_one_minus  highlyTreated_zero_minus highlyTreated_one_plus highlyTreated_two_plus highlyTreated_three_plus highlyTreated_four_plus highlyTreated_five_plus i.year i.department, vce(cluster department)
coefplot, xline(0) ytitle("Regressors", size(small)) xtitle("Coefficients", size(small)) xlabel(-5(1)5) drop(*.year *.department _cons)  title("Parallel Trends Coefficients: Personal Economic Situation", size(small))

regress economicSituation highlyTreated_five_minus highlyTreated_four_minus highlyTreated_three_minus highlyTreated_two_minus highlyTreated_one_minus  highlyTreated_zero_minus highlyTreated_one_plus highlyTreated_two_plus highlyTreated_three_plus highlyTreated_four_plus highlyTreated_five_plus i.year i.department, vce(cluster department)
coefplot, xline(0) ytitle("Regressors", size(small)) xtitle("Coefficients", size(small)) xlabel(-5(1)5) drop(*.year *.department _cons)  title("Parallel Trends Coefficients: Country's Economic Situation", size(small))




****************************************************************************
*Static Effect Regressions
****************************************************************************
reg leftRight shareTreatedDpt i.year i.municipality, vce(cluster department)
estimates store model5
reg economicSituation shareTreatedDpt i.year i.municipality, vce(cluster department)
estimates store model6
reg futurePersonalEconomics shareTreatedDpt i.year i.municipality, vce(cluster department)
estimates store model7
reg satisfacDemocracy shareTreatedDpt i.year i.municipality, vce(cluster department)
estimates store model8

estwide model5 model6 model7 model8 using "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/regressionTables2Static.tex", se ar2 label keep(shareTreatedDpt) title("Red Solidaria CCTs and Political/Economic Outlooks: Static Effect")
****************************************************************************
*Event Study Regression
//time and geography fixed effects
//omit c.percentTreatedDpt##zero_minus to use for baseline
//cluster at dpt level, bc source of variation for treatment of interest
****************************************************************************

//Left-Right Scale
reg leftRight five_minus four_minus three_minus two_minus one_minus shareTreatedDpt_zero_minus shareTreatedDpt_one_plus shareTreatedDpt_two_plus  shareTreatedDpt_three_plus shareTreatedDpt_four_plus shareTreatedDpt_five_plus i.year i.municipality, vce(cluster department)

reg leftRight shareTreatedDpt five_minus four_minus three_minus two_minus one_minus shareTreatedDpt_one_plus shareTreatedDpt_two_plus  shareTreatedDpt_three_plus shareTreatedDpt_four_plus shareTreatedDpt_five_plus i.year i.municipality, vce(cluster department)


estimates store model1
coefplot, xline(0) ytitle("Regressors", size(small)) xtitle("Coefficients", size(small)) xlabel(-80(5)30, valuelabel angle(45)) drop(*.year *.municipality _cons)  title("Event Study Coefficients: Left-Right Scale", size(small))

// Current Economic Situation
reg economicSituation five_minus four_minus three_minus two_minus one_minus shareTreatedDpt_zero_minus shareTreatedDpt_one_plus shareTreatedDpt_two_plus  shareTreatedDpt_three_plus shareTreatedDpt_four_plus shareTreatedDpt_five_plus i.year i.municipality, vce(cluster department)
estimates store model2
coefplot, xline(0) ytitle("Regressors", size(small)) xtitle("Coefficients", size(small)) xlabel(-5(1)13, valuelabel angle(45)) drop(*.year *.municipality _cons)  title("Event Study Coefficients: Country's Economic Situation", size(small))

//Personal Future Economic Situation
reg futurePersonalEconomics five_minus four_minus three_minus two_minus one_minus shareTreatedDpt_zero_minus shareTreatedDpt_one_plus shareTreatedDpt_two_plus  shareTreatedDpt_three_plus shareTreatedDpt_four_plus shareTreatedDpt_five_plus i.year i.municipality, vce(cluster department)
estimates store model3
coefplot, xline(0) ytitle("Regressors", size(small)) xtitle("Coefficients", size(small)) xlabel(-7(2)25, valuelabel angle(45)) drop(*.year *.municipality _cons)  title("Event Study Coefficients: Personal Economic Situation in 12 Months", size(small))

//Personal Satisfaction with Democracy
reg satisfacDemocracy five_minus four_minus three_minus two_minus one_minus shareTreatedDpt_zero_minus shareTreatedDpt_one_plus shareTreatedDpt_two_plus  shareTreatedDpt_three_plus shareTreatedDpt_four_plus shareTreatedDpt_five_plus i.year i.municipality, vce(cluster department)
estimates store model4
coefplot, xline(0) ytitle("Regressors", size(small)) xtitle("Coefficients", size(small)) xlabel(-4(1)20, valuelabel angle(45)) drop(*.year *.municipality _cons)  title("Event Study Coefficients: Satisfaction with Democracy", size(small))


estwide model1 model2 model3 model4 using "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/regressionTablesDynamic.tex", se ar2 label keep(five_minus four_minus three_minus two_minus one_minus shareTreatedDpt_zero_minus shareTreatedDpt_one_plus shareTreatedDpt_two_plus shareTreatedDpt_three_plus shareTreatedDpt_four_plus shareTreatedDpt_five_plus) title("Red Solidaria CCTs and Political/Economic Outlooks: Dynamic Effects")





****************************************************************************
*Mechanisms
****************************************************************************

bysort municipality: egen maxTreatmentLevel = max(shareTreatedDpt)

egen mean_treatment_Democracy = mean(satisfacDemocracy) if maxTreatmentLevel != 0, by(year)
egen mean_control_Democracy = mean(satisfacDemocracy) if maxTreatmentLevel==0, by(year)

egen mean_treatment_Economy = mean(economicSituation) if maxTreatmentLevel != 0, by(year)
egen mean_control_Economy = mean(economicSituation) if maxTreatmentLevel==0, by(year)


egen mean_treatment_FutureEconomy = mean(futurePersonalEconomics) if maxTreatmentLevel != 0, by(year)
egen mean_control_FutureEconomy = mean(futurePersonalEconomics) if maxTreatmentLevel==0, by(year)

egen mean_treatment_LeftRight = mean(leftRight) if maxTreatmentLevel != 0, by(year)
egen mean_control_LeftRight = mean(leftRight) if maxTreatmentLevel==0, by(year)


graph twoway line mean_treatment_Democracy mean_control_Democracy year if year >=2005, sort ytitle("Satisfaction Level") title("Effect of Treatment on Satisfaction with Democracy")legend(label(1 "Treated") label(2 "Control"))
graph save democracy, replace

graph twoway line mean_treatment_Economy mean_control_Economy year if year >=2005, sort ytitle("Satisfaction Level") title("Effect of Treatment on Satisfaction with Economy")legend(label(1 "Treated") label(2 "Control"))
graph save economy, replace

graph twoway line mean_treatment_FutureEconomy mean_control_FutureEconomy year if year >=2005, sort ytitle("Satisfaction Level") title("Effect of Treatment on Future Economic Prospects")legend(label(1 "Treated") label(2 "Control"))
graph save personaleconomy, replace

graph twoway line mean_treatment_LeftRight mean_control_LeftRight year if year >=2005, sort ytitle("Left-Right Scale") title("Effect of Treatment on Political Ideology")legend(label(1 "Treated") label(2 "Control"))
graph save leftright, replace

gr combine democracy.gph economy.gph, ycommon
****************************************************************************
*Regression Model with Lags 
****************************************************************************


collapse (mean) economicSituation futurePersonalEconomics satisfacDemocracy leftRight taxes householdsDepartment treatedHouseholdsDpt shareTreatedDpt relativeYear yearTreatment firstTreatment prePostTreatmentPeriod five_minus four_minus three_minus two_minus one_minus zero_minus one_plus two_plus three_plus four_plus five_plus shareTreatedDpt_zero_minus shareTreatedDpt_one_plus shareTreatedDpt_two_plus shareTreatedDpt_three_plus shareTreatedDpt_four_plus shareTreatedDpt_five_plus z1Democracy z1LeftRight z1PersonalEcon z1economic z1taxes (first) department reg ciudad, by(municipality year)

tsset municipality year
tsfill
foreach x of varlist * {
	replace `x' = `x'[_n-1] if missing(`x') 
}

label variable shareTreatedDpt "shareTreatedDpt"


sort municipality year

//Static Regressions
reg z1Democracy shareTreatedDpt i.year i.municipality, vce(cluster department)
estimates store model12
reg z1LeftRight shareTreatedDpt i.year i.municipality, vce(cluster department)
estimates store model13
reg z1PersonalEcon shareTreatedDpt i.year i.municipality, vce(cluster department)
estimates store model14
reg z1economic shareTreatedDpt i.year i.municipality, vce(cluster department)
estimates store model15
reg z1taxes shareTreatedDpt i.year i.municipality, vce(cluster department)
estimates store model16


estwide model12 model13 model14 model15 model16 using "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/staticRegressions_v2.tex", se ar2 label keep(shareTreatedDpt) title("Red Solidaria CCTs and Political/Economic Outlooks: Static Effect")

cd "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/newGraphs"

//Lagged Autoregressions
reg z1Democracy shareTreatedDpt l.shareTreatedDpt l2.shareTreatedDpt l3.shareTreatedDpt i.year i.municipality, vce(cluster department)
estimates store model16
coefplot, xline(0) ytitle("Regressors", size(small)) xtitle("Coefficients", size(small)) xlabel(-5(1)8, valuelabel angle(45)) drop(*.year *.municipality _cons)  title("Autoregression Coefficients: Satisfaction with Democracy", size(small))
graph export autoregressionDemocracy.png

reg z1LeftRight shareTreatedDpt l.shareTreatedDpt l2.shareTreatedDpt l3.shareTreatedDpt i.year i.municipality, vce(cluster department)
estimates store model17
coefplot, xline(0) ytitle("Regressors", size(small)) xtitle("Coefficients", size(small)) xlabel(-3(1)10, valuelabel angle(45)) drop(*.year *.municipality _cons)  title("Autoregression Coefficients: Satisfaction with Democracy", size(small))
graph export autoregressionLeft.png


reg z1PersonalEcon shareTreatedDpt l.shareTreatedDpt l2.shareTreatedDpt l3.shareTreatedDpt i.year i.municipality, vce(cluster department)
estimates store model18
coefplot, xline(0) ytitle("Regressors", size(small)) xtitle("Coefficients", size(small)) xlabel(-10(1)10, valuelabel angle(45)) drop(*.year *.municipality _cons)  title("Autoregression Coefficients: Satisfaction with Democracy", size(small))
graph export autoregressionPersonalEconomy.png


reg z1economic shareTreatedDpt l.shareTreatedDpt l2.shareTreatedDpt l3.shareTreatedDpt i.year i.municipality, vce(cluster department)
estimates store model19
coefplot, xline(0) ytitle("Regressors", size(small)) xtitle("Coefficients", size(small)) xlabel(-6(1)8, valuelabel angle(45)) drop(*.year *.municipality _cons)  title("Autoregression Coefficients: Satisfaction with Democracy", size(small))
graph export autoregressionEconomy.png

reg z1taxes shareTreatedDpt l.shareTreatedDpt l2.shareTreatedDpt l3.shareTreatedDpt i.year i.municipality, vce(cluster department)
estimates store model20
coefplot, xline(0) ytitle("Regressors", size(small)) xtitle("Coefficients", size(small)) xlabel(-3(1)3, valuelabel angle(45)) drop(*.year *.municipality _cons)  title("Autoregression Coefficients: Are Taxes Too High?", size(small))
graph export autoregressionTaxes.png



estwide model16 model17 model18 model19 model20 using "/Users/fmacchi/Dropbox (MIT)/14.33/RedSolidaria/autoregression_v3.tex", se ar2 label drop(*.year *.municipality) title("Red Solidaria CCTs and Political/Economic Outlooks: Autoregression")






//lags capture post-treatment effects. Basically whether today's outcomes are affected by yesterday's treatment.
//the effect of treatment X years after treatment

****************************************************************************
*Descriptive Statistics 
****************************************************************************
asdoc sum economicSituation futurePersonalEconomics satisfacDemocracy leftRight //makes a nice descriptive stats table for these variables 

sum leftRight
sum satisfacDemocracy
sum futurePersonalEconomics
sum economicSituation

histogram leftRight
histogram leftRight, title("Distribution of Political Views on Left-Right Scale") xtitle("Left Right Scale") discrete percent 

histogram futurePersonalEconomics, title("Vision of Future Personal Economic Prosperity") xtitle("Positivity") discrete percent xlabel(1/5,valuelabel angle(45))

histogram satisfacDemocracy, title("Satisfaction with Democracy") xtitle("Satisfaction Level") discrete percent xlabel(1/4,valuelabel angle(45))

histogram economicSituation, title("Satisfaction with Economic Situation") xtitle("Satisfaction Level") discrete percent xlabel(1/5,valuelabel angle(45))

