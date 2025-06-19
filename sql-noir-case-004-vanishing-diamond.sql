-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?
SELECT * FROM crime_scene
WHERE location = 'Fontainebleau Hotel';

RESULTS:
id	date	location	description
48	19870520	Fontainebleau Hotel	The Heart of Atlantis necklace disappeared. Many guests were questioned but only two of them gave valuable clues. One of them is a really famous actor. The other one is a woman who works as a consultant for a big company and her first name ends with "an".

SELECT * FROM guest
WHERE occupation = 'Actor'
OR occupation = 'Consultant'
AND name LIKE '%an%';

RESULTS:

id	name	         occupation	 invitation_code
43	Ruby Baker	     Actor	     VIP-R
116	Vivian Nair	     Consultant	 VIP-R
129	Clint Eastwood   Actor	     VIP-G
138	Phoenix Sandoval Consultant	 VIP-G
164	River Bowers	 Actor	     VIP-B
189	Sage Dillon	     Actor	     VIP-G
192	Phoenix Pitts	 Actor	     VIP-G

SELECT * FROM witness_statements
WHERE guest_id = 116
OR guest_id = 129;

RESULTS:
id	guest_id	clue
16	116	        I saw someone holding an invitation ending with "-R". He was wearing a navy suit and a white tie.
50	129	        I overheard someone say, "Meet me at the marina, dock 3.

SELECT * FROM attire_registry
WHERE note = 'navy suit, white tie';
RESULTS:
id	guest_id	note
30	156	        navy suit, white tie
42	145	        navy suit, white tie
48	105	        navy suit, white tie
53	112	        navy suit, white tie
58	190	        navy suit, white tie
61	189	        navy suit, white tie
63	167	        navy suit, white tie
67	190	        navy suit, white tie

SELECT guest.id, guest.name, guest.invitation_code,
       attire_registry.note AS attire, marina_rentals.dock_number, marina_rentals.rental_date, marina_rentals.boat_name
FROM guest
JOIN attire_registry ON guest.id = attire_registry.guest_id
JOIN marina_rentals ON guest.id = marina_rentals.renter_guest_id
WHERE attire_registry.note LIKE '%navy suit, white tie%'
  AND guest.invitation_code LIKE '%-R'
  AND marina_rentals.dock_number = 3;

RESULTS:
id	name	        invitation_code	 attire	                dock_number	    rental_date	 boat_name
105	Mike Manning	VIP-R	         navy suit, white tie	3	            19870520	 Coastal Spirit

SELECT guest.name, final_interviews.confession
FROM guest
JOIN final_interviews ON guest.id = final_interviews.guest_id
WHERE guest.id = 105;

RESULT:
name	        confession
Mike Manning	I was the one who took the crystal. I guess I need a lawyer now?
  BE SUBMITTED
