proc/ScomTime() //this handles the vast majority of setup for SCOM. Warping, dressing and shuttles for differentiating between pop
	world<<("\red \b Welcome to the S-COM project... Congratulations! If you are reading this, then the time has come for you to drop your death commando armor, Syndicate assault squad hardsuit, Terran Republic marine gear or other and work with your most hated foes to fight a threat that will likely destroy us all! Ahead of you is a life of training, fighting supernatural and alien threats, and protecting the galaxy and all within it! Because we worry about our soldiers, we feel it needed to warn you of threats you will likely face. You will be fighting unknown threats that we have no information on, known alien lifeforms, and in the event of a Council corporation splitting off, subduing any possible leaks in the  project. It will not be an easy task, and many of you will likely die. Your first task is to secure a pair of Nanotrasen communication satellites in the Nyx system. The fate of humanity rests in your hands. Good luck!")

	for(var/mob/living/carbon/human/M in player_list)//yeah, using other code is nice. if urist doesn't die, i'll condense them all into one proc probably.

		for (var/obj/item/I in M)
			if (istype(I, /obj/item/weapon/implant) || istype(I, /obj/item/weapon/card/id)) //we're going to actually let them keep their IDs because their account is tied to it
				continue
			del(I)

		if(M.job == "Captain")

			M.equip_to_slot_or_del(new /obj/item/clothing/under/rank/centcom(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/suit/captunic(M), slot_wear_suit)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/weapon/pen(M), slot_r_ear)
			M.equip_to_slot_or_del(new /obj/item/device/radio/headset/syndicate(M), slot_l_ear)
			M.equip_to_slot_or_del(new /obj/item/clothing/mask/cigarette(M), slot_wear_mask)
			M.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/formalcaptain(M), slot_head)
			M.equip_to_slot_or_del(new /obj/item/weapon/storage/fancy/cigarettes(M), slot_belt)
			M.equip_to_slot_or_del(new /obj/item/weapon/flame/lighter/zippo(M), slot_r_store)

			for (var/obj/item/weapon/card/id/W in M)
				W.name = "[M.real_name]'s ID Card"
				W.icon_state = "centcom"
				W.access = get_all_accesses()
				W.assignment = "Commander"
				W.registered_name = M.real_name
			M.loc = pick(scomspawn1)
			M << ("\red You are the Commander of the S-COM forces. You are expected to control all local aspects of your S-COM base, research, medical, supply and tactical. You should not attend combat missions yourself, unless you have no other option. Your goal is to ensure the project runs smoothly. You report only to the Council and its members. Good luck, the fate of the galaxy rests on your frail shoulders.")

		else if(M.job in list("Research Director", "Scientist"))
			M.equip_to_slot_or_del(new /obj/item/device/radio/headset/syndicate(M), slot_l_ear)
			M.equip_to_slot_or_del(new /obj/item/clothing/under/rank/scientist(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/device/pda/science(M), slot_belt)
			M.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/toxins(M), slot_back)
			M.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(M.back), slot_in_backpack)
			M.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/toggle/labcoat/science(M), slot_wear_suit)

			for (var/obj/item/weapon/card/id/W in M)
				W.name = "[M.real_name]'s ID Card"
				W.icon_state = "centcom"
				W.access = get_all_accesses()
				W.assignment = "Researcher"
				W.registered_name = M.real_name
			M.loc = pick(scomspawn2)
			M << ("\red You are the Researcher. It is your job to bother the operatives to bring back whatever they can recover from their missions. You will use this, along with the provided facilities to advance the cause of science. It is your job to provide the soldiers with new equipment to match the rising alien threat. It is also your duty to heal any returning injured soldiers. You report to the Commander, good luck.")

