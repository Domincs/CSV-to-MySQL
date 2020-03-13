# CSV-to-MySQL

1 Create Mysql database
    CREATE DATABASE lgt_survey_responses;

2. Create table for groups
    CREATE TABLE questionnaire_groups(id int NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(150) NOT NULL, label text NOT NULL);

3. Create Questionnaire Table
    CREATE TABLE questionnaire(id int NOT NULL PRIMARY KEY AUTO_INCREMENT, name varchar(150), label text NOT NULL, group_id int not null, parent_id int null, CONSTRAINT foreign key(group_id) REFERENCES questionnaire_groups(id) ON UPDATE CASCADE ON DELETE RESTRICT );

4. Create Responses Table
    CREATE TABLE responses(id int NOT NULL PRIMARY KEY AUTO_INCREMENT, qsn_id int NOT NULL, response text not null, date TIMESTAMP NULL, created TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
