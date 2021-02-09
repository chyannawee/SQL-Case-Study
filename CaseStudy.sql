alter session set NLS_DATE_FORMAT='DD/MM/YYYY';

DROP TABLE job_contractor;
DROP TABLE jobs;
DROP TABLE contractors;
DROP TABLE skills;
DROP TABLE contracts;
DROP TABLE clients;

CREATE TABLE clients ( 
      client_id  		CHAR(3) PRIMARY KEY,
      first_name       		CHAR(10), 
      last_name                 CHAR(10),
      phone_number 	        CHAR(10),  
      address                   CHAR(30) );

CREATE TABLE contracts ( 
      contract_id  	        CHAR(5) PRIMARY KEY,
      request_date              DATE, 
      start_date 	        DATE,  
      expected_end_date         DATE,
      end_date                  DATE,
      expected_duration         NUMBER(2),
      contract_status           CHAR(2),
      extension                 NUMBER(2),
      client_id                 CHAR(3),
FOREIGN KEY (client_id) REFERENCES clients(client_id));

CREATE TABLE skills ( 
      skill_id  		CHAR(4) PRIMARY KEY,
      skill_description     	CHAR(30), 
      pay_rate     		DECIMAL(4,2) );

CREATE TABLE contractors ( 
      contractor_id  	        CHAR(4) PRIMARY KEY,
      contractor_name           CHAR(30), 
      office_address 	        CHAR(40),  
      phone_number              CHAR(10),
      skill_id                  CHAR(4),
      contract_id               CHAR(5),
      hours_worked              NUMBER(3),
	FOREIGN KEY (contract_id) REFERENCES contracts(contract_id),
	FOREIGN KEY (skill_id) REFERENCES skills(skill_id));

CREATE TABLE jobs ( 
      job_id  			CHAR(3) PRIMARY KEY,
      job_description       	CHAR(40), 
      required_start_date 	DATE,
      start_date		DATE,  
      expected_end_date	        DATE,
      job_status                CHAR(2),
      skill_id                  CHAR(4),
      contractor_id	        CHAR(4),
      contract_id               CHAR(5),
	FOREIGN KEY (skill_id) REFERENCES skills(skill_id),
	FOREIGN KEY (contractor_id) REFERENCES contractors(contractor_id),
	FOREIGN KEY (contract_id) REFERENCES contracts(contract_id));

CREATE TABLE job_contractor ( 
      job_id  		        CHAR(3) PRIMARY KEY,
      contractor_id      	CHAR(4), 
      contractor_job_status     CHAR(2),
FOREIGN KEY (job_id) REFERENCES jobs(job_id),
FOREIGN KEY (contractor_id) REFERENCES contractors(contractor_id));




INSERT INTO clients VALUES ('C01', 'John', 'Keith', '0123456789', '21 Jump Street');
INSERT INTO clients VALUES ('C02', 'Amelia', 'Francis', '0197453625', '22 Jump Street');
INSERT INTO clients VALUES ('C03', 'Kimberley', 'Esgrate','0179352647', '23 Land Street');
INSERT INTO clients VALUES ('C04', 'Norman', 'Bates', '0108645372', '17 Drain Avenue');
INSERT INTO clients VALUES ('C05', 'Timothy', 'Brick', '0187645344', '06 Fork Lane');
INSERT INTO clients VALUES ('C06', 'Eric', 'Crane', '0178564736', '10 Shadow Brook');
INSERT INTO clients VALUES ('C07', 'Brock', 'Stone', '0167463528', '9 Green Lake Lane');
INSERT INTO clients VALUES ('C08', 'Jack', 'Hammer', '0127456347', '64 Marvon Avenue');
INSERT INTO clients VALUES ('C09', 'Da Shun', 'Fun', '0122456265', '28 Grapevine Drive');
INSERT INTO clients VALUES ('C10', 'Cementha', 'Mekser', '0187457489', '29 Herman Lane');