/*		else if(M.job in list("Clown", "Mime"))
			M.equip_to_slot_or_del(new /obj/item/device/radio/headset/syndicate(M), slot_l_ear)
			M.equip_to_slot_or_del(new /obj/item/clothing/under/psysuit(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/urist/military/scom(M), slot_belt)
			M.equip_to_slot_or_del(new /obj/item/clothing/head/wizard/amp(M), slot_head)
			M.equip_to_slot_or_del(new /obj/item/clothing/suit/wizrobe/psypurple(M), slot_wear_suit)
			M.equip_to_slot_or_del(new /obj/item/weapon/staff(M), slot_l_hand)
			M.mutations.Add(HEAL)
			M.spell_list += new /obj/effect/proc_holder/spell/targeted/turf_teleport/blink(M)
			M.spell_list += new /obj/effect/proc_holder/spell/aoe_turf/conjure/forcewall(M)
			M.spell_list += new /obj/effect/proc_holder/spell/targeted/smoke(M)
			M.mutations.Add(LASER) //TODO: FIX THIS SHIT

			for (var/obj/item/weapon/card/id/W in M)
				W.name = "[M.real_name]'s ID Card"
				W.icon_state = "centcom"
				W.access = get_all_accesses()
				W.assignment = "S-COM Psionic Operative"
				W.registered_name = M.real_name
			M.loc = pick(scomspawn3)
			M << ("\red You are the psionic operative. Handpicked from members of the Wizards Federation, you will use your advanced psionic powers to aid your fellow soldiers, and to fight the enemy. However, the Wizards Federation has a poor sense of humour, and there are many clowns among your ranks. Either way, try not using guns, it won't end well for you. You report to the commander.")
*/

		else
			M.equip_to_slot_or_del(new /obj/item/device/radio/headset/syndicate(M), slot_l_ear)
			M.equip_to_slot_or_del(new /obj/item/clothing/under/rank/centcom(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/swat(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/clothing/gloves/swat(M), slot_gloves)
			M.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/urist/military/scom(M), slot_belt)
			M.equip_to_slot_or_del(new /obj/item/clothing/head/beret/sec/alt(M), slot_head)

			for (var/obj/item/weapon/card/id/W in M)
				W.name = "[M.real_name]'s ID Card"
				W.assignment = "S-COM Operative"
				W.access = get_all_accesses()
				W.registered_name = M.real_name
			M.loc = pick(scomspawn3)
			M << ("\red You are the backbone of the S-COM project. The operatives. Divided into four classes (Combat Medic, Assault, Heavy, Sniper), you are the last and greatest line of defence against the alien menace. You report to the commander. Good luck soldier, the fate of the galaxy rests on your frail shoulders.")
		M.regenerate_icons()

	for(var/mob/living/silicon/S in player_list)
		if(istype(S, /mob/living/silicon/robot))
			S.loc = pick(scomspawn3)
		else if(istype(S, /mob/living/silicon/ai))
			var/mob/living/silicon/robot/R = new /mob/living/silicon/robot(S.loc)
			R.ckey = S.ckey
			R.loc = pick(scomspawn3)
			del(S)

/mob/new_player/proc/ScomLateJoin(var/mob/living/L)
	if(L.mind.assigned_role == "Cyborg")
		L.loc = pick(scomspawn3)

	else

		for (var/obj/item/I in L)
			if (istype(I, /obj/item/weapon/implant) || istype(I, /obj/item/weapon/card/id))
				continue
			del(I)

		if(L.job == "Captain")

			L.equip_to_slot_or_del(new /obj/item/clothing/under/rank/centcom(L), slot_w_uniform)
			L.equip_to_slot_or_del(new /obj/item/clothing/suit/captunic(L), slot_wear_suit)
			L.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(L), slot_shoes)
			L.equip_to_slot_or_del(new /obj/item/weapon/pen(L), slot_r_ear)
			L.equip_to_slot_or_del(new /obj/item/device/radio/headset/syndicate(L), slot_l_ear)
			L.equip_to_slot_or_del(new /obj/item/clothing/mask/cigarette(L), slot_wear_mask)
			L.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/formalcaptain(L), slot_head)
			L.equip_to_slot_or_del(new /obj/item/weapon/storage/fancy/cigarettes(L), slot_belt)
			L.equip_to_slot_or_del(new /obj/item/weapon/flame/lighter/zippo(L), slot_r_store)

			for (var/obj/item/weapon/card/id/W in L)
				W.name = "[L.real_name]'s ID Card"
				W.icon_state = "centcom"
				W.access = get_all_accesses()
				W.assignment = "Commander"
				W.registered_name = L.real_name
			L.loc = pick(scomspawn1)
			L << ("\red You are the Commander of the S-COM forces. You are expected to control all local aspects of your S-COM base, research, medical, supply and tactical. You should not attend combat missions yourself, unless you have no other option. Your goal is to ensure the project runs smoothly. You report only to the Council and its members. Good luck, the fate of the galaxy rests on your frail shoulders.")

		else if(L.job in list("Research Director", "Scientist"))
			L.equip_to_slot_or_del(new /obj/item/device/radio/headset/syndicate(L), slot_l_ear)
			L.equip_to_slot_or_del(new /obj/item/clothing/under/rank/scientist(L), slot_w_uniform)
			L.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(L), slot_shoes)
			L.equip_to_slot_or_del(new /obj/item/device/pda/science(L), slot_belt)
			L.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/toxins(L), slot_back)
			L.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(L.back), slot_in_backpack)
			L.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/toggle/labcoat/science(L), slot_wear_suit)

			for (var/obj/item/weapon/card/id/W in L)
				W.name = "[L.real_name]'s ID Card"
				W.icon_state = "centcom"
				W.access = get_all_accesses()
				W.assignment = "Researcher"
				W.registered_name = L.real_name
			L.loc = pick(scomspawn2)
			L << ("\red You are the Researcher. It is your job to bother the operatives to bring back whatever they can recover from their missions. You will use this, along with the provided facilities to advance the cause of science. It is your job to provide the soldiers with new equipment to match the rising alien threat. It is also your duty to heal any returning injured soldiers. You report to the Commander, good luck.")

