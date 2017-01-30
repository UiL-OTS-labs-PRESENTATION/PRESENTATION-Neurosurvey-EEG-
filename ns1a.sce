# This file is made/ adapted by Esther Meeuwissen. For questions esther.meeuwissen@fcdonders.ru.nl
# may2012 This file is adapted by Marijn Struiksma. For questions m.struiksma@uu.nl

pcl_file = "ns1a.pcl"; 								# pcl file naam geven
scenario = "ns1a.sce"; 									# for log-file
default_font_size = 25;                      # grootte v/d letters

default_background_color = 0, 0, 0;    		# use black
default_text_color = 150, 150, 150;         # use light grey as default

#screen_height = 768;                        # display settings
#screen_width = 1024;                        # display settings
#screen_bit_depth = 8;  							# display settings
#pulse_width = 100;									# determines the length of time that the codes remain on the port
#write_codes = true; 									# presentation will write user defined codes to the output port when an event occurs
active_buttons = 5;									# 5 buttons actief
button_codes = 6, 7, 8, 9, 253;						
#response_port_output = true; 						# zo is er geen output bij response events (dit wordt in de pcl file tijdelijk opgeheven, zo komen er geen respons markers op het moment dat er geen responsen gemaakt mogen worden)
#response_matching=simple_matching;
 
begin;													# starten scenario

picture {} default; 									# betekent dat de standaard picture in beeld een leeg scherm is

picture {text { caption = " "; } text1;	   # met als text het woord gedefinieerd door 'text1'
         x = 0; y = 0;} pict1;
picture {text { caption = "  ";}; 			   # dat bestaat uit een blank screen
			x = 0; y = 0;} pict2;

nothing { default_code = "space"; } stim; # empty stimulus
		
######################################### default-trial
trial {   												# trial definieren
   all_responses = false;							# only responses that occur while some stimulus is active can affect the trial duration
	stimulus_event {									# definieren 1e stimulus event
		nothing stim;
		time = 0; 										# op t=0
 		} event; 										# het stimulus event heet event
		
	#stimulus_event {									# definieren van het 2e stimulus event
		#picture pict2;							# in het midden
		#	duration = 150; 	
		#} eventcode;
								# het stimulus event heet eventcode
 } trial1;  		

trial {   												# trial definieren
   all_responses = false;							# only responses that occur while some stimulus is active can affect the trial duration
	stimulus_event {									# definieren 1e stimulus event
		nothing stim;
		time = 0; 										# op t=0
 		} eventcode; 										# het stimulus event heet event
} trial2;  
									# de hele trial heet trial1
 
####################################  opinie-screen
trial {													# trial definieren
	trial_type = specific_response;
	terminator_button = 1, 2, 3, 4;			
	trial_duration = 7000;							# duur is 7 seconden
	start_delay = 250;	
	stimulus_event{										# start op t=750
		picture {											# het object is een picture
			text {font_size = 25; caption = "  \t";}knop1; x=-200;y=0;			#antwoord scherm opbouwen
			text {font_size = 25; caption = " \t";}knop2; x=-67;y=0;
			text {font_size = 25; caption = "\t";}knop3; x=67;y=0;
			text {font_size = 25; caption = "\t";}knop4; x=200;y=0;
			text {font_size = 25; caption = " juist";}mening1; x=-195;y=-55;
			text {font_size = 25; caption = " ";}mening2; x=-90;y=-55;
			text {font_size = 25; caption = "  onjuist";}mening3; x=195;y=-55;
			text {font_size = 25; caption = " ";}mening4; x=90;y=-55;};
	code = "opinie1";
	response_active = true;								# zorgt ervoor dat de responsen doorkomen tijdens deze trial, dit wordt zo gedefinieerd bij een response active non target
	} corrscherm1;
} opinie1; 		

trial {													# trial definieren
	trial_type = specific_response;
	terminator_button = 1, 2, 3, 4;					# ?
	trial_duration = 7000;							# duur is 7 seconden
	start_delay = 250;	
	stimulus_event{										# start op t=750
		picture {											# het object is een picture
			text {font_size = 25; caption = "  \t";}knop5; x=-200;y=0;			#antwoord scherm opbouwen
			text {font_size = 25; caption = " \t";}knop6; x=-67;y=0;
			text {font_size = 25; caption = "\t";}knop7; x=67;y=0;
			text {font_size = 25; caption = "\t";}knop8; x=200;y=0;
			text {font_size = 25; caption = " onjuist";}mening5; x=-195;y=-55;
			text {font_size = 25; caption = " ";}mening6; x=-90;y=-55;
			text {font_size = 25; caption = "  juist";}mening7; x=195;y=-55;
			text {font_size = 25; caption = " ";}mening8; x=90;y=-55;};
	code = "opinie2";
	response_active = true;								# zorgt ervoor dat de responsen doorkomen tijdens deze trial, dit wordt zo gedefinieerd bij een response active non target
	} corrscherm2;
} opinie2; 		

