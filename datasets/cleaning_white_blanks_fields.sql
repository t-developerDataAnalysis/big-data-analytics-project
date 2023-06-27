CREATE DEFINER=`carlos`@`%` PROCEDURE `cleaning_white_blanks_fields`( IN TableName VARCHAR(45) )
BEGIN
    DECLARE cont INTEGER; 
    DECLARE v_cont INTEGER;
    DECLARE sqlstm TEXT;
    DECLARE field TEXT;
    DECLARE stmt TEXT;
    
    SET v_cont = 0;
    SET cont = 1;
    DROP TEMPORARY TABLE array_table;
    CREATE TEMPORARY TABLE array_table (idx INT, value text);
    INSERT INTO array_table (idx, value) VALUES 
	(1,"total_population_january_1_thousands"),
	(2,"total_population_july_1_thousands"),
	(3,"male_population_july_1_thousands"),
	(4,"female_population_july_1_thousands"),
	(5,"population_sex_ratio_july_1_males_per_100"),
	(6,"median_age_july_1_in_years"),
	(7,"natural_change_births_minus_deaths_thousand"),
	(8,"rate_of_natural_change_per_1000"),
	(9,"population_change_thousand"),
	(10,"population_annual_doubling_time_years"),
	(11,"births_thousands"),
	(12,"births_by_women_15_19_thousand"),
	(13,"crude_birth_rate_x_1000_population"),
	(14,"total_fertility_rate_live_births_per_woman"),
	(15,"net_reproduction_rate_surviving_daughters_per_woman"),
	(16,"mean_age_childbearing_years"),
	(17,"sex_ratio_birth_males_per_100_female_births"),
	(18,"total_deaths_thousands"),
	(19,"male_deaths_thousands"),
	(20,"female_deaths_thousands"),
	(21,"crude_death_rate_deaths_x_1000_population"),
	(22,"life_expectancy_at_birth_both_sexes"),
	(23,"male_life_expectancy_at_birth_years"),
	(24,"female_life_expectancy_at_birth_years"),
	(25,"life_expectancy_at_age_15_both_sexes_years"),
	(26,"male_life_expectancy_at_age_15_years"),
	(27,"female_life_expectancy_at_age_15_years"),
	(28,"life_expectancy_at_age_65_both_sexes_years"),
	(29,"male_life_expectancy_at_age_65_years"),
	(30,"female_life_expectancy_at_age_65_years"),
	(31,"life_expectancy_both_sexes_at_age_80_years"),
	(32,"male_life_expectancy_at_age_80_years"),
	(33,"female_life_expectancy_at_age_80_years"),
	(34,"infant_dates_under_age_1_thousands"),
	(35,"infant_mortality_rate_infant_deaths_x_1000_live_births"),
	(36,"live_births_surviving_to_age_1_thousand"),
	(37,"under_five_deaths_under_age_5_thousand"),
	(38,"under_five_mortality_deaths_under_age_5_x_1000_live_births"),
	(39,"mortality_before_40_both_deaths_under_40_x_1000_live_births"),
	(40,"male_mortality_before_40_deaths_under_age_40_x_1000_live_births"),
	(41,"female_mortality_before_40_deaths_under_age_40_x_1000_live_birth"),
	(42,"mortality_before_age_60_both_deaths_under_60_x_1000_live_births"),
	(43,"male_mortality_before_60_deaths_under_age_60_x_1000_live_births"),
	(44,"female_mortality_before_60_deaths_under_60_x_1000_live_births"),
	(45,"mortality_age_15_to_50_both_deaths_under_50_x_1000_alive_at_15"),
	(46,"male_mortality_age_15_to_50_deaths_under_50_x_1000_alive_at_15"),
	(47,"female_mortality_age_15_to_50_deaths_under_50_x_1000_alive_at_15"),
	(48,"mortality_age_15_to_60_both_deaths_under_60_x_1000_alive_at_15"),
	(49,"male_mortality_age_15_to_60_deaths_under_60_x_1000_alive_at_15"),
	(50,"female_mortality_age_15_to_60_deaths_under_60_x_1000_alive_at_15"),
	(51,"net_number_migrants_thousand"),
	(52,"net_migration_rate_x_1000_population");
        
	SELECT count(*) 
	INTO v_cont
	from array_table;
    
    WHILE cont <= v_cont DO 
		
        SELECT value
        INTO field
        FROM  array_table
        WHERE idx = cont;        
        
		SET @sqlstm = CONCAT("UPDATE cind820.import_united_nations_countries SET ",field,"  = REPLACE(REPLACE(REPLACE(",field,", ' ', ''), '\t', ''), '\n', '');");
 
        PREPARE QUERY FROM @sqlstm;
        EXECUTE QUERY;
		DEALLOCATE PREPARE QUERY;

        SET cont = cont + 1; 
    END WHILE; 
    
END