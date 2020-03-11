#region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\Icon\hunter stats.ico
#AutoIt3Wrapper_Outfile=..\new\hunter stats-x86.exe
#AutoIt3Wrapper_Outfile_x64=..\new\hunter stats-x64.exe
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Res_Fileversion=1.0.5.2
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=p
#AutoIt3Wrapper_Res_SaveSource=y
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Run_Tidy=y
#Obfuscator_Parameters=/striponly
#endregion ;**** Directives created by AutoIt3Wrapper_GUI ****
#region ;~ Options- Includes
#NoTrayIcon
#include <screencaptureV2.au3>
#include <GuiConstantsEx.au3>
#include <File.au3>
#include <Constants.au3>
#include <Misc.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <GUIEdit.au3>
#include <ListBoxConstants.au3>
#include <GUIstatusbar.au3>
#include <ButtonConstants.au3>
#include <GuiTab.au3>
#include <TabConstants.au3>
#include <Inet.au3>
#include <SliderConstants.au3>
#include <StaticConstants.au3>
#include <GuiListView.au3>
#include <APITailRW.au3>
Opt("GUIOnEventMode", 1)
Opt("MustDeclareVars", 1)
Opt("GUICloseOnESC", 0)
AutoItSetOption("WinTitleMatchMode", 3)
#endregion ;~ Options- Includes
#region ;~ Variables
Global Const $SC_DRAGMOVE = 0xF012
Global Const $GUI_ENABLE_1 = 64
Global Const $GUI_DISABLE_1 = 128
Global $mainconfig = @ScriptDir & "\settings\Mainconfig.ini", $dll = DllOpen("user32.dll"), $DwmDisabled = False, $chatloglocation = @MyDocumentsDir & "\Entropia Universe\chat.log"
Global $version = FileGetVersion(@ScriptFullPath), $releasedate = release_date()
Global $chatlogline = 0, $timestamp = @ScriptDir & "\timestamp.txt", $timestamp_url = "http://www.entropianservices.com/hunter_stats/timestamp.txt", $url = "http://www.entropianservices.com/hunter_stats/"
Global $file_ver = FileGetVersion(@ScriptDir & "\hunter stats-x64.exe"), $title = "Hunter Stat Logger - Open Source - " & $version, $weapon_id = 1, $tool_id = 1, $main_weapon_id = 1
Global $Reciving, $read_time, $read, $Case, $w1, $w2
Global $w3, $w4, $w5, $w6, $Tool1, $Tool2, $Tool3, $item, $current_item, $msg
Global $capture_folder, $If, $position_key, $position_key_hex, $time_stamp_key, $time_stamp_key_hex, $GUICtrlSetTip, $jpeg_quality_input, $weapon_key_w1, $weapon_key_hex_w1
Global $weapon_key_w2, $weapon_key_hex_w2, $weapon_key_w3, $weapon_key_hex_w3, $weapon_key_w4, $weapon_key_hex_w4, $weapon_key_w5, $weapon_key_hex_w5, $weapon_key_w6, $weapon_key_hex_w6
Global $tool_key_f1, $tool_key_hex_f1, $tool_key_f2, $tool_key_hex_f2, $tool_key_f3, $tool_key_hex_f3, $weapons_history, $weapon_history_w1, $weapon_history_w2, $weapon_history_w3
Global $weapon_history_w4, $weapon_history_w5, $weapon_history_w6, $Tool_history_f1, $Tool_history_f2, $Tool_history_f3, $skill_history, $dmgout
Global $cdmgout, $miss, $dmgin, $cdmgin, $skill, $skill2, $skill3, $heal, $enhancer, $noloot
Global $death, $global_avatar_h, $hof_avatar_h, $ath_avatar_h, $global_avatar_c, $hof_avatar_c, $ath_avatar_c, $global_avatar_m, $hof_avatar_m, $ath_avatar_m
Global $kill_spree, $first, $global_team_h, $hof_team_h, $ath_team_h, $new, $hunting_data, $While, $Hex, $ElseIf
Global $keyinput, $Until, $newlocation, $image_type, $file_name, $folder, $File, $folder_structure, $x
Global $decay_weapon, $y, $dmg_s, $dmg_s_history, $dmg_pec, $dmg_pec_history, $hit_ability, $hit_ability_history, $chit_ability, $chit_ability_history
Global $hit_count, $chit_count, $miss_count, $use_count, $totaldmg, $decay_tool, $skill_count_agility, $skill_count_Health, $skill_count_intelligence, $skill_count_psyche
Global $skill_count_stamina, $skill_count_strength, $skill_count_Alertness, $skill_count_athletics, $skill_count_bravado, $skill_count_coolness, $skill_count_courage, $skill_count_dexterity, $skill_count_intuition, $skill_count_perception
Global $skill_count_quickness, $skill_count_serendipity, $skill_count_aim, $skill_count_clubs, $skill_count_combat_reflexes, $skill_count_combat_sense, $skill_count_commando, $skill_count_handgun, $skill_count_heavy_melee_weapons, $skill_count_heavy_weapons
Global $skill_count_inflict_melee_damage, $skill_count_inflict_ranged_damage, $skill_count_kill_strike, $skill_count_light_melee_weapons, $skill_count_longblades, $skill_count_marksmanship, $skill_count_martial_arts, $skill_count_melee_combat, $skill_count_melee_damage_assessment, $skill_count_power_fist
Global $skill_count_ranged_damage_assessment, $skill_count_rifle, $skill_count_shortblades, $skill_count_support_weapon_systems, $skill_count_weapons_handling, $skill_count_whip, $skill_count_wounding, $skill_count_anatomy, $skill_count_diagnosis, $skill_count_doctor
Global $skill_count_first_aid, $skill_count_medical_therapy, $skill_count_medicine, $skill_count_treatment, $skill_count_bioregenesis, $skill_count_concentration, $skill_count_cryogenics, $skill_count_electrokinesis, $skill_count_ethereal_soul_language, $skill_count_force_merge
Global $skill_count_jamming, $skill_count_mindforce_harmony, $skill_count_power_catalyst, $skill_count_pyrokinesis, $skill_count_sweat_gatherer, $skill_count_telepathy, $skill_count_translocation, $skill_count_avoidance, $skill_count_Dispense_Decoy, $skill_count_dodge
Global $skill_count_evade, $Func, $month, $date_stamp, $time_stamp, $statsfolder, $global_folder, $tools_folder, $weapons_folder
Global $summary_file, $skills_file, $filesize, $date, $lines, $weapon_file_w1, $weapon_file_w2, $weapon_file_w3, $weapon_file_w4
Global $weapon_file_w5, $weapon_file_w6, $Tool_file_f1, $Tool_file_f2, $Tool_file_f3, $enable_global_capture_avatar, $avatar_name, $enable_global_capture_team, $team_name, $capture_delay
Global $image_type_bmp, $image_type_jpeg, $jpeg_quality, $enable_hunting_globals, $enable_hunting_hof, $enable_mining_globals, $enable_mining_hof, $enable_crafting_globals, $enable_crafting_hof, $enable_position
Global $enable_time_stamp, $hit_count_history, $chit_count_history, $miss_count_history, $use_count_history, $totaldmg_history, $hit_in_count_history, $chit_in_count_history, $totaldmg_in_history, $Tool_use_count_history
Global $skill_count_history, $noloot_count_history, $skill_count_history_Agility, $skill_count_history_Health, $skill_count_history_Intelligence, $skill_count_history_Psyche, $skill_count_history_Stamina, $skill_count_history_Strength, $skill_count_history_Alertness, $skill_count_history_Athletics
Global $skill_count_history_Bravado, $skill_count_history_Coolness, $skill_count_history_Courage, $skill_count_history_Dexterity, $skill_count_history_Intuition, $skill_count_history_Perception, $skill_count_history_Quickness, $skill_count_history_Serendipity, $skill_count_history_Aim, $skill_count_history_Clubs
Global $skill_count_history_Combat_Reflexes, $skill_count_history_Combat_Sense, $skill_count_history_Commando, $skill_count_history_Handgun, $skill_count_history_Heavy_Melee_Weapons, $skill_count_history_Heavy_Weapons, $skill_count_history_Inflict_Melee_Damage, $skill_count_history_Inflict_Ranged_Damage, $skill_count_history_Kill_Strike, $skill_count_history_Light_Melee_Weapons
Global $skill_count_history_Longblades, $skill_count_history_Marksmanship, $skill_count_history_Martial_Arts, $skill_count_history_Melee_Combat, $skill_count_history_Melee_Damage_Assessment, $skill_count_history_Power_Fist, $skill_count_history_Ranged_Damage_Assessment, $skill_count_history_Rifle, $skill_count_history_Shortblades, $skill_count_history_Support_Weapon_Systems
Global $skill_count_history_Weapons_Handling, $skill_count_history_Whip, $skill_count_history_Wounding, $skill_count_history_Anatomy, $skill_count_history_Diagnosis, $skill_count_history_Doctor, $skill_count_history_First_Aid, $skill_count_history_Medical_Therapy, $skill_count_history_Medicine, $skill_count_history_Treatment
Global $skill_count_history_Bioregenesis, $skill_count_history_Concentration, $skill_count_history_Cryogenics, $skill_count_history_Electrokinesis, $skill_count_history_Ethereal_Soul_Language, $skill_count_history_Force_Merge, $skill_count_history_Jamming, $skill_count_history_Mindforce_Harmony, $skill_count_history_Power_Catalyst, $skill_count_history_Pyrokinesis
Global $skill_count_history_Sweat_Gatherer, $skill_count_history_Telepathy, $skill_count_history_Translocation, $skill_count_history_Avoidance, $skill_count_history_Dispense_Decoy, $skill_count_history_Dodge, $skill_count_history_Evade, $lastitem, $main_window, $Tab1, $Tab1_1
Global $TabSheet1, $Group1, $hit_lable, $chit_lable, $miss_lable, $use_lable, $dmg_lable, $hit_ability_lable, $chit_ability_lable, $dmgout_current
Global $dmgout_history, $dmgout_reset_current, $Group2, $hit_in_lable, $chit_in_lable, $dmg_in_lable, $Group3, $Tool_use_count_lable, $total_heal_lable, $noloot_lable
Global $skill_lable, $edit1, $GUICtrlSetLimit, $Group16, $weapon_status_group_w1, $weapon_status_lable_w1, $weapon_status_group_w2, $weapon_status_lable_w2, $weapon_status_group_w3, $weapon_status_lable_w3
Global $weapon_status_group_w4, $weapon_status_lable_w4, $weapon_status_group_w5, $weapon_status_lable_w5, $weapon_status_group_w6, $weapon_status_lable_w6, $Tool_status_gourp_f1, $Tool_status_lable_f1, $Tool_status_group_f2, $Tool_status_lable_f2
Global $Tool_status_gourp_f3, $Tool_status_lable_f3, $TabSheet2, $weapons_tab_w1, $hit_count_lable_w1, $chit_count_lable_w1, $miss_count_lable_w1, $use_count_lable_w1, $totaldmg_lable_w1, $hit_ability_lable_w1
Global $chit_ability_lable_w1, $dmg_s_lable_w1, $dmg_pec_lable_w1, $skills_pec_lable_w1, $broken_enhancers_lable_w1, $history_w1, $current_w1, $reset_w1, $weapons_tab_w2, $hit_count_lable_w2
Global $chit_count_lable_w2, $miss_count_lable_w2, $use_count_lable_w2, $totaldmg_lable_w2, $hit_ability_lable_w2, $chit_ability_lable_w2, $dmg_s_lable_w2, $dmg_pec_lable_w2, $skills_pec_lable_w2, $broken_enhancers_lable_w2
Global $history_w2, $current_w2, $reset_w2, $weapons_tab_w3, $hit_count_lable_w3, $chit_count_lable_w3, $miss_count_lable_w3, $use_count_lable_w3, $totaldmg_lable_w3, $hit_ability_lable_w3
Global $chit_ability_lable_w3, $dmg_s_lable_w3, $dmg_pec_lable_w3, $skills_pec_lable_w3, $broken_enhancers_lable_w3, $history_w3, $current_w3, $reset_w3, $edit2, $TabSheet21
Global $weapons_tab_w4, $hit_count_lable_w4, $chit_count_lable_w4, $miss_count_lable_w4, $use_count_lable_w4, $totaldmg_lable_w4, $hit_ability_lable_w4, $chit_ability_lable_w4, $dmg_s_lable_w4, $dmg_pec_lable_w4
Global $skills_pec_lable_w4, $broken_enhancers_lable_w4, $history_w4, $current_w4, $reset_w4, $weapons_tab_w5, $hit_count_lable_w5, $chit_count_lable_w5, $miss_count_lable_w5, $use_count_lable_w5
Global $totaldmg_lable_w5, $hit_ability_lable_w5, $chit_ability_lable_w5, $dmg_s_lable_w5, $dmg_pec_lable_w5, $skills_pec_lable_w5, $broken_enhancers_lable_w5, $history_w5, $current_w5, $reset_w5
Global $weapons_tab_w6, $hit_count_lable_w6, $chit_count_lable_w6, $miss_count_lable_w6, $use_count_lable_w6, $totaldmg_lable_w6, $hit_ability_lable_w6, $chit_ability_lable_w6, $dmg_s_lable_w6, $dmg_pec_lable_w6
Global $skills_pec_lable_w6, $broken_enhancers_lable_w6, $history_w6, $current_w6, $reset_w6, $edit4, $TabSheet3, $TabSheet3_1, $Tool_tab_f1, $use_count_lable_f1, $total_heal_lable_f1
Global $heals_s_lable_f1, $heals_pec_lable_f1, $skills_pec_lable_f1, $current_f1, $reset_f1, $history_f1, $Tool_tab_f2, $use_count_lable_f2, $total_heal_lable_f2, $heals_s_lable_f2
Global $heals_pec_lable_f2, $skills_pec_lable_f2, $reset_f2, $history_f2, $current_f2, $Tool_tab_f3, $use_count_lable_f3, $total_heal_lable_f3, $heals_s_lable_f3, $heals_pec_lable_f3
Global $skills_pec_lable_f3, $reset_f3, $history_f3, $current_f3, $edit3, $TabSheet4, $Group8, $agility_lable, $strength_lable, $stamina_lable
Global $psyche_lable, $intelligence_lable, $history_skills, $reset_skills, $current_skills, $Group9, $alertness_lable, $athletics_lable, $bravado_lable, $coolness_lable
Global $courage_lable, $dexterity_lable, $intuition_lable, $perception_lable, $quickness_lable, $serendipity_lable, $Group10, $aim_lable, $clubs_lable, $combat_reflexes_lable
Global $combat_sense_lable, $commando_lable, $handgun_lable, $heavy_melee_weapons_lable, $heavy_weapons_lable, $inflict_melee_damage_lable, $inflict_ranged_damgae_lable, $kill_strike_lable, $light_melee_weapons_lable, $longblades_lable
Global $marksmanship_lable, $martial_arts_lable, $melee_combat_lable, $melee_damage_assessment_lable, $power_fist_lable, $ranged_damage_assessment_lable, $rifle_lable, $shortblades_lable, $support_weapon_systems_lable, $weapons_handling_lable
Global $whip_lable, $wounding_lable, $Group11, $anatomy_lable, $diagnosis_lable, $doctor_lable, $first_aid_lable, $medical_therapy_lable, $medicine_lable, $treatment_lable
Global $Group12, $bioregenesis_lable, $concentration_lable, $cryogenics_lable, $electrokinesis_lable, $force_merge_lable, $jamming_lable, $mindforce_harmony_lable, $power_catalyst_lable, $pyrokinesis_lable
Global $sweat_gatherer_lable, $telepathy_lable, $translocation_lable, $Group13, $avoidance_lable, $dispense_decoy_lable, $dodge_lable, $evade_lable, $exit, $Edit
Global $Settings, $Help, $about, $online_help, $statusbar, $settings_window, $TabSheet5, $weapon1_button, $weapon2_button, $weapon3_button
Global $weapon4_button, $weapon5_button, $weapon6_button, $weapon_id_group, $Group30, $Label94, $weapon_profile_input, $change_weapon_profile_button, $load_weapon_profile_button, $Label95
Global $weapon_stats_input, $change_weapon_stats_button, $load_weapon_stats_button, $Group31, $Label32, $weapon_name_input, $Label34, $weapon_attacks_input, $Label58, $weapon_decay_input
Global $weapon_ammo_input, $Label59, $amp_ammo_input, $Label75, $amp_decay_input, $Label77, $Label97, $weapon_markup_input, $Label98, $amp_markup_input
Global $weapon_key_lable, $setkey_input_weapons, $Group14, $Label86, $Label87, $Label90, $Label92, $Label93, $Group32, $weapon_enhancer_I_markup_input
Global $accuracy_I_input, $damage_I_input, $weapon_economy_I_input, $range_I_input, $weapon_skill_modification_I_input, $Label96, $Group33, $weapon_enhancer_II_markup_input, $accuracy_II_input, $damage_II_input
Global $weapon_economy_II_input, $range_II_input, $weapon_skill_modification_II_input, $Group35, $weapon_enhancer_III_markup_input, $accuracy_III_input, $damage_III_input, $weapon_economy_III_input, $range_III_input, $weapon_skill_modification_III_input
Global $Group34, $weapon_enhancer_IV_markup_input, $accuracy_IV_input, $damage_IV_input, $weapon_economy_IV_input, $range_IV_input, $weapon_skill_modification_IV_input, $Group36, $weapon_enhancer_V_markup_input, $accuracy_V_input
Global $damage_V_input, $weapon_economy_V_input, $range_V_input, $weapon_skill_modification_V_input, $Group37, $weapon_enhancer_VI_markup_input, $accuracy_IV_inpu, $damage_VI_input, $weapon_economy_VI_input, $range_VI_input
Global $weapon_skill_modification_VI_input, $Group38, $weapon_enhancer_VII_markup_input, $accuracy_VII_input, $damage_VII_input, $weapon_economy_VII_input, $range_VII_input, $weapon_skill_modification_VII_input, $Group39, $weapon_enhancer_VIII_markup_input
Global $accuracy_VIII_input, $damage_VIII_input, $weapon_economy_VIII_input, $range_VIII_input, $weapon_skill_modification_VIII_input, $Group41, $weapon_enhancer_IX_markup_input, $accuracy_IX_input, $damage_IX_input, $weapon_economy_IX_input
Global $range_IX_input, $weapon_skill_modification_IX_input, $Group40, $weapon_enhancer_X_markup_input, $accuracy_X_input, $damage_X_input, $weapon_economy_X_input, $range_X_input, $weapon_skill_modification_X_input, $tool1_button
Global $tool2_button, $tool3_button, $Group48, $Label7, $tool_profile_input, $change_tool_profile_button, $load_tool_profile_button, $load_tool_stats_button, $change_tool_stats_button, $tool_stats_input
Global $Label8, $Group49, $Label9, $tool_name_input, $Label10, $tool_uses_input, $Label11, $tool_decay_input, $Label15, $Input23
Global $tool_key_lable, $setkey_input_tools, $Label2, $Label3, $Label5, $tool_enhancer_I_markup_input, $heal_enhancer_I_input, $tool_economy_I_input, $tool_skill_modification_I_input, $Label6
Global $tool_enhancer_II_markup_input, $heal_enhancer_II_input, $tool_economy_II_input, $tool_skill_modification_II_input, $tool_enhancer_IV_markup_input, $heal_enhancer_IV_input, $tool_economy_IV_input, $tool_skill_modification_IV_input, $tool_enhancer_III_markup_input, $heal_enhancer_III_input
Global $tool_economy_III_input, $tool_skill_modification_III_input, $Group42, $tool_enhancer_V_markup_input, $heal_enhancer_V_input, $tool_economy_V_input, $tool_skill_modification_V_input, $Group43, $tool_enhancer_VI_markup_input, $heal_enhancer_VI_input
Global $tool_economy_VI_input, $tool_skill_modification_VI_input, $Group44, $tool_enhancer_VII_markup_input, $heal_enhancer_VII_input, $tool_economy_VII_input, $tool_skill_modification_VII_input, $Group45, $tool_enhancer_VIII_markup_input, $heal_enhancer_VIII_input
Global $tool_economy_VIII_input, $tool_skill_modification_VIII_input, $Group46, $tool_enhancer_X_markup_input, $heal_enhancer_X_input, $tool_economy_X_input, $tool_skill_modification_X_input, $Group47, $tool_enhancer_IX_markup_input, $heal_enhancer_IX_input
Global $tool_economy_IX_input, $tool_skill_modification_IX_input, $TabSheet7, $Group25, $Label38, $capture_folder_input, $capture_folder_input_button, $Label70, $capture_delay_input, $Label71
Global $Group19, $Label37, $avatar_name_input, $Label73, $enable_global_capture_avatar_input, $Group22, $Label76, $team_name_input, $Label89, $enable_global_capture_team_input
Global $Group21, $Label69, $folder_structure_input, $1, $Group20, $image_type_bmp_input, $Label68, $image_type_jpeg_input, $Label78, $Group27
Global $Group26, $enable_hunting_globals_input, $enable_hunting_hof_input, $Group28, $enable_mining_globals_input, $enable_mining_hof_input, $Group29, $enable_crafting_globals_input, $enable_crafting_hof_input, $Group23
Global $position_key_lable, $setkey_input_position, $Label88, $enable_position_input, $Group24, $time_stamp_key_lable, $setkey_input_time_stamp, $Label91, $enable_time_stamp_input, $Group7
Global $Label36, $chatloglocation_input, $chatloglocation_input_button, $Group15, $Label57, $weapon_file_input_w1, $weapon_file_input_button_w1, $Label60, $weapon_file_input_w2, $weapon_file_input_button_w2
Global $Label61, $weapon_file_input_w3, $weapon_file_input_button_w3, $Label62, $weapon_file_input_w4, $weapon_file_input_button_w4, $Label63, $weapon_file_input_w5, $weapon_file_input_button_w5, $Label64
Global $weapon_file_input_w6, $weapon_file_input_button_w6, $Group17, $Label65, $Tool_file_input_f1, $Tool_file_input_button_f1, $Label66, $Tool_file_input_f2, $Tool_file_input_button_f2, $Label67
Global $Tool_file_input_f3, $Tool_file_input_button_f3, $exit_settings, $about_window, $Label1, $Label4, $Ok_about, $setkey
Global $setkey_input_w1, $weapon_key_lable_w1, $setkey_input_w2, $weapon_key_lable_w2, $setkey_input_w3, $weapon_key_lable_w3, $setkey_input_w4, $weapon_key_lable_w4, $setkey_input_w5
Global $weapon_key_lable_w5, $setkey_input_w6, $weapon_key_lable_w6, $setkey_input_f1, $tool_key_lable_f1, $setkey_input_f2, $tool_key_lable_f2, $setkey_input_f3, $tool_key_lable_f3
Global $totaldmg_in, $hit_in_count, $chit_in_count, $Tool_use_count, $total_heal, $total_heal_history, $skill_count, $skill_count_dispence_decoy, $skill_count_aleartness, $noloot_count
Global $attacks, $decay, $ammo, $enhancer_count, $filever_location, $accuracy_VI_input, $weapon_economy_I_input, $weapon_economy_II_input, $weapon_economy_III_input, $weapon_economy_IV_input
Global $weapon_economy_V_input, $weapon_economy_VI_input, $weapon_economy_VII_input, $weapon_economy_VIII_input, $weapon_economy_IX_input, $weapon_economy_X_input, $hit_in_count, $chit_in_count
Global $totaldmg_in, $total_heal, $Tool_use_count, $noloot_count, $skill_count, $weapon_status_w1, $weapon_status_w2, $weapon_status_w3, $weapon_status_w4, $weapon_status_w5, $weapon_status_w6
Global $Tool_status_f1, $Tool_status_f2, $Tool_status_f3, $weapon_name_w1, $weapon_name_w2, $weapon_name_w3, $weapon_name_w4, $weapon_name_w5, $weapon_name_w6, $Tool_name_f1, $Tool_name_f2
Global $Tool_name_f3, $TabSheet1_1, $hedit1, $tool_ammo_input, $tool_markup_input, $heal_I_input, $heal_II_input, $heal_III_input, $heal_IV_input, $heal_V_input, $heal_VI_input, $heal_VII_input
Global $heal_VIII_input, $heal_IX_input, $heal_X_input, $tool_economy_I_input, $tool_economy_II_input, $tool_economy_III_input, $tool_economy_IV_input, $tool_economy_V_input, $tool_economy_VI_input, $tool_economy_VII_input
Global $tool_economy_VIII_input, $tool_economy_IX_input, $tool_economy_X_input, $tool_id_group, $accuracy_I_input, $accuracy_II_input, $accuracy_III_input, $accuracy_IV_input
Global $accuracy_V_input, $accuracy_VI_input, $accuracy_VII_input, $accuracy_VIII_input, $accuracy_IX_input, $accuracy_X_input
Global $weapons_tab, $hit_count_lable, $chit_count_lable, $miss_count_lable, $use_count_lable, $totaldmg_lable, $skills_pec_lable, $dmg_pec_lable, $dmg_s_lable
Global $chit_ability_lable, $hit_ability_lable, $broken_enhancers_lable, $total_decay_lable, $reset_weapon_current, $hit_count_history_lable, $chit_count_history_lable
Global $miss_count_history_lable, $use_count_history_lable, $totaldmg_history_lable, $skills_pec_history_lable, $dmg_pec_history_lable, $dmg_s_history_lable
Global $chit_ability_history_lable, $hit_ability_history_lable, $broken_enhancers_history_lable, $total_decay_history_lable, $reset_weapon_history
Global $Main_weapon1_button, $Main_weapon2_button, $Main_weapon3_button, $Main_weapon4_button, $Main_weapon5_button, $Main_weapon6_button, $weapon_hit_count_lable, $weapon_chit_count_lable
Global $weapon_use_count_lable, $weapon_totaldmg_lable, $weapon_miss_count_lable, $weapon_dmg_s_lable, $weapon_dmg_pec_lable, $weapon_hit_ability_lable, $weapon_chit_ability_lable
Global $weapon_skills_pec_lable, $weapon_broken_enhancers_lable, $weapon_total_decay_lable, $weapon_hit_count_history_lable, $weapon_chit_count_history_lable, $weapon_use_count_history_lable
Global $weapon_totaldmg_history_lable, $weapon_miss_count_history_lable, $weapon_dmg_s_history_lable, $weapon_dmg_pec_history_lable, $weapon_hit_ability_history_lable
Global $weapon_chit_ability_history_lable, $weapon_skills_pec_history_lable, $weapon_broken_enhancers_history_lable, $weapon_total_decay_history_lable, $weapon_chit_ability_history_lable
Global $weapon_hit_ability_history_lable, $weapon_name_group, $team_names, $Warning_sound, $Warning_sound_checkbox, $warning_sound_volume, $Warning_sound_file, $warning_sound_volume_slider
Global $Warning_sound_file_input, $Warning_Sound_Group, $Label12, $Warning_sound_file_input_button, $warning_sound_volume_test_button, $min_tray, $min_tray_setting, $lastread
#endregion ;~ Variables


#region ;~ Core
Start()
;~ pre_start()
#region ;~ Start up
;~ Func pre_start()
;~ 	Local $update_file = @ScriptDir & "\update.exe"
;~ 	Local $update_ver = FileGetVersion($update_file)
;~ 	If $update_ver < "1.0.0.3" Then
;~ 		InetGet($url & "update.exe", @ScriptDir & "\update.exe", 1, 0)
;~ 		ShellExecute(@ScriptDir & "\update.exe", "-update")
;~ 		Exit
;~ 	EndIf
;~ 	start()
;~ EndFunc   ;==>pre_start

Func start()
;~ 	version_check()
	GUI()
	GUISetState(@SW_SHOW, $main_window)
	GUISetState(@SW_HIDE, $settings_window)
	GUISetState(@SW_HIDE, $about_window)
	Opt("TrayIconHide", 1)
	read_all_files()
	update_item_names_in_gui()
	weapon_math("w" & $main_weapon_id)
	_update_GUI_weapon_stats()
	_update_GUI_weapon_stats_history()
	_FileOpenAPI($chatloglocation)
	$lastread = _FileReadLineAPI($chatloglocation, -2)
	_FileCloseAPI($chatloglocation)
	main_loop()
EndFunc   ;==>start

;~ Func version_check()
;~ 	Local $latest_timestamp = _INetGetSource($timestamp_url)
;~ 	If $latest_timestamp <> FileRead($timestamp) Then
;~ 		Local $to_update = MsgBox(4, "Update Avalible", "A newer Version is avalible do you want to update?", "", $main_window)
;~ 		Switch $to_update
;~ 			Case 6
;~ 				If FileExists(@ScriptDir & "\update.exe") Then
;~ 					ShellExecute(@ScriptDir & "\update.exe", "-update")
;~ 					Exit
;~ 				Else
;~ 					InetGet($url & "update.exe", @ScriptDir & "\update.exe", 1, 0)
;~ 					ShellExecute(@ScriptDir & "\update.exe", "-update")
;~ 					Exit
;~ 				EndIf
;~ 			Case Else
;~ 				;;;
;~ 		EndSwitch
;~ 	EndIf
;~ EndFunc   ;==>version_check

#endregion ;~ Start up


Func main_loop()
	Local $themeset
	While 1
		If WinExists("Entropia Universe Client", "") And $themeset = False Then
			_SetWindowTheme("Entropia Universe Client")
			$themeset = True
			ConsoleWrite("theme set")
		EndIf
		$Reciving = True
		read_log()
		Select
			Case fullscreen_check() And WinActive("Entropia Universe Client") And $DwmDisabled = False
				DllCall("dwmapi.dll", "hwnd", "DwmEnableComposition", "uint", 0)
				$DwmDisabled = True
			Case fullscreen_check() = False And WinActive("Entropia Universe Client") And $DwmDisabled = True
				DllCall("dwmapi.dll", "hwnd", "DwmEnableComposition", "uint", 1)
				$DwmDisabled = False
			Case Not WinActive("Entropia Universe Client") And $DwmDisabled = True
				DllCall("dwmapi.dll", "hwnd", "DwmEnableComposition", "uint", 1)
				$DwmDisabled = False
;~ 		-==========Equipt Item=========-
			Case WinActive("Entropia Universe Client")
				Select
					Case _IsPressed($weapon_key_hex_w1, $dll)
						$item = "Weapon 1"
						$current_item = "w1"
						lastitem()
						change_active_weapon(1)
					Case _IsPressed($weapon_key_hex_w2, $dll)
						$item = "Weapon 2"
						$current_item = "w2"
						lastitem()
						change_active_weapon(2)
					Case _IsPressed($weapon_key_hex_w3, $dll)
						$item = "Weapon 3"
						$current_item = "w3"
						lastitem()
						change_active_weapon(3)
					Case _IsPressed($weapon_key_hex_w4, $dll)
						$item = "Weapon 4"
						$current_item = "w4"
						lastitem()
						change_active_weapon(4)
					Case _IsPressed($weapon_key_hex_w5, $dll)
						$item = "Weapon 5"
						$current_item = "w5"
						lastitem()
						change_active_weapon(5)
					Case _IsPressed($weapon_key_hex_w6, $dll)
						$item = "Weapon 6"
						$current_item = "w6"
						lastitem()
						change_active_weapon(6)
					Case _IsPressed($tool_key_hex_f1, $dll)
						$item = "Tool 1"
						$current_item = "f1"
						lastitem()
					Case _IsPressed($tool_key_hex_f2, $dll)
						$item = "Tool 2"
						$current_item = "f2"
						lastitem()
					Case _IsPressed($tool_key_hex_f3, $dll)
						$item = "Tool 3"
						$current_item = "f3"
						lastitem()
					Case _IsPressed("2C", $dll)
						global_capture("Print Screen")
					Case Else
						;;;;
				EndSelect
		EndSelect
		Sleep(50)
	WEnd
EndFunc   ;==>main_loop
#region ; Window Events
Func hide_edit()
	Switch GUICtrlRead($Tab1)
		Case 3
			GUICtrlSetState($edit1, $GUI_HIDE)
		Case Else
			GUICtrlSetState($edit1, $GUI_SHOW)
	EndSwitch
EndFunc   ;==>hide_edit
Func GUI_Restore()
	GUISetState(@SW_SHOW, $main_window)
	Opt("TrayAutoPause", 0)
	Opt("TrayMenuMode", 1)
	Opt("TrayIconHide", 1)
EndFunc   ;==>GUI_Restore
Func min_tray()
	If GUICtrlRead($min_tray) = 65 Then
		GUICtrlSetState($min_tray, 68)
	ElseIf GUICtrlRead($min_tray) = 68 Then
		GUICtrlSetState($min_tray, 65)
	EndIf
EndFunc   ;==>min_tray