INSERT INTO contracts VALUES ('CTR01', '01/02/2017', '01/03/2017', '02/08/2017', '02/08/2017', 5, 'S', NULL, 'C01');
INSERT INTO contracts VALUES ('CTR02', '05/02/2017', '16/02/2017', '18/06/2017', '17/08/2017', 4, 'U', 2, 'C02');
INSERT INTO contracts VALUES ('CTR03', '09/06/2017', '22/02/2017', '08/06/2017', '22/06/2017', 4, 'S', NULL, 'C03');
INSERT INTO contracts VALUES ('CTR04', '15/02/2017', '01/03/2017', '06/07/2017', '06/07,2017', 4, 'S', NULL, 'C04');
INSERT INTO contracts VALUES ('CTR05', '22/02/2017', '04/03/2017', '13/07/2017', '30/06/2017', 4, 'S', NULL, 'C05');
INSERT INTO contracts VALUES ('CTR06', '09/03/2017', '16/03/2017', '30/07/2017', '20/07/2017', 5, 'S', NULL, 'C06');
INSERT INTO contracts VALUES ('CTR07', '21/03/2017', '22/03/2017', '09/08/2017', '03/08/2017', 5, 'S', NULL, 'C07');
INSERT INTO contracts VALUES ('CTR08', '30/03/2017', '13/04/2017', '23/09/2017', '21/09/2017', 5, 'S', NULL, 'C08');
INSERT INTO contracts VALUES ('CTR09', '03/04/2017', '22/04/2017', '24/05/2017', '23/06/2017', 1, 'U', 1, 'C09');
INSERT INTO contracts VALUES ('CTR10', '13/04/2017', '28/04/2017', '26/10/2017', '24/11/2017', 6, 'U', 1, 'C10');

INSERT INTO skills VALUES ('SK01', 'Java Programming', 23.0);
INSERT INTO skills VALUES ('SK02', 'HTML Programming', 12.0);
INSERT INTO skills VALUES ('SK03', 'Ruby Programming', 18.0);
INSERT INTO skills VALUES ('SK04', 'C Programming', 30.0);
INSERT INTO skills VALUES ('SK05', 'PHP Programming', 24.0);
INSERT INTO skills VALUES ('SK06', 'Swift Programming', 15.0);
INSERT INTO skills VALUES ('SK07', 'Unity Programming', 28.0);
INSERT INTO skills VALUES ('SK08', 'SQL Programming', 17.0);
INSERT INTO skills VALUES ('SK09', 'Python Programming', 16.0);
INSERT INTO skills VALUES ('SK10', 'JavaScript Programming', 19.0);

INSERT INTO contractors VALUES ('CN01', 'Lee Bil Ding', '76 Rockcrest Street','0178656524', 'SK01', 'CTR01', 283); 
INSERT INTO contractors VALUES ('CN02', 'Kam Thoo Bid', '04 Jennings Avenue', '0176453745', 'SK02', 'CTR02', 176);
INSERT INTO contractors VALUES ('CN03', 'Weah Fook Heng', '23 Buckingham Lane','0145362745', 'SK03', 'CTR03', 154); 
INSERT INTO contractors VALUES ('CN04', 'Sam Moh Wat', '45 High Ridge Drive','0187635426', 'SK04', 'CTR04', 143);  
INSERT INTO contractors VALUES ('CN05', 'Ahmad bin Cement', '87 Race Lane','0196253746', 'SK05', 'CTR05', 167);
INSERT INTO contractors VALUES ('CN06', 'Wee Chyanna', '35 Goldfield Rd','0157263549', 'SK06', 'CTR06', 275);
INSERT INTO contractors VALUES ('CN07', 'Kam Bi-Li', '44 Shirley Ave','0167835244', 'SK07', 'CTR07', 246);
INSERT INTO contractors VALUES ('CN08', 'Lee Yee Hao', '70 Bowman Street','0193567379', 'SK08', 'CTR08', 288);
INSERT INTO contractors VALUES ('CN09', 'Bryan Pang', '24 Magnolia Street','0191793294', 'SK09', 'CTR09', 70);
INSERT INTO contractors VALUES ('CN10', 'One Chien Qin', '87 Roast Drive','0176382582', 'SK10', 'CTR10', 345);
INSERT INTO contractors VALUES ('CN11', 'William Blue', '63 Fleet Street','0178653524', 'SK01', 'CTR01', 272); 
INSERT INTO contractors VALUES ('CN12', 'Daniel Red', '23 Sunset Avenue', '0176457645', 'SK02', 'CTR02', 169);
INSERT INTO contractors VALUES ('CN13', 'Noah Reeding', '22 Crooked Lane','0145362745', 'SK03', 'CTR03', 148); 
INSERT INTO contractors VALUES ('CN14', 'Malcolm Tucker', '98 Blue Drive','0128635426', 'SK04', 'CTR04', 145);  
INSERT INTO contractors VALUES ('CN15', 'Simon Black', '18 Rose Lane','0196259846', 'SK05', 'CTR05', 162);
INSERT INTO contractors VALUES ('CN16', 'Bryan Green', '3 Sparrow Road','0157263549', 'SK06', 'CTR06', 258);
INSERT INTO contractors VALUES ('CN17', 'James Corden', '66 Eagle Ave','0167234244', 'SK07', 'CTR07', 232);
INSERT INTO contractors VALUES ('CN18', 'Grant Davis', '32 Owl Drive','0193567925', 'SK08', 'CTR08', 299);
INSERT INTO contractors VALUES ('CN19', 'Natalia Tan', '19 May Street','0191764734', 'SK09', 'CTR09', 82);
INSERT INTO contractors VALUES ('CN20', 'Tan Wei Soon', '18 Birch Drive','0116292582', 'SK10', 'CTR10', 327);
INSERT INTO contractors VALUES ('CN21', 'Kamaleswari Muniandy', '2 Willow Street','0176092583', 'SK01', 'CTR01', 290);
INSERT INTO contractors VALUES ('CN22', 'Maya White', '3 RidgeWood Lane','0176382287', 'SK01', 'CTR01', 277);
INSERT INTO contractors VALUES ('CN23', 'Jasmine Tee', '4 Colombia Avenue','0176306788', 'SK01', 'CTR01', 253);
INSERT INTO contractors VALUES ('CN24', 'Sally Bonnaire', '5 Raven Rd','0176382563', 'SK01', 'CTR01', 238);

