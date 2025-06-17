-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?
SELECT * FROM crime_scene
WHERE location = 'Coral Bay Marina';

RESULTS:

The body of an unidentified man was found near the docks. Two people were seen nearby: one who lives on 300ish "Ocean Drive" and another whose first name ends with "ul" and his last name ends with "ez".SELECT * FROM person

RESULTS:

SELECT * FROM person
WHERE name LIKE '%ez';

RESULTS : 
102	Raul Gutierrez	The Cobra	Nightclub Owner	45 Sunset Ave
101	Carlos Mendez	Los Ojos	Fisherman	369 Ocean Drive
62	Jesse Brooks	The Judge	Court Clerk	234 Ocean Drive

SELECT * FROM  interviews
WHERE person_id = 101
OR person_id = 102;

101	101	I saw someone check into a hotel on August 13. The guy looked nervous.
103	102	I heard someone checked into a hotel with "Sunset" in the name.

SELECT * FROM hotel_checkins
WHERE hotel_name LIKE '%SUNSET%'
AND check_in_date = 19860813;

SELECT * 
FROM hotel_checkins
JOIN surveillance_records
ON surveillance_records.hotel_checkin_id = hotel_checkins.id
WHERE hotel_name LIKE '%SUNSET%'
AND check_in_date = 19860813;

RESULTS:
id	person_id	hotel_name	        check_in_date	id	person_id	hotel_checkin_id	suspicious_activity
34	39	        Sunset Coast Inn	19860813	    6	6	            34	            Spotted entering late at night
2	27	        Sunset Bay Hotel	19860813	    8	8	            2	            Left suddenly at 3 AM
28	33	        Sunset Crest Hotel	19860813	    157	157	           28	            Broke the vending machine

SELECT * FROM confessions
WHERE person_id = 8
OR person_id = 157
OR person_id = 34;
RESULTS:
28	34	Alright! I confess to the insurance fraud.
73	8	Alright! I did it. I was paid to make sure he never left the marina alive.

SELECT * FROM person
WHERE id = 8;
RESULT:
8	Thomas Brown	The Fox	Dock Worker	