Func window_events()
	$msg = @GUI_CtrlId
	Select
		Case $msg = $GUI_Event_Close
			save_all_settings()
			DllClose($dll)
			Exit
		Case $msg = $GUI_Event_Minimize
			If GUICtrlRead($min_tray) = 65 Then
				GUISetState(@SW_HIDE, $main_window)
				TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE, "GUI_Restore")
				Opt("TrayAutoPause", 0)
				Opt("TrayMenuMode", 1)
				Opt("TrayOnEventMode", 1)
				Opt("TrayIconHide", 0)
			EndIf
		Case $msg = $exit
			save_all_settings()
			DllClose($dll)
			Exit
		Case $msg = $about
			GUISetState(@SW_DISABLE, $main_window)
			GUISetState(@SW_SHOW, $about_window)
			WinActivate($main_window)
		Case $msg = $Settings
			GUISetState(@SW_SHOW, $settings_window)
		Case $msg = $capture_folder_input_button
			$capture_folder = FileSelectFolder("Select the folder you want your Globals Images Saved to", -1, 1, -1, $settings_window)
			If $capture_folder = "" Then
				$capture_folder = @ScriptDir & "\global capture"
			EndIf
			GUICtrlSetData($capture_folder_input, $capture_folder)
			GUICtrlSetTip($capture_folder_input, $capture_folder)
		Case $msg = $setkey_input_position
			hotkey()
			GUICtrlSetData($position_key_lable, "Key: " & $keyinput)
			$position_key = $keyinput
			$position_key_hex = $Hex
		Case $msg = $setkey_input_time_stamp
			hotkey()
			GUICtrlSetData($time_stamp_key_lable, "Key: " & $keyinput)
			$time_stamp_key = $keyinput
			$time_stamp_key_hex = $Hex
		Case $msg = $jpeg_quality_input
			GUICtrlSetTip($jpeg_quality_input, "0 = Poor, 100 = Best, Current: " & GUICtrlRead($jpeg_quality_input) * 25)
		Case $msg = $image_type_jpeg_input = $GUI_CHECKED
			GUICtrlSetState($jpeg_quality_input, $GUI_ENABLE_1)
		Case $msg = $image_type_bmp_input = $GUI_CHECKED
			GUICtrlSetState($jpeg_quality_input, $GUI_DISABLE_1)
		Case $msg = $Ok_about
			GUISetState(@SW_HIDE, $about_window)
			GUISetState(@SW_ENABLE, $main_window)
			WinActivate($main_window)
		Case $msg = $online_help
			ShellExecute("http://www.entropiaforum.com/forum/tools-utilities/201196-hunt-stats-tracker.html")
		Case $msg = $setkey_input_w1
			hotkey()
			GUICtrlSetData($weapon_key_lable_w1, "Weapon Hotkey: " & $keyinput)
			$weapon_key_w1 = $keyinput
			$weapon_key_hex_w1 = $Hex
		Case $msg = $setkey_input_w2
			hotkey()
			GUICtrlSetData($weapon_key_lable_w2, "Weapon Hotkey: " & $keyinput)
			$weapon_key_w2 = $keyinput
			$weapon_key_hex_w2 = $Hex
		Case $msg = $setkey_input_w3
			hotkey()
			GUICtrlSetData($weapon_key_lable_w3, "Weapon Hotkey: " & $keyinput)
			$weapon_key_w3 = $keyinput
			$weapon_key_hex_w3 = $Hex
		Case $msg = $setkey_input_w4
			hotkey()
			GUICtrlSetData($weapon_key_lable_w4, "Weapon Hotkey: " & $keyinput)
			$weapon_key_w4 = $keyinput
			$weapon_key_hex_w4 = $Hex
		Case $msg = $setkey_input_w5
			hotkey()
			GUICtrlSetData($weapon_key_lable_w5, "Weapon Hotkey: " & $keyinput)
			$weapon_key_w5 = $keyinput
			$weapon_key_hex_w5 = $Hex
		Case $msg = $setkey_input_w6
			hotkey()
			GUICtrlSetData($weapon_key_lable_w6, "Weapon Hotkey: " & $keyinput)
			$weapon_key_w6 = $keyinput
			$weapon_key_hex_w6 = $Hex
		Case $msg = $setkey_input_f1
			hotkey()
			GUICtrlSetData($tool_key_lable_f1, "Tool Hotkey: " & $keyinput)
			$tool_key_f1 = $keyinput
			$tool_key_hex_f1 = $Hex
		Case $msg = $setkey_input_f2
			hotkey()
			GUICtrlSetData($tool_key_lable_f2, "Tool Hotkey: " & $keyinput)
			$tool_key_f2 = $keyinput
			$tool_key_hex_f2 = $Hex
		Case $msg = $setkey_input_f3
			hotkey()
			GUICtrlSetData($tool_key_lable_f3, "Tool Hotkey: " & $keyinput)
			$tool_key_f3 = $keyinput
			$tool_key_hex_f3 = $Hex
		Case $msg = $dmgout_history
			GUICtrlSetState($dmgout_reset_current, $GUI_HIDE)
			GUICtrlSetState($dmgout_history, $GUI_HIDE)
			GUICtrlSetState($dmgout_current, $GUI_SHOW)
			$weapons_history = True
			weapons_math()
			_update_GUI_dmg_out_history()
		Case $msg = $dmgout_current
			GUICtrlSetState($dmgout_reset_current, $GUI_SHOW)
			GUICtrlSetState($dmgout_history, $GUI_SHOW)
			GUICtrlSetState($dmgout_current, $GUI_HIDE)
			$weapons_history = False
			weapons_math()
			_update_GUI_dmg_out()
		Case $msg = $dmgout_reset_current
			reset_dmgout_current()
		Case $msg = $reset_weapon_current
			reset_current_weapon("w" & $main_weapon_id)
		Case $msg = $reset_weapon_history
			reset_history_weapon("w" & $main_weapon_id)
		Case $msg = $history_f1
			GUICtrlSetState($reset_f1, $GUI_HIDE)
			GUICtrlSetState($history_f1, $GUI_HIDE)
			GUICtrlSetState($current_f1, $GUI_SHOW)
			$Tool_history_f1 = True
			Tool_math("f1")
			_update_GUI_Tool_stats_history("f1")
		Case $msg = $current_f1
			GUICtrlSetState($reset_f1, $GUI_SHOW)
			GUICtrlSetState($history_f1, $GUI_SHOW)
			GUICtrlSetState($current_f1, $GUI_HIDE)
			$Tool_history_f1 = False
			Tool_math("f1")
			_update_GUI_Tool_stats("f1")
		Case $msg = $reset_f1
			reset_current_Tool("f1")
		Case $msg = $history_f2
			GUICtrlSetState($reset_f2, $GUI_HIDE)
			GUICtrlSetState($history_f2, $GUI_HIDE)
			GUICtrlSetState($current_f2, $GUI_SHOW)
			$Tool_history_f2 = True
			Tool_math("f2")
			_update_GUI_Tool_stats_history("f2")
		Case $msg = $current_f2
			GUICtrlSetState($reset_f2, $GUI_SHOW)
			GUICtrlSetState($history_f2, $GUI_SHOW)
			GUICtrlSetState($current_f2, $GUI_HIDE)
			$Tool_history_f2 = False
			Tool_math("f2")
			_update_GUI_Tool_stats("f2")
		Case $msg = $reset_f2
			reset_current_Tool("f2")
		Case $msg = $history_f3
			GUICtrlSetState($reset_f3, $GUI_HIDE)
			GUICtrlSetState($history_f3, $GUI_HIDE)
			GUICtrlSetState($current_f3, $GUI_SHOW)
			$Tool_history_f3 = True
			Tool_math("f3")
			_update_GUI_Tool_stats_history("f3")
		Case $msg = $current_f3
			GUICtrlSetState($reset_f3, $GUI_SHOW)
			GUICtrlSetState($history_f3, $GUI_SHOW)
			GUICtrlSetState($current_f3, $GUI_HIDE)
			$Tool_history_f3 = False
			Tool_math("f3")
			_update_GUI_Tool_stats("f3")
		Case $msg = $reset_f3
			reset_current_Tool("f3")
		Case $msg = $history_skills
			GUICtrlSetState($reset_skills, $GUI_HIDE)
			GUICtrlSetState($history_skills, $GUI_HIDE)
			GUICtrlSetState($current_skills, $GUI_SHOW)
			$skill_history = True
			_update_GUI_skills()
		Case $msg = $current_skills
			GUICtrlSetState($reset_skills, $GUI_SHOW)
			GUICtrlSetState($history_skills, $GUI_SHOW)
			GUICtrlSetState($current_skills, $GUI_HIDE)
			$skill_history = False
			_update_GUI_skills()
		Case $msg = $reset_skills
			reset_current_skills()
	EndSelect
EndFunc   ;==>window_events

Func change_active_weapon($x)
	Local $ctrlid = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', Eval("Main_weapon" & $x & "_button"))
	$ctrlid = Hextodec($ctrlid[1])
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $Main_weapon1_button)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $Main_weapon6_button)
	$iEnd = Hextodec($iEnd[1])
	For $i = $iStart To $iEnd
		GUICtrlSetState($i, $GUI_ENABLE_1)
	Next
	GUICtrlSetState($ctrlid, $GUI_DISABLE_1)
	Switch $ctrlid
		Case $Main_weapon1_button
			$main_weapon_id = 1
		Case $Main_weapon2_button
			$main_weapon_id = 2
		Case $Main_weapon3_button
			$main_weapon_id = 3
		Case $Main_weapon4_button
			$main_weapon_id = 4
		Case $Main_weapon5_button
			$main_weapon_id = 5
		Case $Main_weapon6_button
			$main_weapon_id = 6
	EndSwitch
	weapon_math("w" & $main_weapon_id)
	_update_GUI_weapon_stats()
	_update_GUI_weapon_stats_history()
EndFunc   ;==>change_active_weapon

Func Main_window_weapon_events()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $Main_weapon1_button)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $Main_weapon6_button)
	$iEnd = Hextodec($iEnd[1])
	For $i = $iStart To $iEnd
		GUICtrlSetState($i, $GUI_ENABLE_1)
	Next
	GUICtrlSetState(@GUI_CtrlId, $GUI_DISABLE_1)
	Switch @GUI_CtrlId
		Case $Main_weapon1_button
			$main_weapon_id = 1
		Case $Main_weapon2_button
			$main_weapon_id = 2
		Case $Main_weapon3_button
			$main_weapon_id = 3
		Case $Main_weapon4_button
			$main_weapon_id = 4
		Case $Main_weapon5_button
			$main_weapon_id = 5
		Case $Main_weapon6_button
			$main_weapon_id = 6
	EndSwitch
	weapon_math("w" & $main_weapon_id)
	_update_GUI_weapon_stats()
	_update_GUI_weapon_stats_history()