/*		else if(L.job in list("Clown", "Mime"))
			L.equip_to_slot_or_del(new /obj/item/device/radio/headset/syndicate(L), slot_l_ear)
			L.equip_to_slot_or_del(new /obj/item/clothing/under/psysuit(L), slot_w_uniform)
			L.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(L), slot_shoes)
			L.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/urist/military/scom(L), slot_belt)
			L.equip_to_slot_or_del(new /obj/item/clothing/head/wizard/amp(L), slot_head)
			L.equip_to_slot_or_del(new /obj/item/clothing/suit/wizrobe/psypurple(L), slot_wear_suit)
			L.equip_to_slot_or_del(new /obj/item/weapon/staff(L), slot_l_hand)
			L.mutations.Add(HEAL)
			L.spell_list += new /obj/effect/proc_holder/spell/targeted/turf_teleport/blink(L)
			L.spell_list += new /obj/effect/proc_holder/spell/aoe_turf/conjure/forcewall(L)
			L.spell_list += new /obj/effect/proc_holder/spell/targeted/smoke(L)
			L.mutations.Add(LASER) //TODO: FIX THIS SHIT

			for (var/obj/item/weapon/card/id/W in L)
				W.name = "[L.real_name]'s ID Card"
				W.icon_state = "centcom"
				W.access = get_all_accesses()
				W.assignment = "S-COM Psionic Operative"
				W.registered_name = L.real_name
			L.loc = pick(scomspawn3)
			L << ("\red You are the psionic operative. Handpicked from members of the Wizards Federation, you will use your advanced psionic powers to aid your fellow soldiers, and to fight the enemy. However, the Wizards Federation has a poor sense of humour, and there are many clowns among your ranks. Either way, try not using guns, it won't end well for you. You report to the commander.")
*/

		else
			L.equip_to_slot_or_del(new /obj/item/device/radio/headset/syndicate(L), slot_l_ear)
			L.equip_to_slot_or_del(new /obj/item/clothing/under/rank/centcom(L), slot_w_uniform)
			L.equip_to_slot_or_del(new /obj/item/clothing/shoes/swat(L), slot_shoes)
			L.equip_to_slot_or_del(new /obj/item/clothing/gloves/swat(L), slot_gloves)
			L.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/urist/military/scom(L), slot_belt)
			L.equip_to_slot_or_del(new /obj/item/clothing/head/beret/sec/alt(L), slot_head)
			for (var/obj/item/weapon/card/id/W in L)
				W.name = "[L.real_name]'s ID Card"
				W.assignment = "S-COM Operative"
				W.access = get_all_accesses()
				W.registered_name = L.real_name
			L.loc = pick(scomspawn3)
			L << ("\red You are the backbone of the S-COM project. The operatives. Divided into four classes (Combat Medic, Assault, Heavy, Sniper), you are the last and greatest line of defence against the alien menace. You report to the commander. Good luck soldier, the fate of the galaxy rests on your frail shoulders.")
		L.regenerate_icons()

proc/LoadScom()

	if(!scommapsloaded)
		world << "\red \b Loading S-COM Maps..."

		var/file = file("maps/ScomMaps/missions1.dmm")
		if(isfile(file))
			maploader.load_map(file)
			world.log << "S-COM Maps loaded."

		world << "\red \b S-COM Maps loaded."

		scommapsloaded = 1
	else
		return