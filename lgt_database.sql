-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: lgt_survey_responses
-- ------------------------------------------------------
-- Server version	8.0.19-0ubuntu0.19.10.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `questionnaire`
--

DROP TABLE IF EXISTS `questionnaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `label` text NOT NULL,
  `group_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `questionnaire_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `questionnaire_groups` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire`
--

LOCK TABLES `questionnaire` WRITE;
/*!40000 ALTER TABLE `questionnaire` DISABLE KEYS */;
INSERT INTO `questionnaire` VALUES (166,'_1_Gender','Gender',15,NULL),(167,'_2_City','City',15,NULL),(168,'_2_Age','Age',15,NULL),(169,'_3_Highest_level_of_education','Highest level of education',15,NULL),(170,'_4_Employment_status','Employment status',15,NULL),(171,'_5_Are_you_the_head_of_the_hou','Are you the head of the household?',15,NULL),(172,'_5_a_If_NO_Gender_of_head_of_household','If NO: Gender of head of household',15,171),(173,'_6_Do_you_own_the_ho_se_you_are_living_in','Do you own the house you are living in?',15,NULL),(174,'_7_Do_you_belong_to_sident_s_association','Do you belong to a residents association?',15,NULL),(175,'_8_Has_municipal_water_been_co','Has municipal water been connected to your residence?',16,NULL),(176,'_9_Do_you_remember_the_last_ti','Do you remember the last time you had municipal water?',16,NULL),(177,'_10_a_When_was_the_got_municipal_water','When was the last time you got municipal water?',16,176),(178,'_9_Select_the_statement_that_m','Select the statement that most accurately describes your municipal water availability',16,NULL),(179,'_9_a_Source_of_Water','Source of Water',16,178),(180,'_12_On_which_days_do_get_municipal_water','On which days do you usually get municipal water?',16,NULL),(181,'_12_Do_you_drink_mun_ut_further_treatment','Do you drink municipal water without further treatment?',16,NULL),(182,'_13_a_How_do_you_treat_municipal_water','How do you treat municipal water?',16,181),(183,'_13_Do_you_know_the_g_water_to_your_area','Do you know the municipalitys schedule for delivering water to your area?',16,NULL),(184,'_14_Does_the_city_follow_this_schedule','Does the city follow this schedule?',16,NULL),(185,'_15_Does_the_city_communicate_','Does the city communicate changes to the schedule?',16,NULL),(186,'_15_a_If_YES_how_do_they_communicate','If YES how do they communicate?',16,185),(187,'_16_Do_you_have_a_pr_ater_meter_installed','Do you have a pre-paid water meter installed?',16,NULL),(188,'_17_Do_you_get_a_regular_bill_','Do you get a regular bill (monthly) for your water service charge?',16,NULL),(189,'_17_a_If_YES_how','If YES how?',16,188),(190,'_18_Do_you_know_your_ly_water_charge_cost','Do you know your average monthly water charge/cost?',16,NULL),(191,'_19_a_If_YES_how_e_do_you_pay_monthly','If YES, how much on average do you pay monthly?',16,190),(192,'_19_Do_you_think_you_of_your_water_usage','Do you think your bill is an accurate reflection of your water usage?',16,NULL),(193,'_20_Are_you_up_to_da_th_your_bill_payment','Are you up to date with your bill payment?',16,NULL),(194,'_21_Do_you_currently_report_on','Do you currently report on burst pipes/ problems with water services?',16,NULL),(195,'_21_a_If_YES_How_service_in_your_area','If YES. How do you report a loss of water service in your area?',16,194),(196,'_22_Do_you_get_a_res_method_of_reporting','Do you get a response from your current method of reporting?',16,NULL),(197,'_23_How_long_does_th_eported_water_issues','How long does the municipality take to fix reported water issues',16,NULL),(198,'_OPTIONAL_Record_an_tuation_in_your_area','(OPTIONAL) Record any comments you have about the water situation in your area',16,NULL),(199,'Record_the_household_current_interviewee','Record the household location of your current interviewee',16,NULL),(200,'_25_Which_of_the_following_bes','Which of the following best describes your current refuse collection arrangement?',17,NULL),(201,'_24_How_often_does_the_municip','How often does the municipality collect refuse from your home?',17,NULL),(202,'_25_Is_there_a_sched_or_refuse_collection','Is there a schedule in your neighbourhood for refuse collection?',17,NULL),(203,'_26_Does_the_municip_follow_the_schedule','Does the municipality follow the schedule?',17,NULL),(204,'_30_Does_the_City_communicate_','Does the City communicate changes to the collection schedule?',17,NULL),(205,'_30_a_If_YES_how','If YES how?',17,204),(206,'_27_What_do_you_do_with_your_r','What do you do with your refuse when it is not collected? (choose all that apply)',17,NULL),(207,'_27_a_Other_please_describe','Other - please describe',17,206),(208,'_28_Do_you_know_your_or_refuse_collection','Do you know your monthly charge for refuse collection?',17,NULL),(209,'_31_a_If_YES_how_e_do_you_pay_monthly','If YES, how much on average do you pay monthly?',17,208),(210,'Are_you_satisfied_wi_e_collection_service','Are you satisfied with the level of refuse collection service?',17,NULL),(211,'_OPTIONAL_Any_other_comments','(OPTIONAL) Any other comments?',17,NULL),(212,'_31_How_many_times_did_you_vis','How many times did you visit your local municipal clinic in the last year?',18,NULL),(213,'_32_What_is_your_reason_for_not_going','What is your reason for not going?',18,NULL),(214,'_34_What_kind_of_ser_ic_in_the_past_month','What kind of treatment services have you accessed at your local clinic in the past year?',18,NULL),(215,'_35_Were_you_able_to_get_the_s','Were you able to get the service you were looking for? (Medication or medical attention)',18,NULL),(216,'_35_a_If_NO_why','If NO why?',18,215),(217,'_36_How_long_did_it_used_these_services','How long did it take you to get served at the last time you used these services?',18,NULL),(218,'_37_How_satisfied_we_service_you_received','How satisfied were you with the service you received?',18,NULL),(219,'_39_How_would_you_de_staff_at_the_clinic','How would you describe the staff at the clinic?',18,NULL),(220,'_39_Will_you_go_back_to_the_same_facility','Will you go back to the same facility?',18,NULL);
/*!40000 ALTER TABLE `questionnaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire_groups`
--

DROP TABLE IF EXISTS `questionnaire_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `label` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_groups`
--

LOCK TABLES `questionnaire_groups` WRITE;
/*!40000 ALTER TABLE `questionnaire_groups` DISABLE KEYS */;
INSERT INTO `questionnaire_groups` VALUES (15,'group_demographics','Demographics'),(16,'group_rv94r85','Water Services Delivery Survey'),(17,'group_qu5ch75','Refuse Collection Services Delivery Survey'),(18,'group_dq47t00','Primary Health Care/Municipal Clinic Services Delivery Survey');
/*!40000 ALTER TABLE `questionnaire_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responses`
--

DROP TABLE IF EXISTS `responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qsn_id` int NOT NULL,
  `response` text NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responses`
--

LOCK TABLES `responses` WRITE;
/*!40000 ALTER TABLE `responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `responses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-13 10:40:28