EndFunc   ;==>Main_window_weapon_events
#endregion ; Window Events
#region ; Settings
Func settings_events()
	Local $iStart_w = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $weapon1_button)
	$iStart_w = Hextodec($iStart_w[1])
	Local $iEnd_w = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $weapon6_button)
	$iEnd_w = Hextodec($iEnd_w[1])
	Local $iStart_f = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $tool1_button)
	$iStart_f = Hextodec($iStart_f[1])
	Local $iEnd_f = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $tool3_button)
	$iEnd_f = Hextodec($iEnd_f[1])
	$msg = @GUI_CtrlId
	Select
		Case $msg = $weapon1_button
			read_settings_gui_weapon()
			write_settings_weapon("w" & $weapon_id)
			For $i = $iStart_w To $iEnd_w
				GUICtrlSetState($i, $GUI_ENABLE_1)
			Next
			GUICtrlSetState($msg, $GUI_DISABLE_1)
			$weapon_id = "1"
			read_settings_weapon("w" & $weapon_id)
			update_settings_gui_weapon()
		Case $msg = $weapon2_button
			read_settings_gui_weapon()
			write_settings_weapon("w" & $weapon_id)
			For $i = $iStart_w To $iEnd_w
				GUICtrlSetState($i, $GUI_ENABLE_1)
			Next
			GUICtrlSetState($msg, $GUI_DISABLE_1)
			$weapon_id = "2"
			read_settings_weapon("w" & $weapon_id)
			update_settings_gui_weapon()
		Case $msg = $weapon3_button
			read_settings_gui_weapon()
			write_settings_weapon("w" & $weapon_id)
			For $i = $iStart_w To $iEnd_w
				GUICtrlSetState($i, $GUI_ENABLE_1)
			Next
			GUICtrlSetState($msg, $GUI_DISABLE_1)
			$weapon_id = "3"
			read_settings_weapon("w" & $weapon_id)
			update_settings_gui_weapon()
		Case $msg = $weapon4_button
			read_settings_gui_weapon()
			write_settings_weapon("w" & $weapon_id)
			For $i = $iStart_w To $iEnd_w
				GUICtrlSetState($i, $GUI_ENABLE_1)
			Next
			GUICtrlSetState($msg, $GUI_DISABLE_1)
			$weapon_id = "4"
			read_settings_weapon("w" & $weapon_id)
			update_settings_gui_weapon()
		Case $msg = $weapon5_button
			read_settings_gui_weapon()
			write_settings_weapon("w" & $weapon_id)
			For $i = $iStart_w To $iEnd_w
				GUICtrlSetState($i, $GUI_ENABLE_1)
			Next
			GUICtrlSetState($msg, $GUI_DISABLE_1)
			$weapon_id = "5"
			read_settings_weapon("w" & $weapon_id)
			update_settings_gui_weapon()
		Case $msg = $weapon6_button
			read_settings_gui_weapon()
			write_settings_weapon("w" & $weapon_id)
			For $i = $iStart_w To $iEnd_w
				GUICtrlSetState($i, $GUI_ENABLE_1)
			Next
			GUICtrlSetState($msg, $GUI_DISABLE_1)
			$weapon_id = "6"
			read_settings_weapon("w" & $weapon_id)
			update_settings_gui_weapon()
		Case $msg = $change_weapon_profile_button
			Assign("weapon_file_w" & $weapon_id, change_file_location(@ScriptDir & "\weapon profiles\", "Weapon Profile", "Profiles File (*.ini)"), 2)
			GUICtrlSetData($weapon_profile_input, Eval("weapon_file_w" & $weapon_id), "<none>")
			read_settings_weapon("w" & $weapon_id)
			update_settings_gui_weapon()
		Case $msg = $change_weapon_stats_button
			Assign("history_weapon_file_w" & $weapon_id, change_file_location(@ScriptDir & "\statistics\weapons\", "Weapon Statistics", "Statistics File (*.ini)"), 2)
			read_history_weapon("w" & $weapon_id)
			update_settings_gui_weapon()
		Case $msg = $setkey_input_weapons
			hotkey()
			GUICtrlSetData($weapon_key_lable, "Weapon Hotkey: " & $keyinput)
			Assign("weapon_key_w" & $weapon_id, $keyinput, 2)
			Assign("weapon_key_hex_w" & $weapon_id, $Hex, 2)
		Case $msg = $tool1_button
			read_settings_gui_tool()
			write_settings_tool("f" & $tool_id)
			For $i = $iStart_f To $iEnd_f
				GUICtrlSetState($i, $GUI_ENABLE_1)
			Next
			GUICtrlSetState($msg, $GUI_DISABLE_1)
			$tool_id = "1"
			read_settings_tool("f" & $tool_id)
			update_settings_gui_tool()
		Case $msg = $tool2_button
			read_settings_gui_tool()
			write_settings_tool("f" & $tool_id)
			For $i = $iStart_f To $iEnd_f
				GUICtrlSetState($i, $GUI_ENABLE_1)
			Next
			GUICtrlSetState($msg, $GUI_DISABLE_1)
			$tool_id = "2"
			read_settings_tool("f" & $tool_id)
			update_settings_gui_tool()
		Case $msg = $tool3_button
			read_settings_gui_tool()
			write_settings_tool("f" & $tool_id)
			For $i = $iStart_f To $iEnd_f
				GUICtrlSetState($i, $GUI_ENABLE_1)
			Next
			GUICtrlSetState($msg, $GUI_DISABLE_1)
			$tool_id = "3"
			read_settings_tool("f" & $tool_id)
			update_settings_gui_tool()
		Case $msg = $change_tool_profile_button
			Assign("tool_file_f" & $tool_id, change_file_location(@ScriptDir & "\tool profiles\", "tool Profile", "Profiles File (*.ini)"), 2)
			GUICtrlSetData($tool_profile_input, Eval("tool_file_f" & $tool_id), "<none>")
			read_settings_tool("f" & $tool_id)
			update_settings_gui_tool()
		Case $msg = $change_tool_stats_button
			Assign("history_tool_file_f" & $tool_id, change_file_location(@ScriptDir & "\statistics\tools\", "tool Statistics", "Statistics File (*.ini)"), 2)
			read_history_tool("f" & $tool_id)
			update_settings_gui_tool()
		Case $msg = $setkey_input_tools
			hotkey()
			GUICtrlSetData($tool_key_lable, "tool Hotkey: " & $keyinput)
			Assign("tool_key_f" & $tool_id, $keyinput, 2)
			Assign("tool_key_hex_f" & $tool_id, $Hex, 2)
		Case $msg = $chatloglocation_input_button
			$chatloglocation = change_file_location(@MyDocumentsDir & "\Entropia Universe\", " Chat Log", " Chat.log file(chat.log) ")
			update_settings_gui_general_settings_tab()
		Case $msg = $Warning_sound_file_input_button
			$Warning_sound_file = change_file_location("", "Sound Files", "Wave File(*.wav)|Mp3 File(*.mp3)|All Files(*.*)")
			If $Warning_sound_file = "<none>" Then $Warning_sound_file = @WindowsDir & "\media\windows balloon.wav"
			update_settings_gui_general_settings_tab()
		Case $msg = $exit_settings
			GUISetState(@SW_HIDE, $settings_window)
			GUISetState(@SW_ENABLE, $main_window)
			WinActivate($main_window)
			read_settings_gui_weapon()
			read_settings_gui_tool()
			read_settings_gui()
			write_general_settings()
			read_general_settings()
			update_item_names_in_gui()
			_update_GUI_item_status()
	EndSelect
EndFunc   ;==>settings_events
#endregion ; Settings
#region ; Enhancers - Weapons
Func weapon_enhancer_events_I()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $accuracy_I_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $weapon_skill_modification_I_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>weapon_enhancer_events_I

Func weapon_enhancer_events_II()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $accuracy_II_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $weapon_skill_modification_II_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>weapon_enhancer_events_II

Func weapon_enhancer_events_III()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $accuracy_III_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $weapon_skill_modification_III_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>weapon_enhancer_events_III

Func weapon_enhancer_events_IV()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $accuracy_IV_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $weapon_skill_modification_IV_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>weapon_enhancer_events_IV

Func weapon_enhancer_events_V()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $accuracy_V_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $weapon_skill_modification_V_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>weapon_enhancer_events_V

Func weapon_enhancer_events_VI()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $accuracy_VI_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $weapon_skill_modification_VI_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>weapon_enhancer_events_VI

Func weapon_enhancer_events_VII()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $accuracy_VII_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $weapon_skill_modification_VII_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>weapon_enhancer_events_VII

Func weapon_enhancer_events_VIII()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $accuracy_VIII_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $weapon_skill_modification_VIII_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>weapon_enhancer_events_VIII

Func weapon_enhancer_events_IX()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $accuracy_IX_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $weapon_skill_modification_IX_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>weapon_enhancer_events_IX

Func weapon_enhancer_events_X()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $accuracy_X_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $weapon_skill_modification_X_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>weapon_enhancer_events_X
#endregion ; Enhancers - Weapons

#region ; Enhancers - Tools

Func tool_enhancer_events_I()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $heal_enhancer_I_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $tool_skill_modification_I_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>tool_enhancer_events_I

Func tool_enhancer_events_II()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $heal_enhancer_II_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $tool_skill_modification_II_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>tool_enhancer_events_II

Func tool_enhancer_events_III()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $heal_enhancer_III_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $tool_skill_modification_III_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>tool_enhancer_events_III

Func tool_enhancer_events_IV()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $heal_enhancer_IV_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $tool_skill_modification_IV_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>tool_enhancer_events_IV

Func tool_enhancer_events_V()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $heal_enhancer_V_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $tool_skill_modification_V_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>tool_enhancer_events_V

Func tool_enhancer_events_VI()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $heal_enhancer_VI_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $tool_skill_modification_VI_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>tool_enhancer_events_VI

Func tool_enhancer_events_VII()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $heal_enhancer_VII_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $tool_skill_modification_VII_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>tool_enhancer_events_VII

Func tool_enhancer_events_VIII()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $heal_enhancer_VIII_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $tool_skill_modification_VIII_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>tool_enhancer_events_VIII

Func tool_enhancer_events_IX()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $heal_enhancer_IX_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $tool_skill_modification_IX_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>tool_enhancer_events_IX

Func tool_enhancer_events_X()
	Local $iStart = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $heal_enhancer_X_input)
	$iStart = Hextodec($iStart[1])
	Local $iEnd = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $tool_skill_modification_X_input)
	$iEnd = Hextodec($iEnd[1])
	If GUICtrlRead(@GUI_CtrlId) = 1 Then
		For $i = $iStart To $iEnd
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
	Else
		GUICtrlSetState(@GUI_CtrlId, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>tool_enhancer_events_X

#endregion ; Enhancers - Tools


#region ; Read Chat.log
Func read_log()
	_FileOpenAPI($chatloglocation)
	$read = _FileReadLineAPI($chatloglocation, -2)
	; Find $lastread line
	Local $findlastread
	Local $iLastline
	If $read <> $lastread Then
		For $i = 1 To 9999
			$findlastread = _FileReadLineAPI($chatloglocation, -$i)
			If $findlastread = $lastread Then
				$iLastline = -$i + 1
				ExitLoop
			EndIf
		Next
		ConsoleWrite("last line: " & $iLastline & @CR)
		If $iLastline = 0 Then $iLastline = -2 ;~ fix for when it gets lost.....
		$read = _FileReadLineAPI($chatloglocation, $iLastline)
		$lastread = $read
		read_log_data()
	EndIf
	_FileCloseAPI($chatloglocation)
EndFunc   ;==>read_log

Func read_log_data()
	Local $dmgout = StringRegExp($read, "\[Local\] \[\] You inflicted", 0)
	Local $cdmgout = BitOR(StringRegExp($read, "\[Local\] \[\] Critical hit - additional damage! You inflict", 0), StringRegExp($read, "\[Local\] \[\] Critical hit - armor penetration! You inflict", 0))
	Local $miss = StringRegExp($read, "\[Local\] \[\] MISS", 0)
	Local $dmgin = StringRegExp($read, "\[Local\] \[\] You take", 0)
	Local $cdmgin = BitOR(StringRegExp($read, "\[Local\] \[\] Critical hit - additional damage! You take", 0), StringRegExp($read, "\[Local\] \[\] Critical hit - armor penetration! You take", 0))
	Local $skill = StringRegExp($read, "\[Local\] \[\] You have gained experience in your ", 0) ;- Combat - Medical - Defense - Mindforce
	Local $skill2 = StringRegExp($read, "\[Local\] \[\] You have gained ", 0) ;- General
	Local $skill3 = StringRegExp($read, " has improved.", 0) ;- Attributes
	Local $heal = StringRegExp($read, "\[Local\] \[\] You healed", 0)
	Local $enhancer = StringRegExp($read, "\[Local\] \[\] Your enhancer", 0)
	Local $noloot = StringRegExp($read, "\[Local\] \[\] This creature didn&apos;t carry any loot.", 0)
	Local $death = StringRegExp($read, "\[Local\] \[\] You were killed", 0)
	If $enable_global_capture_avatar = 1 Then
		$global_avatar_h = StringRegExp($read, "\[Local\] \[\] " & $avatar_name & " killed", 0)
		$hof_avatar_h = StringRegExp($read, "\[Local\] \[\] " & $avatar_name & " killed", 0) And StringRegExp($read, "Hall of Fame", 0)
		$ath_avatar_h = StringRegExp($read, "\[Local\] \[\] " & $avatar_name & " killed", 0) And StringRegExp($read, "ALL TIME HIGH", 0)
		$global_avatar_c = StringRegExp($read, "\[Local\] \[\] " & $avatar_name & " manufactured", 0)
		$hof_avatar_c = StringRegExp($read, "\[Local\] \[\] " & $avatar_name & " manufactured", 0) And StringRegExp($read, "Hall of Fame", 0)
		$ath_avatar_c = StringRegExp($read, "\[Local\] \[\] " & $avatar_name & " manufactured", 0) And StringRegExp($read, "ALL TIME HIGH", 0)
		$global_avatar_m = StringRegExp($read, "\[Local\] \[\] " & $avatar_name & " found", 0)
		$hof_avatar_m = StringRegExp($read, "\[Local\] \[\] " & $avatar_name & " found", 0) And StringRegExp($read, "Hall of Fame", 0)
		$ath_avatar_m = StringRegExp($read, "\[Local\] \[\] " & $avatar_name & " found", 0) And StringRegExp($read, "ALL TIME HIGH", 0)
		$kill_spree = StringRegExp($read, "\[Local\] \[\] " & $avatar_name & " defeated", 0) And StringRegExp($read, "Hall of Fame", 0)
		$first = StringRegExp($read, "\[Local\] \[\] " & $avatar_name & " is the first colonist to", 0)
	EndIf
	If $enable_global_capture_team = 1 Then
		For $i = 1 To team_names()
			$global_team_h = StringRegExp($read, "\[Local\] \[\] Team &quot;" & $team_names[$i] & "&quot; killed", 0)
			$hof_team_h = StringRegExp($read, "\[Local\] \[\] Team &quot;" & $team_names[$i] & "&quot; killed", 0) And StringRegExp($read, "Hall of Fame", 0)
			$ath_team_h = StringRegExp($read, "\[Local\] \[\] Team &quot;" & $team_names[$i] & "&quot; killed", 0) And StringRegExp($read, "ALL TIME HIGH", 0)
			Select
				Case $global_team_h And $hof_team_h = 0 And $ath_team_h = 0 And $enable_hunting_globals = 1
					$hunting_data = "Captured| Global"
					_update_GUI_edits("purple")
					global_capture_team($team_names[$i])
				Case $hof_team_h And $ath_team_h = 0 And $enable_hunting_hof = 1
					$hunting_data = "Captured| Hall Of Fame"
					_update_GUI_edits("purple")
					global_capture_team($team_names[$i])
				Case $ath_team_h
					$hunting_data = "Captured| All Time High Big Congrats from PostHistory"
					_update_GUI_edits("purple")
					global_capture_team($team_names[$i])
				Case $global_team_h And StringRegExp($read, "in combat")
					$hunting_data = "Captured| Team Murderers - Global Captured"
					_update_GUI_edits("purple")
					global_capture_team($team_names[$i])
			EndSelect
		Next
	EndIf
	Select
		Case $dmgout = 1
			If Not StringRegExp($current_item, "w", 0) And $Warning_sound = 1 Then _play_sound()
			$new = StringRegExpReplace($read, "[^0-9.\s]", "")
			$new = StringTrimRight($new, 2)
			$new = StringTrimLeft($new, 3 + 17)
			$totaldmg += $new
			$totaldmg_history += $new
			$hit_count += 1
			$hit_count_history += 1
			$hunting_data = "Damge Out|" & $new
			$use_count += 1
			$use_count_history += 1
			Assign("total_decay_" & $current_item, (Eval("total_decay_" & $current_item) + (decay_weapon($current_item) / 10)), 2)
			Assign("total_decay_history_" & $current_item, (Eval("total_decay_history_" & $current_item) + (decay_weapon($current_item) / 10)), 2)
			weapons_math()
			dmgout_weapon($current_item)
			weapon_math($current_item)
			_update_GUI_weapon_stats_history()
			_update_GUI_weapon_stats()
			If $weapons_history Then
				_update_GUI_dmg_out_history()
			Else
				_update_GUI_dmg_out()
			EndIf
			_update_GUI_edits("blue")
		Case $cdmgout = 1
			If Not StringRegExp($current_item, "w", 0) And $Warning_sound = 1 Then _play_sound()
			$new = StringRegExpReplace($read, "[^0-9.\s]", "")
			$new = StringTrimRight($new, 2)
			$new = StringTrimLeft($new, 8 + 17)
			$totaldmg += $new
			$totaldmg_history += $new
			$hit_count += 1
			$hit_count_history += 1
			$chit_count += 1
			$chit_count_history += 1
			$hunting_data = "Damage Out|" & $new
			$use_count += 1
			$use_count_history += 1
			Assign("total_decay_" & $current_item, (Eval("total_decay_" & $current_item) + (decay_weapon($current_item) / 10)), 2)
			Assign("total_decay_history_" & $current_item, (Eval("total_decay_history_" & $current_item) + (decay_weapon($current_item) / 10)), 2)
			weapons_math()
			cdmgout_weapon($current_item)
			weapon_math($current_item)
			_update_GUI_weapon_stats_history($current_item)
			_update_GUI_weapon_stats($current_item)
			If $weapons_history Then
				_update_GUI_dmg_out_history()
			Else
				_update_GUI_dmg_out()
			EndIf
			_update_GUI_edits("blue")

		Case $miss = 1
			If Not StringRegExp($current_item, "w", 0) And $Warning_sound = 1 Then _play_sound()
			$new = StringTrimLeft($read, 2 + 17 + 12)
			$miss_count += 1
			$miss_count_history += 1
			$hunting_data = "Damage Out|" & $new
			$use_count += 1
			$use_count_history += 1
			Assign("total_decay_" & $current_item, (Eval("total_decay_" & $current_item) + (decay_weapon($current_item) / 10)), 2)
			Assign("total_decay_history_" & $current_item, (Eval("total_decay_history_" & $current_item) + (decay_weapon($current_item) / 10)), 2)
			weapons_math()
			miss_weapon($current_item)
			weapon_math($current_item)
			_update_GUI_weapon_stats_history($current_item)
			_update_GUI_weapon_stats($current_item)
			If $weapons_history Then
				_update_GUI_dmg_out_history()
			Else
				_update_GUI_dmg_out()
			EndIf
			_update_GUI_edits("yellow")

		Case $dmgin = 1
			$new = StringRegExpReplace($read, "[^0-9.\s]", "")
			$new = StringTrimRight($new, 2)
			$new = StringTrimLeft($new, 3 + 17)
			$totaldmg_in += $new
			$totaldmg_in_history += $new
			$hit_in_count += 1
			$hit_in_count_history += 1
			$hunting_data = "Damage In|" & $new
			_update_GUI_dmg_in()
			_update_GUI_edits("orange")

		Case $cdmgin = 1
			$new = StringRegExpReplace($read, "[^0-9.\s]", "")
			$new = StringTrimRight($new, 2)
			$new = StringTrimLeft($new, 7 + 17)
			$totaldmg_in += $new
			$totaldmg_in_history += $new
			$chit_in_count += 1
			$chit_in_count_history += 1
			$hit_in_count += 1
			$hit_in_count_history += 1
			$hunting_data = "Damage In|" & $new
			_update_GUI_dmg_in()
			_update_GUI_edits("red")

		Case $heal = 1
			If Not StringRegExp($current_item, "f", 0) And $Warning_sound = 1 Then _play_sound()
			$new = StringRegExpReplace($read, "[^0-9.\s]", "")
			$new = StringTrimRight($new, 2)
			$new = StringTrimLeft($new, 4 + 17)
			$Tool_use_count += 1
			$Tool_use_count_history += 1
			$total_heal += $new
			$total_heal_history += $new
			$hunting_data = "Heal|" & $new
			Tool_math($current_item)
			If Eval("Tool_history_" & $current_item) Then
				_update_GUI_Tool_stats_history($current_item)
			Else
				_update_GUI_Tool_stats($current_item)
			EndIf
			_update_GUI_misc()
			_update_GUI_edits("green")

		Case $skill = 1
			$new = StringTrimLeft($read, 37 + 17 + 12)
			$new = StringTrimRight($new, 7)
			$hunting_data = "Skill|" & $new
			$skill_count += 1
			$skill_count_history += 1
			Select
				Case StringRegExp($read, "Aim", 0)
					$skill_count_aim += 1
					$skill_count_history_Aim += 1
					_update_GUI_skill("aim")
				Case StringRegExp($read, "Clubs", 0)
					$skill_count_clubs += 1
					$skill_count_history_Clubs += 1
					_update_GUI_skill("clubs")
				Case StringRegExp($read, "Combat Reflexes", 0)
					$skill_count_combat_reflexes += 1
					$skill_count_history_Combat_Reflexes += 1
					_update_GUI_skill("combat_reflexes")
				Case StringRegExp($read, "Combat Sense", 0)
					$skill_count_combat_sense += 1
					$skill_count_history_Combat_Sense += 1
					_update_GUI_skill("combat_sense")
				Case StringRegExp($read, "Commando", 0)
					$skill_count_commando += 1
					$skill_count_history_Commando += 1
					_update_GUI_skill("commando")
				Case StringRegExp($read, "Handgun", 0)
					$skill_count_handgun += 1
					$skill_count_history_Handgun += 1
					_update_GUI_skill("handgun")
				Case StringRegExp($read, "Heavy Melee Weapons", 0)
					$skill_count_heavy_melee_weapons += 1
					$skill_count_history_Heavy_Melee_Weapons += 1
					_update_GUI_skill("heavy_melee_weapons")
				Case StringRegExp($read, "Heavy Weapons", 0)
					$skill_count_heavy_weapons += 1
					$skill_count_history_Heavy_Weapons += 1
					_update_GUI_skill("heavy_weapons")
				Case StringRegExp($read, "Inflict Melee Damage", 0)
					$skill_count_inflict_melee_damage += 1
					$skill_count_history_Inflict_Melee_Damage += 1
					_update_GUI_skill("inflict_melee_damage")
				Case StringRegExp($read, "Inflict Ranged Damage", 0)
					$skill_count_inflict_ranged_damage += 1
					$skill_count_history_Inflict_Ranged_Damage += 1
					_update_GUI_skill("inflict_ranged_damage")
				Case StringRegExp($read, "Kill Strike", 0)
					$skill_count_kill_strike += 1
					$skill_count_history_Kill_Strike += 1
					_update_GUI_skill("kill_strike")
				Case StringRegExp($read, "Light Melee Weapons", 0)
					$skill_count_light_melee_weapons += 1
					$skill_count_history_Light_Melee_Weapons += 1
					_update_GUI_skill("light_melee_weapons")
				Case StringRegExp($read, "Longblades", 0)
					$skill_count_longblades += 1
					$skill_count_history_Longblades += 1
					_update_GUI_skill("longblades")
				Case StringRegExp($read, "Marksmanship", 0)
					$skill_count_marksmanship += 1
					$skill_count_history_Marksmanship += 1
					_update_GUI_skill("marksmanship")
				Case StringRegExp($read, "Martial Arts", 0)
					$skill_count_martial_arts += 1
					$skill_count_history_Martial_Arts += 1
					_update_GUI_skill("martial_arts")
				Case StringRegExp($read, "Melee Combat", 0)
					$skill_count_melee_combat += 1
					$skill_count_history_Melee_Combat += 1
					_update_GUI_skill("melee_combat")
				Case StringRegExp($read, "Melee Damage Assessment", 0)
					$skill_count_melee_damage_assessment += 1
					$skill_count_history_Melee_Damage_Assessment += 1
					_update_GUI_skill("melee_damage_assessment")
				Case StringRegExp($read, "Power Fist", 0)
					$skill_count_power_fist += 1
					$skill_count_history_Power_Fist += 1
					_update_GUI_skill("power_fist")
				Case StringRegExp($read, "Ranged Damage Assessment", 0)
					$skill_count_ranged_damage_assessment += 1
					$skill_count_history_Ranged_Damage_Assessment += 1
					_update_GUI_skill("ranged_damage_assessment")
				Case StringRegExp($read, "Rifle", 0)
					$skill_count_rifle += 1
					$skill_count_history_Rifle += 1
					_update_GUI_skill("rifle")
				Case StringRegExp($read, "Shortblades", 0)
					$skill_count_shortblades += 1
					$skill_count_history_Shortblades += 1
					_update_GUI_skill("shortblades")
				Case StringRegExp($read, "Support Weapon Systems", 0)
					$skill_count_support_weapon_systems += 1
					$skill_count_history_Support_Weapon_Systems += 1
					_update_GUI_skill("support_weapon_systems")
				Case StringRegExp($read, "Weapons Handling", 0)
					$skill_count_weapons_handling += 1
					$skill_count_history_Weapons_Handling += 1
					_update_GUI_skill("weapons_handling")
				Case StringRegExp($read, "Whip", 0)
					$skill_count_whip += 1
					$skill_count_history_Whip += 1
					_update_GUI_skill("whip")
				Case StringRegExp($read, "Wounding", 0)
					$skill_count_wounding += 1
					$skill_count_history_Wounding += 1
					_update_GUI_skill("wounding")
				Case StringRegExp($read, "Anatomy", 0)
					$skill_count_anatomy += 1
					$skill_count_history_Anatomy += 1
					_update_GUI_skill("anatomy")
				Case StringRegExp($read, "Diagnosis", 0)
					$skill_count_diagnosis += 1
					$skill_count_history_Diagnosis += 1
					_update_GUI_skill("diagnosis")
				Case StringRegExp($read, "Doctor", 0)
					$skill_count_doctor += 1
					$skill_count_history_Doctor += 1
					_update_GUI_skill("doctor")
				Case StringRegExp($read, "First Aid", 0)
					$skill_count_first_aid += 1
					$skill_count_history_First_Aid += 1
					_update_GUI_skill("first_aid")
				Case StringRegExp($read, "Medical Therapy", 0)
					$skill_count_medical_therapy += 1
					$skill_count_history_Medical_Therapy += 1
					_update_GUI_skill("medical_therapy")
				Case StringRegExp($read, "Medicine", 0)
					$skill_count_medicine += 1
					$skill_count_history_Medicine += 1
					_update_GUI_skill("medicine")
				Case StringRegExp($read, "Treatment", 0)
					$skill_count_treatment += 1
					$skill_count_history_Treatment += 1
					_update_GUI_skill("treatment")
				Case StringRegExp($read, "Bioregenesis", 0)
					$skill_count_bioregenesis += 1
					$skill_count_history_Bioregenesis += 1
					_update_GUI_skill("bioregenesis")
				Case StringRegExp($read, "Concentration", 0)
					$skill_count_concentration += 1
					$skill_count_history_Concentration += 1
					_update_GUI_skill("concentration")
				Case StringRegExp($read, "Cryogenics", 0)
					$skill_count_cryogenics += 1
					$skill_count_history_Cryogenics += 1
					_update_GUI_skill("cryogenics")
				Case StringRegExp($read, "Electrokinesis", 0)
					$skill_count_electrokinesis += 1
					$skill_count_history_Electrokinesis += 1
					_update_GUI_skill("electrokinesis")
				Case StringRegExp($read, "Ethereal Soul Language", 0)
					$skill_count_ethereal_soul_language += 1
					$skill_count_history_Ethereal_Soul_Language += 1
					_update_GUI_skill("ethereal_soul_language")
				Case StringRegExp($read, "Force Merge", 0)
					$skill_count_force_merge += 1
					$skill_count_history_Force_Merge += 1
					_update_GUI_skill("force_merge")
				Case StringRegExp($read, "Jamming", 0)
					$skill_count_jamming += 1
					$skill_count_history_Jamming += 1
					_update_GUI_skill("jamming")
				Case StringRegExp($read, "Mindforce Harmony", 0)
					$skill_count_mindforce_harmony += 1
					$skill_count_history_Mindforce_Harmony += 1
					_update_GUI_skill("mindforce_harmony")
				Case StringRegExp($read, "Power Catalyst", 0)
					$skill_count_power_catalyst += 1
					$skill_count_history_Power_Catalyst += 1
					_update_GUI_skill("power_catalyst")
				Case StringRegExp($read, "Pyrokinesis", 0)
					$skill_count_pyrokinesis += 1
					$skill_count_history_Pyrokinesis += 1
					_update_GUI_skill("pyrokinesis")
				Case StringRegExp($read, "Sweat Gatherer", 0)
					$skill_count_sweat_gatherer += 1
					$skill_count_history_Sweat_Gatherer += 1
					_update_GUI_skill("sweat_gatherer")
				Case StringRegExp($read, "Telepathy", 0)
					$skill_count_telepathy += 1
					$skill_count_history_Telepathy += 1
					_update_GUI_skill("telepathy")
				Case StringRegExp($read, "Translocation", 0)
					$skill_count_translocation += 1
					$skill_count_history_Translocation += 1
					_update_GUI_skill("translocation")
				Case StringRegExp($read, "Avoidance", 0)
					$skill_count_avoidance += 1
					$skill_count_history_Avoidance += 1
					_update_GUI_skill("avoidance")
				Case StringRegExp($read, "Dispense Decoy", 0)
					$skill_count_dispence_decoy += 1
					$skill_count_history_Dispense_Decoy += 1
					_update_GUI_skill("dispencse_decoy")
				Case StringRegExp($read, "Dodge", 0)
					$skill_count_dodge += 1
					$skill_count_history_Dodge += 1
					_update_GUI_skill("dodge")
				Case StringRegExp($read, "Evade", 0)
					$skill_count_evade += 1
					$skill_count_history_Evade += 1
					_update_GUI_skill("evade")
			EndSelect
			skills_item()
			_update_GUI_misc()
			_update_GUI_edits("green")

		Case $skill2 = 1
			$new = StringTrimLeft($read, 17 + 12 + 18)
			$new = StringTrimRight($new, 1)
			$hunting_data = "Skill|" & $new
			$skill_count += 1
			$skill_count_history += 1
			Select
				Case StringRegExp($read, "Alertness", 0)
					$skill_count_aleartness += 1
					$skill_count_history_Alertness += 1
					_update_GUI_skill("aleartness")
				Case StringRegExp($read, "Athletics", 0)
					$skill_count_athletics += 1
					$skill_count_history_Athletics += 1
					_update_GUI_skill("athletics")
				Case StringRegExp($read, "Bravado", 0)
					$skill_count_bravado += 1
					$skill_count_history_Bravado += 1
					_update_GUI_skill("bravado")
				Case StringRegExp($read, "Coolness", 0)
					$skill_count_coolness += 1
					$skill_count_history_Coolness += 1
					_update_GUI_skill("coolness")
				Case StringRegExp($read, "Courage", 0)
					$skill_count_courage += 1
					$skill_count_history_Courage += 1
					_update_GUI_skill("courage")
				Case StringRegExp($read, "Dexterity", 0)
					$skill_count_dexterity += 1
					$skill_count_history_Dexterity += 1
					_update_GUI_skill("dexterity")
				Case StringRegExp($read, "Intuition", 0)
					$skill_count_intuition += 1
					$skill_count_history_Intuition += 1
					_update_GUI_skill("intuition")
				Case StringRegExp($read, "Perception", 0)
					$skill_count_perception += 1
					$skill_count_history_Perception += 1
					_update_GUI_skill("perception")
				Case StringRegExp($read, "Quickness", 0)
					$skill_count_quickness += 1
					$skill_count_history_Quickness += 1
					_update_GUI_skill("quickness")
				Case StringRegExp($read, "Serendipity", 0)
					$skill_count_serendipity += 1
					$skill_count_history_Serendipity += 1
					_update_GUI_skill("serendipity")
			EndSelect
			skills_item()
			_update_GUI_misc()
			_update_GUI_edits("green")

		Case $skill3 = 1
			$new = StringTrimLeft($read, 36)
			$new = StringTrimRight($new, 14)
			$hunting_data = "Skill|" & $new
			$skill_count += 1
			$skill_count_history += 1
			Select
				Case StringRegExp($read, "Agility", 0)
					$skill_count_agility += 1
					$skill_count_history_Agility += 1
					_update_GUI_skill("agility")
				Case StringRegExp($read, "Intelligence", 0)
					$skill_count_intelligence += 1
					$skill_count_history_Intelligence += 1
					_update_GUI_skill("intelligence")
				Case StringRegExp($read, "Psyche", 0)
					$skill_count_psyche += 1
					$skill_count_history_Psyche += 1
					_update_GUI_skill("psyche")
				Case StringRegExp($read, "Stamina", 0)
					$skill_count_stamina += 1
					$skill_count_history_Stamina += 1
					_update_GUI_skill("stamina")
				Case StringRegExp($read, "Strength", 0)
					$skill_count_strength += 1
					$skill_count_history_Strength += 1
					_update_GUI_skill("strength")
			EndSelect
			skills_item()
			_update_GUI_misc()
			_update_GUI_edits("green")
		Case $enhancer = 1
			Select
				Case StringRegExp($read, "Weapon Accuracy Enhancer I ", 0)
					broken_enhancer("Weapon Accuracy Enhancer I")
				Case StringRegExp($read, "Weapon Accuracy Enhancer II ", 0)
					broken_enhancer("Weapon Accuracy Enhancer II")
				Case StringRegExp($read, "Weapon Accuracy Enhancer III ", 0)
					broken_enhancer("Weapon Accuracy Enhancer III")
				Case StringRegExp($read, "Weapon Accuracy Enhancer IV ", 0)
					broken_enhancer("Weapon Accuracy Enhancer IV")
				Case StringRegExp($read, "Weapon Accuracy Enhancer IX ", 0)
					broken_enhancer("Weapon Accuracy Enhancer IX")
				Case StringRegExp($read, "Weapon Accuracy Enhancer V ", 0)
					broken_enhancer("Weapon Accuracy Enhancer V")
				Case StringRegExp($read, "Weapon Accuracy Enhancer VI ", 0)
					broken_enhancer("Weapon Accuracy Enhancer VI")
				Case StringRegExp($read, "Weapon Accuracy Enhancer VII ", 0)
					broken_enhancer("Weapon Accuracy Enhancer VII")
				Case StringRegExp($read, "Weapon Accuracy Enhancer VIII ", 0)
					broken_enhancer("Weapon Accuracy Enhancer VIII")
				Case StringRegExp($read, "Weapon Accuracy Enhancer X ", 0)
					broken_enhancer("Weapon Accuracy Enhancer X")
				Case StringRegExp($read, "Weapon Damage Enhancer I ", 0)
					broken_enhancer("Weapon Damage Enhancer I")
				Case StringRegExp($read, "Weapon Damage Enhancer II ", 0)
					broken_enhancer("Weapon Damage Enhancer II")
				Case StringRegExp($read, "Weapon Damage Enhancer III ", 0)
					broken_enhancer("Weapon Damage Enhancer III")
				Case StringRegExp($read, "Weapon Damage Enhancer IV ", 0)
					broken_enhancer("Weapon Damage Enhancer IV")
				Case StringRegExp($read, "Weapon Damage Enhancer IX ", 0)
					broken_enhancer("Weapon Damage Enhancer IX")
				Case StringRegExp($read, "Weapon Damage Enhancer V ", 0)
					broken_enhancer("Weapon Damage Enhancer V")
				Case StringRegExp($read, "Weapon Damage Enhancer VI ", 0)
					broken_enhancer("Weapon Damage Enhancer VI")
				Case StringRegExp($read, "Weapon Damage Enhancer VII ", 0)
					broken_enhancer("Weapon Damage Enhancer VII")
				Case StringRegExp($read, "Weapon Damage Enhancer VIII ", 0)
					broken_enhancer("Weapon Damage Enhancer VIII")
				Case StringRegExp($read, "Weapon Damage Enhancer X ", 0)
					broken_enhancer("Weapon Damage Enhancer X")
				Case StringRegExp($read, "Weapon Economy Enhancer I ", 0)
					broken_enhancer("Weapon Economy Enhancer I")
				Case StringRegExp($read, "Weapon Economy Enhancer II ", 0)
					broken_enhancer("Weapon Economy Enhancer II")
				Case StringRegExp($read, "Weapon Economy Enhancer III ", 0)
					broken_enhancer("Weapon Economy Enhancer III")
				Case StringRegExp($read, "Weapon Economy Enhancer IV ", 0)
					broken_enhancer("Weapon Economy Enhancer IV")
				Case StringRegExp($read, "Weapon Economy Enhancer IX ", 0)
					broken_enhancer("Weapon Economy Enhancer IX")
				Case StringRegExp($read, "Weapon Economy Enhancer V ", 0)
					broken_enhancer("Weapon Economy Enhancer V")
				Case StringRegExp($read, "Weapon Economy Enhancer VI ", 0)
					broken_enhancer("Weapon Economy Enhancer VI")
				Case StringRegExp($read, "Weapon Economy Enhancer VII ", 0)
					broken_enhancer("Weapon Economy Enhancer VII")
				Case StringRegExp($read, "Weapon Economy Enhancer VIII ", 0)
					broken_enhancer("Weapon Economy Enhancer VIII")
				Case StringRegExp($read, "Weapon Economy Enhancer X ", 0)
					broken_enhancer("Weapon Economy Enhancer X")
				Case StringRegExp($read, "Weapon Range Enhancer I ", 0)
					broken_enhancer("Weapon Range Enhancer I")
				Case StringRegExp($read, "Weapon Range Enhancer II ", 0)
					broken_enhancer("Weapon Range Enhancer II")
				Case StringRegExp($read, "Weapon Range Enhancer III ", 0)
					broken_enhancer("Weapon Range Enhancer III")
				Case StringRegExp($read, "Weapon Range Enhancer IV ", 0)
					broken_enhancer("Weapon Range Enhancer IV")
				Case StringRegExp($read, "Weapon Range Enhancer IX ", 0)
					broken_enhancer("Weapon Range Enhancer IX")
				Case StringRegExp($read, "Weapon Range Enhancer V ", 0)
					broken_enhancer("Weapon Range Enhancer V")
				Case StringRegExp($read, "Weapon Range Enhancer VI ", 0)
					broken_enhancer("Weapon Range Enhancer VI")
				Case StringRegExp($read, "Weapon Range Enhancer VII ", 0)
					broken_enhancer("Weapon Range Enhancer VII")
				Case StringRegExp($read, "Weapon Range Enhancer VIII ", 0)
					broken_enhancer("Weapon Range Enhancer VIII")
				Case StringRegExp($read, "Weapon Range Enhancer X ", 0)
					broken_enhancer("Weapon Range Enhancer X")
				Case StringRegExp($read, "Weapon Skill Modification Enhancer I ", 0)
					broken_enhancer("Weapon Skill Modification Enhancer I")
				Case StringRegExp($read, "Weapon Skill Modification Enhancer II ", 0)
					broken_enhancer("Weapon Skill Modification Enhancer II")
				Case StringRegExp($read, "Weapon Skill Modification Enhancer III ", 0)
					broken_enhancer("Weapon Skill Modification Enhancer III")
				Case StringRegExp($read, "Weapon Skill Modification Enhancer IV ", 0)
					broken_enhancer("Weapon Skill Modification Enhancer IV")
				Case StringRegExp($read, "Weapon Skill Modification Enhancer IX ", 0)
					broken_enhancer("Weapon Skill Modification Enhancer IX")
				Case StringRegExp($read, "Weapon Skill Modification Enhancer V ", 0)
					broken_enhancer("Weapon Skill Modification Enhancer V")
				Case StringRegExp($read, "Weapon Skill Modification Enhancer VI ", 0)
					broken_enhancer("Weapon Skill Modification Enhancer VI")
				Case StringRegExp($read, "Weapon Skill Modification Enhancer VII ", 0)
					broken_enhancer("Weapon Skill Modification Enhancer VII")
				Case StringRegExp($read, "Weapon Skill Modification Enhancer VIII ", 0)
					broken_enhancer("Weapon Skill Modification Enhancer VIII")
				Case StringRegExp($read, "Weapon Skill Modification Enhancer X ", 0)
					broken_enhancer("Weapon Skill Modification Enhancer X")
				Case StringRegExp($read, "Medical Tool Economy Enhancer I ", 0)
					broken_enhancer("Medical Tool Economy Enhancer I")
				Case StringRegExp($read, "Medical Tool Economy Enhancer II ", 0)
					broken_enhancer("Medical Tool Economy Enhancer II")
				Case StringRegExp($read, "Medical Tool Economy Enhancer III ", 0)
					broken_enhancer("Medical Tool Economy Enhancer III")
				Case StringRegExp($read, "Medical Tool Economy Enhancer IV ", 0)
					broken_enhancer("Medical Tool Economy Enhancer IV")
				Case StringRegExp($read, "Medical Tool Economy Enhancer IX ", 0)
					broken_enhancer("Medical Tool Economy Enhancer IX")
				Case StringRegExp($read, "Medical Tool Economy Enhancer V ", 0)
					broken_enhancer("Medical Tool Economy Enhancer V")
				Case StringRegExp($read, "Medical Tool Economy Enhancer VI ", 0)
					broken_enhancer("Medical Tool Economy Enhancer VI")
				Case StringRegExp($read, "Medical Tool Economy Enhancer VII ", 0)
					broken_enhancer("Medical Tool Economy Enhancer VII")
				Case StringRegExp($read, "Medical Tool Economy Enhancer VIII ", 0)
					broken_enhancer("Medical Tool Economy Enhancer VIII")
				Case StringRegExp($read, "Medical Tool Economy Enhancer X ", 0)
					broken_enhancer("Medical Tool Economy Enhancer X")
				Case StringRegExp($read, "Medical Tool Heal Enhancer I ", 0)
					broken_enhancer("Medical Tool Heal Enhancer I")
				Case StringRegExp($read, "Medical Tool Heal Enhancer II ", 0)
					broken_enhancer("Medical Tool Heal Enhancer II")
				Case StringRegExp($read, "Medical Tool Heal Enhancer III ", 0)
					broken_enhancer("Medical Tool Heal Enhancer III")
				Case StringRegExp($read, "Medical Tool Heal Enhancer IV ", 0)
					broken_enhancer("Medical Tool Heal Enhancer IV")
				Case StringRegExp($read, "Medical Tool Heal Enhancer IX ", 0)
					broken_enhancer("Medical Tool Heal Enhancer IX")
				Case StringRegExp($read, "Medical Tool Heal Enhancer V ", 0)
					broken_enhancer("Medical Tool Heal Enhancer V")
				Case StringRegExp($read, "Medical Tool Heal Enhancer VI ", 0)
					broken_enhancer("Medical Tool Heal Enhancer VI")
				Case StringRegExp($read, "Medical Tool Heal Enhancer VII ", 0)
					broken_enhancer("Medical Tool Heal Enhancer VII")
				Case StringRegExp($read, "Medical Tool Heal Enhancer VIII ", 0)
					broken_enhancer("Medical Tool Heal Enhancer VIII")
				Case StringRegExp($read, "Medical Tool Heal Enhancer X ", 0)
					broken_enhancer("Medical Tool Heal Enhancer X")
				Case StringRegExp($read, "Medical Tool Skill Modification Enhancer I ", 0)
					broken_enhancer("Medical Tool Skill Modification Enhancer I")
				Case StringRegExp($read, "Medical Tool Skill Modification Enhancer II ", 0)
					broken_enhancer("Medical Tool Skill Modification Enhancer II")
				Case StringRegExp($read, "Medical Tool Skill Modification Enhancer III ", 0)
					broken_enhancer("Medical Tool Skill Modification Enhancer III")
				Case StringRegExp($read, "Medical Tool Skill Modification Enhancer IV ", 0)
					broken_enhancer("Medical Tool Skill Modification Enhancer IV")
				Case StringRegExp($read, "Medical Tool Skill Modification Enhancer IX ", 0)
					broken_enhancer("Medical Tool Skill Modification Enhancer IX")
				Case StringRegExp($read, "Medical Tool Skill Modification Enhancer V ", 0)
					broken_enhancer("Medical Tool Skill Modification Enhancer V")
				Case StringRegExp($read, "Medical Tool Skill Modification Enhancer VI ", 0)
					broken_enhancer("Medical Tool Skill Modification Enhancer VI")
				Case StringRegExp($read, "Medical Tool Skill Modification Enhancer VII ", 0)
					broken_enhancer("Medical Tool Skill Modification Enhancer VII")
				Case StringRegExp($read, "Medical Tool Skill Modification Enhancer VIII ", 0)
					broken_enhancer("Medical Tool Skill Modification Enhancer VIII")
				Case StringRegExp($read, "Medical Tool Skill Modification Enhancer X ", 0)
					broken_enhancer("Medical Tool Skill Modification Enhancer X")
			EndSelect
		Case $noloot = 1
			$hunting_data = "Loot| This creature didn't carry any loot."
			$noloot_count += 1
			_update_GUI_misc()
			_update_GUI_edits("yellow")
		Case $global_avatar_h And $hof_avatar_h = False And $ath_avatar_h = False And $enable_hunting_globals = 1
			$hunting_data = "Captured| Global"
			_update_GUI_edits("purple")
			global_capture("Hunting")
		Case $hof_avatar_h And $ath_avatar_h = False And $enable_hunting_hof = 1
			$hunting_data = "Captured| Hall Of Fame"
			_update_GUI_edits("purple")
			global_capture("Hunting")
		Case $ath_avatar_h
			$hunting_data = "Captured| All Time High Big Congrats from PostHistory"
			_update_GUI_edits("purple")
			global_capture("Hunting")
		Case $global_avatar_h And StringRegExp($read, "in combat")
			$hunting_data = "Captured| Murderer - Global Captured"
			_update_GUI_edits("purple")
			global_capture("PVP")
		Case $global_avatar_c And $hof_avatar_c = False And $ath_avatar_c = False And $enable_crafting_globals = 1
			$hunting_data = "Captured| Global"
			_update_GUI_edits("purple")
			global_capture("Crafting")
		Case $hof_avatar_c And $ath_avatar_c = False And $enable_crafting_hof = 1
			$hunting_data = "Captured| Hall Of Fame"
			_update_GUI_edits("purple")
			global_capture("Crafting")
		Case $ath_avatar_c
			$hunting_data = "Captured| All Time High Big Congrats from PostHistory"
			_update_GUI_edits("purple")
			global_capture("Crafting")
		Case $global_avatar_m And $hof_avatar_m = False And $ath_avatar_m = False And $enable_mining_globals = 1
			$hunting_data = "Captured| Global"
			_update_GUI_edits("purple")
			global_capture("Mining")
		Case $hof_avatar_m And $ath_avatar_m = False And $enable_mining_hof = 1
			$hunting_data = "Captured| Hall Of Fame"
			_update_GUI_edits("purple")
			global_capture("Mining")
		Case $ath_avatar_m
			$hunting_data = "Captured| All Time High Big Congrats from PostHistory"
			_update_GUI_edits("purple")
			global_capture("Mining")
		Case $kill_spree
			$hunting_data = "Captured| Serves you right :)"
			_update_GUI_edits("purple")
			global_capture("Kill Spree")
		Case $first And StringRegExp($read, "reach tier", 1)
			$hunting_data = "Tier Hof Captured"
			_update_GUI_edits("purple")
			global_capture("Tier")
		Case $first And StringRegExp($read, "discover", 1)
			$hunting_data = "Discovery Captured"
			_update_GUI_edits("purple")
			global_capture("Discovery")
;~ 		Case $death ; And GUICtrlRead($death_pos_input) = 1
;~ 			Opt("SendKeyDelay", 5)
;~ 			Send("{Enter}")
;~ 			Sleep(600)
;~ 			Send("/l /pos")
;~ 			Sleep(500)
;~ 			Send("{Enter}")
;~ 			Send("{ESCAPE}")
;~ 			Opt("SendKeyDelay", 0)
	EndSelect
EndFunc   ;==>read_log_data
#endregion ; Read Chat.log
#region ; Hotkeys
Func hotkey()
	GUISetState(@SW_SHOW, $setkey)
	While $Reciving = True
		getkey()
	WEnd
	GUISetState(@SW_HIDE, $setkey)
EndFunc   ;==>hotkey
Func getkey()
	Do
		For $i = 0 To 256
			If _IsPressed(Hex($i, 2)) Then
				$Hex = Hex($i, 2)
				If $Hex = "01" Then $keyinput = "Left Mouse Button"
				If $Hex = "02" Then $keyinput = "Right Mouse Button"
				If $Hex = "04" Then $keyinput = "Middle Mouse Button"
				If $Hex = "05" Then $keyinput = "Mouse Button 4"
				If $Hex = "06" Then $keyinput = "Mouse Button 5"
				If $Hex = "08" Then $keyinput = "BACKSPACE"
				If $Hex = "09" Then $keyinput = "TAB"
				If $Hex = "0C" Then $keyinput = "CLEAR"
				If $Hex = "0D" Then $keyinput = "ENTER"
				If $Hex = "13" Then $keyinput = "PAUSE"
				If $Hex = "14" Then $keyinput = "CAPS LOCK"
				If $Hex = "20" Then $keyinput = "SPACEBAR"
				If $Hex = "21" Then $keyinput = "PAGE UP"
				If $Hex = "22" Then $keyinput = "PAGE DOWN"
				If $Hex = "23" Then $keyinput = "END"
				If $Hex = "24" Then $keyinput = "HOME"
				If $Hex = "25" Then $keyinput = "LEFT ARROW"
				If $Hex = "26" Then $keyinput = "UP ARROW"
				If $Hex = "27" Then $keyinput = "RIGHT ARROW"
				If $Hex = "28" Then $keyinput = "DOWN ARROW"
				If $Hex = "29" Then $keyinput = "SELECT"
				If $Hex = "2A" Then $keyinput = "PRINT"
				If $Hex = "2B" Then $keyinput = "EXECUTE"
				If $Hex = "2C" Then $keyinput = "PRINT SCREEN"
				If $Hex = "2D" Then $keyinput = "INS"
				If $Hex = "2E" Then $keyinput = "DEL"
				If $Hex = "30" Then $keyinput = "0"
				If $Hex = "31" Then $keyinput = "1"
				If $Hex = "32" Then $keyinput = "2"
				If $Hex = "33" Then $keyinput = "3"
				If $Hex = "34" Then $keyinput = "4"
				If $Hex = "35" Then $keyinput = "5"
				If $Hex = "36" Then $keyinput = "6"
				If $Hex = "37" Then $keyinput = "7"
				If $Hex = "38" Then $keyinput = "8"
				If $Hex = "39" Then $keyinput = "9"
				If $Hex = "41" Then $keyinput = "A"
				If $Hex = "42" Then $keyinput = "B"
				If $Hex = "43" Then $keyinput = "C"
				If $Hex = "44" Then $keyinput = "D"
				If $Hex = "45" Then $keyinput = "E"
				If $Hex = "46" Then $keyinput = "F"
				If $Hex = "47" Then $keyinput = "G"
				If $Hex = "48" Then $keyinput = "H"
				If $Hex = "49" Then $keyinput = "I"
				If $Hex = "4A" Then $keyinput = "J"
				If $Hex = "4B" Then $keyinput = "K"
				If $Hex = "4C" Then $keyinput = "L"
				If $Hex = "4D" Then $keyinput = "M"
				If $Hex = "4E" Then $keyinput = "N"
				If $Hex = "4F" Then $keyinput = "O"
				If $Hex = "50" Then $keyinput = "P"
				If $Hex = "51" Then $keyinput = "Q"
				If $Hex = "52" Then $keyinput = "R"
				If $Hex = "53" Then $keyinput = "S"
				If $Hex = "54" Then $keyinput = "T"
				If $Hex = "55" Then $keyinput = "U"
				If $Hex = "56" Then $keyinput = "V"
				If $Hex = "57" Then $keyinput = "W"
				If $Hex = "58" Then $keyinput = "X"
				If $Hex = "59" Then $keyinput = "Y"
				If $Hex = "5A" Then $keyinput = "Z"
				If $Hex = "5B" Then $keyinput = "Left Windows"
				If $Hex = "5C" Then $keyinput = "Right Windows"
				If $Hex = "5D" Then $keyinput = "Right Application"
				If $Hex = "60" Then $keyinput = "Numeric keypad 0"
				If $Hex = "61" Then $keyinput = "Numeric keypad 1"
				If $Hex = "62" Then $keyinput = "Numeric keypad 2"
				If $Hex = "63" Then $keyinput = "Numeric keypad 3"
				If $Hex = "64" Then $keyinput = "Numeric keypad 4"
				If $Hex = "65" Then $keyinput = "Numeric keypad 5"
				If $Hex = "66" Then $keyinput = "Numeric keypad 6"
				If $Hex = "67" Then $keyinput = "Numeric keypad 7"
				If $Hex = "68" Then $keyinput = "Numeric keypad 8"
				If $Hex = "69" Then $keyinput = "Numeric keypad 9"
				If $Hex = "6A" Then $keyinput = "Multiply"
				If $Hex = "6B" Then $keyinput = "Add"
				If $Hex = "6C" Then $keyinput = "Separator"
				If $Hex = "6D" Then $keyinput = "Subtract"
				If $Hex = "6E" Then $keyinput = "Decimal"
				If $Hex = "6F" Then $keyinput = "Divide"
				If $Hex = "70" Then $keyinput = "F1"
				If $Hex = "71" Then $keyinput = "F2"
				If $Hex = "72" Then $keyinput = "F3"
				If $Hex = "73" Then $keyinput = "F4"
				If $Hex = "74" Then $keyinput = "F5"
				If $Hex = "75" Then $keyinput = "F6"
				If $Hex = "76" Then $keyinput = "F7"
				If $Hex = "77" Then $keyinput = "F8"
				If $Hex = "78" Then $keyinput = "F9"
				If $Hex = "79" Then $keyinput = "F10"
				If $Hex = "7A" Then $keyinput = "F11"
				If $Hex = "7B" Then $keyinput = "F12"
				If $Hex = "90" Then $keyinput = "NUM LOCK"
				If $Hex = "91" Then $keyinput = "SCROLL LOCK"
				If $Hex = "A0" Then $keyinput = "Left SHIFT"
				If $Hex = "A1" Then $keyinput = "Right SHIFT"
				If $Hex = "A2" Then $keyinput = "Left CONTROL"
				If $Hex = "A3" Then $keyinput = "Right CONTROL"
				If $Hex = "A4" Then $keyinput = "Left MENU"
				If $Hex = "A5" Then $keyinput = "Right MENU"
				If $Hex = "BA" Then $keyinput = ";"
				If $Hex = "BB" Then $keyinput = "="
				If $Hex = "BC" Then $keyinput = ","
				If $Hex = "BD" Then $keyinput = "-"
				If $Hex = "BE" Then $keyinput = "."
				If $Hex = "BF" Then $keyinput = "/"
				If $Hex = "C0" Then $keyinput = "`"
				If $Hex = "DB" Then $keyinput = "["
				If $Hex = "DC" Then $keyinput = "\"
				If $Hex = "DD" Then $keyinput = "]"
				GUISetState(@SW_HIDE, $setkey)
				GUISetState(@SW_ENABLE, $main_window)
				$Reciving = False
			ElseIf $Hex = "1B" Then
				$keyinput = "<none>"
				$Hex = ""
				GUISetState(@SW_HIDE, $setkey)
				GUISetState(@SW_ENABLE, $main_window)
				$Reciving = False
			EndIf
		Next
	Until $Reciving = False
EndFunc   ;==>getkey
#endregion ; Hotkeys

#region ; Global Capture
Func team_names()
	$team_names = StringSplit($team_name, "|", 1)
	Local $team_names_count = UBound($team_names)
	Return $team_names_count - 1
EndFunc   ;==>team_names
Func global_capture_team($aTeam_name)
	Send($position_key)
	Send($time_stamp_key)
	Sleep($capture_delay)
	Select
		Case $image_type_bmp = 1
			Local $image_type = ".bmp"
			_ScreenCapture_SetBMPFormat(4)
		Case $image_type_jpeg = 1
			Local $image_type = ".jpg"
			_ScreenCapture_SetJPGQuality(GUICtrlRead($jpeg_quality_input) * 25)
	EndSelect
	Local $file_name = StringRegExpReplace($aTeam_name, "[/?<>\\:*|”]", "-") & " " & date_stamp() & " " & time_stamp() & $image_type
	Local $folder = folder_structure("Team")
	Local $File = $capture_folder & "\" & $folder & "\" & $file_name
	Local $s_title = "Entropia Universe Client"
	_ScreenCapture_CaptureWndV2($File, WinGetHandle($s_title))
EndFunc   ;==>global_capture_team
Func global_capture($type)
	Local $s_title = "Entropia Universe Client"
	Local $orig_pos
	If WinGetState($s_title) = 23 Then
		WinSetTrans($s_title, "", 0)
		WinSetState($s_title, "", @SW_SHOWNORMAL)
		$orig_pos = WinGetPos($s_title)
		WinMove($s_title, "", 10000, 10000)
		WinSetTrans($s_title, "", 255)
		capture($type)
		WinSetState($s_title, "", @SW_HIDE)
		WinMove($s_title, "", $orig_pos[0], $orig_pos[1])
		WinSetState($s_title, "", @SW_MINIMIZE)
	Else
		capture($type)
	EndIf
EndFunc   ;==>global_capture
Func Capture($type)
	Send($position_key)
	Send($time_stamp_key)
	Sleep($capture_delay)
	Select
		Case $image_type_bmp = 1
			Local $image_type = ".bmp"
			_ScreenCapture_SetBMPFormat(4)
		Case $image_type_jpeg = 1
			Local $image_type = ".jpg"
			_ScreenCapture_SetJPGQuality(GUICtrlRead($jpeg_quality_input) * 25)
	EndSelect
	Local $file_name = StringRegExpReplace($avatar_name, "[/?<>\\:*|”]", "-") & " " & date_stamp() & " " & time_stamp() & $image_type
	Local $folder = folder_structure($type)
	Local $File = $capture_folder & "\" & $folder & "\" & $file_name
	Local $s_title = "Entropia Universe Client"
	_ScreenCapture_CaptureWndV2($File, WinGetHandle($s_title))
EndFunc   ;==>Capture

Func folder_structure($type)
	Local $folder_structure_restructure
	$folder_structure_restructure = $folder_structure
	$folder_structure_restructure = StringRegExpReplace($folder_structure_restructure, "\[M\]", month_long())
	$folder_structure_restructure = StringRegExpReplace($folder_structure_restructure, "\[m\]", @MON)
	$folder_structure_restructure = StringRegExpReplace($folder_structure_restructure, "\[Y\]", @YEAR)
	$folder_structure_restructure = StringRegExpReplace($folder_structure_restructure, "\[y\]", StringTrimLeft(@YEAR, 2))
	$folder_structure_restructure = StringRegExpReplace($folder_structure_restructure, "\[D\]", day_long())
	$folder_structure_restructure = StringRegExpReplace($folder_structure_restructure, "\[d\]", @MDAY)
	$folder_structure_restructure = StringRegExpReplace($folder_structure_restructure, "\[Type\]", $type)
	folder_create($capture_folder & "\" & $folder_structure_restructure)
	Return $folder_structure_restructure
EndFunc   ;==>folder_structure
#endregion ; Global Capture

#endregion ;~ Core
#region ;~ Joke of the month question
;~ Supplied by Max Power Voltage
;~ What Do you Call 500 lawyers on the bottom of the Ocean?
#endregion ;~ Joke of the month question
#region ;~ Math
#region ; Weapon Math
Func dmgout_weapon($x)
	Assign("totaldmg_" & $x, Eval("totaldmg_" & $x) + $new, 2)
	Assign("totaldmg_history_" & $x, Eval("totaldmg_history_" & $x) + $new, 2)
	Assign("use_count_" & $x, Eval("use_count_" & $x) + 1, 2)
	Assign("use_count_history_" & $x, Eval("use_count_history_" & $x) + 1, 2)
	Assign("hit_count_" & $x, Eval("hit_count_" & $x) + 1, 2)
	Assign("hit_count_history_" & $x, Eval("hit_count_history_" & $x) + 1, 2)
EndFunc   ;==>dmgout_weapon

Func cdmgout_weapon($x)
	dmgout_weapon($x)
	Assign("chit_count_" & $x, Eval("chit_count_" & $x) + 1, 2)
	Assign("chit_count_history_" & $x, Eval("chit_count_history_" & $x) + 1, 2)
EndFunc   ;==>cdmgout_weapon

Func miss_weapon($x)
	Assign("use_count_" & $x, Eval("use_count_" & $x) + 1, 2)
	Assign("use_count_history_" & $x, Eval("use_count_history_" & $x) + 1, 2)
	Assign("miss_count_" & $x, Eval("miss_count_" & $x) + 1, 2)
	Assign("miss_count_history_" & $x, Eval("miss_count_history_" & $x) + 1, 2)
EndFunc   ;==>miss_weapon

Func weapons_math()
	$dmg_s = ((($totaldmg / $use_count) * $attacks) / 60)
	$dmg_s_history = ((($totaldmg_history / $use_count_history) * $attacks) / 60)
	$dmg_pec = ($totaldmg / $use_count) / ($decay + ($ammo / 100))
	$dmg_pec_history = ($totaldmg_history / $use_count_history) / ($decay + ($ammo / 100))
	$hit_ability = ($hit_count / $use_count) * 100
	$hit_ability_history = ($hit_count_history / $use_count_history) * 100
	$chit_ability = ($chit_count / $use_count) * 100
	$chit_ability_history = ($chit_count_history / $use_count_history) * 100
EndFunc   ;==>weapons_math

Func weapon_math($x)
	Assign("dmg_s_" & $x, (Eval("totaldmg_" & $x) / Eval("use_count_" & $x)) / (60 / Eval("weapon_attacks_" & $x)), 2)
	Assign("dmg_s_history_" & $x, (Eval("totaldmg_history_" & $x) / Eval("use_count_history_" & $x)) / (60 / Eval("weapon_attacks_" & $x)), 2)
	Assign("dmg_pec_" & $x, (Eval("totaldmg_" & $x) / Eval("use_count_" & $x)) / decay_weapon($x), 2)
	Assign("dmg_pec_history_" & $x, (Eval("totaldmg_history_" & $x) / Eval("use_count_history_" & $x)) / decay_weapon($x), 2)
	Assign("hit_ability_" & $x, (Eval("hit_count_" & $x) / Eval("use_count_" & $x)) * 100, 2)
	Assign("hit_ability_history_" & $x, (Eval("hit_count_history_" & $x) / Eval("use_count_history_" & $x)) * 100, 2)
	Assign("chit_ability_" & $x, (Eval("chit_count_" & $x) / Eval("use_count_" & $x)) * 100, 2)
	Assign("chit_ability_history_" & $x, (Eval("chit_count_history_" & $x) / Eval("use_count_history_" & $x)) * 100, 2)
	Assign("skills_pec_" & $x, Round((Eval("use_count_" & $x) * decay_weapon($x)) / Eval("skill_count_" & $x), 2), 2)
	Assign("skills_pec_history_" & $x, Round((Eval("use_count_history_" & $x) * decay_weapon($x)) / Eval("skill_count_history_" & $x), 2), 2)
EndFunc   ;==>weapon_math

Func decay_weapon($x)
	Local $decay_weapon = (((Eval("weapon_decay_" & $x) + (Eval("weapon_decay_" & $x) * weapon_enhancer_state($x))) * (Eval("weapon_markup_" & $x) / 100)) + ((Eval("weapon_ammo_" & $x) / 100) + (Eval("weapon_ammo_" & $x) / 100) * weapon_enhancer_state($x))) + (Eval("amp_decay_" & $x) + (Eval("amp_decay_") * (Eval("amp_markup_" & $x) / 100)) + (Eval("amp_ammo_" & $x) / 100))
	Return $decay_weapon
EndFunc   ;==>decay_weapon

Func weapon_enhancer_state($x)
	$y = 0
	If Eval("damage_I_" & $x) = 1 Then
		$y += .10
	EndIf
	If Eval("damage_II_" & $x) = 1 Then
		$y += .10
	EndIf
	If Eval("damage_III_" & $x) = 1 Then
		$y += .10
	EndIf
	If Eval("damage_IV_" & $x) = 1 Then
		$y += .10
	EndIf
	If Eval("damage_V_" & $x) = 1 Then
		$y += .10
	EndIf
	If Eval("damage_VI_" & $x) = 1 Then
		$y += .10
	EndIf
	If Eval("damage_VII_" & $x) = 1 Then
		$y += .10
	EndIf
	If Eval("damage_VIII_" & $x) = 1 Then
		$y += .10
	EndIf
	If Eval("damage_IX_" & $x) = 1 Then
		$y += .10
	EndIf
	If Eval("damage_X_" & $x) = 1 Then
		$y += .10
	EndIf
	If Eval("weapon_economy_I_" & $x) = 1 Then
		$y -= .01
	EndIf
	If Eval("weapon_economy_II_" & $x) = 1 Then
		$y -= .01
	EndIf
	If Eval("weapon_economy_III_" & $x) = 1 Then
		$y -= .01
	EndIf
	If Eval("weapon_economy_IV_" & $x) = 1 Then
		$y -= .01
	EndIf
	If Eval("weapon_economy_V_" & $x) = 1 Then
		$y -= .01
	EndIf
	If Eval("weapon_economy_VI_" & $x) = 1 Then
		$y -= .01
	EndIf
	If Eval("weapon_economy_VII_" & $x) = 1 Then
		$y -= .01
	EndIf
	If Eval("weapon_economy_VIII_" & $x) = 1 Then
		$y -= .01
	EndIf
	If Eval("weapon_economy_IX_" & $x) = 1 Then
		$y -= .01
	EndIf
	If Eval("weapon_economy_X_" & $x) = 1 Then
		$y -= .01
	EndIf
	Return $y
EndFunc   ;==>weapon_enhancer_state

Func reset_dmgout_current()
	$hit_count = 0
	$chit_count = 0
	$miss_count = 0
	$use_count = 0
	$totaldmg = 0
	$hit_ability = 0
	$chit_ability = 0
	$dmg_s = 0
	$dmg_pec = 0
	_update_GUI_dmg_out()
EndFunc   ;==>reset_dmgout_current

Func reset_current_weapon($x)
	Assign("hit_count_" & $x, 0, 2)
	Assign("chit_count_" & $x, 0, 2)
	Assign("miss_count_" & $x, 0, 2)
	Assign("use_count_" & $x, 0, 2)
	Assign("totaldmg_" & $x, 0, 2)
	Assign("hit_ability_" & $x, 0, 2)
	Assign("chit_ability_" & $x, 0, 2)
	Assign("dmg_s_" & $x, 0, 2)
	Assign("dmg_pec_" & $x, 0, 2)
	Assign("skill_count_" & $x, 0, 2)
	Assign("broken_enhancer_" & $x, 0, 2)
	Assign("total_decay_" & $x, 0, 2)
	_update_GUI_weapon_stats($x)
EndFunc   ;==>reset_current_weapon

Func reset_history_weapon($x)
	Local $msgbox = MsgBox(4, "Reset History of " & Eval("weapon_name_" & $x) & "?", "Are you sure you want to Reset the History of " & Eval("weapon_name_" & $x) & "?" & @CRLF & "All data will be lost and not recoverable.", -1, $main_window)
	Switch $msgbox
		Case 6
			Assign("hit_count_history_" & $x, 0, 2)
			Assign("chit_count_history_" & $x, 0, 2)
			Assign("miss_count_history_" & $x, 0, 2)
			Assign("use_count_history_" & $x, 0, 2)
			Assign("totaldmg_history_" & $x, 0, 2)
			Assign("hit_ability_history_" & $x, 0, 2)
			Assign("chit_ability_history_" & $x, 0, 2)
			Assign("dmg_s_history_" & $x, 0, 2)
			Assign("dmg_pec_history_" & $x, 0, 2)
			Assign("skill_count_history_" & $x, 0, 2)
			Assign("broken_enhancer_history_" & $x, 0, 2)
			Assign("total_decay_history_" & $x, 0, 2)
			_update_GUI_weapon_stats_history($x)
		Case Else
			;;
	EndSwitch
EndFunc   ;==>reset_history_weapon
#endregion ; Weapon Math

#region ; Tool math

Func Tool_math($x)
	Assign("total_heal_" & $x, Eval("total_heal_" & $x) + $new, 2)
	Assign("total_heal_history_" & $x, Eval("total_heal_history_" & $x) + $new, 2)
	Assign("use_count_" & $x, Eval("use_count_" & $x) + 1, 2)
	Assign("use_count_history_" & $x, Eval("use_count_history_" & $x) + 1, 2)
	Assign("heals_s_" & $x, (Eval("total_heal_" & $x) / Eval("use_count_" & $x)) / (60 / Eval("tool_uses_" & $x)), 2)
	Assign("heals_s_history_" & $x, (Eval("total_heal_history_" & $x) / Eval("use_count_history_" & $x)) / (60 / Eval("tool_uses_" & $x)), 2)
	Assign("heals_pec_" & $x, (Eval("total_heal_" & $x) / Eval("use_count_" & $x)) / decay_tool($x), 2)
	Assign("heals_pec_history_" & $x, (Eval("total_heal_history_" & $x) / Eval("use_count_history_" & $x)) / decay_tool($x), 2)
	Assign("total_decay_" & $x, (Eval("use_count_" & $x) * (decay_tool($x) / 100)), 2)
	Assign("total_decay_history_" & $x, (Eval("total_decay_history_" & $x) + (decay_tool($x) / 100)), 2)
	Assign("skills_pec_" & $x, Round((Eval("use_count_" & $x) * decay_tool($x)) / Eval("skill_count_" & $x), 2), 2)
	Assign("skills_pec_history_" & $x, Round((Eval("use_count_history_" & $x) * decay_tool($x)) / Eval("skill_count_history_" & $x), 2), 2)
	Assign("total_decay_" & $x, (Eval("use_count_" & $x) * (decay_tool($x) / 10)), 2)
	Assign("total_decay_history_" & $x, (Eval("total_decay_history_" & $x) + (decay_tool($x) / 10)), 2)
EndFunc   ;==>Tool_math

Func reset_current_Tool($x)
	Assign("use_count_" & $x, 0, 2)
	Assign("total_heal_" & $x, 0, 2)
	Assign("heals_s_" & $x, 0, 2)
	Assign("heals_pec_" & $x, 0, 2)
	Assign("total_decay_" & $x, 0, 2)
	_update_GUI_Tool_stats($x)
EndFunc   ;==>reset_current_Tool

Func decay_tool($x)
	$decay_tool = (Eval("tool_decay_" & $x) * (Eval("tool_markup_" & $x) / 100)) + ((Eval("tool_decay_" & $x) * (Eval("tool_markup_" & $x) / 100)) * tool_enhancer_state($x))
	Return $decay_tool
EndFunc   ;==>decay_tool

Func tool_enhancer_state($x)
	$y = 0
	If Eval("heal_I_" & $x) = 1 Then
		$y += .05
	EndIf
	If Eval("heal_II_" & $x) = 1 Then
		$y += .05
	EndIf
	If Eval("heal_III_" & $x) = 1 Then
		$y += .05
	EndIf
	If Eval("heal_IV_" & $x) = 1 Then
		$y += .05
	EndIf
	If Eval("heal_V_" & $x) = 1 Then
		$y += .05
	EndIf
	If Eval("heal_VI_" & $x) = 1 Then
		$y += .05
	EndIf
	If Eval("heal_VII_" & $x) = 1 Then
		$y += .05
	EndIf
	If Eval("heal_VIII_" & $x) = 1 Then
		$y += .05
	EndIf
	If Eval("heal_IX_" & $x) = 1 Then
		$y += .05
	EndIf
	If Eval("heal_X_" & $x) = 1 Then
		$y += .05
	EndIf
	If Eval("economy_I_" & $x) = 1 Then
		$y -= .05
	EndIf
	If Eval("economy_II_" & $x) = 1 Then
		$y -= .05
	EndIf
	If Eval("economy_III_" & $x) = 1 Then
		$y -= .05
	EndIf
	If Eval("economy_IV_" & $x) = 1 Then
		$y -= .05
	EndIf
	If Eval("economy_V_" & $x) = 1 Then
		$y -= .05
	EndIf
	If Eval("economy_VI_" & $x) = 1 Then
		$y -= .05
	EndIf
	If Eval("economy_VII_" & $x) = 1 Then
		$y -= .05
	EndIf
	If Eval("economy_VIII_" & $x) = 1 Then
		$y -= .05
	EndIf
	If Eval("economy_IX_" & $x) = 1 Then
		$y -= .05
	EndIf
	If Eval("economy_X_" & $x) = 1 Then
		$y -= .05
	EndIf
	Return $y
EndFunc   ;==>tool_enhancer_state

#endregion ; Tool math

#region ; Skill Math
Func skills_item()
	Assign("skill_count_" & $current_item, Eval("skill_count_" & $current_item) + 1, 2)
	Assign("skill_count_history_" & $current_item, Eval("skill_count_history_" & $current_item) + 1, 2)
EndFunc   ;==>skills_item

Func reset_current_skills()
	$skill_count_agility = 0
	$skill_count_Health = 0
	$skill_count_intelligence = 0
	$skill_count_psyche = 0
	$skill_count_stamina = 0
	$skill_count_strength = 0
	$skill_count_Alertness = 0
	$skill_count_athletics = 0
	$skill_count_bravado = 0
	$skill_count_coolness = 0
	$skill_count_courage = 0
	$skill_count_dexterity = 0
	$skill_count_intuition = 0
	$skill_count_perception = 0
	$skill_count_quickness = 0
	$skill_count_serendipity = 0
	$skill_count_aim = 0
	$skill_count_clubs = 0
	$skill_count_combat_reflexes = 0
	$skill_count_combat_sense = 0
	$skill_count_commando = 0
	$skill_count_handgun = 0
	$skill_count_heavy_melee_weapons = 0
	$skill_count_heavy_weapons = 0
	$skill_count_inflict_melee_damage = 0
	$skill_count_inflict_ranged_damage = 0
	$skill_count_kill_strike = 0
	$skill_count_light_melee_weapons = 0
	$skill_count_longblades = 0
	$skill_count_marksmanship = 0
	$skill_count_martial_arts = 0
	$skill_count_melee_combat = 0
	$skill_count_melee_damage_assessment = 0
	$skill_count_power_fist = 0
	$skill_count_ranged_damage_assessment = 0
	$skill_count_rifle = 0
	$skill_count_shortblades = 0
	$skill_count_support_weapon_systems = 0
	$skill_count_weapons_handling = 0
	$skill_count_whip = 0
	$skill_count_wounding = 0
	$skill_count_anatomy = 0
	$skill_count_diagnosis = 0
	$skill_count_doctor = 0
	$skill_count_first_aid = 0
	$skill_count_medical_therapy = 0
	$skill_count_medicine = 0
	$skill_count_treatment = 0
	$skill_count_bioregenesis = 0
	$skill_count_concentration = 0
	$skill_count_cryogenics = 0
	$skill_count_electrokinesis = 0
	$skill_count_ethereal_soul_language = 0
	$skill_count_force_merge = 0
	$skill_count_jamming = 0
	$skill_count_mindforce_harmony = 0
	$skill_count_power_catalyst = 0
	$skill_count_pyrokinesis = 0
	$skill_count_sweat_gatherer = 0
	$skill_count_telepathy = 0
	$skill_count_translocation = 0
	$skill_count_avoidance = 0
	$skill_count_Dispense_Decoy = 0
	$skill_count_dodge = 0
	$skill_count_evade = 0
	_update_GUI_skills()
EndFunc   ;==>reset_current_skills
#endregion ; Skill Math
#region ; Enhancer Math
Func broken_enhancer($enhancer_name)
	$enhancer_count += 1
	$hunting_data = "Enhancer|Broken " & $enhancer_name
	Assign("broken_enhancer_" & StringRegExpReplace($enhancer_name, " ", "_"), Eval("broken_enhancer_" & StringRegExpReplace($enhancer_name, " ", "_")) + 1, 2) ; i.e. $broken_enhancer_Weapon_Accuracy_Enhancer_I
	Assign("broken_enhancer_history_" & StringRegExpReplace($enhancer_name, " ", "_"), Eval("broken_enhancer_history_" & StringRegExpReplace($enhancer_name, " ", "_")) + 1, 2) ; i.e. $broken_enhancer_history_Weapon_Accuracy_Enhancer_I
	Assign("broken_enhancer_" & $current_item, Eval("broken_enhancer_" & $current_item) + 1, 2) ; i.e. $broken_enhancer_w1
	Assign("broken_enhancer_history_" & $current_item, Eval("broken_enhancer_history_" & $current_item) + 1, 2) ; i.e. $broken_enhancer_history_w1
	Assign("broken_enhancer_" & StringRegExpReplace($enhancer_name, " ", "_") & "_" & $current_item, Eval("broken_enhancer_" & StringRegExpReplace($enhancer_name, " ", "_") & "_" & $current_item) + 1, 2); i.e. $broken_enhancer_Weapon_Accuracy_Enhancer_I_w1
	Assign("broken_enhancer_history_" & StringRegExpReplace($enhancer_name, " ", "_") & "_" & $current_item, Eval("broken_enhancer_history_" & StringRegExpReplace($enhancer_name, " ", "_") & "_" & $current_item) + 1, 2); i.e. $broken_enhancer_history_Weapon_Accuracy_Enhancer_I_w1
	_update_GUI_edits("yellow")
	If StringRegExp($current_item, "w") = 1 Then
		If Eval("weapon_history_" & $current_item) Then
			_update_GUI_weapon_stats_history($current_item)
		Else
			_update_GUI_weapon_stats($current_item)
		EndIf
	Else
		If Eval("tool_history_" & $current_item) Then
			_update_GUI_Tool_stats_history($current_item)
		Else
			_update_GUI_Tool_stats($current_item)
		EndIf
	EndIf
	broken_enhancer_cost($enhancer_name)
EndFunc   ;==>broken_enhancer

Func broken_enhancer_cost($enhancer_name)
	ConsoleWrite("broken_enhancer_cost" & @CRLF)
	Local $tier
	Local $accuracy = StringRegExp($enhancer_name, "accuracy", 0)
	Local $damage = StringRegExp($enhancer_name, "damage", 0)
	Local $weapon_economy = StringRegExp($enhancer_name, "weapon econ", 0)
	Local $range = StringRegExp($enhancer_name, "range", 0)
	Local $weapon_skill_modification = StringRegExp($enhancer_name, "weapon skill mod", 0)
	Local $heal_enhancer = StringRegExp($enhancer_name, "heal en", 0)
	Local $tool_economy = StringRegExp($enhancer_name, "tool econ", 0)
	Local $tool_skill_modification = StringRegExp("tool skill mod", 0)
	Select
		Case StringRegExp($enhancer_name, " I ", 0) = 1
			$tier = "I"
		Case StringRegExp($enhancer_name, " II ", 0) = 1
			$tier = "II"
		Case StringRegExp($enhancer_name, " III ", 0) = 1
			$tier = "III"
		Case StringRegExp($enhancer_name, " IV ", 0) = 1
			$tier = "IV"
		Case StringRegExp($enhancer_name, " V ", 0) = 1
			$tier = "V"
		Case StringRegExp($enhancer_name, " VI ", 0) = 1
			$tier = "VI"
		Case StringRegExp($enhancer_name, " VII ", 0) = 1
			$tier = "VII"
		Case StringRegExp($enhancer_name, " VIII ", 0) = 1
			$tier = "VIII"
		Case StringRegExp($enhancer_name, " IX ", 0) = 1
			$tier = "IX"
		Case StringRegExp($enhancer_name, " X ", 0) = 1
			$tier = "X"
	EndSelect
	Select
		Case $accuracy = 1
			Assign("total_decay_" & $current_item, Eval("total_decay_" & $current_item) + ((Eval("weapon_enhancer_" & $tier & "_markup_input") / 100) * 40), 2)
			Assign("total_decay_history_" & $current_item, Eval("total_decay_history_" & $current_item) + ((Eval("weapon_enhancer_" & $tier & "_markup_input") / 100) * 40), 2)
		Case $damage = 1
			Assign("total_decay_" & $current_item, Eval("total_decay_" & $current_item) + ((Eval("weapon_enhancer_" & $tier & "_markup_input") / 100) * 80), 2)
			Assign("total_decay_history_" & $current_item, Eval("total_decay__history" & $current_item) + ((Eval("weapon_enhancer_" & $tier & "_markup_input") / 100) * 80), 2)
		Case $weapon_economy = 1
			Assign("total_decay_" & $current_item, Eval("total_decay_" & $current_item) + ((Eval("weapon_enhancer_" & $tier & "_markup_input") / 100) * 100), 2)
			Assign("total_decay_history_" & $current_item, Eval("total_decay_history_" & $current_item) + ((Eval("weapon_enhancer_" & $tier & "_markup_input") / 100) * 100), 2)
		Case $range = 1
			Assign("total_decay_" & $current_item, Eval("total_decay_" & $current_item) + ((Eval("weapon_enhancer_" & $tier & "_markup_input") / 100) * 40), 2)
			Assign("total_decay_history_" & $current_item, Eval("total_decay_history_" & $current_item) + ((Eval("weapon_enhancer_" & $tier & "_markup_input") / 100) * 40), 2)
		Case $weapon_skill_modification = 1
			Assign("total_decay_" & $current_item, Eval("total_decay_" & $current_item) + ((Eval("weapon_enhancer_" & $tier & "_markup_input") / 100) * 60), 2)
			Assign("total_decay_history_" & $current_item, Eval("total_decay_history_" & $current_item) + ((Eval("weapon_enhancer_" & $tier & "_markup_input") / 100) * 60), 2)
		Case $heal_enhancer = 1
			Assign("total_decay_" & $current_item, Eval("total_decay_" & $current_item) + ((Eval("tool_enhancer_" & $tier & "_markup_input") / 100) * 40), 2)
			Assign("total_decay_history_" & $current_item, Eval("total_decay_history_" & $current_item) + ((Eval("tool_enhancer_" & $tier & "_markup_input") / 100) * 40), 2)
		Case $tool_economy = 1
			Assign("total_decay_" & $current_item, Eval("total_decay_" & $current_item) + ((Eval("tool_enhancer_" & $tier & "_markup_input") / 100) * 60), 2)
			Assign("total_decay_history_" & $current_item, Eval("total_decay_history_" & $current_item) + ((Eval("tool_enhancer_" & $tier & "_markup_input") / 100) * 60), 2)
		Case $tool_skill_modification = 1
			Assign("total_decay_" & $current_item, Eval("total_decay_" & $current_item) + ((Eval("tool_enhancer_" & $tier & "_markup_input") / 100) * 60), 2)
			Assign("total_decay_history_" & $current_item, Eval("total_decay_history_" & $current_item) + ((Eval("tool_enhancer_" & $tier & "_markup_input") / 100) * 60), 2)
	EndSelect
	_update_GUI_weapon_stats()
	_update_GUI_weapon_stats_history()
EndFunc   ;==>broken_enhancer_cost
#endregion ; Enhancer Math
#endregion ;~ Math
#region ;~ Date and time
Func month_long()
	$x = @MON
	$month = StringSplit("Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec", ",")
	Return $month[$x]
EndFunc   ;==>month_long

Func day_long()
	$x = @WDAY
	If ($x < 0) Or ($x > 7) Then Return "Error..."
	Local $day = StringSplit("Sun,Mon,Tue,Wed,Thu,Fri,Sat", ",")
	Return $day[$x]
EndFunc   ;==>day_long

Func date_stamp()
	$date_stamp = @MDAY & "-" & month_long() & "-" & @YEAR
	Return $date_stamp
EndFunc   ;==>date_stamp

Func time_stamp()
	$time_stamp = @HOUR & "-" & @MIN & "-" & @SEC
	Return $time_stamp
EndFunc   ;==>time_stamp
#endregion ;~ Date and time

#region ;~ Write
Func save_all_settings()
	write_history_weapons()
	write_history_Tools()
	write_history_skills()
	write_summary_history_file()
	write_settings_weapons()
	write_settings_Tools()
	write_general_settings()
EndFunc   ;==>save_all_settings

Func write_general_settings()
	If FileExists(@ScriptDir & "\config\Mainconfig.ini") Then
		read_settings_gui()
		FileOpen(@ScriptDir & "\config\Mainconfig.ini", 2)
		$mainconfig = @ScriptDir & "\config\Mainconfig.ini"
		IniWrite($mainconfig, "Main Settings", "Chat.log", $chatloglocation)
		IniWrite($mainconfig, "Main Settings", "Min to Tray", $min_tray_setting)
		IniWrite($mainconfig, "Warning Sound", "Enabled", $Warning_sound)
		IniWrite($mainconfig, "Warning Sound", "Volume", $warning_sound_volume)
		IniWrite($mainconfig, "Warning Sound", "File", $Warning_sound_file)
		IniWrite($mainconfig, "Weapon Profiles", "Weapon 1", $weapon_file_w1)
		IniWrite($mainconfig, "Weapon Profiles", "Weapon 2", $weapon_file_w2)
		IniWrite($mainconfig, "Weapon Profiles", "Weapon 3", $weapon_file_w3)
		IniWrite($mainconfig, "Weapon Profiles", "Weapon 4", $weapon_file_w4)
		IniWrite($mainconfig, "Weapon Profiles", "Weapon 5", $weapon_file_w5)
		IniWrite($mainconfig, "Weapon Profiles", "Weapon 6", $weapon_file_w6)
		IniWrite($mainconfig, "Tool Profiles", "Tool 1", $Tool_file_f1)
		IniWrite($mainconfig, "Tool Profiles", "Tool 2", $Tool_file_f2)
		IniWrite($mainconfig, "Tool Profiles", "Tool 3", $Tool_file_f3)
		IniWrite($mainconfig, "History", "summary", @ScriptDir & "\statistics\summary.ini")
		IniWrite($mainconfig, "History", "Skills", @ScriptDir & "\statistics\skills.ini")
		IniWrite($mainconfig, "Global Capture", "Capture Avatar", $enable_global_capture_avatar)
		IniWrite($mainconfig, "Global Capture", "Avatar Name", $avatar_name)
		IniWrite($mainconfig, "Global Capture", "Capture Team", $enable_global_capture_team)
		IniWrite($mainconfig, "Global Capture", "Team Name", $team_name)
		IniWrite($mainconfig, "Global Capture", "Save Folder", $capture_folder)
		IniWrite($mainconfig, "Global Capture", "Delay", $capture_delay)
		IniWrite($mainconfig, "Global Capture", "Folder Structure", $folder_structure)
		IniWrite($mainconfig, "Global Capture", "BMP", $image_type_bmp)
		IniWrite($mainconfig, "Global Capture", "JPEG", $image_type_jpeg)
		IniWrite($mainconfig, "Global Capture", "JPEG Quality", $jpeg_quality)
		IniWrite($mainconfig, "Global Capture", "Hunting Capture Globals", $enable_hunting_globals)
		IniWrite($mainconfig, "Global Capture", "Hunting Capture Hofs", $enable_hunting_hof)
		IniWrite($mainconfig, "Global Capture", "Mining Capture Globals", $enable_mining_globals)
		IniWrite($mainconfig, "Global Capture", "Mining Capture Hofs", $enable_mining_hof)
		IniWrite($mainconfig, "Global Capture", "Crafting Capture Globals", $enable_crafting_globals)
		IniWrite($mainconfig, "Global Capture", "Crafting Capture Hofs", $enable_crafting_hof)
		IniWrite($mainconfig, "Global Capture", "Enabled position", $enable_position)
		IniWrite($mainconfig, "Global Capture", "position Key", $position_key)
		IniWrite($mainconfig, "Global Capture", "Enabled Time Stamp", $enable_time_stamp)
		IniWrite($mainconfig, "Global Capture", "Time Stamp Key", $time_stamp_key)
	Else
		install()
		read_general_settings()
	EndIf
	FileClose(@ScriptDir & "\config\Mainconfig.ini")
EndFunc   ;==>write_general_settings

Func folder_create($x)
	FileOpen($x & "\0.file", 10)
	FileClose($x & "\0.file")
	FileDelete($x & "\0.file")
EndFunc   ;==>folder_create

Func install()
	$statsfolder = @ScriptDir & "\statistics"
	$global_folder = @ScriptDir & "\global capture"
	$tools_folder = @ScriptDir & "\tool profiles"
	$weapons_folder = @ScriptDir & "\weapon profiles"
	$mainconfig = @ScriptDir & "\config\Mainconfig.ini"
	Select
		Case FileExists($statsfolder) = False
			folder_create($statsfolder)
		Case FileExists($global_folder) = False
			folder_create($global_folder)
		Case FileExists($tools_folder) = False
			folder_create($tools_folder)
		Case FileExists($weapons_folder) = False
			folder_create($weapons_folder)
		Case FileExists($mainconfig) = False
			FileOpen(@ScriptDir & "\config\Mainconfig.ini", 10)
			IniWrite($mainconfig, "Main Settings", "Chat.log", @UserProfileDir & "\documents\Entropia Universe\chat.log")
			IniWrite($mainconfig, "Weapon Profiles", "Weapon 1", "<none>")
			IniWrite($mainconfig, "Weapon Profiles", "Weapon 2", "<none>")
			IniWrite($mainconfig, "Weapon Profiles", "Weapon 3", "<none>")
			IniWrite($mainconfig, "Weapon Profiles", "Weapon 4", "<none>")
			IniWrite($mainconfig, "Weapon Profiles", "Weapon 5", "<none>")
			IniWrite($mainconfig, "Weapon Profiles", "Weapon 6", "<none>")
			IniWrite($mainconfig, "Tool Profiles", "Tool 1", "<none>")
			IniWrite($mainconfig, "Tool Profiles", "Tool 2", "<none>")
			IniWrite($mainconfig, "Tool Profiles", "Tool 3", "<none>")
			IniWrite($mainconfig, "History", "summary", @ScriptDir & "\statistics\summary.ini")
			IniWrite($mainconfig, "History", "Skills", @ScriptDir & "\statistics\skills.ini")
			IniWrite($mainconfig, "Global Capture", "Capture Avatar", $enable_global_capture_avatar)
			IniWrite($mainconfig, "Global Capture", "Avatar Name", $avatar_name)
			IniWrite($mainconfig, "Global Capture", "Capture Team", $enable_global_capture_team)
			IniWrite($mainconfig, "Global Capture", "Team Name", $team_name)
			IniWrite($mainconfig, "Global Capture", "Save Folder", $capture_folder)
			IniWrite($mainconfig, "Global Capture", "Delay", $capture_delay)
			IniWrite($mainconfig, "Global Capture", "Folder Structure", $folder_structure)
			IniWrite($mainconfig, "Global Capture", "BMP", $image_type_bmp)
			IniWrite($mainconfig, "Global Capture", "JPEG", $image_type_jpeg)
			IniWrite($mainconfig, "Global Capture", "JPEG Quality", $jpeg_quality)
			IniWrite($mainconfig, "Global Capture", "Hunting Capture Globals", $enable_hunting_globals)
			IniWrite($mainconfig, "Global Capture", "Hunting Capture Hofs", $enable_hunting_hof)
			IniWrite($mainconfig, "Global Capture", "Mining Capture Globals", $enable_mining_globals)
			IniWrite($mainconfig, "Global Capture", "Mining Capture Hofs", $enable_mining_hof)
			IniWrite($mainconfig, "Global Capture", "Crafting Capture Globals", $enable_crafting_globals)
			IniWrite($mainconfig, "Global Capture", "Crafting Capture Hofs", $enable_crafting_hof)
			IniWrite($mainconfig, "Global Capture", "Enabled position", $enable_position)
			IniWrite($mainconfig, "Global Capture", "position Key", $position_key)
			IniWrite($mainconfig, "Global Capture", "Enabled Time Stamp", $enable_time_stamp)
			IniWrite($mainconfig, "Global Capture", "Time Stamp Key", $time_stamp_key)
			FileClose(@ScriptDir & "\config\Mainconfig.ini")
		Case FileExists(@ScriptDir & "\update.exe") = False
			InetGet($url & "update.exe", @ScriptDir & "\update.exe", 1, 1)
		Case FileExists(@ScriptDir & "\change_log.txt") = False
			InetGet($url & "change_log.txt", @ScriptDir & "\change_log.txt", 1, 1)
	EndSelect
	FileOpen($filever_location, 2)
	FileWrite($filever_location, $version)
	FileClose($filever_location)
EndFunc   ;==>install

Func write_summary_history_file()
	If FileExists(@ScriptDir & "\statistics\summary.ini") Then
		$summary_file = @ScriptDir & "\statistics\summary.ini"
		FileOpen($summary_file, 2)
		write_summary_history()
	Else
		$summary_file = @ScriptDir & "\statistics\summary.ini"
		FileOpen($summary_file, 10)
		write_summary_history()
	EndIf
EndFunc   ;==>write_summary_history_file

Func write_summary_history()
	IniWrite($summary_file, "Damage Out", "Total Hits", $hit_count_history)
	IniWrite($summary_file, "Damage Out", "Total Critical Hits", $chit_count_history)
	IniWrite($summary_file, "Damage Out", "Miss Count", $miss_count_history)
	IniWrite($summary_file, "Damage Out", "Uses Count", $use_count_history)
	IniWrite($summary_file, "Damage Out", "Total Damage", $totaldmg_history)
	IniWrite($summary_file, "Damage Out", "Hit Ability", $hit_ability_history)
	IniWrite($summary_file, "Damage Out", "Critical Hit Ability", $chit_ability_history)
	IniWrite($summary_file, "Damage In", "Total Hits", $hit_in_count_history)
	IniWrite($summary_file, "Damage In", "Total Critical Hits", $chit_in_count_history)
	IniWrite($summary_file, "Damage In", "Total Damage", $totaldmg_in_history)
	IniWrite($summary_file, "Misc", "Total Tool Uses", $Tool_use_count_history)
	IniWrite($summary_file, "Misc", "Total Skill Points Gained", $skill_count_history)
	IniWrite($summary_file, "Misc", "Total Mobs without loot", $noloot_count_history)
EndFunc   ;==>write_summary_history

Func write_settings_weapons()
	For $i = 1 To 6
		write_settings_weapon("w" & $i)
	Next
EndFunc   ;==>write_settings_weapons

Func write_settings_weapon($x)
	If FileExists(@ScriptDir & "\weapon profiles\" & Eval("weapon_name_" & $x) & ".ini") Then
		Assign("weapon_file_" & $x, @ScriptDir & "\weapon profiles\" & Eval("weapon_name_" & $x) & ".ini", 2)
		FileOpen(Eval("weapon_file_" & $x), 2)
		write_weapon($x)
	ElseIf Eval("weapon_name_" & $x) = "" Then
;~ do nothing
	Else
		Assign("weapon_file_" & $x, @ScriptDir & "\weapon profiles\" & Eval("weapon_name_" & $x) & ".ini", 2)
		FileOpen(Eval("weapon_file_" & $x), 10)
		write_weapon($x)
	EndIf
EndFunc   ;==>write_settings_weapon

Func write_weapon($x)
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Weapon_Name", Eval("weapon_name_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Weapon Attacks", Eval("weapon_attacks_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Weapon Ammo", Eval("weapon_ammo_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Weapon Decay", Eval("weapon_decay_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Weapon Mark Up", Eval("weapon_markup_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Amp Decay", Eval("amp_decay_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Amp Ammo", Eval("amp_ammo_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Amp Mark Up", Eval("amp_markup_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Weapon_Key", Eval("weapon_key_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Weapon_HexKey", Eval("weapon_key_hex_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "accuracy I", Eval("accuracy_I_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "accuracy II", Eval("accuracy_II_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "accuracy III", Eval("accuracy_III_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "accuracy IV", Eval("accuracy_IV_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "accuracy V", Eval("accuracy_V_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "accuracy VI", Eval("accuracy_VI_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "accuracy VII", Eval("accuracy_VII_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "accuracy VIII", Eval("accuracy_VIII_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "accuracy IX", Eval("accuracy_IX_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "accuracy X", Eval("accuracy_X_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "damage I", Eval("damage_I_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "damage II", Eval("damage_II_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "damage III", Eval("damage_III_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "damage IV", Eval("damage_IV_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "damage V", Eval("damage_V_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "damage VI", Eval("damage_VI_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "damage VII", Eval("damage_VII_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "damage VIII", Eval("damage_VIII_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "damage IX", Eval("damage_IX_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "damage X", Eval("damage_X_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "economy I", Eval("economy_I_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "economy II", Eval("economy_II_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "economy III", Eval("economy_III_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "economy IV", Eval("economy_IV_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "economy V", Eval("economy_V_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "economy VI", Eval("economy_VI_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "economy VII", Eval("economy_VII_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "economy VIII", Eval("economy_VIII_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "economy IX", Eval("economy_IX_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "economy X", Eval("economy_X_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "range I", Eval("range_I_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "range II", Eval("range_II_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "range III", Eval("range_III_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "range IV", Eval("range_IV_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "range V", Eval("range_V_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "range VI", Eval("range_VI_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "range VII", Eval("range_VII_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "range VIII", Eval("range_VIII_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "range IX", Eval("range_IX_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "range X", Eval("range_X_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "skill modification I", Eval("skill_modification_I_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "skill modification II", Eval("skill_modification_II_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "skill modification III", Eval("skill_modification_III_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "skill modification IV", Eval("skill_modification_IV_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "skill modification V", Eval("skill_modification_V_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "skill modification VI", Eval("skill_modification_VI_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "skill modification VII", Eval("skill_modification_VII_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "skill modification VIII", Eval("skill_modification_VIII_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "skill modification IX", Eval("skill_modification_IX_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "skill modification X", Eval("skill_modification_X_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Enhancer I Mark Up", Eval("enhancer_I_markup_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Enhancer II Mark Up", Eval("enhancer_II_markup_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Enhancer III Mark Up", Eval("enhancer_III_markup_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Enhancer IV Mark Up", Eval("enhancer_IV_markup_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Enhancer V Mark Up", Eval("enhancer_V_markup_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Enhancer VI Mark Up", Eval("enhancer_VI_markup_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Enhancer VII Mark Up", Eval("enhancer_VII_markup_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Enhancer VIII Mark Up", Eval("enhancer_VIII_markup_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Enhancer IX Mark Up", Eval("enhancer_IX_markup_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "Settings", "Enhancer X Mark Up", Eval("enhancer_X_markup_" & $x))
	IniWrite(Eval("weapon_file_" & $x), "History", "File", Eval("history_weapon_file_" & $x))
EndFunc   ;==>write_weapon

Func write_history_weapons()
	For $i = 1 To 6
		write_history_weapon_file("w" & $i)
	Next
EndFunc   ;==>write_history_weapons

Func write_history_weapon_file($x)
	If FileExists(Eval("history_weapon_file_" & $x)) Then
		FileOpen(Eval("history_weapon_file_" & $x), 2)
		write_history_weapon($x)
	ElseIf Eval("weapon_name_" & $x) = "" Then
;~ do nothing
	Else
		Assign("history_weapon_file_" & $x, @ScriptDir & "\statistics\weapons\" & "History " & Eval("weapon_name_" & $x) & ".ini", 2)
		FileOpen(Eval("history_weapon_file_" & $x), 10)
		write_history_weapon($x)
	EndIf
EndFunc   ;==>write_history_weapon_file


Func write_history_weapon($x)
	IniWrite(Eval("history_weapon_file_" & $x), "History", "Hit Count", Eval("hit_count_history_" & $x))
	IniWrite(Eval("history_weapon_file_" & $x), "History", "Crit Hit Count", Eval("chit_count_history_" & $x))
	IniWrite(Eval("history_weapon_file_" & $x), "History", "Miss Count", Eval("miss_count_history_" & $x))
	IniWrite(Eval("history_weapon_file_" & $x), "History", "Use Count", Eval("use_count_history_" & $x))
	IniWrite(Eval("history_weapon_file_" & $x), "History", "Total Damage", Eval("totaldmg_history_" & $x))
	IniWrite(Eval("history_weapon_file_" & $x), "History", "Total Decay", Eval("total_decay_history_" & $x))
	IniWrite(Eval("history_weapon_file_" & $x), "Enhancers", "Total Broken Enhancers", Eval("broken_enhancer_history_" & $x))
	IniWrite(Eval("history_weapon_file_" & $x), "Skills", "Total Skills", Eval("skill_count_history_" & $x))
EndFunc   ;==>write_history_weapon

Func write_settings_Tools()
	For $i = 1 To 3
		write_settings_Tool("f" & $i)
	Next
EndFunc   ;==>write_settings_Tools

Func write_settings_Tool($x)
	If FileExists(@ScriptDir & "\Tool profiles\" & Eval("Tool_name_" & $x) & ".ini") Then
		Assign("Tool_file_" & $x, @ScriptDir & "\tool profiles\" & Eval("Tool_name_" & $x) & ".ini", 2)
		FileOpen(Eval("Tool_file_" & $x), 2)
		write_Tool($x)
	ElseIf Eval("Tool_name_" & $x) = "" Then
;~ do nothing
	Else
		Assign("Tool_file_" & $x, @ScriptDir & "\tool profiles\" & Eval("Tool_name_" & $x) & ".ini", 2)
		FileOpen(Eval("Tool_file_" & $x), 10)
		write_Tool($x)
	EndIf
EndFunc   ;==>write_settings_Tool

Func write_Tool($x)
	IniWrite(Eval("tool_file_" & $x), "Settings", "Tool_Name", Eval("tool_name_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "Uses", Eval("tool_uses_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "Decay", Eval("tool_decay_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "Mark Up", Eval("tool_markup_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "heal_I", Eval("heal_I_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "heal_II", Eval("heal_II_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "heal_III", Eval("heal_III_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "heal_IV", Eval("heal_IV_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "heal_V", Eval("heal_V_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "heal_VI", Eval("heal_VI_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "heal_VII", Eval("heal_VII_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "heal_VIII", Eval("heal_VIII_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "heal_IX", Eval("heal_IX_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "heal_X", Eval("heal_X_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "economy_I", Eval("economy_I_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "economy_II", Eval("economy_II_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "economy_III", Eval("economy_III_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "economy_IV", Eval("economy_IV_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "economy_V", Eval("economy_V_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "economy_VI", Eval("economy_VI_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "economy_VII", Eval("economy_VII_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "economy_VIII", Eval("economy_VIII_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "economy_IX", Eval("economy_IX_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "economy_X", Eval("economy_X_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "skill_modification_I", Eval("skill_modification_I_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "skill_modification_II", Eval("skill_modification_II_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "skill_modification_III", Eval("skill_modification_III_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "skill_modification_IV", Eval("skill_modification_IV_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "skill_modification_V", Eval("skill_modification_V_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "skill_modification_VI", Eval("skill_modification_VI_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "skill_modification_VII", Eval("skill_modification_VII_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "skill_modification_VIII", Eval("skill_modification_VIII_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "skill_modification_IX", Eval("skill_modification_IX_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "skill_modification_X", Eval("skill_modification_X_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "Tool_key", Eval("tool_key_" & $x))
	IniWrite(Eval("tool_file_" & $x), "Settings", "Tool_HexKey", Eval("tool_key_hex_" & $x))
	IniWrite(Eval("tool_file_" & $x), "History", "File", Eval("history_tool_file_" & $x))
EndFunc   ;==>write_Tool

Func write_history_Tools()
	For $i = 1 To 3
		write_history_Tool_file("f" & $i)
	Next
EndFunc   ;==>write_history_Tools

Func write_history_Tool_file($x)
	If FileExists(Eval("history_tool_file_" & $x)) Then
		FileOpen(Eval("history_Tool_file_" & $x), 2)
		write_history_Tool($x)
	ElseIf Eval("Tool_name_" & $x) = "" Then
;~ do nothing
	Else
		Assign("history_Tool_file_" & $x, @ScriptDir & "\statistics\Tools\" & "History " & Eval("Tool_name_" & $x) & ".ini", 2)
		FileOpen(Eval("history_Tool_file_" & $x), 10)
		write_history_Tool($x)
	EndIf
EndFunc   ;==>write_history_Tool_file

Func write_history_Tool($x)
	IniWrite(Eval("history_Tool_file_" & $x), "History", "Use Count", Eval("use_count_history_" & $x))
	IniWrite(Eval("history_Tool_file_" & $x), "History", "Total Heal", Eval("total_heal_history_" & $x))
	IniWrite(Eval("history_Tool_file_" & $x), "History", "Total Decay", Eval("total_decay_history_" & $x))
	IniWrite(Eval("history_Tool_file_" & $x), "Enhancers", "Total Broken Enhancers", Eval("broken_enhancer_history_" & $x))
	IniWrite(Eval("history_Tool_file_" & $x), "Skills", "Total Skill Count", Eval("skill_count_history_" & $x))
EndFunc   ;==>write_history_Tool


Func write_history_skills()
	If FileExists(@ScriptDir & "\statistics\skills.ini") Then
		$skills_file = @ScriptDir & "\statistics\skills.ini"
		FileOpen($skills_file, 2)
		write_history_skill()
	Else
		$skills_file = @ScriptDir & "\statistics\skills.ini"
		FileOpen($skills_file, 10)
		write_history_skill()
	EndIf
EndFunc   ;==>write_history_skills

Func write_history_skill()
	IniWrite($skills_file, "Attributes", "Agility", $skill_count_history_Agility)
	IniWrite($skills_file, "Attributes", "Health", $skill_count_history_Health)
	IniWrite($skills_file, "Attributes", "Intelligence", $skill_count_history_Intelligence)
	IniWrite($skills_file, "Attributes", "Psyche", $skill_count_history_Psyche)
	IniWrite($skills_file, "Attributes", "Stamina", $skill_count_history_Stamina)
	IniWrite($skills_file, "Attributes", "Strength", $skill_count_history_Strength)
	IniWrite($skills_file, "General", "Alertness", $skill_count_history_Alertness)
	IniWrite($skills_file, "General", "Athletics", $skill_count_history_Athletics)
	IniWrite($skills_file, "General", "Bravado", $skill_count_history_Bravado)
	IniWrite($skills_file, "General", "Coolness", $skill_count_history_Coolness)
	IniWrite($skills_file, "General", "Courage", $skill_count_history_Courage)
	IniWrite($skills_file, "General", "Dexterity", $skill_count_history_Dexterity)
	IniWrite($skills_file, "General", "Intuition", $skill_count_history_Intuition)
	IniWrite($skills_file, "General", "Perception", $skill_count_history_Perception)
	IniWrite($skills_file, "General", "Quickness", $skill_count_history_Quickness)
	IniWrite($skills_file, "General", "Serendipity", $skill_count_history_Serendipity)
	IniWrite($skills_file, "Combat", "Aim", $skill_count_history_Aim)
	IniWrite($skills_file, "Combat", "Clubs", $skill_count_history_Clubs)
	IniWrite($skills_file, "Combat", "Combat_Reflexes", $skill_count_history_Combat_Reflexes)
	IniWrite($skills_file, "Combat", "Combat_Sense", $skill_count_history_Combat_Sense)
	IniWrite($skills_file, "Combat", "Commando", $skill_count_history_Commando)
	IniWrite($skills_file, "Combat", "Handgun", $skill_count_history_Handgun)
	IniWrite($skills_file, "Combat", "Heavy_Melee_Weapons", $skill_count_history_Heavy_Melee_Weapons)
	IniWrite($skills_file, "Combat", "Heavy_Weapons", $skill_count_history_Heavy_Weapons)
	IniWrite($skills_file, "Combat", "Inflict_Melee_Damage", $skill_count_history_Inflict_Melee_Damage)
	IniWrite($skills_file, "Combat", "Inflict_Ranged_Damage", $skill_count_history_Inflict_Ranged_Damage)
	IniWrite($skills_file, "Combat", "Kill_Strike", $skill_count_history_Kill_Strike)
	IniWrite($skills_file, "Combat", "Light_Melee_Weapons", $skill_count_history_Light_Melee_Weapons)
	IniWrite($skills_file, "Combat", "Longblades", $skill_count_history_Longblades)
	IniWrite($skills_file, "Combat", "Marksmanship", $skill_count_history_Marksmanship)
	IniWrite($skills_file, "Combat", "Martial_Arts", $skill_count_history_Martial_Arts)
	IniWrite($skills_file, "Combat", "Melee_Combat", $skill_count_history_Melee_Combat)
	IniWrite($skills_file, "Combat", "Melee_Damage_Assessment", $skill_count_history_Melee_Damage_Assessment)
	IniWrite($skills_file, "Combat", "Power_Fist", $skill_count_history_Power_Fist)
	IniWrite($skills_file, "Combat", "Ranged_Damage_Assessment", $skill_count_history_Ranged_Damage_Assessment)
	IniWrite($skills_file, "Combat", "Rifle", $skill_count_history_Rifle)
	IniWrite($skills_file, "Combat", "Shortblades", $skill_count_history_Shortblades)
	IniWrite($skills_file, "Combat", "Support_Weapon_Systems", $skill_count_history_Support_Weapon_Systems)
	IniWrite($skills_file, "Combat", "Weapons_Handling", $skill_count_history_Weapons_Handling)
	IniWrite($skills_file, "Combat", "Whip", $skill_count_history_Whip)
	IniWrite($skills_file, "Combat", "Wounding", $skill_count_history_Wounding)
	IniWrite($skills_file, "Medical", "Anatomy", $skill_count_history_Anatomy)
	IniWrite($skills_file, "Medical", "Diagnosis", $skill_count_history_Diagnosis)
	IniWrite($skills_file, "Medical", "Doctor", $skill_count_history_Doctor)
	IniWrite($skills_file, "Medical", "First_Aid", $skill_count_history_First_Aid)
	IniWrite($skills_file, "Medical", "Medical_Therapy", $skill_count_history_Medical_Therapy)
	IniWrite($skills_file, "Medical", "Medicine", $skill_count_history_Medicine)
	IniWrite($skills_file, "Medical", "Treatment", $skill_count_history_Treatment)
	IniWrite($skills_file, "Mindforce", "Bioregenesis", $skill_count_history_Bioregenesis)
	IniWrite($skills_file, "Mindforce", "Concentration", $skill_count_history_Concentration)
	IniWrite($skills_file, "Mindforce", "Cryogenics", $skill_count_history_Cryogenics)
	IniWrite($skills_file, "Mindforce", "Electrokinesis", $skill_count_history_Electrokinesis)
	IniWrite($skills_file, "Mindforce", "Ethereal_Soul_Language", $skill_count_history_Ethereal_Soul_Language)
	IniWrite($skills_file, "Mindforce", "Force_Merge", $skill_count_history_Force_Merge)
	IniWrite($skills_file, "Mindforce", "Jamming", $skill_count_history_Jamming)
	IniWrite($skills_file, "Mindforce", "Mindforce_Harmony", $skill_count_history_Mindforce_Harmony)
	IniWrite($skills_file, "Mindforce", "Power_Catalyst", $skill_count_history_Power_Catalyst)
	IniWrite($skills_file, "Mindforce", "Pyrokinesis", $skill_count_history_Pyrokinesis)
	IniWrite($skills_file, "Mindforce", "Sweat_Gatherer", $skill_count_history_Sweat_Gatherer)
	IniWrite($skills_file, "Mindforce", "Telepathy", $skill_count_history_Telepathy)
	IniWrite($skills_file, "Mindforce", "Translocation", $skill_count_history_Translocation)
	IniWrite($skills_file, "Defense", "Avoidance", $skill_count_history_Avoidance)
	IniWrite($skills_file, "Defense", "Dispense_Decoy", $skill_count_history_Dispense_Decoy)
	IniWrite($skills_file, "Defense", "Dodge", $skill_count_history_Dodge)
	IniWrite($skills_file, "Defense", "Evade", $skill_count_history_Evade)
EndFunc   ;==>write_history_skill

#endregion ;~ Write

#region ;~ Read

Func read_all_settings()
	read_general_settings()
	read_settings_weapons()
	read_settings_Tools()
EndFunc   ;==>read_all_settings

Func read_all_files()
	read_general_settings()
	read_settings_weapons()
	read_settings_Tools()
	read_history_weapons()
	read_history_Tools()
	read_history_skills()
	read_summary_history()
EndFunc   ;==>read_all_files
Func read_general_settings()
	If FileExists(@ScriptDir & "\config\Mainconfig.ini") Then
		$mainconfig = @ScriptDir & "\config\Mainconfig.ini"
		$chatloglocation = IniRead($mainconfig, "Main Settings", "chat.log", "")
		$min_tray_setting = IniRead($mainconfig, "Main Settings", "Min to Tray", "")
		$Warning_sound = IniRead($mainconfig, "Warning Sound", "Enabled", "")
		$warning_sound_volume = IniRead($mainconfig, "Warning Sound", "Volume", "")
		$Warning_sound_file = IniRead($mainconfig, "Warning Sound", "File", "")
		$weapon_file_w1 = IniRead($mainconfig, "Weapon Profiles", "Weapon 1", "")
		$weapon_file_w2 = IniRead($mainconfig, "Weapon Profiles", "Weapon 2", "")
		$weapon_file_w3 = IniRead($mainconfig, "Weapon Profiles", "Weapon 3", "")
		$weapon_file_w4 = IniRead($mainconfig, "Weapon Profiles", "Weapon 4", "")
		$weapon_file_w5 = IniRead($mainconfig, "Weapon Profiles", "Weapon 5", "")
		$weapon_file_w6 = IniRead($mainconfig, "Weapon Profiles", "Weapon 6", "")
		$Tool_file_f1 = IniRead($mainconfig, "Tool Profiles", "Tool 1", "")
		$Tool_file_f2 = IniRead($mainconfig, "Tool Profiles", "Tool 2", "")
		$Tool_file_f3 = IniRead($mainconfig, "Tool Profiles", "Tool 3", "")
		$summary_file = IniRead($mainconfig, "History", "summary", @ScriptDir & "\statistics\summary.ini")
		$skills_file = IniRead($mainconfig, "History", "Skills", @ScriptDir & "\statistics\skills.ini")
		$enable_global_capture_avatar = IniRead($mainconfig, "Global Capture", "Capture Avatar", "")
		$avatar_name = IniRead($mainconfig, "Global Capture", "Avatar Name", "")
		$enable_global_capture_team = IniRead($mainconfig, "Global Capture", "Capture Team", "")
		$team_name = IniRead($mainconfig, "Global Capture", "Team Name", "")
		$capture_folder = IniRead($mainconfig, "Global Capture", "Save Folder", @ScriptDir & "\global capture")
		$capture_delay = IniRead($mainconfig, "Global Capture", "Delay", "500")
		$folder_structure = IniRead($mainconfig, "Global Capture", "Folder Structure", "[M]-[Y]\[D]-[d]\[Type]")
		$image_type_bmp = IniRead($mainconfig, "Global Capture", "BMP", "")
		$image_type_jpeg = IniRead($mainconfig, "Global Capture", "JPEG", "")
		$jpeg_quality = IniRead($mainconfig, "Global Capture", "JPEG Quality", 50)
		$enable_hunting_globals = IniRead($mainconfig, "Global Capture", "Hunting Capture Globals", 1)
		$enable_hunting_hof = IniRead($mainconfig, "Global Capture", "Hunting Capture Hofs", 1)
		$enable_mining_globals = IniRead($mainconfig, "Global Capture", "Mining Capture Globals", 1)
		$enable_mining_hof = IniRead($mainconfig, "Global Capture", "Mining Capture Hofs", 1)
		$enable_crafting_globals = IniRead($mainconfig, "Global Capture", "Crafting Capture Globals", 1)
		$enable_crafting_hof = IniRead($mainconfig, "Global Capture", "Crafting Capture Hofs", 1)
		$enable_position = IniRead($mainconfig, "Global Capture", "Enabled position", "")
		$position_key = IniRead($mainconfig, "Global Capture", "position Key", "<none>")
		$enable_time_stamp = IniRead($mainconfig, "Global Capture", "Enabled Time Stamp", "")
		$time_stamp_key = IniRead($mainconfig, "Global Capture", "Time Stamp Key", "<none>")
		update_settings_gui_general_settings_tab()
		update_settings_gui_global_capture()
	Else
		write_general_settings()
	EndIf
EndFunc   ;==>read_general_settings

Func read_summary_history()
	$hit_count_history = IniRead($summary_file, "Damage Out", "Total Hits", 0)
	$chit_count_history = IniRead($summary_file, "Damage Out", "Total Critical Hits", 0)
	$miss_count_history = IniRead($summary_file, "Damage Out", "Miss Count", 0)
	$use_count_history = IniRead($summary_file, "Damage Out", "Uses Count", 0)
	$totaldmg_history = IniRead($summary_file, "Damage Out", "Total Damage", 0)
	$hit_ability_history = IniRead($summary_file, "Damage Out", "Hit Ability", 0)
	$chit_ability_history = IniRead($summary_file, "Damage Out", "Critical Hit Ability", 0)
	$hit_in_count_history = IniRead($summary_file, "Damage In", "Total Hits", 0)
	$chit_in_count_history = IniRead($summary_file, "Damage In", "Total Critical Hits", 0)
	$totaldmg_in_history = IniRead($summary_file, "Damage In", "Total Damage", 0)
	$Tool_use_count_history = IniRead($summary_file, "Misc", "Total Tool Uses", 0)
	$skill_count_history = IniRead($summary_file, "Misc", "Total Skill Points Gained", 0)
	$noloot_count_history = IniRead($summary_file, "Misc", "Total Mobs without loot", 0)
EndFunc   ;==>read_summary_history

Func read_settings_weapons()
	For $i = 1 To 6
		read_settings_weapon("w" & $i)
	Next
EndFunc   ;==>read_settings_weapons

Func read_settings_weapon($x)
	Assign("weapon_name_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Weapon_Name", ""), 2)
	Assign("weapon_attacks_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Weapon Attacks", ""), 2)
	Assign("weapon_ammo_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Weapon Ammo", ""), 2)
	Assign("weapon_decay_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Weapon Decay", ""), 2)
	Assign("weapon_markup_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Weapon Mark Up", ""), 2)
	Assign("amp_decay_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Amp Decay", ""), 2)
	Assign("amp_ammo_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Amp Ammo", ""), 2)
	Assign("amp_markup_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Amp Mark Up", ""), 2)
	Assign("weapon_key_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Weapon_Key", ""), 2)
	Assign("weapon_key_hex_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Weapon_HexKey", ""), 2)
	Assign("accuracy_I_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "accuracy I", ""), 2)
	Assign("accuracy_II_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "accuracy II", ""), 2)
	Assign("accuracy_III_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "accuracy III", ""), 2)
	Assign("accuracy_IV_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "accuracy IV", ""), 2)
	Assign("accuracy_V_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "accuracy V", ""), 2)
	Assign("accuracy_VI_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "accuracy VI", ""), 2)
	Assign("accuracy_VII_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "accuracy VII", ""), 2)
	Assign("accuracy_VIII_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "accuracy VIII", ""), 2)
	Assign("accuracy_IX_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "accuracy IX", ""), 2)
	Assign("accuracy_X_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "accuracy X", ""), 2)
	Assign("damage_I_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "damage I", ""), 2)
	Assign("damage_II_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "damage II", ""), 2)
	Assign("damage_III_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "damage III", ""), 2)
	Assign("damage_IV_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "damage IV", ""), 2)
	Assign("damage_V_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "damage V", ""), 2)
	Assign("damage_VI_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "damage VI", ""), 2)
	Assign("damage_VII_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "damage VII", ""), 2)
	Assign("damage_VIII_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "damage VIII", ""), 2)
	Assign("damage_IX_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "damage IX", ""), 2)
	Assign("damage_X_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "damage X", ""), 2)
	Assign("economy_I_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "economy I", ""), 2)
	Assign("economy_II_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "economy II", ""), 2)
	Assign("economy_III_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "economy III", ""), 2)
	Assign("economy_IV_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "economy IV", ""), 2)
	Assign("economy_V_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "economy V", ""), 2)
	Assign("economy_VI_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "economy VI", ""), 2)
	Assign("economy_VII_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "economy VII", ""), 2)
	Assign("economy_VIII_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "economy VIII", ""), 2)
	Assign("economy_IX_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "economy IX", ""), 2)
	Assign("economy_X_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "economy X", ""), 2)
	Assign("range_I_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "range I", ""), 2)
	Assign("range_II_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "range II", ""), 2)
	Assign("range_III_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "range III", ""), 2)
	Assign("range_IV_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "range IV", ""), 2)
	Assign("range_V_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "range V", ""), 2)
	Assign("range_VI_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "range VI", ""), 2)
	Assign("range_VII_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "range VII", ""), 2)
	Assign("range_VIII_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "range VIII", ""), 2)
	Assign("range_IX_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "range IX", ""), 2)
	Assign("range_X_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "range X", ""), 2)
	Assign("skill_modification_I_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "skill modification I", ""), 2)
	Assign("skill_modification_II_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "skill modification II", ""), 2)
	Assign("skill_modification_III_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "skill modification III", ""), 2)
	Assign("skill_modification_IV_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "skill modification IV", ""), 2)
	Assign("skill_modification_V_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "skill modification V", ""), 2)
	Assign("skill_modification_VI_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "skill modification VI", ""), 2)
	Assign("skill_modification_VII_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "skill modification VII", ""), 2)
	Assign("skill_modification_VIII_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "skill modification VIII", ""), 2)
	Assign("skill_modification_IX_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "skill modification IX", ""), 2)
	Assign("skill_modification_X_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "skill modification X", ""), 2)
	Assign("enhancer_I_markup_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Enhancer I Mark Up", ""), 2)
	Assign("enhancer_II_markup_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Enhancer II Mark Up", ""), 2)
	Assign("enhancer_III_markup_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Enhancer III Mark Up", ""), 2)
	Assign("enhancer_IV_markup_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Enhancer IV Mark Up", ""), 2)
	Assign("enhancer_V_markup_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Enhancer V Mark Up", ""), 2)
	Assign("enhancer_VI_markup_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Enhancer VI Mark Up", ""), 2)
	Assign("enhancer_VII_markup_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Enhancer VII Mark Up", ""), 2)
	Assign("enhancer_VIII_markup_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Enhancer VIII Mark Up", ""), 2)
	Assign("enhancer_IX_markup_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Enhancer IX Mark Up", ""), 2)
	Assign("enhancer_X_markup_" & $x, IniRead(Eval("weapon_file_" & $x), "Settings", "Enhancer X Mark Up", ""), 2)
	Assign("history_weapon_file_" & $x, IniRead(Eval("weapon_file_" & $x), "History", "File", ""), 2)
	update_settings_gui_weapon()
EndFunc   ;==>read_settings_weapon

Func read_history_weapons()
	For $i = 1 To 6
		read_history_weapon("w" & $i)
	Next
EndFunc   ;==>read_history_weapons

Func read_history_weapon($x)
	Assign("hit_count_history_" & $x, IniRead(Eval("history_weapon_file_" & $x), "History", "Hit Count", 0), 2)
	Assign("chit_count_history_" & $x, IniRead(Eval("history_weapon_file_" & $x), "History", "Crit Hit Count", 0), 2)
	Assign("miss_count_history_" & $x, IniRead(Eval("history_weapon_file_" & $x), "History", "Miss Count", 0), 2)
	Assign("use_count_history_" & $x, IniRead(Eval("history_weapon_file_" & $x), "History", "Use Count", 0), 2)
	Assign("totaldmg_history_" & $x, IniRead(Eval("history_weapon_file_" & $x), "History", "Total Damage", 0), 2)
	Assign("total_decay_history_" & $x, IniRead(Eval("history_weapon_file_" & $x), "History", "Total Decay", 0), 2)
	Assign("broken_enhancer_history_" & $x, IniRead(Eval("history_weapon_file_" & $x), "Enhancers", "Total Broken Enhancers", 0), 2)
	Assign("skill_count_history_" & $x, IniRead(Eval("history_weapon_file_" & $x), "Skills", "Total Skills", 0), 2)
EndFunc   ;==>read_history_weapon

Func read_settings_Tools()
	For $i = 1 To 3
		read_settings_Tool("f" & $i)
	Next
EndFunc   ;==>read_settings_Tools

Func read_settings_Tool($x)
	Assign("tool_name_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "Tool_Name", ""), 2)
	Assign("tool_uses_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "Uses", ""), 2)
	Assign("tool_decay_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "Decay", ""), 2)
	Assign("tool_markup_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "Mark Up", ""), 2)
	Assign("heal_I_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "heal_I", 0), 2)
	Assign("heal_II_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "heal_II", 0), 2)
	Assign("heal_III_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "heal_III", 0), 2)
	Assign("heal_IV_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "heal_IV", 0), 2)
	Assign("heal_V_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "heal_V", 0), 2)
	Assign("heal_VI_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "heal_VI", 0), 2)
	Assign("heal_VII_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "heal_VII", 0), 2)
	Assign("heal_VIII_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "heal_VIII", 0), 2)
	Assign("heal_IX_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "heal_IX", 0), 2)
	Assign("heal_X_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "heal_X", 0), 2)
	Assign("economy_I_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "economy_I", 0), 2)
	Assign("economy_II_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "economy_II", 0), 2)
	Assign("economy_III_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "economy_III", 0), 2)
	Assign("economy_IV_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "economy_IV", 0), 2)
	Assign("economy_V_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "economy_V", 0), 2)
	Assign("economy_VI_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "economy_VI", 0), 2)
	Assign("economy_VII_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "economy_VII", 0), 2)
	Assign("economy_VIII_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "economy_VIII", 0), 2)
	Assign("economy_IX_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "economy_IX", 0), 2)
	Assign("economy_X_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "economy_X", 0), 2)
	Assign("skill_modification_I_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "skill_modification_I", 0), 2)
	Assign("skill_modification_II_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "skill_modification_II", 0), 2)
	Assign("skill_modification_III_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "skill_modification_III", 0), 2)
	Assign("skill_modification_IV_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "skill_modification_IV", 0), 2)
	Assign("skill_modification_V_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "skill_modification_V", 0), 2)
	Assign("skill_modification_VI_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "skill_modification_VI", 0), 2)
	Assign("skill_modification_VII_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "skill_modification_VII", 0), 2)
	Assign("skill_modification_VIII_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "skill_modification_VIII", 0), 2)
	Assign("skill_modification_IX_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "skill_modification_IX", 0), 2)
	Assign("skill_modification_X_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "skill_modification_X", 0), 2)
	Assign("tool_key_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "Tool_key", "<none>"), 2)
	Assign("tool_key_hex_" & $x, IniRead(Eval("tool_file_" & $x), "Settings", "Tool_HexKey", ""), 2)
	Assign("history_tool_file_" & $x, IniRead(Eval("tool_file_" & $x), "History", "File", ""), 2)
	update_settings_gui_tool()
EndFunc   ;==>read_settings_Tool

Func read_history_Tools()
	For $i = 1 To 3
		read_history_Tool("f" & $i)
	Next
EndFunc   ;==>read_history_Tools

Func read_history_Tool($x)
	Assign("use_count_history_" & $x, IniRead(Eval("history_Tool_file_" & $x), "History", "Use Count", 0), 2)
	Assign("total_heal_history_" & $x, IniRead(Eval("history_Tool_file_" & $x), "History", "Total Heal", 0), 2)
	Assign("total_decay_history_" & $x, IniRead(Eval("history_Tool_file_" & $x), "History", "Total Decay", 0), 2)
	Assign("broken_enhancer_history_" & $x, IniRead(Eval("history_Tool_file_" & $x), "Enhancers", "Total Broken Enhancers", 0), 2)
	Assign("skill_count_history_" & $x, IniRead(Eval("history_Tool_file_" & $x), "Skills", "Total Skill Count", 0), 2)
EndFunc   ;==>read_history_Tool

Func read_history_skills()
	$skill_count_history_Agility = IniRead($skills_file, "Attributes", "Agility", 0)
	$skill_count_history_Health = IniRead($skills_file, "Attributes", "Health", 0)
	$skill_count_history_Intelligence = IniRead($skills_file, "Attributes", "Intelligence", 0)
	$skill_count_history_Psyche = IniRead($skills_file, "Attributes", "Psyche", 0)
	$skill_count_history_Stamina = IniRead($skills_file, "Attributes", "Stamina", 0)
	$skill_count_history_Strength = IniRead($skills_file, "Attributes", "Strength", 0)
	$skill_count_history_Alertness = IniRead($skills_file, "General", "Alertness", 0)
	$skill_count_history_Athletics = IniRead($skills_file, "General", "Athletics", 0)
	$skill_count_history_Bravado = IniRead($skills_file, "General", "Bravado", 0)
	$skill_count_history_Coolness = IniRead($skills_file, "General", "Coolness", 0)
	$skill_count_history_Courage = IniRead($skills_file, "General", "Courage", 0)
	$skill_count_history_Dexterity = IniRead($skills_file, "General", "Dexterity", 0)
	$skill_count_history_Intuition = IniRead($skills_file, "General", "Intuition", 0)
	$skill_count_history_Perception = IniRead($skills_file, "General", "Perception", 0)
	$skill_count_history_Quickness = IniRead($skills_file, "General", "Quickness", 0)
	$skill_count_history_Serendipity = IniRead($skills_file, "General", "Serendipity", 0)
	$skill_count_history_Aim = IniRead($skills_file, "Combat", "Aim", 0)
	$skill_count_history_Clubs = IniRead($skills_file, "Combat", "Clubs", 0)
	$skill_count_history_Combat_Reflexes = IniRead($skills_file, "Combat", "Combat_Reflexes", 0)
	$skill_count_history_Combat_Sense = IniRead($skills_file, "Combat", "Combat_Sense", 0)
	$skill_count_history_Commando = IniRead($skills_file, "Combat", "Commando", 0)
	$skill_count_history_Handgun = IniRead($skills_file, "Combat", "Handgun", 0)
	$skill_count_history_Heavy_Melee_Weapons = IniRead($skills_file, "Combat", "Heavy_Melee_Weapons", 0)
	$skill_count_history_Heavy_Weapons = IniRead($skills_file, "Combat", "Heavy_Weapons", 0)
	$skill_count_history_Inflict_Melee_Damage = IniRead($skills_file, "Combat", "Inflict_Melee_Damage", 0)
	$skill_count_history_Inflict_Ranged_Damage = IniRead($skills_file, "Combat", "Inflict_Ranged_Damage", 0)
	$skill_count_history_Kill_Strike = IniRead($skills_file, "Combat", "Kill_Strike", 0)
	$skill_count_history_Light_Melee_Weapons = IniRead($skills_file, "Combat", "Light_Melee_Weapons", 0)
	$skill_count_history_Longblades = IniRead($skills_file, "Combat", "Longblades", 0)
	$skill_count_history_Marksmanship = IniRead($skills_file, "Combat", "Marksmanship", 0)
	$skill_count_history_Martial_Arts = IniRead($skills_file, "Combat", "Martial_Arts", 0)
	$skill_count_history_Melee_Combat = IniRead($skills_file, "Combat", "Melee_Combat", 0)
	$skill_count_history_Melee_Damage_Assessment = IniRead($skills_file, "Combat", "Melee_Damage_Assessment", 0)
	$skill_count_history_Power_Fist = IniRead($skills_file, "Combat", "Power_Fist", 0)
	$skill_count_history_Ranged_Damage_Assessment = IniRead($skills_file, "Combat", "Ranged_Damage_Assessment", 0)
	$skill_count_history_Rifle = IniRead($skills_file, "Combat", "Rifle", 0)
	$skill_count_history_Shortblades = IniRead($skills_file, "Combat", "Shortblades", 0)
	$skill_count_history_Support_Weapon_Systems = IniRead($skills_file, "Combat", "Support_Weapon_Systems", 0)
	$skill_count_history_Weapons_Handling = IniRead($skills_file, "Combat", "Weapons_Handling", 0)
	$skill_count_history_Whip = IniRead($skills_file, "Combat", "Whip", 0)
	$skill_count_history_Wounding = IniRead($skills_file, "Combat", "Wounding", 0)
	$skill_count_history_Anatomy = IniRead($skills_file, "Medical", "Anatomy", 0)
	$skill_count_history_Diagnosis = IniRead($skills_file, "Medical", "Diagnosis", 0)
	$skill_count_history_Doctor = IniRead($skills_file, "Medical", "Doctor", 0)
	$skill_count_history_First_Aid = IniRead($skills_file, "Medical", "First_Aid", 0)
	$skill_count_history_Medical_Therapy = IniRead($skills_file, "Medical", "Medical_Therapy", 0)
	$skill_count_history_Medicine = IniRead($skills_file, "Medical", "Medicine", 0)
	$skill_count_history_Treatment = IniRead($skills_file, "Medical", "Treatment", 0)
	$skill_count_history_Bioregenesis = IniRead($skills_file, "Mindforce", "Bioregenesis", 0)
	$skill_count_history_Concentration = IniRead($skills_file, "Mindforce", "Concentration", 0)
	$skill_count_history_Cryogenics = IniRead($skills_file, "Mindforce", "Cryogenics", 0)
	$skill_count_history_Electrokinesis = IniRead($skills_file, "Mindforce", "Electrokinesis", 0)
	$skill_count_history_Ethereal_Soul_Language = IniRead($skills_file, "Mindforce", "Ethereal_Soul_Language", 0)
	$skill_count_history_Force_Merge = IniRead($skills_file, "Mindforce", "Force_Merge", 0)
	$skill_count_history_Jamming = IniRead($skills_file, "Mindforce", "Jamming", 0)
	$skill_count_history_Mindforce_Harmony = IniRead($skills_file, "Mindforce", "Mindforce_Harmony", 0)
	$skill_count_history_Power_Catalyst = IniRead($skills_file, "Mindforce", "Power_Catalyst", 0)
	$skill_count_history_Pyrokinesis = IniRead($skills_file, "Mindforce", "Pyrokinesis", 0)
	$skill_count_history_Sweat_Gatherer = IniRead($skills_file, "Mindforce", "Sweat_Gatherer", 0)
	$skill_count_history_Telepathy = IniRead($skills_file, "Mindforce", "Telepathy", 0)
	$skill_count_history_Translocation = IniRead($skills_file, "Mindforce", "Translocation", 0)
	$skill_count_history_Avoidance = IniRead($skills_file, "Defense", "Avoidance", 0)
	$skill_count_history_Dispense_Decoy = IniRead($skills_file, "Defense", "Dispense_Decoy", 0)
	$skill_count_history_Dodge = IniRead($skills_file, "Defense", "Dodge", 0)
	$skill_count_history_Evade = IniRead($skills_file, "Defense", "Evade", 0)
EndFunc   ;==>read_history_skills

#endregion ;~ Read

#region ;~ Joke of the month answer
;~ A good Start!!!
#endregion ;~ Joke of the month answer
#region ;~ Read GUI

Func read_settings_gui()
	$min_tray_setting = GUICtrlRead($min_tray)
	read_settings_gui_general_settings_tab()
	read_settings_gui_global_capture()
EndFunc   ;==>read_settings_gui

Func read_settings_gui_general_settings_tab()
	$chatloglocation = GUICtrlRead($chatloglocation_input)
	$Warning_sound = GUICtrlRead($Warning_sound_checkbox)
	$warning_sound_volume = GUICtrlRead($warning_sound_volume_slider)
	$Warning_sound_file = GUICtrlRead($Warning_sound_file_input)
EndFunc   ;==>read_settings_gui_general_settings_tab

Func read_settings_gui_weapon()
	Assign("weapon_file_w" & $weapon_id, GUICtrlRead($weapon_profile_input), 2)
	Assign("history_weapon_file_w" & $weapon_id, GUICtrlRead($weapon_stats_input), 2)
	Assign("weapon_name_w" & $weapon_id, GUICtrlRead($weapon_name_input), 2)
	Assign("weapon_attacks_w" & $weapon_id, GUICtrlRead($weapon_attacks_input), 2)
	Assign("weapon_ammo_w" & $weapon_id, GUICtrlRead($weapon_ammo_input), 2)
	Assign("weapon_decay_w" & $weapon_id, GUICtrlRead($weapon_decay_input), 2)
	Assign("weapon_markup_w" & $weapon_id, GUICtrlRead($weapon_markup_input), 2)
	Assign("amp_decay_w" & $weapon_id, GUICtrlRead($amp_decay_input), 2)
	Assign("amp_ammo_w" & $weapon_id, GUICtrlRead($amp_ammo_input), 2)
	Assign("amp_markup_w" & $weapon_id, GUICtrlRead($amp_markup_input), 2)
	Assign("accuracy_I_w" & $weapon_id, GUICtrlRead($accuracy_I_input), 2)
	Assign("accuracy_II_w" & $weapon_id, GUICtrlRead($accuracy_II_input), 2)
	Assign("accuracy_III_w" & $weapon_id, GUICtrlRead($accuracy_III_input), 2)
	Assign("accuracy_IV_w" & $weapon_id, GUICtrlRead($accuracy_IV_input), 2)
	Assign("accuracy_V_w" & $weapon_id, GUICtrlRead($accuracy_V_input), 2)
	Assign("accuracy_VI_w" & $weapon_id, GUICtrlRead($accuracy_VI_input), 2)
	Assign("accuracy_VII_w" & $weapon_id, GUICtrlRead($accuracy_VII_input), 2)
	Assign("accuracy_VIII_w" & $weapon_id, GUICtrlRead($accuracy_VIII_input), 2)
	Assign("accuracy_IX_w" & $weapon_id, GUICtrlRead($accuracy_IX_input), 2)
	Assign("accuracy_X_w" & $weapon_id, GUICtrlRead($accuracy_X_input), 2)
	Assign("damage_I_w" & $weapon_id, GUICtrlRead($damage_I_input), 2)
	Assign("damage_II_w" & $weapon_id, GUICtrlRead($damage_II_input), 2)
	Assign("damage_III_w" & $weapon_id, GUICtrlRead($damage_III_input), 2)
	Assign("damage_IV_w" & $weapon_id, GUICtrlRead($damage_IV_input), 2)
	Assign("damage_V_w" & $weapon_id, GUICtrlRead($damage_V_input), 2)
	Assign("damage_VI_w" & $weapon_id, GUICtrlRead($damage_VI_input), 2)
	Assign("damage_VII_w" & $weapon_id, GUICtrlRead($damage_VII_input), 2)
	Assign("damage_VIII_w" & $weapon_id, GUICtrlRead($damage_VIII_input), 2)
	Assign("damage_IX_w" & $weapon_id, GUICtrlRead($damage_IX_input), 2)
	Assign("damage_X_w" & $weapon_id, GUICtrlRead($damage_X_input), 2)
	Assign("economy_I_w" & $weapon_id, GUICtrlRead($weapon_economy_I_input), 2)
	Assign("economy_II_w" & $weapon_id, GUICtrlRead($weapon_economy_II_input), 2)
	Assign("economy_III_w" & $weapon_id, GUICtrlRead($weapon_economy_III_input), 2)
	Assign("economy_IV_w" & $weapon_id, GUICtrlRead($weapon_economy_IV_input), 2)
	Assign("economy_V_w" & $weapon_id, GUICtrlRead($weapon_economy_V_input), 2)
	Assign("economy_VI_w" & $weapon_id, GUICtrlRead($weapon_economy_VI_input), 2)
	Assign("economy_VII_w" & $weapon_id, GUICtrlRead($weapon_economy_VII_input), 2)
	Assign("economy_VIII_w" & $weapon_id, GUICtrlRead($weapon_economy_VIII_input), 2)
	Assign("economy_IX_w" & $weapon_id, GUICtrlRead($weapon_economy_IX_input), 2)
	Assign("economy_X_w" & $weapon_id, GUICtrlRead($weapon_economy_X_input), 2)
	Assign("range_I_w" & $weapon_id, GUICtrlRead($range_I_input), 2)
	Assign("range_II_w" & $weapon_id, GUICtrlRead($range_II_input), 2)
	Assign("range_III_w" & $weapon_id, GUICtrlRead($range_III_input), 2)
	Assign("range_IV_w" & $weapon_id, GUICtrlRead($range_IV_input), 2)
	Assign("range_V_w" & $weapon_id, GUICtrlRead($range_V_input), 2)
	Assign("range_VI_w" & $weapon_id, GUICtrlRead($range_VI_input), 2)
	Assign("range_VII_w" & $weapon_id, GUICtrlRead($range_VII_input), 2)
	Assign("range_VIII_w" & $weapon_id, GUICtrlRead($range_VIII_input), 2)
	Assign("range_IX_w" & $weapon_id, GUICtrlRead($range_IX_input), 2)
	Assign("range_X_w" & $weapon_id, GUICtrlRead($range_X_input), 2)
	Assign("skill_modification_I_w" & $weapon_id, GUICtrlRead($weapon_skill_modification_I_input), 2)
	Assign("skill_modification_II_w" & $weapon_id, GUICtrlRead($weapon_skill_modification_II_input), 2)
	Assign("skill_modification_III_w" & $weapon_id, GUICtrlRead($weapon_skill_modification_III_input), 2)
	Assign("skill_modification_IV_w" & $weapon_id, GUICtrlRead($weapon_skill_modification_IV_input), 2)
	Assign("skill_modification_V_w" & $weapon_id, GUICtrlRead($weapon_skill_modification_V_input), 2)
	Assign("skill_modification_VI_w" & $weapon_id, GUICtrlRead($weapon_skill_modification_VI_input), 2)
	Assign("skill_modification_VII_w" & $weapon_id, GUICtrlRead($weapon_skill_modification_VII_input), 2)
	Assign("skill_modification_VIII_w" & $weapon_id, GUICtrlRead($weapon_skill_modification_VIII_input), 2)
	Assign("skill_modification_IX_w" & $weapon_id, GUICtrlRead($weapon_skill_modification_IX_input), 2)
	Assign("skill_modification_X_w" & $weapon_id, GUICtrlRead($weapon_skill_modification_X_input), 2)
	Assign("enhancer_I_markup_w" & $weapon_id, GUICtrlRead($weapon_enhancer_I_markup_input), 2)
	Assign("enhancer_II_markup_w" & $weapon_id, GUICtrlRead($weapon_enhancer_II_markup_input), 2)
	Assign("enhancer_III_markup_w" & $weapon_id, GUICtrlRead($weapon_enhancer_III_markup_input), 2)
	Assign("enhancer_IV_markup_w" & $weapon_id, GUICtrlRead($weapon_enhancer_IV_markup_input), 2)
	Assign("enhancer_V_markup_w" & $weapon_id, GUICtrlRead($weapon_enhancer_V_markup_input), 2)
	Assign("enhancer_VI_markup_w" & $weapon_id, GUICtrlRead($weapon_enhancer_VI_markup_input), 2)
	Assign("enhancer_VII_markup_w" & $weapon_id, GUICtrlRead($weapon_enhancer_VII_markup_input), 2)
	Assign("enhancer_VIII_markup_w" & $weapon_id, GUICtrlRead($weapon_enhancer_VIII_markup_input), 2)
	Assign("enhancer_IX_markup_w" & $weapon_id, GUICtrlRead($weapon_enhancer_IX_markup_input), 2)
	Assign("enhancer_X_markup_w" & $weapon_id, GUICtrlRead($weapon_enhancer_X_markup_input), 2)
EndFunc   ;==>read_settings_gui_weapon


Func read_settings_gui_Tool()
	Assign("tool_file_f" & $tool_id, GUICtrlRead($tool_profile_input), 2)
	Assign("history_tool_file_f" & $tool_id, GUICtrlRead($tool_stats_input), 2)
	Assign("tool_name_f" & $tool_id, GUICtrlRead($tool_name_input), 2)
	Assign("tool_uses_f" & $tool_id, GUICtrlRead($tool_uses_input), 2)
	Assign("tool_decay_f" & $tool_id, GUICtrlRead($tool_decay_input), 2)
	Assign("tool_markup_f" & $tool_id, GUICtrlRead($tool_markup_input), 2)
	Assign("heal_I_f" & $tool_id, GUICtrlRead($heal_enhancer_I_input), 2)
	Assign("heal_II_f" & $tool_id, GUICtrlRead($heal_enhancer_II_input), 2)
	Assign("heal_III_f" & $tool_id, GUICtrlRead($heal_enhancer_III_input), 2)
	Assign("heal_IV_f" & $tool_id, GUICtrlRead($heal_enhancer_IV_input), 2)
	Assign("heal_V_f" & $tool_id, GUICtrlRead($heal_enhancer_V_input), 2)
	Assign("heal_VI_f" & $tool_id, GUICtrlRead($heal_enhancer_VI_input), 2)
	Assign("heal_VII_f" & $tool_id, GUICtrlRead($heal_enhancer_VII_input), 2)
	Assign("heal_VIII_f" & $tool_id, GUICtrlRead($heal_enhancer_VIII_input), 2)
	Assign("heal_IX_f" & $tool_id, GUICtrlRead($heal_enhancer_IX_input), 2)
	Assign("heal_X_f" & $tool_id, GUICtrlRead($heal_enhancer_X_input), 2)
	Assign("economy_I_f" & $tool_id, GUICtrlRead($tool_economy_I_input), 2)
	Assign("economy_II_f" & $tool_id, GUICtrlRead($tool_economy_II_input), 2)
	Assign("economy_III_f" & $tool_id, GUICtrlRead($tool_economy_III_input), 2)
	Assign("economy_IV_f" & $tool_id, GUICtrlRead($tool_economy_IV_input), 2)
	Assign("economy_V_f" & $tool_id, GUICtrlRead($tool_economy_V_input), 2)
	Assign("economy_VI_f" & $tool_id, GUICtrlRead($tool_economy_VI_input), 2)
	Assign("economy_VII_f" & $tool_id, GUICtrlRead($tool_economy_VII_input), 2)
	Assign("economy_VIII_f" & $tool_id, GUICtrlRead($tool_economy_VIII_input), 2)
	Assign("economy_IX_f" & $tool_id, GUICtrlRead($tool_economy_IX_input), 2)
	Assign("economy_X_f" & $tool_id, GUICtrlRead($tool_economy_X_input), 2)
	Assign("skill_modification_I_f" & $tool_id, GUICtrlRead($tool_skill_modification_I_input), 2)
	Assign("skill_modification_II_f" & $tool_id, GUICtrlRead($tool_skill_modification_II_input), 2)
	Assign("skill_modification_III_f" & $tool_id, GUICtrlRead($tool_skill_modification_III_input), 2)
	Assign("skill_modification_IV_f" & $tool_id, GUICtrlRead($tool_skill_modification_IV_input), 2)
	Assign("skill_modification_V_f" & $tool_id, GUICtrlRead($tool_skill_modification_V_input), 2)
	Assign("skill_modification_VI_f" & $tool_id, GUICtrlRead($tool_skill_modification_VI_input), 2)
	Assign("skill_modification_VII_f" & $tool_id, GUICtrlRead($tool_skill_modification_VII_input), 2)
	Assign("skill_modification_VIII_f" & $tool_id, GUICtrlRead($tool_skill_modification_VIII_input), 2)
	Assign("skill_modification_IX_f" & $tool_id, GUICtrlRead($tool_skill_modification_IX_input), 2)
	Assign("skill_modification_X_f" & $tool_id, GUICtrlRead($tool_skill_modification_X_input), 2)
	Assign("enhancer_I_markup_f" & $tool_id, GUICtrlRead($tool_enhancer_I_markup_input), 2)
	Assign("enhancer_II_markup_f" & $tool_id, GUICtrlRead($tool_enhancer_II_markup_input), 2)
	Assign("enhancer_III_markup_f" & $tool_id, GUICtrlRead($tool_enhancer_III_markup_input), 2)
	Assign("enhancer_IV_markup_f" & $tool_id, GUICtrlRead($tool_enhancer_IV_markup_input), 2)
	Assign("enhancer_V_markup_f" & $tool_id, GUICtrlRead($tool_enhancer_V_markup_input), 2)
	Assign("enhancer_VI_markup_f" & $tool_id, GUICtrlRead($tool_enhancer_VI_markup_input), 2)
	Assign("enhancer_VII_markup_f" & $tool_id, GUICtrlRead($tool_enhancer_VII_markup_input), 2)
	Assign("enhancer_VIII_markup_f" & $tool_id, GUICtrlRead($tool_enhancer_VIII_markup_input), 2)
	Assign("enhancer_IX_markup_f" & $tool_id, GUICtrlRead($tool_enhancer_IX_markup_input), 2)
	Assign("enhancer_X_markup_f" & $tool_id, GUICtrlRead($tool_enhancer_X_markup_input), 2)
EndFunc   ;==>read_settings_gui_Tool

Func read_settings_gui_global_capture()
	$enable_global_capture_avatar = GUICtrlRead($enable_global_capture_avatar_input)
	$avatar_name = GUICtrlRead($avatar_name_input)
	$enable_global_capture_team = GUICtrlRead($enable_global_capture_team_input)
	$team_name = GUICtrlRead($team_name_input)
	$capture_folder = GUICtrlRead($capture_folder_input)
	$capture_delay = GUICtrlRead($capture_delay_input)
	$folder_structure = GUICtrlRead($folder_structure_input)
	$image_type_bmp = GUICtrlRead($image_type_bmp_input)
	$image_type_jpeg = GUICtrlRead($image_type_jpeg_input)
	$jpeg_quality = GUICtrlRead($jpeg_quality_input)
	$enable_hunting_globals = GUICtrlRead($enable_hunting_globals_input)
	$enable_hunting_hof = GUICtrlRead($enable_hunting_hof_input)
	$enable_mining_globals = GUICtrlRead($enable_mining_globals_input)
	$enable_mining_hof = GUICtrlRead($enable_mining_hof_input)
	$enable_crafting_globals = GUICtrlRead($enable_crafting_globals_input)
	$enable_crafting_hof = GUICtrlRead($enable_crafting_hof_input)
	$enable_position = GUICtrlRead($enable_position_input)
	$enable_time_stamp = GUICtrlRead($enable_time_stamp_input)
EndFunc   ;==>read_settings_gui_global_capture

#endregion ;~ Read GUI
#region ;~ Update GUI
Func _update_GUI_dmg_out()
	GUICtrlSetData($hit_lable, "Total Hits: " & $hit_count)
	GUICtrlSetData($chit_lable, "Total Critical Hits: " & $chit_count)
	GUICtrlSetData($use_lable, "Total Uses: " & $use_count)
	GUICtrlSetData($dmg_lable, "Total Dmg: " & Round($totaldmg, 2))
	GUICtrlSetData($miss_lable, "Total Misses: " & $miss_count)
	GUICtrlSetData($hit_ability_lable, "Hit Ability: " & Round($hit_ability, 2) & "%")
	GUICtrlSetData($chit_ability_lable, "Critical Hit Ability: " & Round($chit_ability, 2) & "%")
EndFunc   ;==>_update_GUI_dmg_out

Func _update_GUI_dmg_out_history()
	GUICtrlSetData($hit_lable, "Total Hits: " & $hit_count_history)
	GUICtrlSetData($chit_lable, "Total Critical Hits: " & $chit_count_history)
	GUICtrlSetData($use_lable, "Total Uses: " & $use_count_history)
	GUICtrlSetData($dmg_lable, "Total Dmg: " & Round($totaldmg_history, 2))
	GUICtrlSetData($miss_lable, "Total Misses: " & $miss_count_history)
	GUICtrlSetData($hit_ability_lable, "Hit Ability: " & Round($hit_ability_history, 2) & "%")
	GUICtrlSetData($chit_ability_lable, "Critical Hit Ability: " & Round($chit_ability_history, 2) & "%")
EndFunc   ;==>_update_GUI_dmg_out_history

Func _update_GUI_dmg_in()
	GUICtrlSetData($hit_in_lable, "Total Hits: " & $hit_in_count)
	GUICtrlSetData($chit_in_lable, "Total Critical Hits: " & $chit_in_count)
	GUICtrlSetData($dmg_in_lable, "Total Dmg: " & Round($totaldmg_in, 2))
EndFunc   ;==>_update_GUI_dmg_in

Func _update_GUI_misc()
	GUICtrlSetData($total_heal_lable, "Total Heals: " & $total_heal)
	GUICtrlSetData($Tool_use_count_lable, "Total Tool Uses: " & $Tool_use_count)
	GUICtrlSetData($noloot_lable, "Total Mobs without loot: " & $noloot_count)
	GUICtrlSetData($skill_lable, "Total Skill Points Gained: " & $skill_count)
EndFunc   ;==>_update_GUI_misc


Func _update_GUI_item_status()
	GUICtrlSetData($weapon_status_lable_w1, $weapon_status_w1)
	GUICtrlSetData($weapon_status_lable_w2, $weapon_status_w2)
	GUICtrlSetData($weapon_status_lable_w3, $weapon_status_w3)
	GUICtrlSetData($weapon_status_lable_w4, $weapon_status_w4)
	GUICtrlSetData($weapon_status_lable_w5, $weapon_status_w5)
	GUICtrlSetData($weapon_status_lable_w6, $weapon_status_w6)
	GUICtrlSetData($Tool_status_lable_f1, $Tool_status_f1)
	GUICtrlSetData($Tool_status_lable_f2, $Tool_status_f2)
	GUICtrlSetData($Tool_status_lable_f3, $Tool_status_f3)
EndFunc   ;==>_update_GUI_item_status


Func _update_GUI_weapon_stats($x = $main_weapon_id)
	If StringRegExp($x, "w", 0) = 0 Then
		$x = "w" & $x
	EndIf
	GUICtrlSetData($weapon_name_group, "[ " & Eval("weapon_name_" & $x) & " ]")
	If Eval("weapon_name_" & $x) = "" Then GUICtrlSetData($weapon_name_group, "[ Weapon " & $main_weapon_id & " ]")
	GUICtrlSetData($weapon_hit_count_lable, "Total Hits: " & Eval("hit_count_" & $x))
	GUICtrlSetData($weapon_chit_count_lable, "Total Critical Hits: " & Eval("chit_count_" & $x))
	GUICtrlSetData($weapon_use_count_lable, "Total Uses: " & Eval("use_count_" & $x))
	GUICtrlSetData($weapon_totaldmg_lable, "Total Dmg: " & Round(Eval("totaldmg_" & $x), 2))
	GUICtrlSetData($weapon_miss_count_lable, "Total Misses: " & Eval("miss_count_" & $x))
	GUICtrlSetData($weapon_dmg_s_lable, "Damage/sec: " & Round(Eval("dmg_s_" & $x), 2))
	GUICtrlSetData($weapon_dmg_pec_lable, "Damage/PEC: " & Round(Eval("dmg_pec_" & $x), 3))
	GUICtrlSetData($weapon_hit_ability_lable, "Hit Ability: " & Round(Eval("hit_ability_" & $x), 2) & "%")
	GUICtrlSetData($weapon_chit_ability_lable, "Critical Hit Ability: " & Round(Eval("chit_ability_" & $x), 2) & "%")
	GUICtrlSetData($weapon_skills_pec_lable, "PEC/Skill: " & Round(Eval("skills_pec_" & $x), 4))
	GUICtrlSetData($weapon_broken_enhancers_lable, "Broken Enhancers: " & Eval("broken_enhancer_" & $x))
	GUICtrlSetData($weapon_total_decay_lable, "Total Decay: " & Round((Eval("total_decay_" & $x) / 10), 2) & " PED")
EndFunc   ;==>_update_GUI_weapon_stats

Func _update_GUI_weapon_stats_history($x = $main_weapon_id)
	If StringRegExp($x, "w", 0) = 0 Then
		$x = "w" & $x
	EndIf
	GUICtrlSetData($weapon_hit_count_history_lable, "Total Hits: " & Eval("hit_count_history_" & $x))
	GUICtrlSetData($weapon_chit_count_history_lable, "Total Critical Hits: " & Eval("chit_count_history_" & $x))
	GUICtrlSetData($weapon_use_count_history_lable, "Total Uses: " & Eval("use_count_history_" & $x))
	GUICtrlSetData($weapon_totaldmg_history_lable, "Total Dmg: " & Round(Eval("totaldmg_history_" & $x), 2))
	GUICtrlSetData($weapon_miss_count_history_lable, "Total Misses: " & Eval("miss_count_history_" & $x))
	GUICtrlSetData($weapon_dmg_s_history_lable, "Damage/sec: " & Round(Eval("dmg_s_history_" & $x), 2))
	GUICtrlSetData($weapon_dmg_pec_history_lable, "Damage/PEC: " & Round(Eval("dmg_pec_history_" & $x), 3))
	GUICtrlSetData($weapon_hit_ability_history_lable, "Hit Ability: " & Round(Eval("hit_ability_history_" & $x), 2) & "%")
	GUICtrlSetData($weapon_chit_ability_history_lable, "Critical Hit Ability: " & Round(Eval("chit_ability_history_" & $x), 2) & "%")
	GUICtrlSetData($weapon_skills_pec_history_lable, "PEC/Skill: " & Round(Eval("skills_pec_history_" & $x), 4))
	GUICtrlSetData($weapon_broken_enhancers_history_lable, "Broken Enhancers: " & Eval("broken_enhancer_history_" & $x))
	GUICtrlSetData($weapon_total_decay_history_lable, "Total Decay: " & Round((Eval("total_decay_history_" & $x) / 10), 2) & " PED")
EndFunc   ;==>_update_GUI_weapon_stats_history

Func _update_GUI_Tool_stats($x)
	GUICtrlSetData(Eval("use_count_lable_" & $x), "Total Uses: " & Eval("use_count_" & $x))
	GUICtrlSetData(Eval("total_heal_lable_" & $x), "Total Heals: " & Round(Eval("total_heal_" & $x), 2))
	GUICtrlSetData(Eval("heals_s_lable_" & $x), "Heals/sec: " & Round(Eval("heals_s_" & $x), 2))
	GUICtrlSetData(Eval("heals_pec_lable_" & $x), "Heals/PEC: " & Round(Eval("heals_pec_" & $x), 3))
	GUICtrlSetData(Eval("skills_pec_lable_" & $x), "PEC/Skill: " & Round(Eval("skills_pec_" & $x), 2))
EndFunc   ;==>_update_GUI_Tool_stats

Func _update_GUI_Tool_stats_history($x)
	GUICtrlSetData(Eval("use_count_lable_" & $x), "Total Uses: " & Eval("use_count_history_" & $x))
	GUICtrlSetData(Eval("total_heal_lable_" & $x), "Total Heals: " & Round(Eval("total_heal_history_" & $x), 2))
	GUICtrlSetData(Eval("heals_s_lable_" & $x), "Heals/sec: " & Round(Eval("heals_s_history_" & $x), 2))
	GUICtrlSetData(Eval("heals_pec_lable_" & $x), "Heals/PEC: " & Round(Eval("heals_pec_history_" & $x), 3))
EndFunc   ;==>_update_GUI_Tool_stats_history

Func _update_GUI_edits($color)
	Local $color_hex = ""
	Switch $color
		Case "blue"
			$color_hex = 0x00AAFF
		Case "orange"
			$color_hex = 0xff7f00
		Case "red"
			$color_hex = 0xff0000
		Case "yellow"
			$color_hex = 0xF8F800
		Case "green"
			$color_hex = 0x118B10
		Case "purple"
			$color_hex = 0xAA00FF
	EndSwitch
	GUICtrlCreateListViewItem($hunting_data, $edit1)
	GUICtrlSetColor(-1, $color_hex)
	Local $count = _GUICtrlListView_GetItemCount($hedit1) - 1
	_GUICtrlListView_EnsureVisible($hedit1, $count, False)
EndFunc   ;==>_update_GUI_edits

Func _update_GUI_skills()
	_update_GUI_skill("Agility")
	_update_GUI_skill("Health")
	_update_GUI_skill("Intelligence")
	_update_GUI_skill("Psyche")
	_update_GUI_skill("Stamina")
	_update_GUI_skill("Strength")
	_update_GUI_skill("Alertness")
	_update_GUI_skill("Athletics")
	_update_GUI_skill("Bravado")
	_update_GUI_skill("Coolness")
	_update_GUI_skill("Courage")
	_update_GUI_skill("Dexterity")
	_update_GUI_skill("Intuition")
	_update_GUI_skill("Perception")
	_update_GUI_skill("Quickness")
	_update_GUI_skill("Serendipity")
	_update_GUI_skill("Aim")
	_update_GUI_skill("Clubs")
	_update_GUI_skill("Combat Reflexes")
	_update_GUI_skill("Combat Sense")
	_update_GUI_skill("Commando")
	_update_GUI_skill("Handgun")
	_update_GUI_skill("Heavy Melee Weapons")
	_update_GUI_skill("Heavy Weapons")
	_update_GUI_skill("Inflict Melee Damage")
	_update_GUI_skill("Inflict Ranged Damage")
	_update_GUI_skill("Kill Strike")
	_update_GUI_skill("Light Melee Weapons")
	_update_GUI_skill("Longblades")
	_update_GUI_skill("Marksmanship")
	_update_GUI_skill("Martial Arts")
	_update_GUI_skill("Melee Combat")
	_update_GUI_skill("Melee Damage Assessment")
	_update_GUI_skill("Power Fist")
	_update_GUI_skill("Ranged Damage Assessment")
	_update_GUI_skill("Rifle")
	_update_GUI_skill("Shortblades")
	_update_GUI_skill("Support Weapon Systems")
	_update_GUI_skill("Weapons Handling")
	_update_GUI_skill("Whip")
	_update_GUI_skill("Wounding")
	_update_GUI_skill("Anatomy")
	_update_GUI_skill("Diagnosis")
	_update_GUI_skill("Doctor")
	_update_GUI_skill("First Aid")
	_update_GUI_skill("Medical Therapy")
	_update_GUI_skill("Medicine")
	_update_GUI_skill("Treatment")
	_update_GUI_skill("Bioregenesis")
	_update_GUI_skill("Concentration")
	_update_GUI_skill("Cryogenics")
	_update_GUI_skill("Electrokinesis")
	_update_GUI_skill("Ethereal Soul Language")
	_update_GUI_skill("Force Merge")
	_update_GUI_skill("Jamming")
	_update_GUI_skill("Mindforce Harmony")
	_update_GUI_skill("Power Catalyst")
	_update_GUI_skill("Pyrokinesis")
	_update_GUI_skill("Sweat Gatherer")
	_update_GUI_skill("Telepathy")
	_update_GUI_skill("Translocation")
	_update_GUI_skill("Avoidance")
	_update_GUI_skill("Dispense Decoy")
	_update_GUI_skill("Dodge")
	_update_GUI_skill("Evade")
EndFunc   ;==>_update_GUI_skills

Func _update_GUI_skill($x)
	If $skill_history Then
		$y = StringRegExpReplace(GUICtrlRead(Eval($x & "_lable")), "[0-9]", "")
		GUICtrlSetData(Eval($x & "_lable"), $y & Eval("skill_count_history_" & $x))
	Else
		$y = StringRegExpReplace(GUICtrlRead(Eval($x & "_lable")), "[0-9]", "")
		GUICtrlSetData(Eval($x & "_lable"), $y & Eval("skill_count_" & $x))
	EndIf
EndFunc   ;==>_update_GUI_skill

Func lastitem()
	If $item <> $lastitem Then
		$lastitem = $item
		_item_status()
	EndIf
EndFunc   ;==>lastitem

Func _item_status()
	Switch $item
		Case "Weapon 1"
			GUICtrlSetData($weapon_status_lable_w1, "Enabled")
			GUICtrlSetBkColor($weapon_status_lable_w1, 0x00FF00)
			GUICtrlSetData($weapon_status_lable_w2, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w2, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w3, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w3, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w4, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w4, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w5, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w5, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w6, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w6, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f1, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f1, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f2, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f2, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f3, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f3, 0xFF0000)
		Case "Weapon 2"
			GUICtrlSetData($weapon_status_lable_w1, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w1, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w2, "Enabled")
			GUICtrlSetBkColor($weapon_status_lable_w2, 0x00FF00)
			GUICtrlSetData($weapon_status_lable_w3, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w3, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w4, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w4, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w5, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w5, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w6, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w6, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f1, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f1, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f2, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f2, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f3, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f3, 0xFF0000)
		Case "Weapon 3"
			GUICtrlSetData($weapon_status_lable_w1, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w1, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w2, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w2, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w3, "Enabled")
			GUICtrlSetBkColor($weapon_status_lable_w3, 0x00FF00)
			GUICtrlSetData($weapon_status_lable_w4, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w4, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w5, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w5, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w6, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w6, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f1, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f1, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f2, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f2, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f3, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f3, 0xFF0000)
		Case "Weapon 4"
			GUICtrlSetData($weapon_status_lable_w1, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w1, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w2, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w2, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w3, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w3, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w4, "Enabled")
			GUICtrlSetBkColor($weapon_status_lable_w4, 0x00FF00)
			GUICtrlSetData($weapon_status_lable_w5, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w5, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w6, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w6, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f1, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f1, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f2, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f2, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f3, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f3, 0xFF0000)
		Case "Weapon 5"
			GUICtrlSetData($weapon_status_lable_w1, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w1, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w2, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w2, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w3, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w3, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w4, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w4, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w5, "Enabled")
			GUICtrlSetBkColor($weapon_status_lable_w5, 0x00FF00)
			GUICtrlSetData($weapon_status_lable_w6, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w6, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f1, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f1, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f2, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f2, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f3, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f3, 0xFF0000)
		Case "Weapon 6"
			GUICtrlSetData($weapon_status_lable_w1, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w1, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w2, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w2, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w3, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w3, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w4, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w4, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w5, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w5, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w6, "Enabled")
			GUICtrlSetBkColor($weapon_status_lable_w6, 0x00FF00)
			GUICtrlSetData($Tool_status_lable_f1, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f1, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f2, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f2, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f3, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f3, 0xFF0000)
		Case "Tool 1"
			GUICtrlSetData($weapon_status_lable_w1, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w1, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w2, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w2, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w3, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w3, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w4, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w4, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w5, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w5, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w6, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w6, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f1, "Enabled")
			GUICtrlSetBkColor($Tool_status_lable_f1, 0x00FF00)
			GUICtrlSetData($Tool_status_lable_f2, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f2, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f3, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f3, 0xFF0000)
		Case "Tool 2"
			GUICtrlSetData($weapon_status_lable_w1, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w1, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w2, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w2, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w3, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w3, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w4, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w4, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w5, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w5, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w6, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w6, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f1, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f1, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f2, "Enabled")
			GUICtrlSetBkColor($Tool_status_lable_f2, 0x00FF00)
			GUICtrlSetData($Tool_status_lable_f3, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f3, 0xFF0000)
		Case "Tool 3"
			GUICtrlSetData($weapon_status_lable_w1, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w1, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w2, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w2, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w3, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w3, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w4, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w4, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w5, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w5, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w6, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w6, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f1, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f1, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f2, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f2, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f3, "Enabled")
			GUICtrlSetBkColor($Tool_status_lable_f3, 0x00FF00)
		Case Else
			GUICtrlSetData($weapon_status_lable_w1, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w1, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w2, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w2, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w3, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w3, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w4, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w4, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w5, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w5, 0xFF0000)
			GUICtrlSetData($weapon_status_lable_w6, "Disabled")
			GUICtrlSetBkColor($weapon_status_lable_w6, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f1, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f1, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f2, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f2, 0xFF0000)
			GUICtrlSetData($Tool_status_lable_f3, "Disabled")
			GUICtrlSetBkColor($Tool_status_lable_f3, 0xFF0000)
	EndSwitch
EndFunc   ;==>_item_status

Func update_item_names_in_gui()
	If StringLen($weapon_name_w1) > 1 Then
		GUICtrlSetData($weapons_tab_w1, "[ " & $weapon_name_w1 & " ]")
		GUICtrlSetData($weapon_status_group_w1, "[ " & StringMid($weapon_name_w1, 1, 12) & "... ]")
	EndIf
	If StringLen($weapon_name_w2) > 1 Then
		GUICtrlSetData($weapons_tab_w2, "[ " & $weapon_name_w2 & " ]")
		GUICtrlSetData($weapon_status_group_w2, "[ " & StringMid($weapon_name_w2, 1, 12) & "... ]")
	EndIf
	If StringLen($weapon_name_w3) > 1 Then
		GUICtrlSetData($weapons_tab_w3, "[ " & $weapon_name_w3 & " ]")
		GUICtrlSetData($weapon_status_group_w3, "[ " & StringMid($weapon_name_w3, 1, 12) & "... ]")
	EndIf
	If StringLen($weapon_name_w4) > 1 Then
		GUICtrlSetData($weapons_tab_w4, "[ " & $weapon_name_w4 & " ]")
		GUICtrlSetData($weapon_status_group_w4, "[ " & StringMid($weapon_name_w4, 1, 12) & "... ]")
	EndIf
	If StringLen($weapon_name_w5) > 1 Then
		GUICtrlSetData($weapons_tab_w5, "[ " & $weapon_name_w5 & " ]")
		GUICtrlSetData($weapon_status_group_w5, "[ " & StringMid($weapon_name_w5, 1, 12) & "... ]")
	EndIf
	If StringLen($weapon_name_w6) > 1 Then
		GUICtrlSetData($weapons_tab_w6, "[ " & $weapon_name_w6 & " ]")
		GUICtrlSetData($weapon_status_group_w6, "[ " & StringMid($weapon_name_w6, 1, 12) & "... ]")
	EndIf
	If StringLen($Tool_name_f1) > 1 Then
		GUICtrlSetData($Tool_tab_f1, "[ " & $Tool_name_f1 & " ]")
		GUICtrlSetData($Tool_status_gourp_f1, "[ " & StringMid($Tool_name_f1, 1, 12) & "... ]")
	EndIf
	If StringLen($Tool_name_f2) > 1 Then
		GUICtrlSetData($Tool_tab_f2, "[ " & $Tool_name_f2 & " ]")
		GUICtrlSetData($Tool_status_group_f2, "[ " & StringMid($Tool_name_f2, 1, 12) & "... ]")
	EndIf
	If StringLen($Tool_name_f3) > 1 Then
		GUICtrlSetData($Tool_tab_f3, "[ " & $Tool_name_f3 & " ]")
		GUICtrlSetData($Tool_status_gourp_f3, "[ " & StringMid($Tool_name_f3, 1, 12) & "... ]")
	EndIf
EndFunc   ;==>update_item_names_in_gui

Func update_settings_gui_weapon()
	GUICtrlSetData($weapon_id_group, "[ Weapon " & $weapon_id & " ]")
	GUICtrlSetData($weapon_profile_input, Eval("weapon_file_w" & $weapon_id))
	GUICtrlSetData($weapon_stats_input, Eval("history_weapon_file_w" & $weapon_id))
	GUICtrlSetData($weapon_name_input, Eval("weapon_name_w" & $weapon_id))
	GUICtrlSetData($weapon_attacks_input, Eval("weapon_attacks_w" & $weapon_id))
	GUICtrlSetData($weapon_ammo_input, Eval("weapon_ammo_w" & $weapon_id))
	GUICtrlSetData($weapon_decay_input, Eval("weapon_decay_w" & $weapon_id))
	GUICtrlSetData($weapon_markup_input, Eval("weapon_markup_w" & $weapon_id))
	GUICtrlSetData($amp_decay_input, Eval("amp_decay_w" & $weapon_id))
	GUICtrlSetData($amp_ammo_input, Eval("amp_ammo_w" & $weapon_id))
	GUICtrlSetData($amp_markup_input, Eval("amp_markup_w" & $weapon_id))
	GUICtrlSetData($weapon_key_lable, "Weapon Hotkey: " & Eval("weapon_key_w" & $weapon_id))
	GUICtrlSetState($accuracy_I_input, Eval("accuracy_I_w" & $weapon_id))
	GUICtrlSetState($accuracy_II_input, Eval("accuracy_II_w" & $weapon_id))
	GUICtrlSetState($accuracy_III_input, Eval("accuracy_III_w" & $weapon_id))
	GUICtrlSetState($accuracy_IV_input, Eval("accuracy_IV_w" & $weapon_id))
	GUICtrlSetState($accuracy_V_input, Eval("accuracy_V_w" & $weapon_id))
	GUICtrlSetState($accuracy_VI_input, Eval("accuracy_VI_w" & $weapon_id))
	GUICtrlSetState($accuracy_VII_input, Eval("accuracy_VII_w" & $weapon_id))
	GUICtrlSetState($accuracy_VIII_input, Eval("accuracy_VIII_w" & $weapon_id))
	GUICtrlSetState($accuracy_IX_input, Eval("accuracy_IX_w" & $weapon_id))
	GUICtrlSetState($accuracy_X_input, Eval("accuracy_X_w" & $weapon_id))
	GUICtrlSetState($damage_I_input, Eval("damage_I_w" & $weapon_id))
	GUICtrlSetState($damage_II_input, Eval("damage_II_w" & $weapon_id))
	GUICtrlSetState($damage_III_input, Eval("damage_III_w" & $weapon_id))
	GUICtrlSetState($damage_IV_input, Eval("damage_IV_w" & $weapon_id))
	GUICtrlSetState($damage_V_input, Eval("damage_V_w" & $weapon_id))
	GUICtrlSetState($damage_VI_input, Eval("damage_VI_w" & $weapon_id))
	GUICtrlSetState($damage_VII_input, Eval("damage_VII_w" & $weapon_id))
	GUICtrlSetState($damage_VIII_input, Eval("damage_VIII_w" & $weapon_id))
	GUICtrlSetState($damage_IX_input, Eval("damage_IX_w" & $weapon_id))
	GUICtrlSetState($damage_X_input, Eval("damage_X_w" & $weapon_id))
	GUICtrlSetState($weapon_economy_I_input, Eval("economy_I_w" & $weapon_id))
	GUICtrlSetState($weapon_economy_II_input, Eval("economy_II_w" & $weapon_id))
	GUICtrlSetState($weapon_economy_III_input, Eval("economy_III_w" & $weapon_id))
	GUICtrlSetState($weapon_economy_IV_input, Eval("economy_IV_w" & $weapon_id))
	GUICtrlSetState($weapon_economy_V_input, Eval("economy_V_w" & $weapon_id))
	GUICtrlSetState($weapon_economy_VI_input, Eval("economy_VI_w" & $weapon_id))
	GUICtrlSetState($weapon_economy_VII_input, Eval("economy_VII_w" & $weapon_id))
	GUICtrlSetState($weapon_economy_VIII_input, Eval("economy_VIII_w" & $weapon_id))
	GUICtrlSetState($weapon_economy_IX_input, Eval("economy_IX_w" & $weapon_id))
	GUICtrlSetState($weapon_economy_X_input, Eval("economy_X_w" & $weapon_id))
	GUICtrlSetState($range_I_input, Eval("range_I_w" & $weapon_id))
	GUICtrlSetState($range_II_input, Eval("range_II_w" & $weapon_id))
	GUICtrlSetState($range_III_input, Eval("range_III_w" & $weapon_id))
	GUICtrlSetState($range_IV_input, Eval("range_IV_w" & $weapon_id))
	GUICtrlSetState($range_V_input, Eval("range_V_w" & $weapon_id))
	GUICtrlSetState($range_VI_input, Eval("range_VI_w" & $weapon_id))
	GUICtrlSetState($range_VII_input, Eval("range_VII_w" & $weapon_id))
	GUICtrlSetState($range_VIII_input, Eval("range_VIII_w" & $weapon_id))
	GUICtrlSetState($range_IX_input, Eval("range_IX_w" & $weapon_id))
	GUICtrlSetState($range_X_input, Eval("range_X_w" & $weapon_id))
	GUICtrlSetState($weapon_skill_modification_I_input, Eval("skill_modification_I_w" & $weapon_id))
	GUICtrlSetState($weapon_skill_modification_II_input, Eval("skill_modification_II_w" & $weapon_id))
	GUICtrlSetState($weapon_skill_modification_III_input, Eval("skill_modification_III_w" & $weapon_id))
	GUICtrlSetState($weapon_skill_modification_IV_input, Eval("skill_modification_IV_w" & $weapon_id))
	GUICtrlSetState($weapon_skill_modification_V_input, Eval("skill_modification_V_w" & $weapon_id))
	GUICtrlSetState($weapon_skill_modification_VI_input, Eval("skill_modification_VI_w" & $weapon_id))
	GUICtrlSetState($weapon_skill_modification_VII_input, Eval("skill_modification_VII_w" & $weapon_id))
	GUICtrlSetState($weapon_skill_modification_VIII_input, Eval("skill_modification_VIII_w" & $weapon_id))
	GUICtrlSetState($weapon_skill_modification_IX_input, Eval("skill_modification_IX_w" & $weapon_id))
	GUICtrlSetState($weapon_skill_modification_X_input, Eval("skill_modification_X_w" & $weapon_id))
	GUICtrlSetData($weapon_enhancer_I_markup_input, Eval("enhancer_I_markup_w" & $weapon_id))
	GUICtrlSetData($weapon_enhancer_II_markup_input, Eval("enhancer_II_markup_w" & $weapon_id))
	GUICtrlSetData($weapon_enhancer_III_markup_input, Eval("enhancer_III_markup_w" & $weapon_id))
	GUICtrlSetData($weapon_enhancer_IV_markup_input, Eval("enhancer_IV_markup_w" & $weapon_id))
	GUICtrlSetData($weapon_enhancer_V_markup_input, Eval("enhancer_V_markup_w" & $weapon_id))
	GUICtrlSetData($weapon_enhancer_VI_markup_input, Eval("enhancer_VI_markup_w" & $weapon_id))
	GUICtrlSetData($weapon_enhancer_VII_markup_input, Eval("enhancer_VII_markup_w" & $weapon_id))
	GUICtrlSetData($weapon_enhancer_VIII_markup_input, Eval("enhancer_VIII_markup_w" & $weapon_id))
	GUICtrlSetData($weapon_enhancer_IX_markup_input, Eval("enhancer_IX_markup_w" & $weapon_id))
	GUICtrlSetData($weapon_enhancer_X_markup_input, Eval("enhancer_X_markup_w" & $weapon_id))
EndFunc   ;==>update_settings_gui_weapon

Func update_settings_gui_Tool()
	GUICtrlSetData($tool_id_group, "[ tool " & $tool_id & " ]")
	GUICtrlSetData($tool_profile_input, Eval("tool_file_f" & $tool_id))
	GUICtrlSetData($tool_stats_input, Eval("history_tool_file_f" & $tool_id))
	GUICtrlSetData($tool_name_input, Eval("tool_name_f" & $tool_id))
	GUICtrlSetData($tool_uses_input, Eval("tool_uses_f" & $tool_id))
	GUICtrlSetData($tool_decay_input, Eval("tool_decay_f" & $tool_id))
	GUICtrlSetData($tool_markup_input, Eval("tool_markup_f" & $tool_id))
	GUICtrlSetData($tool_key_lable, "tool Hotkey: " & Eval("tool_key_f" & $tool_id))
	GUICtrlSetState($heal_enhancer_I_input, Eval("heal_I_f" & $tool_id))
	GUICtrlSetState($heal_enhancer_II_input, Eval("heal_II_f" & $tool_id))
	GUICtrlSetState($heal_enhancer_III_input, Eval("heal_III_f" & $tool_id))
	GUICtrlSetState($heal_enhancer_IV_input, Eval("heal_IV_f" & $tool_id))
	GUICtrlSetState($heal_enhancer_V_input, Eval("heal_V_f" & $tool_id))
	GUICtrlSetState($heal_enhancer_VI_input, Eval("heal_VI_f" & $tool_id))
	GUICtrlSetState($heal_enhancer_VII_input, Eval("heal_VII_f" & $tool_id))
	GUICtrlSetState($heal_enhancer_VIII_input, Eval("heal_VIII_f" & $tool_id))
	GUICtrlSetState($heal_enhancer_IX_input, Eval("heal_IX_f" & $tool_id))
	GUICtrlSetState($heal_enhancer_X_input, Eval("heal_X_f" & $tool_id))
	GUICtrlSetState($tool_economy_I_input, Eval("economy_I_f" & $tool_id))
	GUICtrlSetState($tool_economy_II_input, Eval("economy_II_f" & $tool_id))
	GUICtrlSetState($tool_economy_III_input, Eval("economy_III_f" & $tool_id))
	GUICtrlSetState($tool_economy_IV_input, Eval("economy_IV_f" & $tool_id))
	GUICtrlSetState($tool_economy_V_input, Eval("economy_V_f" & $tool_id))
	GUICtrlSetState($tool_economy_VI_input, Eval("economy_VI_f" & $tool_id))
	GUICtrlSetState($tool_economy_VII_input, Eval("economy_VII_f" & $tool_id))
	GUICtrlSetState($tool_economy_VIII_input, Eval("economy_VIII_f" & $tool_id))
	GUICtrlSetState($tool_economy_IX_input, Eval("economy_IX_f" & $tool_id))
	GUICtrlSetState($tool_economy_X_input, Eval("economy_X_f" & $tool_id))
	GUICtrlSetState($tool_skill_modification_I_input, Eval("skill_modification_I_f" & $tool_id))
	GUICtrlSetState($tool_skill_modification_II_input, Eval("skill_modification_II_f" & $tool_id))
	GUICtrlSetState($tool_skill_modification_III_input, Eval("skill_modification_III_f" & $tool_id))
	GUICtrlSetState($tool_skill_modification_IV_input, Eval("skill_modification_IV_f" & $tool_id))
	GUICtrlSetState($tool_skill_modification_V_input, Eval("skill_modification_V_f" & $tool_id))
	GUICtrlSetState($tool_skill_modification_VI_input, Eval("skill_modification_VI_f" & $tool_id))
	GUICtrlSetState($tool_skill_modification_VII_input, Eval("skill_modification_VII_f" & $tool_id))
	GUICtrlSetState($tool_skill_modification_VIII_input, Eval("skill_modification_VIII_f" & $tool_id))
	GUICtrlSetState($tool_skill_modification_IX_input, Eval("skill_modification_IX_f" & $tool_id))
	GUICtrlSetState($tool_skill_modification_X_input, Eval("skill_modification_X_f" & $tool_id))
	GUICtrlSetData($tool_enhancer_I_markup_input, Eval("enhancer_I_markup_f" & $tool_id))
	GUICtrlSetData($tool_enhancer_II_markup_input, Eval("enhancer_II_markup_f" & $tool_id))
	GUICtrlSetData($tool_enhancer_III_markup_input, Eval("enhancer_III_markup_f" & $tool_id))
	GUICtrlSetData($tool_enhancer_IV_markup_input, Eval("enhancer_IV_markup_f" & $tool_id))
	GUICtrlSetData($tool_enhancer_V_markup_input, Eval("enhancer_V_markup_f" & $tool_id))
	GUICtrlSetData($tool_enhancer_VI_markup_input, Eval("enhancer_VI_markup_f" & $tool_id))
	GUICtrlSetData($tool_enhancer_VII_markup_input, Eval("enhancer_VII_markup_f" & $tool_id))
	GUICtrlSetData($tool_enhancer_VIII_markup_input, Eval("enhancer_VIII_markup_f" & $tool_id))
	GUICtrlSetData($tool_enhancer_IX_markup_input, Eval("enhancer_IX_markup_f" & $tool_id))
	GUICtrlSetData($tool_enhancer_X_markup_input, Eval("enhancer_X_markup_f" & $tool_id))
EndFunc   ;==>update_settings_gui_Tool

Func update_settings_gui_general_settings_tab()
	GUICtrlSetData($chatloglocation_input, $chatloglocation)
	GUICtrlSetState($Warning_sound_checkbox, $Warning_sound)
	GUICtrlSetData($warning_sound_volume_slider, $warning_sound_volume)
	GUICtrlSetData($Warning_sound_file_input, $Warning_sound_file)
	GUICtrlSetState($min_tray, $min_tray_setting)
EndFunc   ;==>update_settings_gui_general_settings_tab

Func update_settings_gui_global_capture()
	GUICtrlSetState($enable_global_capture_avatar_input, $enable_global_capture_avatar)
	GUICtrlSetData($avatar_name_input, $avatar_name)
	GUICtrlSetState($enable_global_capture_team_input, $enable_global_capture_team)
	GUICtrlSetData($team_name_input, $team_name)
	GUICtrlSetData($capture_folder_input, $capture_folder)
	GUICtrlSetTip($capture_folder_input, $capture_folder)
	GUICtrlSetData($capture_delay_input, $capture_delay)
	GUICtrlSetData($folder_structure_input, $folder_structure)
	GUICtrlSetState($image_type_bmp_input, $image_type_bmp)
	GUICtrlSetState($image_type_jpeg_input, $image_type_jpeg)
	GUICtrlSetData($jpeg_quality_input, $jpeg_quality)
	GUICtrlSetState($enable_hunting_globals_input, $enable_hunting_globals)
	GUICtrlSetState($enable_hunting_hof_input, $enable_hunting_hof)
	GUICtrlSetState($enable_mining_globals_input, $enable_mining_globals)
	GUICtrlSetState($enable_mining_hof_input, $enable_mining_hof)
	GUICtrlSetState($enable_crafting_globals_input, $enable_crafting_globals)
	GUICtrlSetState($enable_crafting_hof_input, $enable_crafting_hof)
	GUICtrlSetState($enable_position_input, $enable_position)
	GUICtrlSetData($position_key_lable, "Key: " & $position_key)
	GUICtrlSetState($enable_time_stamp_input, $enable_time_stamp)
	GUICtrlSetData($time_stamp_key_lable, "Key: " & $time_stamp_key)
EndFunc   ;==>update_settings_gui_global_capture

#endregion ;~ Update GUI

#region ;~ GUI
Func GUI()
	#region ;~ Main Window
	$main_window = GUICreate($title, 754, 606)
	TraySetIcon(@ScriptFullPath)
	GUISetOnEvent($GUI_Event_Close, "window_events")
	GUISetOnEvent($GUI_Event_Minimize, "window_events")
	$edit1 = GUICtrlCreateListView("Type|Value", 24, 400, 705, 153)
	GUICtrlSetBkColor(-1, 0xD2D2D2)
	$hedit1 = GUICtrlGetHandle($edit1)
	_GUICtrlListView_SetColumnWidth($hedit1, 0, 80)
	_GUICtrlListView_SetColumnWidth($hedit1, 1, 600)
	$Tab1 = GUICtrlCreateTab(0, 0, 753, 561)
	GUICtrlSetResizing(-1, $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
	GUICtrlSetOnEvent(-1, "hide_edit")
	$TabSheet1 = GUICtrlCreateTabItem("Statistical Summary")
	$Group1 = GUICtrlCreateGroup("[ Damage Out ]", 24, 40, 705, 80)
	$hit_lable = GUICtrlCreateLabel("Total Hits: ", 40, 65, 85, 17)
	$chit_lable = GUICtrlCreateLabel("Total Critical Hits: ", 124, 65, 119, 17)
	$miss_lable = GUICtrlCreateLabel("Total Misses: ", 244, 65, 99, 17)
	$use_lable = GUICtrlCreateLabel("Total Uses: ", 344, 65, 91, 17)
	$dmg_lable = GUICtrlCreateLabel("Total Damage: ", 434, 65, 125, 17)
	$hit_ability_lable = GUICtrlCreateLabel("Hit Ability: %", 39, 90, 85, 17)
	$chit_ability_lable = GUICtrlCreateLabel("Critical Hit Ability: %", 130, 90, 120, 17)
	$dmgout_current = GUICtrlCreateButton("Current", 632, 56, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetTip(-1, "Switch to Current Session")
	GUICtrlSetState(-1, $GUI_HIDE)
	GUICtrlSetState(-1, @SW_DISABLE)
	$dmgout_history = GUICtrlCreateButton("History", 632, 56, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetTip(-1, "Switch to History")
	$dmgout_reset_current = GUICtrlCreateButton("Reset", 632, 88, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetTip(-1, "Reset Current Session")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group2 = GUICtrlCreateGroup("[ Damage In ]", 24, 136, 705, 55)
	$hit_in_lable = GUICtrlCreateLabel("Total Hits: ", 40, 160, 85, 17)
	$chit_in_lable = GUICtrlCreateLabel("Total Critical Hits: ", 128, 160, 119, 17)
	$dmg_in_lable = GUICtrlCreateLabel("Total Damage: ", 248, 160, 125, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group3 = GUICtrlCreateGroup("[ Misc ]", 24, 200, 705, 55)
	$Tool_use_count_lable = GUICtrlCreateLabel("Total Tool Uses: ", 40, 224, 114, 17)
	$total_heal_lable = GUICtrlCreateLabel("Total Heals: ", 152, 224, 112, 17)
	$noloot_lable = GUICtrlCreateLabel("Total Mobs without loot: ", 419, 224, 150, 17)
	$skill_lable = GUICtrlCreateLabel("Total Skill Points Gained: ", 264, 224, 155, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group16 = GUICtrlCreateGroup("[ Item Status ]", 24, 272, 705, 121)
	$weapon_status_group_w1 = GUICtrlCreateGroup("[ Weapon 1 ]", 34, 297, 110, 40)
	$weapon_status_lable_w1 = GUICtrlCreateLabel("", 64, 312, 43, 17, 0)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$weapon_status_group_w2 = GUICtrlCreateGroup("[ Weapon 2 ]", 149, 297, 110, 40)
	$weapon_status_lable_w2 = GUICtrlCreateLabel("", 179, 312, 43, 17, 0)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$weapon_status_group_w3 = GUICtrlCreateGroup("[ Weapon 3 ]", 264, 297, 110, 40)
	$weapon_status_lable_w3 = GUICtrlCreateLabel("", 294, 312, 43, 17, 0)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$weapon_status_group_w4 = GUICtrlCreateGroup("[ Weapon 4 ]", 34, 337, 110, 40)
	$weapon_status_lable_w4 = GUICtrlCreateLabel("", 64, 352, 43, 17, 0)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$weapon_status_group_w5 = GUICtrlCreateGroup("[ Weapon 5 ]", 149, 337, 110, 40)
	$weapon_status_lable_w5 = GUICtrlCreateLabel("", 179, 352, 43, 17, 0)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$weapon_status_group_w6 = GUICtrlCreateGroup("[ Weapon 6 ]", 264, 337, 110, 40)
	$weapon_status_lable_w6 = GUICtrlCreateLabel("", 294, 352, 43, 17, 0)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Tool_status_gourp_f1 = GUICtrlCreateGroup("[ Healing Tool 1 ]", 379, 297, 110, 80)
	$Tool_status_lable_f1 = GUICtrlCreateLabel("", 409, 328, 43, 17, 0)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Tool_status_group_f2 = GUICtrlCreateGroup("[ Healing Tool 2 ]", 494, 297, 110, 80)
	$Tool_status_lable_f2 = GUICtrlCreateLabel("", 524, 328, 43, 17, 0)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Tool_status_gourp_f3 = GUICtrlCreateGroup("[ Healing Tool 3 ]", 609, 297, 110, 80)
	$Tool_status_lable_f3 = GUICtrlCreateLabel("", 639, 328, 45, 17, 0)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$weapons_tab = GUICtrlCreateTabItem("Weapons")
	$Main_weapon1_button = GUICtrlCreateButton("Weapon 1", 24, 32, 75, 25)
	GUICtrlSetOnEvent(-1, "Main_window_weapon_events")
	GUICtrlSetState(-1, $GUI_DISABLE_1)
	$Main_weapon2_button = GUICtrlCreateButton("Weapon 2", 150, 32, 75, 25)
	GUICtrlSetOnEvent(-1, "Main_window_weapon_events")
	$Main_weapon3_button = GUICtrlCreateButton("Weapon 3", 276, 32, 75, 25)
	GUICtrlSetOnEvent(-1, "Main_window_weapon_events")
	$Main_weapon4_button = GUICtrlCreateButton("Weapon 4", 402, 32, 75, 25)
	GUICtrlSetOnEvent(-1, "Main_window_weapon_events")
	$Main_weapon5_button = GUICtrlCreateButton("Weapon 5", 528, 32, 75, 25)
	GUICtrlSetOnEvent(-1, "Main_window_weapon_events")
	$Main_weapon6_button = GUICtrlCreateButton("Weapon 6", 654, 32, 75, 25)
	GUICtrlSetOnEvent(-1, "Main_window_weapon_events")
	$weapon_name_group = GUICtrlCreateGroup("[ Weapon Name ]", 24, 64, 705, 329)
	$Group27 = GUICtrlCreateGroup("[ Current Session ]", 40, 96, 673, 129)
	$weapon_hit_count_lable = GUICtrlCreateLabel("Total Hits: ", 55, 121, 85, 17, 0)
	$weapon_chit_count_lable = GUICtrlCreateLabel("Total Critical Hits: ", 172, 121, 119, 17, 0)
	$weapon_miss_count_lable = GUICtrlCreateLabel("Total Misses: ", 322, 121, 99, 17, 0)
	$weapon_use_count_lable = GUICtrlCreateLabel("Total Uses: ", 448, 121, 91, 17, 0)
	$weapon_totaldmg_lable = GUICtrlCreateLabel("Total Damage: ", 571, 121, 125, 17, 0)
	$weapon_skills_pec_lable = GUICtrlCreateLabel("PEC/Skill: ", 592, 151, 88, 17)
	$weapon_dmg_pec_lable = GUICtrlCreateLabel("Damage/PEC: ", 448, 151, 109, 17)
	$weapon_dmg_s_lable = GUICtrlCreateLabel("Damage/sec: ", 320, 151, 102, 17)
	$weapon_chit_ability_lable = GUICtrlCreateLabel("Critical Hit Ability: ", 172, 151, 120, 17, 0)
	$weapon_hit_ability_lable = GUICtrlCreateLabel("Hit Ability: ", 55, 151, 85, 17, 0)
	$weapon_broken_enhancers_lable = GUICtrlCreateLabel("Broken Enhancers: ", 56, 176, 122, 17)
	$weapon_total_decay_lable = GUICtrlCreateLabel("Total Decay:  PED", 200, 176, 156, 17)
	$reset_weapon_current = GUICtrlCreateButton("Reset", 616, 176, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group28 = GUICtrlCreateGroup("[ History ]", 40, 240, 673, 129)
	$weapon_hit_count_history_lable = GUICtrlCreateLabel("Total Hits: ", 55, 265, 85, 17, 0)
	$weapon_chit_count_history_lable = GUICtrlCreateLabel("Total Critical Hits: ", 172, 265, 119, 17, 0)
	$weapon_miss_count_history_lable = GUICtrlCreateLabel("Total Misses: ", 322, 265, 99, 17, 0)
	$weapon_use_count_history_lable = GUICtrlCreateLabel("Total Uses: ", 448, 265, 91, 17, 0)
	$weapon_totaldmg_history_lable = GUICtrlCreateLabel("Total Damage: ", 571, 265, 125, 17, 0)
	$weapon_skills_pec_history_lable = GUICtrlCreateLabel("Skills/PEC: ", 592, 295, 93, 17)
	$weapon_dmg_pec_history_lable = GUICtrlCreateLabel("Damage/PEC: ", 448, 295, 109, 17)
	$weapon_dmg_s_history_lable = GUICtrlCreateLabel("Damage/sec: ", 320, 295, 102, 17)
	$weapon_chit_ability_history_lable = GUICtrlCreateLabel("Critical Hit Ability: ", 172, 295, 120, 17, 0)
	$weapon_hit_ability_history_lable = GUICtrlCreateLabel("Hit Ability: ", 55, 295, 85, 17, 0)
	$weapon_broken_enhancers_history_lable = GUICtrlCreateLabel("Broken Enhancers: ", 56, 320, 122, 17)
	$weapon_total_decay_history_lable = GUICtrlCreateLabel("Total Decay:  PED", 200, 320, 156, 17)
	$reset_weapon_history = GUICtrlCreateButton("Reset", 616, 320, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$TabSheet3 = GUICtrlCreateTabItem("Healing Tools")
	$Tool_tab_f1 = GUICtrlCreateGroup("[ Healing Tool 1 ]", 24, 40, 705, 105)
	$use_count_lable_f1 = GUICtrlCreateLabel("Total Uses: ", 39, 65, 91, 17)
	$total_heal_lable_f1 = GUICtrlCreateLabel("Total Heals: ", 144, 65, 112, 17)
	$heals_s_lable_f1 = GUICtrlCreateLabel("Heals/Sec: ", 272, 65, 91, 17)
	$heals_pec_lable_f1 = GUICtrlCreateLabel("Heals/PEC: ", 376, 65, 99, 17)
	$skills_pec_lable_f1 = GUICtrlCreateLabel("PEC/Skill: ", 488, 65, 91, 17)
	$current_f1 = GUICtrlCreateButton("Current", 640, 64, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetTip(-1, "Switch to Current Session")
	GUICtrlSetState(-1, $GUI_HIDE)
	GUICtrlSetState(-1, @SW_DISABLE)
	$reset_f1 = GUICtrlCreateButton("Reset", 640, 96, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetTip(-1, "Reset Current Session")
	$history_f1 = GUICtrlCreateButton("History", 640, 64, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetTip(-1, "Switch to History")
	$Tool_tab_f2 = GUICtrlCreateGroup("[ Healing Tool 2 ]", 24, 160, 705, 105)
	$use_count_lable_f2 = GUICtrlCreateLabel("Total Uses: ", 39, 185, 91, 17)
	$total_heal_lable_f2 = GUICtrlCreateLabel("Total Heals: ", 144, 185, 112, 17)
	$heals_s_lable_f2 = GUICtrlCreateLabel("Heals/Sec: ", 272, 185, 91, 17)
	$heals_pec_lable_f2 = GUICtrlCreateLabel("Heals/PEC: ", 376, 185, 99, 17)
	$skills_pec_lable_f2 = GUICtrlCreateLabel("PEC/Skill: ", 488, 185, 91, 17)
	$reset_f2 = GUICtrlCreateButton("Reset", 640, 216, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetTip(-1, "Reset Current Session")
	$history_f2 = GUICtrlCreateButton("History", 640, 184, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetTip(-1, "Switch to History")
	$current_f2 = GUICtrlCreateButton("Current", 640, 184, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetTip(-1, "Switch to Current Session")
	GUICtrlSetState(-1, $GUI_HIDE)
	GUICtrlSetState(-1, @SW_DISABLE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Tool_tab_f3 = GUICtrlCreateGroup("[ Healing Tool 3 ]", 24, 280, 705, 105)
	$use_count_lable_f3 = GUICtrlCreateLabel("Total Uses: ", 39, 305, 91, 17)
	$total_heal_lable_f3 = GUICtrlCreateLabel("Total Heals: ", 144, 305, 112, 17)
	$heals_s_lable_f3 = GUICtrlCreateLabel("Heals/Sec: ", 272, 305, 91, 17)
	$heals_pec_lable_f3 = GUICtrlCreateLabel("Heals/PEC: ", 376, 305, 99, 17)
	$skills_pec_lable_f3 = GUICtrlCreateLabel("PEC/Skill: ", 488, 305, 91, 17)
	$reset_f3 = GUICtrlCreateButton("Reset", 640, 336, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetTip(-1, "Reset Current Session")
	$history_f3 = GUICtrlCreateButton("History", 640, 304, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetTip(-1, "Switch to History")
	$current_f3 = GUICtrlCreateButton("Current", 640, 304, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetTip(-1, "Switch to Current Session")
	GUICtrlSetState(-1, $GUI_HIDE)
	GUICtrlSetState(-1, @SW_DISABLE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$TabSheet4 = GUICtrlCreateTabItem("Skills")
	$Group8 = GUICtrlCreateGroup("[ Attributes ]", 24, 40, 705, 55)
	$agility_lable = GUICtrlCreateLabel("Agility: ", 40, 64, 67, 17)
	$strength_lable = GUICtrlCreateLabel("Strength: ", 356, 64, 80, 17)
	$stamina_lable = GUICtrlCreateLabel("Stamina: ", 279, 64, 78, 17)
	$psyche_lable = GUICtrlCreateLabel("Psyche: ", 204, 64, 75, 17)
	$intelligence_lable = GUICtrlCreateLabel("Intelligence: ", 109, 64, 94, 17)
	$history_skills = GUICtrlCreateButton("History", 560, 56, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetTip(-1, "Switch to History")
	$reset_skills = GUICtrlCreateButton("Reset", 640, 56, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetTip(-1, "Reset Current Session")
	$current_skills = GUICtrlCreateButton("Current", 560, 56, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetTip(-1, "Switch to Current Session")
	GUICtrlSetState(-1, $GUI_HIDE)
	GUICtrlSetState(-1, @SW_DISABLE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group9 = GUICtrlCreateGroup("[ General Skills ]", 25, 99, 705, 80)
	$alertness_lable = GUICtrlCreateLabel("Alertness: ", 41, 124, 83, 17)
	$athletics_lable = GUICtrlCreateLabel("Athletics: ", 125, 124, 80, 17)
	$bravado_lable = GUICtrlCreateLabel("Bravado: ", 205, 124, 80, 17)
	$coolness_lable = GUICtrlCreateLabel("Coolness: ", 285, 124, 83, 17)
	$courage_lable = GUICtrlCreateLabel("Courage: ", 370, 124, 80, 17)
	$dexterity_lable = GUICtrlCreateLabel("Dexterity: ", 450, 124, 81, 17)
	$intuition_lable = GUICtrlCreateLabel("Intuition: ", 530, 124, 77, 17)
	$perception_lable = GUICtrlCreateLabel("Perception: ", 610, 124, 91, 17)
	$quickness_lable = GUICtrlCreateLabel("Quickness: ", 41, 149, 90, 17)
	$serendipity_lable = GUICtrlCreateLabel("Serendipity: ", 132, 149, 92, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group10 = GUICtrlCreateGroup("[ Combat ]", 24, 182, 705, 156)
	$aim_lable = GUICtrlCreateLabel("Aim: ", 40, 207, 57, 17)
	$clubs_lable = GUICtrlCreateLabel("Clubs: ", 99, 207, 66, 17)
	$combat_reflexes_lable = GUICtrlCreateLabel("Combat Reflexes: ", 169, 207, 120, 17)
	$combat_sense_lable = GUICtrlCreateLabel("Combat Sense: ", 289, 207, 109, 17)
	$commando_lable = GUICtrlCreateLabel("Commando: ", 399, 207, 93, 17)
	$handgun_lable = GUICtrlCreateLabel("Handgun: ", 489, 207, 84, 17)
	$heavy_melee_weapons_lable = GUICtrlCreateLabel("Heavy Melee Weapons: ", 574, 207, 152, 17)
	$heavy_weapons_lable = GUICtrlCreateLabel("Heavy Weapons: ", 40, 232, 120, 17)
	$inflict_melee_damage_lable = GUICtrlCreateLabel("Inflict Melee Damage: ", 159, 232, 140, 17)
	$inflict_ranged_damgae_lable = GUICtrlCreateLabel("Inflict Ranged Damage: ", 299, 232, 149, 17)
	$kill_strike_lable = GUICtrlCreateLabel("Kill Strike: ", 449, 232, 83, 17)
	$light_melee_weapons_lable = GUICtrlCreateLabel("Light Melee Weapons: ", 534, 232, 144, 17)
	$longblades_lable = GUICtrlCreateLabel("Longblades: ", 40, 257, 95, 17)
	$marksmanship_lable = GUICtrlCreateLabel("Marksmanship: ", 134, 257, 108, 17)
	$martial_arts_lable = GUICtrlCreateLabel("Martial Arts: ", 244, 257, 92, 17)
	$melee_combat_lable = GUICtrlCreateLabel("Melee Combat: ", 339, 257, 108, 17)
	$melee_damage_assessment_lable = GUICtrlCreateLabel("Melee Damage Assessment: ", 449, 257, 171, 17)
	$power_fist_lable = GUICtrlCreateLabel("Power Fist: " & $skill_count_power_fist, 619, 257, 89, 17)
	$ranged_damage_assessment_lable = GUICtrlCreateLabel("Ranged Damage Assessment: ", 40, 282, 180, 17)
	$rifle_lable = GUICtrlCreateLabel("Rifle: ", 219, 282, 61, 17)
	$shortblades_lable = GUICtrlCreateLabel("Shortblades: ", 279, 282, 96, 17)
	$support_weapon_systems_lable = GUICtrlCreateLabel("Support Weapon Systems: ", 374, 282, 163, 17)
	$weapons_handling_lable = GUICtrlCreateLabel("Weapons Handling: ", 539, 282, 131, 17)
	$whip_lable = GUICtrlCreateLabel("Whip: ", 40, 307, 65, 17)
	$wounding_lable = GUICtrlCreateLabel("Wounding: ", 109, 307, 89, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group11 = GUICtrlCreateGroup("[ Medical ]", 24, 344, 705, 55)
	$anatomy_lable = GUICtrlCreateLabel("Anatomy: ", 40, 369, 81, 17)
	$diagnosis_lable = GUICtrlCreateLabel("Diagnosis: ", 124, 369, 86, 17)
	$doctor_lable = GUICtrlCreateLabel("Doctor: ", 209, 369, 72, 17)
	$first_aid_lable = GUICtrlCreateLabel("First Aid: ", 284, 369, 77, 17)
	$medical_therapy_lable = GUICtrlCreateLabel("Medical Therapy: ", 364, 369, 119, 17)
	$medicine_lable = GUICtrlCreateLabel("Medicine: ", 484, 369, 83, 17)
	$treatment_lable = GUICtrlCreateLabel("Treatment: ", 569, 369, 88, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group12 = GUICtrlCreateGroup("[ Mindforce ]", 24, 407, 705, 80)
	$bioregenesis_lable = GUICtrlCreateLabel("Bioregenesis: ", 40, 432, 100, 17)
	$concentration_lable = GUICtrlCreateLabel("Concentration: ", 139, 432, 106, 17)
	$cryogenics_lable = GUICtrlCreateLabel("Cryogenics: ", 244, 432, 92, 17)
	$electrokinesis_lable = GUICtrlCreateLabel("Electrokinesis: ", 339, 432, 105, 17)
	$force_merge_lable = GUICtrlCreateLabel("Force Merge: ", 444, 432, 100, 17)
	$jamming_lable = GUICtrlCreateLabel("Jamming: ", 544, 432, 81, 17)
	$mindforce_harmony_lable = GUICtrlCreateLabel("Mindforce Harmony: ", 40, 457, 132, 17)
	$power_catalyst_lable = GUICtrlCreateLabel("Power Catalyst: ", 174, 457, 110, 17)
	$pyrokinesis_lable = GUICtrlCreateLabel("Pyrokinesis: ", 284, 457, 93, 17)
	$sweat_gatherer_lable = GUICtrlCreateLabel("Sweat Gatherer: ", 374, 457, 114, 17)
	$telepathy_lable = GUICtrlCreateLabel("Telepathy: ", 489, 457, 87, 17)
	$translocation_lable = GUICtrlCreateLabel("Translocation: ", 574, 457, 104, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group13 = GUICtrlCreateGroup("[ Defense ]", 24, 495, 705, 55)
	$avoidance_lable = GUICtrlCreateLabel("Avoidance: ", 40, 520, 91, 17)
	$dispense_decoy_lable = GUICtrlCreateLabel("Dispense Decoy: ", 134, 520, 118, 17)
	$dodge_lable = GUICtrlCreateLabel("Dodge: ", 254, 520, 72, 17)
	$evade_lable = GUICtrlCreateLabel("Evade: ", 329, 520, 71, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlSetState($TabSheet1, $GUI_SHOW)
	GUICtrlCreateTabItem("")
	$File = GUICtrlCreateMenu("&File")
	$exit = GUICtrlCreateMenuItem("Exit", $File)
	GUICtrlSetOnEvent(-1, "window_events")
	$Edit = GUICtrlCreateMenu("&Edit")
	$Settings = GUICtrlCreateMenuItem("Settings", $Edit)
	GUICtrlSetOnEvent(-1, "window_events")
	$min_tray = GUICtrlCreateMenuItem("Minimize to Tray", $Edit)
	GUICtrlSetOnEvent(-1, "min_tray")
	$Help = GUICtrlCreateMenu("&Help")
	$about = GUICtrlCreateMenuItem("About", $Help)
	GUICtrlSetOnEvent(-1, "window_events")
	$online_help = GUICtrlCreateMenuItem("Online Help", $Help)
	GUICtrlSetOnEvent(-1, "window_events")
	$statusbar = _GUICtrlStatusBar_Create($main_window)
	_GUICtrlStatusBar_SetText($statusbar, $item)
	#endregion ;~ Main Window
	#region ;~ Settings Window
	$settings_window = GUICreate("Settings", 753, 605, 0, -20, BitOR($WS_SYSMENU, $WS_POPUP, $WS_POPUPWINDOW, $WS_BORDER, $WS_CLIPSIBLINGS), $ws_ex_mdichild, $main_window)
	$Tab1_1 = GUICtrlCreateTab(-2, 2, 753, 561)
	GUICtrlSetResizing(-1, $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
	#region ;~ Weapons
	$TabSheet5 = GUICtrlCreateTabItem("Weapons")
	$weapon1_button = GUICtrlCreateButton("Weapon 1", 16, 31, 75, 25)
	GUICtrlSetOnEvent(-1, "settings_events")
	GUICtrlSetState(-1, $GUI_DISABLE_1)
	$weapon2_button = GUICtrlCreateButton("Weapon 2", 144, 31, 75, 25)
	GUICtrlSetOnEvent(-1, "settings_events")
	$weapon3_button = GUICtrlCreateButton("Weapon 3", 273, 31, 75, 25)
	GUICtrlSetOnEvent(-1, "settings_events")
	$weapon4_button = GUICtrlCreateButton("Weapon 4", 401, 31, 75, 25)
	GUICtrlSetOnEvent(-1, "settings_events")
	$weapon5_button = GUICtrlCreateButton("Weapon 5", 530, 31, 75, 25)
	GUICtrlSetOnEvent(-1, "settings_events")
	$weapon6_button = GUICtrlCreateButton("Weapon 6", 658, 31, 75, 25)
	GUICtrlSetOnEvent(-1, "settings_events")
	$weapon_id_group = GUICtrlCreateGroup("[ Weapon 1 ]", 17, 69, 715, 489)
	$Group30 = GUICtrlCreateGroup("[ Weapon Files ]", 32, 94, 685, 89)
	$Label94 = GUICtrlCreateLabel("Weapon Profile:", 47, 118, 80, 17)
	$weapon_profile_input = GUICtrlCreateInput("", 132, 117, 488, 21, $GUI_SS_DEFAULT_INPUT)
	$change_weapon_profile_button = GUICtrlCreateButton("Change", 623, 115, 75, 25)
	GUICtrlSetOnEvent(-1, "settings_events")
	$Label95 = GUICtrlCreateLabel("Weapon Stats:", 47, 150, 75, 17)
	$weapon_stats_input = GUICtrlCreateInput("", 132, 149, 488, 21, $GUI_SS_DEFAULT_INPUT)
	$change_weapon_stats_button = GUICtrlCreateButton("Change", 623, 147, 75, 25)
	GUICtrlSetOnEvent(-1, "settings_events")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group31 = GUICtrlCreateGroup("[ Weapon Info ]", 32, 200, 685, 97)
	$Label32 = GUICtrlCreateLabel("Weapon Name:", 47, 225, 79, 17, 0)
	$weapon_name_input = GUICtrlCreateInput("", 131, 223, 113, 21, $GUI_SS_DEFAULT_INPUT)
	$Label34 = GUICtrlCreateLabel("Attacks/min:", 254, 225, 64, 17, 0)
	$weapon_attacks_input = GUICtrlCreateInput("", 322, 223, 25, 21, $GUI_SS_DEFAULT_INPUT)
	$Label58 = GUICtrlCreateLabel("Decay in PEC:", 461, 225, 73, 17, 0)
	$weapon_decay_input = GUICtrlCreateInput("", 537, 223, 50, 21, $GUI_SS_DEFAULT_INPUT)
	$weapon_ammo_input = GUICtrlCreateInput("", 400, 223, 50, 21, $GUI_SS_DEFAULT_INPUT)
	$Label59 = GUICtrlCreateLabel("Ammo:", 360, 225, 36, 17, 0)
	$amp_ammo_input = GUICtrlCreateInput("", 248, 261, 50, 21, $GUI_SS_DEFAULT_INPUT)
	$Label75 = GUICtrlCreateLabel("Ammo:", 206, 263, 36, 17, 0)
	$amp_decay_input = GUICtrlCreateInput("", 151, 261, 50, 21, $GUI_SS_DEFAULT_INPUT)
	$Label77 = GUICtrlCreateLabel("Amp Decay in PEC:", 47, 263, 97, 17, 0)
	$Label97 = GUICtrlCreateLabel("Mark Up % :", 600, 225, 62, 17)
	$weapon_markup_input = GUICtrlCreateInput("", 666, 223, 30, 21)
	GUICtrlSetTip(-1, "For Unlimited Items use 100%")
	$Label98 = GUICtrlCreateLabel("Mark Up % :", 312, 263, 62, 17)
	$amp_markup_input = GUICtrlCreateInput("", 378, 261, 30, 21)
	GUICtrlSetTip(-1, "For Unlimited Items use 100%")
	$weapon_key_lable = GUICtrlCreateLabel("Weapon Hotkey: Middle Mouse Button", 445, 263, 188, 17, 0)
	$setkey_input_weapons = GUICtrlCreateButton("Set", 645, 255, 50, 26)
	GUICtrlSetOnEvent(-1, "settings_events")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group14 = GUICtrlCreateGroup("[ Enhancers ]", 32, 310, 685, 182)
	$Label86 = GUICtrlCreateLabel("Accuracy", 47, 342, 49, 17)
	$Label87 = GUICtrlCreateLabel("Damage", 47, 364, 44, 17)
	$Label90 = GUICtrlCreateLabel("Economy", 47, 386, 48, 17)
	$Label92 = GUICtrlCreateLabel("Range", 47, 408, 36, 17)
	$Label93 = GUICtrlCreateLabel("Skill Modification", 47, 430, 83, 17)
	$Group32 = GUICtrlCreateGroup("[  I  ]", 136, 320, 41, 161)
	$weapon_enhancer_I_markup_input = GUICtrlCreateInput("", 141, 456, 30, 21)
	$accuracy_I_input = GUICtrlCreateCheckbox("", 150, 341, 14, 17)
	GUICtrlSetTip(-1, "Accuracy I")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_I")
	$damage_I_input = GUICtrlCreateCheckbox("", 150, 363, 14, 17)
	GUICtrlSetTip(-1, "Damage I")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_I")
	$weapon_economy_I_input = GUICtrlCreateCheckbox("", 150, 386, 14, 17)
	GUICtrlSetTip(-1, "Economy I")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_I")
	$range_I_input = GUICtrlCreateCheckbox("", 150, 408, 14, 17)
	GUICtrlSetTip(-1, "Range I")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_I")
	$weapon_skill_modification_I_input = GUICtrlCreateCheckbox("", 150, 430, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification I")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_I")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Label96 = GUICtrlCreateLabel("Mark Up % :", 47, 460, 62, 17)
	$Group33 = GUICtrlCreateGroup("[  II ]", 193, 320, 41, 161)
	$weapon_enhancer_II_markup_input = GUICtrlCreateInput("", 198, 456, 30, 21)
	$accuracy_II_input = GUICtrlCreateCheckbox("", 207, 341, 14, 17)
	GUICtrlSetTip(-1, "Accuracy II")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_II")
	$damage_II_input = GUICtrlCreateCheckbox("damage_II_input", 207, 363, 14, 17)
	GUICtrlSetTip(-1, "Damage II")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_II")
	$weapon_economy_II_input = GUICtrlCreateCheckbox("", 207, 386, 14, 17)
	GUICtrlSetTip(-1, "Economy II")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_II")
	$range_II_input = GUICtrlCreateCheckbox("", 207, 408, 14, 17)
	GUICtrlSetTip(-1, "Range II")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_II")
	$weapon_skill_modification_II_input = GUICtrlCreateCheckbox("", 207, 430, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification II")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_II")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group35 = GUICtrlCreateGroup("[ III ]", 251, 320, 41, 161)
	$weapon_enhancer_III_markup_input = GUICtrlCreateInput("", 256, 456, 30, 21)
	$accuracy_III_input = GUICtrlCreateCheckbox("", 265, 341, 14, 17)
	GUICtrlSetTip(-1, "Accuracy III")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_III")
	$damage_III_input = GUICtrlCreateCheckbox("", 265, 363, 14, 17)
	GUICtrlSetTip(-1, "Damage III")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_III")
	$weapon_economy_III_input = GUICtrlCreateCheckbox("", 265, 386, 14, 17)
	GUICtrlSetTip(-1, "Economy III")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_III")
	$range_III_input = GUICtrlCreateCheckbox("", 265, 408, 14, 17)
	GUICtrlSetTip(-1, "Range III")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_III")
	$weapon_skill_modification_III_input = GUICtrlCreateCheckbox("", 265, 430, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification III")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_III")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group34 = GUICtrlCreateGroup("[ IV ]", 308, 320, 41, 161)
	$weapon_enhancer_IV_markup_input = GUICtrlCreateInput("", 313, 456, 30, 21)
	$accuracy_IV_input = GUICtrlCreateCheckbox("", 322, 341, 14, 17)
	GUICtrlSetTip(-1, "Accuracy IV")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_IV")
	$damage_IV_input = GUICtrlCreateCheckbox("", 322, 363, 14, 17)
	GUICtrlSetTip(-1, "Damage IV")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_IV")
	$weapon_economy_IV_input = GUICtrlCreateCheckbox("", 322, 386, 14, 17)
	GUICtrlSetTip(-1, "Economy IV")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_IV")
	$range_IV_input = GUICtrlCreateCheckbox("", 322, 408, 14, 17)
	GUICtrlSetTip(-1, "Range IV")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_IV")
	$weapon_skill_modification_IV_input = GUICtrlCreateCheckbox("", 322, 430, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification IV")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_IV")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group36 = GUICtrlCreateGroup("[  V ]", 365, 320, 41, 161)
	$weapon_enhancer_V_markup_input = GUICtrlCreateInput("", 370, 456, 30, 21)
	$accuracy_V_input = GUICtrlCreateCheckbox("", 379, 341, 14, 17)
	GUICtrlSetTip(-1, "Accuracy V")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_V")
	$damage_V_input = GUICtrlCreateCheckbox("", 379, 363, 14, 17)
	GUICtrlSetTip(-1, "Damage V")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_V")
	$weapon_economy_V_input = GUICtrlCreateCheckbox("", 379, 386, 14, 17)
	GUICtrlSetTip(-1, "Economy V")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_V")
	$range_V_input = GUICtrlCreateCheckbox("", 379, 408, 14, 17)
	GUICtrlSetTip(-1, "Range V")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_V")
	$weapon_skill_modification_V_input = GUICtrlCreateCheckbox("", 379, 430, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification V")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_V")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group37 = GUICtrlCreateGroup("[ VI ]", 423, 320, 41, 161)
	$weapon_enhancer_VI_markup_input = GUICtrlCreateInput("", 428, 456, 30, 21)
	$accuracy_IV_inpu = GUICtrlCreateCheckbox("", 437, 341, 14, 17)
	GUICtrlSetTip(-1, "Accuracy VI")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_VI")
	$damage_VI_input = GUICtrlCreateCheckbox("", 437, 363, 14, 17)
	GUICtrlSetTip(-1, "Damage VI")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_VI")
	$weapon_economy_VI_input = GUICtrlCreateCheckbox("", 437, 386, 14, 17)
	GUICtrlSetTip(-1, "Economy VI")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_VI")
	$range_VI_input = GUICtrlCreateCheckbox("", 437, 408, 14, 17)
	GUICtrlSetTip(-1, "Range VI")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_VI")
	$weapon_skill_modification_VI_input = GUICtrlCreateCheckbox("", 437, 430, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification VI")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_VI")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group38 = GUICtrlCreateGroup("[ VII]", 480, 320, 41, 161)
	$weapon_enhancer_VII_markup_input = GUICtrlCreateInput("", 485, 456, 30, 21)
	$accuracy_VII_input = GUICtrlCreateCheckbox("", 494, 341, 14, 17)
	GUICtrlSetTip(-1, "Accuracy VII")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_VII")
	$damage_VII_input = GUICtrlCreateCheckbox("", 494, 363, 14, 17)
	GUICtrlSetTip(-1, "Damage VII")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_VII")
	$weapon_economy_VII_input = GUICtrlCreateCheckbox("", 494, 386, 14, 17)
	GUICtrlSetTip(-1, "Economy VII")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_VII")
	$range_VII_input = GUICtrlCreateCheckbox("", 494, 408, 14, 17)
	GUICtrlSetTip(-1, "Range VII")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_VII")
	$weapon_skill_modification_VII_input = GUICtrlCreateCheckbox("", 494, 430, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification VII")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_VII")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group39 = GUICtrlCreateGroup("[VIII]", 537, 320, 41, 161)
	$weapon_enhancer_VIII_markup_input = GUICtrlCreateInput("", 542, 456, 30, 21)
	$accuracy_VIII_input = GUICtrlCreateCheckbox("", 551, 341, 14, 17)
	GUICtrlSetTip(-1, "Accuracy VIII")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_VIII")
	$damage_VIII_input = GUICtrlCreateCheckbox("", 551, 363, 14, 17)
	GUICtrlSetTip(-1, "Damage VIII")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_VIII")
	$weapon_economy_VIII_input = GUICtrlCreateCheckbox("", 551, 386, 14, 17)
	GUICtrlSetTip(-1, "Economy VIII")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_VIII")
	$range_VIII_input = GUICtrlCreateCheckbox("", 551, 408, 14, 17)
	GUICtrlSetTip(-1, "Range VIII")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_VIII")
	$weapon_skill_modification_VIII_input = GUICtrlCreateCheckbox("", 551, 430, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification VIII")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_VIII")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group41 = GUICtrlCreateGroup("[ IX ]", 595, 320, 41, 161)
	$weapon_enhancer_IX_markup_input = GUICtrlCreateInput("", 600, 456, 30, 21)
	$accuracy_IX_input = GUICtrlCreateCheckbox("", 609, 341, 14, 17)
	GUICtrlSetTip(-1, "Accuracy IX")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_IX")
	$damage_IX_input = GUICtrlCreateCheckbox("", 609, 363, 14, 17)
	GUICtrlSetTip(-1, "Damage IX")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_IX")
	$weapon_economy_IX_input = GUICtrlCreateCheckbox("", 609, 386, 14, 17)
	GUICtrlSetTip(-1, "Economy IX")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_IX")
	$range_IX_input = GUICtrlCreateCheckbox("", 609, 408, 14, 17)
	GUICtrlSetTip(-1, "Range IX")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_IX")
	$weapon_skill_modification_IX_input = GUICtrlCreateCheckbox("", 609, 430, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification IX")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_IX")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group40 = GUICtrlCreateGroup("[ X ]", 652, 320, 41, 161)
	$weapon_enhancer_X_markup_input = GUICtrlCreateInput("", 657, 456, 30, 21)
	$accuracy_X_input = GUICtrlCreateCheckbox("", 666, 341, 14, 17)
	GUICtrlSetTip(-1, "Accuracy X")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_X")
	$damage_X_input = GUICtrlCreateCheckbox("", 666, 363, 14, 17)
	GUICtrlSetTip(-1, "Damage X")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_X")
	$weapon_economy_X_input = GUICtrlCreateCheckbox("", 666, 386, 14, 17)
	GUICtrlSetTip(-1, "Economy X")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_X")
	$range_X_input = GUICtrlCreateCheckbox("", 666, 408, 14, 17)
	GUICtrlSetTip(-1, "Range X")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_X")
	$weapon_skill_modification_X_input = GUICtrlCreateCheckbox("", 666, 430, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification X")
	GUICtrlSetOnEvent(-1, "weapon_enhancer_events_X")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	#endregion ;~ Weapons
	#region ;~ Tools
	$TabSheet1_1 = GUICtrlCreateTabItem("Medical Tools")
	$tool1_button = GUICtrlCreateButton("Tool 1", 15, 31, 75, 25)
	GUICtrlSetState(-1, $GUI_DISABLE_1)
	GUICtrlSetOnEvent(-1, "settings_events")
	$tool2_button = GUICtrlCreateButton("Tool 2", 144, 31, 75, 25)
	GUICtrlSetOnEvent(-1, "settings_events")
	$tool3_button = GUICtrlCreateButton("Tool 3", 272, 31, 75, 25)
	GUICtrlSetOnEvent(-1, "settings_events")
	$Group1 = GUICtrlCreateGroup("[ Tool 1 ]", 16, 69, 715, 489)
	$Group48 = GUICtrlCreateGroup("[ Tool Files ]", 31, 94, 685, 89)
	$Label7 = GUICtrlCreateLabel("Tool Profile:", 46, 118, 60, 17)
	$tool_profile_input = GUICtrlCreateInput("", 107, 117, 432, 21, $GUI_SS_DEFAULT_INPUT)
	$change_tool_profile_button = GUICtrlCreateButton("Change", 550, 115, 75, 25)
	GUICtrlSetOnEvent(-1, "settings_events")
	$change_tool_stats_button = GUICtrlCreateButton("Change", 550, 147, 75, 25)
	GUICtrlSetOnEvent(-1, "settings_events")
	$tool_stats_input = GUICtrlCreateInput("", 107, 149, 432, 21, $GUI_SS_DEFAULT_INPUT)
	$Label8 = GUICtrlCreateLabel("Tool Stats:", 46, 150, 55, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group49 = GUICtrlCreateGroup("[ Tool Info ]", 31, 200, 685, 97)
	$Label9 = GUICtrlCreateLabel("Tool Name:", 46, 225, 59, 17, 0)
	$tool_name_input = GUICtrlCreateInput("", 106, 223, 241, 21, $GUI_SS_DEFAULT_INPUT)
	$Label10 = GUICtrlCreateLabel("Uses/min:", 365, 225, 52, 17, 0)
	$tool_uses_input = GUICtrlCreateInput("", 418, 223, 25, 21, $GUI_SS_DEFAULT_INPUT)
	$Label11 = GUICtrlCreateLabel("Decay in PEC:", 460, 225, 73, 17, 0)
	$tool_decay_input = GUICtrlCreateInput("", 536, 223, 50, 21, $GUI_SS_DEFAULT_INPUT)
	$Label15 = GUICtrlCreateLabel("Mark Up % :", 599, 225, 62, 17)
	$tool_markup_input = GUICtrlCreateInput("", 665, 223, 30, 21)
	GUICtrlSetTip(-1, "For Unlimited Items use 100%")
	$tool_key_lable = GUICtrlCreateLabel("Tool Hotkey: ", 46, 263, 168, 17, 0)
	$setkey_input_tools = GUICtrlCreateButton("Set", 230, 255, 50, 26)
	GUICtrlSetOnEvent(-1, "settings_events")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group2 = GUICtrlCreateGroup("[ Enhancers ]", 31, 310, 685, 134)
	$Label2 = GUICtrlCreateLabel("Heal", 46, 334, 26, 17)
	$Label3 = GUICtrlCreateLabel("Economy", 46, 355, 48, 17)
	$Label5 = GUICtrlCreateLabel("Skill Modification", 46, 375, 83, 17)
	$Group11 = GUICtrlCreateGroup("[  I  ]", 135, 320, 41, 113)
	$tool_enhancer_I_markup_input = GUICtrlCreateInput("", 140, 400, 30, 21)
	$heal_enhancer_I_input = GUICtrlCreateCheckbox("", 149, 336, 14, 17)
	GUICtrlSetTip(-1, "Heal I")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_I")
	$tool_economy_I_input = GUICtrlCreateCheckbox("", 149, 356, 14, 17)
	GUICtrlSetTip(-1, "Economy I")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_I")
	$tool_skill_modification_I_input = GUICtrlCreateCheckbox("", 149, 375, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification I")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_I")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Label6 = GUICtrlCreateLabel("Mark Up % :", 46, 404, 62, 17)
	$Group12 = GUICtrlCreateGroup("[  II ]", 192, 320, 41, 113)
	$tool_enhancer_II_markup_input = GUICtrlCreateInput("", 197, 400, 30, 21)
	$heal_enhancer_II_input = GUICtrlCreateCheckbox("damage_II_input", 206, 336, 14, 17)
	GUICtrlSetTip(-1, "Heal II")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_II")
	$tool_economy_II_input = GUICtrlCreateCheckbox("tool_economy_II_input", 206, 356, 14, 17)
	GUICtrlSetTip(-1, "Economy II")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_II")
	$tool_skill_modification_II_input = GUICtrlCreateCheckbox("", 206, 375, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification II")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_II")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group16 = GUICtrlCreateGroup("[ III ]", 250, 320, 41, 113)
	$tool_enhancer_III_markup_input = GUICtrlCreateInput("", 255, 400, 30, 21)
	$heal_enhancer_III_input = GUICtrlCreateCheckbox("", 264, 336, 14, 17)
	GUICtrlSetTip(-1, "Heal III")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_III")
	$tool_economy_III_input = GUICtrlCreateCheckbox("", 264, 356, 14, 17)
	GUICtrlSetTip(-1, "Economy III")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_III")
	$tool_skill_modification_III_input = GUICtrlCreateCheckbox("", 264, 375, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification III")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_III")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group13 = GUICtrlCreateGroup("[ IV ]", 307, 320, 41, 113)
	$tool_enhancer_IV_markup_input = GUICtrlCreateInput("", 312, 400, 30, 21)
	$heal_enhancer_IV_input = GUICtrlCreateCheckbox("", 321, 336, 14, 17)
	GUICtrlSetTip(-1, "Heal IV")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_IV")
	$tool_economy_IV_input = GUICtrlCreateCheckbox("", 321, 356, 14, 17)
	GUICtrlSetTip(-1, "Economy IV")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_IV")
	$tool_skill_modification_IV_input = GUICtrlCreateCheckbox("", 321, 375, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification IV")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_IV")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group42 = GUICtrlCreateGroup("[  V ]", 364, 320, 41, 113)
	$tool_enhancer_V_markup_input = GUICtrlCreateInput("", 369, 400, 30, 21)
	$heal_enhancer_V_input = GUICtrlCreateCheckbox("", 378, 336, 14, 17)
	GUICtrlSetTip(-1, "Heal V")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_V")
	$tool_economy_V_input = GUICtrlCreateCheckbox("", 378, 356, 14, 17)
	GUICtrlSetTip(-1, "Economy V")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_V")
	$tool_skill_modification_V_input = GUICtrlCreateCheckbox("", 378, 375, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification V")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_V")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group43 = GUICtrlCreateGroup("[ VI ]", 422, 320, 41, 113)
	$tool_enhancer_VI_markup_input = GUICtrlCreateInput("", 427, 400, 30, 21)
	$heal_enhancer_VI_input = GUICtrlCreateCheckbox("", 436, 336, 14, 17)
	GUICtrlSetTip(-1, "Heal VI")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_VI")
	$tool_economy_VI_input = GUICtrlCreateCheckbox("", 436, 356, 14, 17)
	GUICtrlSetTip(-1, "Economy VI")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_VI")
	$tool_skill_modification_VI_input = GUICtrlCreateCheckbox("", 436, 375, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification VI")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_VI")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group44 = GUICtrlCreateGroup("[ VII]", 479, 320, 41, 113)
	$tool_enhancer_VII_markup_input = GUICtrlCreateInput("", 484, 400, 30, 21)
	$heal_enhancer_VII_input = GUICtrlCreateCheckbox("", 493, 336, 14, 17)
	GUICtrlSetTip(-1, "Heal VII")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_VII")
	$tool_economy_VII_input = GUICtrlCreateCheckbox("", 493, 356, 14, 17)
	GUICtrlSetTip(-1, "Economy VII")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_VII")
	$tool_skill_modification_VII_input = GUICtrlCreateCheckbox("", 493, 375, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification VII")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_VII")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group45 = GUICtrlCreateGroup("[VIII]", 536, 320, 41, 113)
	$tool_enhancer_VIII_markup_input = GUICtrlCreateInput("", 541, 400, 30, 21)
	$heal_enhancer_VIII_input = GUICtrlCreateCheckbox("", 550, 336, 14, 17)
	GUICtrlSetTip(-1, "Heal VIII")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_VIII")
	$tool_economy_VIII_input = GUICtrlCreateCheckbox("", 550, 356, 14, 17)
	GUICtrlSetTip(-1, "Economy VIII")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_VIII")
	$tool_skill_modification_VIII_input = GUICtrlCreateCheckbox("", 550, 375, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification VIII")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_VIII")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group47 = GUICtrlCreateGroup("[ IX ]", 594, 320, 41, 113)
	$tool_enhancer_IX_markup_input = GUICtrlCreateInput("", 599, 400, 30, 21)
	$heal_enhancer_IX_input = GUICtrlCreateCheckbox("", 608, 336, 14, 17)
	GUICtrlSetTip(-1, "Heal IX")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_IX")
	$tool_economy_IX_input = GUICtrlCreateCheckbox("", 608, 356, 14, 17)
	GUICtrlSetTip(-1, "Economy IX")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_IX")
	$tool_skill_modification_IX_input = GUICtrlCreateCheckbox("", 608, 375, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification IX")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_IX")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group46 = GUICtrlCreateGroup("[ X ]", 651, 320, 41, 113)
	$tool_enhancer_X_markup_input = GUICtrlCreateInput("", 656, 400, 30, 21)
	$heal_enhancer_X_input = GUICtrlCreateCheckbox("", 665, 336, 14, 17)
	GUICtrlSetTip(-1, "Heal X")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_X")
	$tool_economy_X_input = GUICtrlCreateCheckbox("", 665, 356, 14, 17)
	GUICtrlSetTip(-1, "Economy X")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_X")
	$tool_skill_modification_X_input = GUICtrlCreateCheckbox("", 665, 375, 14, 17)
	GUICtrlSetTip(-1, "Skill Modification X")
	GUICtrlSetOnEvent(-1, "tool_enhancer_events_X")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	#endregion ;~ Tools
	#region ;~ Global Capture
	$TabSheet7 = GUICtrlCreateTabItem("Global Capture")
	$Group25 = GUICtrlCreateGroup("[ Global Capture Settings ] ", 16, 48, 705, 497)
	$Label38 = GUICtrlCreateLabel("Captured Images Folder:", 31, 73, 119, 17)
	$capture_folder_input = GUICtrlCreateInput("", 151, 71, 208, 21)
	$capture_folder_input_button = GUICtrlCreateButton("Browse", 370, 69, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	$Label70 = GUICtrlCreateLabel("Capture Delay:", 463, 73, 74, 17)
	$capture_delay_input = GUICtrlCreateInput("500", 543, 71, 40, 21)
	$Label71 = GUICtrlCreateLabel("msec", 588, 73, 29, 17)
	$Group19 = GUICtrlCreateGroup("[ Avatar Capture Settings ]", 31, 100, 665, 60)
	$Label37 = GUICtrlCreateLabel("Full Avatar Name:", 150, 125, 88, 17)
	$avatar_name_input = GUICtrlCreateInput("", 238, 123, 208, 21)
	$Label73 = GUICtrlCreateLabel("Enable Capture", 46, 125, 77, 17)
	$enable_global_capture_avatar_input = GUICtrlCreateCheckbox("", 126, 125, 17, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group22 = GUICtrlCreateGroup("[ Team Capture Settings ]", 31, 172, 665, 60)
	$Label76 = GUICtrlCreateLabel("Team Name:", 150, 197, 65, 17)
	$team_name_input = GUICtrlCreateInput("", 214, 195, 208, 21)
	$Label89 = GUICtrlCreateLabel("Enable Capture", 46, 197, 79, 17)
	$enable_global_capture_team_input = GUICtrlCreateCheckbox("", 126, 197, 17, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group21 = GUICtrlCreateGroup("[ Folder Structure Settings ]", 31, 240, 665, 57)
	$Label69 = GUICtrlCreateLabel("Folder Structure:", 46, 265, 82, 17)
	$folder_structure_input = GUICtrlCreateInput("[M]-[Y]\[D]-[d]\[Type]", 136, 263, 208, 21)
	GUICtrlSetTip(-1, "Y = full year ie 2011, y = two digit year ie 11, M = Jan to Dec, m = 1 to 12" & @CRLF & "D = Sun to Sat, d = 01 to 31, Type = prnt_scr or hunting or crafting or mining")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group20 = GUICtrlCreateGroup("[ Image Settings ]", 31, 304, 665, 65)
	$image_type_bmp_input = GUICtrlCreateRadio("BMP", 112, 329, 41, 17)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetTip(-1, "BMP 32 Bit")
	$Label68 = GUICtrlCreateLabel("Image Type:", 46, 329, 63, 17)
	$image_type_jpeg_input = GUICtrlCreateRadio("JPEG", 160, 329, 45, 17)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetTip(-1, "JPEG")
	$jpeg_quality_input = GUICtrlCreateSlider(342, 319, 150, 37)
	GUICtrlSetOnEvent(-1, "window_events")
	GUICtrlSetLimit(-1, 4, 0)
	GUICtrlSetData(-1, 4)
	GUICtrlSetTip(-1, "0 = Poor , 4 = Best")
	$Label78 = GUICtrlCreateLabel("JPEG Quality Setting:", 232, 329, 105, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group27 = GUICtrlCreateGroup("[ Capture Types ]", 32, 376, 665, 82)
	$Group26 = GUICtrlCreateGroup("[ Hunting ]", 79, 401, 161, 49)
	$enable_hunting_globals_input = GUICtrlCreateCheckbox("Globals", 94, 426, 52, 17)
	GUICtrlSetState(-1, $GUI_CHECKED)
	$enable_hunting_hof_input = GUICtrlCreateCheckbox("Hall of Fames", 150, 426, 81, 17)
	GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group28 = GUICtrlCreateGroup("[ Mining ]", 280, 401, 161, 49)
	$enable_mining_globals_input = GUICtrlCreateCheckbox("Globals", 295, 426, 52, 17)
	GUICtrlSetState(-1, $GUI_CHECKED)
	$enable_mining_hof_input = GUICtrlCreateCheckbox("Hall of Fames", 351, 426, 81, 17)
	GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group29 = GUICtrlCreateGroup("[ Crafting ]", 480, 401, 161, 49)
	$enable_crafting_globals_input = GUICtrlCreateCheckbox("Globals", 495, 426, 52, 17)
	GUICtrlSetState(-1, $GUI_CHECKED)
	$enable_crafting_hof_input = GUICtrlCreateCheckbox("Hall of Fames", 551, 426, 81, 17)
	GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group23 = GUICtrlCreateGroup("[ Auto Position ]", 31, 465, 329, 57)
	$position_key_lable = GUICtrlCreateLabel("Key:  < None >", 182, 490, 75, 17)
	$setkey_input_position = GUICtrlCreateButton("Set", 283, 486, 50, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	$Label88 = GUICtrlCreateLabel("Enable position", 46, 490, 82, 17)
	$enable_position_input = GUICtrlCreateCheckbox("", 134, 490, 17, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group24 = GUICtrlCreateGroup("[ Auto Time Stamp ]", 367, 465, 329, 57)
	$time_stamp_key_lable = GUICtrlCreateLabel("Key:  < None >", 518, 490, 75, 17)
	$setkey_input_time_stamp = GUICtrlCreateButton("Set", 619, 486, 50, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	$Label91 = GUICtrlCreateLabel("Enable Time Stamp", 382, 490, 96, 17)
	$enable_time_stamp_input = GUICtrlCreateCheckbox("", 478, 490, 17, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	#endregion ;~ Global Capture
	#region ;~ General Settings
	$TabSheet3_1 = GUICtrlCreateTabItem("General Settings")
	$Group7 = GUICtrlCreateGroup("[Main Settings]", 17, 47, 705, 57)
	$Label36 = GUICtrlCreateLabel("Chat.log File location:", 32, 72, 105, 17, 0)
	$chatloglocation_input = GUICtrlCreateInput("", 141, 71, 496, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_READONLY))
	$chatloglocation_input_button = GUICtrlCreateButton("Change", 640, 69, 75, 25)
	GUICtrlSetOnEvent(-1, "window_events")
	$Warning_Sound_Group = GUICtrlCreateGroup("[ Warning Sound of Unregistered Item Damage/Heal ]", 16, 128, 705, 113)
	$Label12 = GUICtrlCreateLabel("Enable:", 31, 153, 40, 17)
	$Warning_sound_checkbox = GUICtrlCreateCheckbox("", 79, 153, 17, 17)
	GUICtrlSetState(-1, $GUI_CHECKED)
	$Label4 = GUICtrlCreateLabel("File:", 111, 154, 23, 17)
	$Warning_sound_file_input = GUICtrlCreateInput("", 140, 152, 496, 21)
	GUICtrlSetData(-1, @WindowsDir & "\media\windows balloon.wav")
	$Warning_sound_file_input_button = GUICtrlCreateButton("Browse", 639, 150, 75, 25)
	GUICtrlSetOnEvent(-1, "settings_events")
	$Label1 = GUICtrlCreateLabel("Volume Level:", 31, 200, 71, 17)
	$warning_sound_volume_slider = GUICtrlCreateSlider(104, 192, 150, 45)
	GUICtrlSetData(-1, 50)
	GUICtrlSetOnEvent(-1, "warning_sound_volume")
	$warning_sound_volume_test_button = GUICtrlCreateButton("Test", 264, 200, 75, 25)
	GUICtrlSetOnEvent(-1, "_play_sound")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	#endregion ;~ General Settings
	GUICtrlCreateTabItem("")
	$exit_settings = GUICtrlCreateButton("Exit", 648, 568, 75, 25, 0)
	GUICtrlSetOnEvent(-1, "settings_events")
	#endregion ;~ Settings Window
	#region ;~ About Window
	$about_window = GUICreate("About", 403, 239, 497, 261, BitOR($WS_SYSMENU, $WS_CAPTION, $WS_POPUP, $WS_POPUPWINDOW, $WS_BORDER, $WS_CLIPSIBLINGS), -1, $main_window)
	$Label1 = GUICtrlCreateLabel("Hunter Stat Logger - Open Source", 88, 16, 291, 28)
	GUICtrlSetFont(-1, 15, 400, 0, "MS Sans Serif")
	GUICtrlSetColor(-1, 0x0000FF)
	$Label2 = GUICtrlCreateLabel("This program is designed for those of us that are statisticaly hungry and", 16, 72, 337, 17)
	$Label3 = GUICtrlCreateLabel("it is Open Source for peer scrutiny for the communities security.", 16, 96, 302, 17)
	$Label4 = GUICtrlCreateLabel("", 16, 120, 102, 17)
	GUICtrlSetData(-1, "Version: " & $version)
	$Label5 = GUICtrlCreateLabel("", 16, 136, 152, 17)
	GUICtrlSetData(-1, "Release Date: " & $releasedate)
	$Label6 = GUICtrlCreateLabel("Web Site: http://www.EntropianServices.com", 16, 160, 223, 17)
	$Ok_about = GUICtrlCreateButton("Ok", 152, 200, 75, 25, 0)
	GUICtrlSetOnEvent(-1, "window_events")
	#endregion ;~ About Window
	#region ;~ HotKey Window
	$setkey = GUICreate("Press Key", 200, 50, 280, 250, BitOR($WS_SYSMENU, $WS_POPUP, $WS_POPUPWINDOW, $WS_BORDER, $WS_CLIPSIBLINGS), $ws_ex_mdichild, $settings_window)
	GUICtrlCreateLabel("Press the key/button of your item", 20, 10)
	GUICtrlCreateLabel("or Press Escape 'ESC' to cancel.", 20, 25)
	#endregion ;~ HotKey Window
EndFunc   ;==>GUI
#endregion ;~ GUI
#region ;~ Misc Funcs

Func Hextodec($Hex)
	Local $number = 0
	For $i = StringLen($Hex) To 1 Step -1
		$number += Dec(StringMid($Hex, $i, 1)) * 16 ^ (StringLen($Hex) - $i)
	Next
	Return $number
EndFunc   ;==>Hextodec

Func change_file_location($w, $y, $z)
	$newlocation = FileOpenDialog("Locate your " & $y & " file", $w, $z, 0, "", $settings_window)
	If $newlocation = "" Then
		$x = "<none>"
	Else
		$x = $newlocation
	EndIf
	Return $x
EndFunc   ;==>change_file_location

Func release_date()
	Local $t = FileGetTime(@ScriptFullPath, 1)
	Local $date = $t[2] & "-" & $t[1] & "-" & $t[0]
	Return $date
EndFunc   ;==>release_date
Func _SetWindowTheme($hHandle)
	Local $aReturn = DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($hHandle), "wstr", 0, "wstr", 0)
	If @error Then Return SetError(1, 1, 0)
	Return $aReturn[0]
EndFunc   ;==>_SetWindowTheme

Func fullscreen_check()
	Local $size = WinGetPos(WinGetHandle($title)), $x
	Select
		Case $size[0] = 0 And $size[1] = 0 And $size[2] >= @DesktopWidth And $size[3] >= @DesktopHeight
			Local $window_mode = True
		Case Else
			Local $window_mode = False
	EndSelect
	Return $window_mode
EndFunc   ;==>fullscreen_check
Func _play_sound()
	SoundPlay($Warning_sound_file)
	SoundSetWaveVolume($warning_sound_volume)
EndFunc   ;==>_play_sound
Func warning_sound_volume()
	Do
		$warning_sound_volume = GUICtrlRead($warning_sound_volume_slider)
		Local $i = 1
	Until $i = 1
EndFunc   ;==>warning_sound_volume

#endregion ;~ Misc Funcs