####################################### start-screen that precedes the practice-session
trial {													# trial definieren
	trial_type = specific_response;
	terminator_button = 5;					# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	picture { 											# het object is een picture
		text { caption = "Je krijgt telkens zinnen te lezen. 
Hierna moet je aangeven in 
hoeverre je het hiermee eens bent.

Na de zin volgt een fixatiekruisje: *
Als je dit ziet kun je evt. even knipperen.

Je mag nu eerst een paar keer oefenen.
Start de oefensessie door op de 
spatiebalk te drukken.
Succes!";}; 		# met de text 'oefensessie'
		x = 0; y = 0;};								# in het midden van het scherm														
	response_active = true;  						# responsen komen door
} oefen; 												# deze trial heet oefen

trial {													# trial definieren
	trial_duration=forever;	
	trial_type = specific_response;				# eerste response eindigt de trial				
	terminator_button=5;
	picture { 											# object is een picture
		text { caption = "Einde van de oefensessie.

De proefleider komt nu even binnen.
Heb je nog vragen, dan kun je die nu
aan de proefleider stellen.

Start het experiment door op de 
spatiebalk te drukken.
Succes!";}; 	# met de text 'einde van de oefensessie'
		x = 0; y = 0;};								# in het middel van het scherm															
	response_active = true; 					   # responsen mogen nu doorkomen
} eindeoefen;											# deze trial heel eindeoefen

############################## fixatie
 trial {													# trial definieren
	trial_duration = 1000; 							# trial duur 1000 ms
	picture { text { caption = "*";}; 			# met de text '*'
		x = 0; y = 0;};	
response_active = true;  							# in het midden van het scherm
} fix;  													# de trial heet fix

################################# end-screen
trial {													# trial definieren
	trial_type = first_response;					# eerste response eindigt de trial (wacht op respons)
	trial_duration = forever;                 # trial duur oneindig  
	picture { text { caption = "Einde van de taak";}; # picture met de text 'einde van het experiment'
		x = 0; y = 0;};								# in het midden van het scherm															# de correcte response is button 1
	response_active = true;  						# responsen mogen tijdens deze trial doorkomen
} einde;  												# de trial heet einde

################################# blank-screen
trial {													# trial definieren
		trial_duration = 1000; 						# trial duur 1000 ms
		picture { 										# het object is een picture
		text { caption = " ";}; 					# met de text '*'
		x = 0; y = 0;};
response_active = true;    								# in het midden van het scherm
} blank;  												# de trial heet blank

##################################### play beep-sound
wavefile { filename = "beep.wav"; } beepwav; # filenaam van de wavfile geven en deze wavfile beepwav noemen								
trial {													# trial definieren
   sound { wavefile beepwav; } sound1;			# geluid van wavfile beepwav is sound1
	code = "beep";
} beep; 													# de trial heet beep

#################################### photo's
trial {													# trial definieren
	trial_type = specific_response;
   terminator_button=5;					# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	picture { 											# het object is een picture
		text { caption = "Druk op de spatiebalk
als je klaar bent
om verder te gaan";}; 		# met de text 'oefensessie'
		x = 0; y = 0;};								# in het midden van het scherm														
	response_active = true;  						# responsen komen door
} endpause; 

trial{
	trial_duration=30000;
	trial_type=fixed;
	picture{
		bitmap{ filename = "kikker.jpg";};
		x=0;y=0;
	} pic1;
	code = "pause1";
	response_active=true;
} photo1;

trial{
	trial_duration=30000;
	trial_type=fixed;
	picture{
		bitmap{ filename = "kikker.jpg";};
		x=0;y=0;
	} pic2;
	code = "pause2";
	response_active=true;
} photo2;

trial{
	trial_duration=30000;
	trial_type=fixed;
	picture{
		bitmap{ filename = "kikker.jpg";};
		x=0;y=0;
	} pic3;
	code = "pause3";
	response_active=true;
} photo3;

trial{
	trial_duration=30000;
	trial_type=fixed;
	picture{
		bitmap{ filename = "kikker.jpg";};
		x=0;y=0;
	} pic4;
	code = "pause4";
	response_active=true;
} photo4;

trial{
	trial_duration=30000;
	trial_type=fixed;
	picture{
		bitmap{ filename = "kikker.jpg";};
		x=0;y=0;
	} pic5;
	code = "pause5";
	response_active=true;
} photo5;
