-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?
Case #002: The Stolen Sound
In the neon glow of 1980s Los Angeles, the West Hollywood Records store was rocked by a daring theft. A prized vinyl record, worth over $10,000, vanished during a busy evening, leaving the store owner desperate for answers. Vaguely recalling the details, you know the incident occurred on July 15, 1983, at this famous store. Your task is to track down the thief and bring them to justice.

SELECT * FROM crime_scene
WHERE location = 'West Hollywood Records';
--id	 date	    type	location	            description
--65	19830715	theft	West Hollywood Records	A prized vinyl record was stolen from the store during a busy evening.

SELECT * FROM witnesses;
--id	crime_scene_id	clue

SELECT * FROM witnesses
WHERE crime_scene_id = 65;
--id	crime_scene_id	clue
--28	65	            I saw a man wearing a red bandana rushing out of the store.
--75	65	            The main thing I remember is that he had a distinctive gold watch on his wrist.

SELECT * FROM suspects
WHERE bandana_color ='red'
AND accessory = 'gold watch';

--id	name	        bandana_color	accessory
--35	Tony Ramirez	red	            gold watch
--44	Mickey Rivera	red	            gold watch
--97	Rico Delgado	red	            gold watch
SELECT * 
FROM 
interviews 
WHERE suspect_id = 35
OR suspect_id = 44
OR suspect_id = 97;

--suspect_id	transcript
--35	        I wasn't anywhere near West Hollywood Records that night.
--44	        I was busy with my music career; I have nothing to do with this theft.
--97	        I couldn't help it. I snapped and took the record.

SELECT * FROM suspects 
WHERE id = 97;
HE DID IT !!! RICO DELGADO THAT NAUGTHY GUY!
--id	name	        bandana_color	accessory
--97	Rico Delgado	red	            gold watch