INSERT INTO jobs VALUES ('J01', 'Desktop Application Development','01/02/2017', '01/03/2017', '02/08/2017', 'O', 'SK01', 'CN01', 'CTR01');
INSERT INTO jobs VALUES ('J02', 'Website Development (Front-End)', '05/02/2017', '16/02/2017', '18/06/2017', 'O', 'SK02', 'CN02', 'CTR02');
INSERT INTO jobs VALUES ('J03', 'Website Development (Back-End)', '09/06/2017', '16/02/2017', '18/06/2017' , 'C', 'SK03', 'CN03', 'CTR03');
INSERT INTO jobs VALUES ('J04', 'Mobile Operating System Development', '15/02/2017', '01/03/2017', '06/07/2017', 'O', 'SK04', 'CN04', 'CTR04');
INSERT INTO jobs VALUES ('J05', 'Server Maintenance', '22/02/2017', '04/03/2017', '13/07/2017', 'O', 'SK05', 'CN05', 'CTR05');
INSERT INTO jobs VALUES ('J06', 'IOS Game Development', '09/03/2017', '16/03/2017', '30/07/2017', 'O', 'SK06', 'CN06', 'CTR06');
INSERT INTO jobs VALUES ('J07', 'Console Game Development', '21/03/2017', '16/03/2017', '30/07/2017', 'O','SK07', 'CN07', 'CTR07');
INSERT INTO jobs VALUES ('J08', 'Database Designing', '30/03/2017', '13/04/2017', '23/09/2017', 'O', 'SK08', 'CN08', 'CTR08');
INSERT INTO jobs VALUES ('J09', 'Network Penetration Testing', '03/04/2017', '22/04/2017', '24/05/2017', 'O', 'SK09', 'CN09', 'CTR09');
INSERT INTO jobs VALUES ('J10', 'Web Application Development', '13/04/2017', '28/04/2017', '26/10/2017', 'O', 'SK10', 'CN10', 'CTR10');
INSERT INTO jobs VALUES ('J11', 'Android Game Development', '17/04/2017', '18/04/2017', '21/09/2017', 'O', 'SK01', 'CN01', 'CTR01');

INSERT INTO job_contractor VALUES ('J01', 'CN01', 'P');
INSERT INTO job_contractor VALUES ('J02', 'CN02', 'F');
INSERT INTO job_contractor VALUES ('J03', 'CN03', 'F');
INSERT INTO job_contractor VALUES ('J04', 'CN04', 'P');
INSERT INTO job_contractor VALUES ('J05', 'CN05', 'F');
INSERT INTO job_contractor VALUES ('J06', 'CN06', 'P');
INSERT INTO job_contractor VALUES ('J07', 'CN07', 'P');
INSERT INTO job_contractor VALUES ('J08', 'CN08', 'F');
INSERT INTO job_contractor VALUES ('J09', 'CN09', 'F');
INSERT INTO job_contractor VALUES ('J10', 'CN10', 'F');
INSERT INTO job_contractor VALUES ('J11', 'CN01', 'P');





