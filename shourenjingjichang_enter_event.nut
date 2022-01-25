this.shourenjingjichang_enter_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.shourenjingjichang_enter_event";
		this.m.Title = "As you approach...";
		this.m.Cooldown = 0.0 * this.World.getTime().SecondsPerDay;
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_74.png[/img]Привет",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Let's goo!",
					function getResult( _event )
					{
						return "B";
					}

				},
				{
					Text = "Let\'s not disturb what rests here.",
					function getResult( _event )
					{
						if (this.World.State.getLastLocation() != null)
						{
							this.World.State.getLastLocation().setVisited(false);
						}

						return 0;
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_67.png[/img]{The orc master took you into the arena and said, the game has been arranged. If you want to escape now, it's too late. Choose an opponent, including me. Then he looked at you with a smile.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "/Kill-loving/ Gargarus",
					function getResult( _event )
					{
						return "C";
					}

				},
				{
					Text = "/Great Chief/ Blake Andrey",
					function getResult( _event )
					{
						return "D";
					}

				},
				{
					Text = "/Gold snatcher/ Kaluares",
					function getResult( _event )
					{
						return "E";
					}

				},
				{
					Text = "Glen",
					function getResult( _event )
					{
						return "F";
					}

				},

				{
					Text = "/Sounds from the jungle/ Truditrudi",
					function getResult( _event )
					{
						return "G";
					}

				},

				{
					Text = "Is there a stronger opponent?",
					function getResult( _event )
					{
						return "H";
					}

				}




			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/event_49.png[/img]{Orc master laugh after you choose, you asked him why he smile so happy, it didn't say anything, followed by a tall orc entered the arena, the orc around all cheer up, it seems that he, well known in the arena gradually close to it as you, you find that the orcs spirit is not normal!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Hope we survive this maniac!!",
					function getResult( _event )
					{
						if (this.World.State.getLastLocation() != null)
						{
							this.World.State.getLastLocation().setVisited(false);
						}

						local p = this.Const.Tactical.CombatInfo.getClone();
						p.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
						p.CombatID = "Arena";
						p.TerrainTemplate = "tactical.arena";
						p.LocationTemplate.Template[0] = "tactical.shourenjingjichang_floor";
						p.Music = this.Const.Music.OrcsTracks;
						p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.IsFleeingProhibited = true;
						p.IsLootingProhibited = false;
						p.IsWithoutAmbience = true;
						p.IsFogOfWarVisible = false;
						p.IsArenaMode = false;
						p.IsAutoAssigningBases = false;
						p.Entities = [];

						for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.Fengzi);
						}

                        for( local i = 0; i < 9; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcBerserker);
						}


						local f = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Orcs).getID();

						for( local i = 0; i < p.Entities.len(); i = ++i )
						{
							p.Entities[i].Faction <- f;
						}


						_event.registerToShowAfterCombat("Victory", "Defeat");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				}
			],
		});

		this.m.Screens.push({
			ID = "D",
			Text = "[img]gfx/ui/events/event_49.png[/img]{You chose the /Great Chief/ Blake Andrey, and then a huge figure stood up behind the door. This is the biggest and strongest Orc you have ever seen. It's too late to say anything now. You can only survive by defeating it!!!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Let's kill him!",
					function getResult( _event )
					{
						if (this.World.State.getLastLocation() != null)
						{
							this.World.State.getLastLocation().setVisited(false);
						}

						local p = this.Const.Tactical.CombatInfo.getClone();
						p.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
						p.CombatID = "Arena";
						p.TerrainTemplate = "tactical.arena";
						p.LocationTemplate.Template[0] = "tactical.shourenjingjichang_floor";
						p.Music = this.Const.Music.OrcsTracks;
						p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.IsFleeingProhibited = true;
						p.IsLootingProhibited = false;
						p.IsWithoutAmbience = true;
						p.IsFogOfWarVisible = false;
						p.IsArenaMode = false;
						p.IsAutoAssigningBases = false;
						p.Entities = [];

						for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.Daqiuzhang);
						}

                        for( local i = 0; i < 2; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcWarrior);
						}

                        for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcWarlord);
						}

                        for( local i = 0; i < 2; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcBerserker);
						}

                        for( local i = 0; i < 6; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcYoung);
						}

						local f = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Orcs).getID();

						for( local i = 0; i < p.Entities.len(); i = ++i )
						{
							p.Entities[i].Faction <- f;
						}


						_event.registerToShowAfterCombat("Victory", "Defeat");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				}
			],
		});


		this.m.Screens.push({
			ID = "E",
			Text = "[img]gfx/ui/events/event_93.png[/img]{ In the distance came a glistening orc covered in human gear. He grinned and looked like he was ready to rob you of your equipment, but this guy was so rich, you might as well cut off his head and take his collection,}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "This guy's a treasure. Let's take him!",
					function getResult( _event )
					{
						if (this.World.State.getLastLocation() != null)
						{
							this.World.State.getLastLocation().setVisited(false);
						}

						local p = this.Const.Tactical.CombatInfo.getClone();
						p.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
						p.CombatID = "Arena";
						p.TerrainTemplate = "tactical.arena";
						p.LocationTemplate.Template[0] = "tactical.shourenjingjichang_floor";
						p.Music = this.Const.Music.OrcsTracks;
						p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.IsFleeingProhibited = true;
						p.IsLootingProhibited = false;
						p.IsWithoutAmbience = true;
						p.IsFogOfWarVisible = false;
						p.IsArenaMode = false;
						p.IsAutoAssigningBases = false;
						p.Entities = [];

						for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.Shourenlueduozhe);
						}


						for( local i = 0; i < 21; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcYoung);
						}

                        for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcWarlord);
						}

						local f = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Orcs).getID();

						for( local i = 0; i < p.Entities.len(); i = ++i )
						{
							p.Entities[i].Faction <- f;
						}


						_event.registerToShowAfterCombat("Victory", "Defeat");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				}
			],
		});

		this.m.Screens.push({
			ID = "F",
			Text = "[img]gfx/ui/events/event_93.png[/img]{To your surprise, your opponent is a young ORC. You ask the orc master what's going on. He said slowly. This young Orc has defeated three Orc warlords. Maybe he is the youngest and most potential soldier here.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Then let's teach this young man a lesson!",
					function getResult( _event )
					{
						if (this.World.State.getLastLocation() != null)
						{
							this.World.State.getLastLocation().setVisited(false);
						}

						local p = this.Const.Tactical.CombatInfo.getClone();
						p.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
						p.CombatID = "Arena";
						p.TerrainTemplate = "tactical.arena";
						p.LocationTemplate.Template[0] = "tactical.shourenjingjichang_floor";
						p.Music = this.Const.Music.OrcsTracks;
						p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.IsFleeingProhibited = true;
						p.IsLootingProhibited = false;
						p.IsWithoutAmbience = true;
						p.IsFogOfWarVisible = false;
						p.IsArenaMode = false;
						p.IsAutoAssigningBases = false;
						p.Entities = [];


                        for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.Pochengzhe);
						}

                        for( local i = 0; i < 5; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcWarrior);
						}

                        for( local i = 0; i < 8; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcYoung);
						}


						local f = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Orcs).getID();

						for( local i = 0; i < p.Entities.len(); i = ++i )
						{
							p.Entities[i].Faction <- f;
						}


						_event.registerToShowAfterCombat("Victory", "Defeat");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				}
			],
		});

		this.m.Screens.push({
			ID = "G",
			Text = "[img]gfx/ui/events/event_25.png[/img]{The wolf's call came from a distance. It seems that your opponent is a little unusual. After a moment, a tall and burly Orc entered the arena, and behind him, there are wolves!!!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Isn't this the orc arena?",
					function getResult( _event )
					{
						if (this.World.State.getLastLocation() != null)
						{
							this.World.State.getLastLocation().setVisited(false);
						}

						local p = this.Const.Tactical.CombatInfo.getClone();
						p.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
						p.CombatID = "Arena";
						p.TerrainTemplate = "tactical.arena";
						p.LocationTemplate.Template[0] = "tactical.shourenjingjichang_floor";
						p.Music = this.Const.Music.OrcsTracks;
						p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.IsFleeingProhibited = true;
						p.IsLootingProhibited = false;
						p.IsWithoutAmbience = true;
						p.IsFogOfWarVisible = false;
						p.IsArenaMode = false;
						p.IsAutoAssigningBases = false;
						p.Entities = [];

                        for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.Xiongshou);
						}

						for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.Qiuzhang);
						}

                        for( local i = 0; i < 5; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcBerserker);
						}

                        for( local i = 0; i < 10; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.Direwolf);
						}



						local f = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Orcs).getID();

						for( local i = 0; i < p.Entities.len(); i = ++i )
						{
							p.Entities[i].Faction <- f;
						}


						_event.registerToShowAfterCombat("Victory", "Defeat");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				}
			],
		});

		this.m.Screens.push({
			ID = "H",
			Text = "[img]gfx/ui/events/event_67.png[/img]{If you think the above is not enough, you are welcome to challenge more powerful warriors! Of course, including me!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "The orc swordmaster",
					function getResult( _event )
					{
						return "I";
					}

				},

				{
					Text = "The orc master",
					function getResult( _event )
					{
						return "J";
					}

				},

				{
					Text = "The orc warlock",
					function getResult( _event )
					{
						return "K";
					}

				},


				{
					Text = "/The orc fear/ Andre Woog",
					function getResult( _event )
					{
						return "L";
					}

				},


				{
					Text = "Tauren monster",
					function getResult( _event )
					{
						return "M";
					}

				},

				{
					Text = "Let's take a look at our former enemies.",
					function getResult( _event )
					{
						return "B";
					}

				},


			],
			function start( _event )
			{
			}

		});

		this.m.Screens.push({
			ID = "I",
			Text = "[img]gfx/ui/events/event_49.png[/img]{The orc looks no different, but his intuition tells you that he is not simple. Looking at the big blade in his hand, you seem to see a swordsman opposite you.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Maybe he's a swordsman among the orcs?",
					function getResult( _event )
					{
						if (this.World.State.getLastLocation() != null)
						{
							this.World.State.getLastLocation().setVisited(false);
						}

						local p = this.Const.Tactical.CombatInfo.getClone();
						p.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
						p.CombatID = "Arena";
						p.TerrainTemplate = "tactical.arena";
						p.LocationTemplate.Template[0] = "tactical.shourenjingjichang_floor";
						p.Music = this.Const.Music.OrcsTracks;
						p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.IsFleeingProhibited = true;
						p.IsLootingProhibited = false;
						p.IsWithoutAmbience = true;
						p.IsFogOfWarVisible = false;
						p.IsArenaMode = false;
						p.IsAutoAssigningBases = false;
						p.Entities = [];

						for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.Balian);
						}


                        for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcWarlord);
						}

                        for( local i = 0; i < 5; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcWarrior);
						}

                        for( local i = 0; i < 8; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcYoung);
						}

                        for( local i = 0; i < 3; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcBerserker);
						}

						local f = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Orcs).getID();

						for( local i = 0; i < p.Entities.len(); i = ++i )
						{
							p.Entities[i].Faction <- f;
						}


						_event.registerToShowAfterCombat("Victory", "Defeat");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				}
			],
		});


		this.m.Screens.push({
			ID = "J",
			Text = "[img]gfx/ui/events/event_49.png[/img]{The orc master smiled. He didn't say anything. He turned and picked up his axe. After entering the arena, there were cheers around. At this time, he opened his mouth. I'm looking forward to a player who will defeat the owner of the arena. But I've never seen it. If you do, I'll give you my helmet, and I'll give you a pair of armor I made myself. They will bring you great power when you fight the orcs. Of course, these two things are on me now, helmet? It's on my head.But with a loud roar. The orc master rushed over and shouted, can you defeat me?}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "I'll let you know who owns this arena.",
					function getResult( _event )
					{
						if (this.World.State.getLastLocation() != null)
						{
							this.World.State.getLastLocation().setVisited(false);
						}

						local p = this.Const.Tactical.CombatInfo.getClone();
						p.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
						p.CombatID = "Arena";
						p.TerrainTemplate = "tactical.arena";
						p.LocationTemplate.Template[0] = "tactical.shourenjingjichang_floor";
						p.Music = this.Const.Music.OrcsTracks;
						p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.IsFleeingProhibited = true;
						p.IsLootingProhibited = false;
						p.IsWithoutAmbience = true;
						p.IsFogOfWarVisible = false;
						p.IsArenaMode = false;
						p.IsAutoAssigningBases = false;
						p.Entities = [];

						for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.Shourendashi);
						}

                        for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.Pochengzhe);
						}

                        for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.Daqiuzhang);
						}

                        for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.Fengzi);
						}

                        for( local i = 0; i < 3; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcWarrior);
						}

                        for( local i = 0; i < 8; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcYoung);
						}


						local f = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Orcs).getID();

						for( local i = 0; i < p.Entities.len(); i = ++i )
						{
							p.Entities[i].Faction <- f;
						}


						_event.registerToShowAfterCombat("Victory", "Defeat");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				}
			],
		});


		this.m.Screens.push({
			ID = "K",
			Text = "[img]gfx/ui/events/event_29.png[/img]{You ask the orc master about your opponent, but he says he doesn't know. The orc came not long ago, but his supporters are increasing day by day. This is its first time to compete in public. No one knows what ability it has, but the orc warlords and orc soldiers who fought with him before are strangely respectful to him.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Mysterious guy.",
					function getResult( _event )
					{
						if (this.World.State.getLastLocation() != null)
						{
							this.World.State.getLastLocation().setVisited(false);
						}

						local p = this.Const.Tactical.CombatInfo.getClone();
						p.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
						p.CombatID = "Arena";
						p.TerrainTemplate = "tactical.arena";
						p.LocationTemplate.Template[0] = "tactical.shourenjingjichang_floor";
						p.Music = this.Const.Music.OrcsTracks;
						p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.IsFleeingProhibited = true;
						p.IsLootingProhibited = false;
						p.IsWithoutAmbience = true;
						p.IsFogOfWarVisible = false;
						p.IsArenaMode = false;
						p.IsAutoAssigningBases = false;
						p.Entities = [];



						for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.Guerdan);
						}

                        for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.Shourenbusiren);
						}

                        for( local i = 0; i < 5; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.Shourenbusiren04);
						}

                        for( local i = 0; i < 5; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcYoung);
						}

                        for( local i = 0; i < 3; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcBerserker);
						}

                        for( local i = 0; i < 3; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcWarrior);
						}

						local f = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Orcs).getID();

						for( local i = 0; i < p.Entities.len(); i = ++i )
						{
							p.Entities[i].Faction <- f;
						}


						_event.registerToShowAfterCombat("Victory", "Defeat");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				}
			],
		});


		this.m.Screens.push({
			ID = "L",
			Text = "[img]gfx/ui/events/event_93.png[/img]{After entering the arena, you find that your opponent is alone. You have a hunch that something is wrong. There are strange lines on the orc's head and body, and there are fewer and fewer spectators around. It seems that the orc is very unknown.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "That's weird.",
					function getResult( _event )
					{
						if (this.World.State.getLastLocation() != null)
						{
							this.World.State.getLastLocation().setVisited(false);
						}

						local p = this.Const.Tactical.CombatInfo.getClone();
						p.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
						p.CombatID = "Arena";
						p.TerrainTemplate = "tactical.arena";
						p.LocationTemplate.Template[0] = "tactical.shourenjingjichang_floor";
						p.Music = this.Const.Music.OrcsTracks;
						p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.IsFleeingProhibited = true;
						p.IsLootingProhibited = false;
						p.IsWithoutAmbience = true;
						p.IsFogOfWarVisible = false;
						p.IsArenaMode = false;
						p.IsAutoAssigningBases = false;
						p.Entities = [];

						for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.Zuie02);
						}

						local f = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Orcs).getID();

						for( local i = 0; i < p.Entities.len(); i = ++i )
						{
							p.Entities[i].Faction <- f;
						}


						_event.registerToShowAfterCombat("Victory", "Defeat");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				}
			],
		});

		this.m.Screens.push({
			ID = "M",
			Text = "[img]gfx/ui/events/event_146.png[/img]{The orc master smiled and said, this child is not our ORC. I found him far away in the wild and brought him back. I taught him his fighting skills to make him less wild. Go and try the mercenary. He may be more powerful than me.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "It's an ORC with a cow's head!!!",
					function getResult( _event )
					{
						if (this.World.State.getLastLocation() != null)
						{
							this.World.State.getLastLocation().setVisited(false);
						}

						local p = this.Const.Tactical.CombatInfo.getClone();
						p.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
						p.CombatID = "Arena";
						p.TerrainTemplate = "tactical.arena";
						p.LocationTemplate.Template[0] = "tactical.shourenjingjichang_floor";
						p.Music = this.Const.Music.OrcsTracks;
						p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.IsFleeingProhibited = true;
						p.IsLootingProhibited = false;
						p.IsWithoutAmbience = true;
						p.IsFogOfWarVisible = false;
						p.IsArenaMode = false;
						p.IsAutoAssigningBases = false;
						p.Entities = [];

						for( local i = 0; i < 1; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.Niutoukuangzhanshi);
						}

                        for( local i = 0; i < 10; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcWarrior);
						}

                        for( local i = 0; i < 2; i = ++i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.OrcWarlord);
						}



						local f = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Orcs).getID();

						for( local i = 0; i < p.Entities.len(); i = ++i )
						{
							p.Entities[i].Faction <- f;
						}


						_event.registerToShowAfterCombat("Victory", "Defeat");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				}
			],
		});




		this.m.Screens.push({
			ID = "Victory",
			Text = "[img]gfx/ui/events/event_65.png[/img]{After a difficult battle, you finally won. Maybe there are many such strong men in the world, you think with deep breath. The orc master came over and patted you. You said that your skills are really good. These are gifts for you. You are welcome to continue here at any time. }",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Well done, guys.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				_event.m.Title = "After the battle...";


				this.World.Assets.getStash().makeEmptySlots(1);
				local item = this.new("scripts/items/loot/ancient_gold_coins_item");
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});
				this.World.Flags.set("IsLorekeeperDefeated", true);
				this.updateAchievement("Lorekeeper", 1, 1);
			}

		});
		this.m.Screens.push({
			ID = "Defeat",
			Text = "[img]gfx/ui/events/event_88.png[/img]You and your brothers were cut down by the orcs! The surviving people asked to leave here quickly after simple dressing. The orc master smiled at you and said, I hope you will come here again after you become strong.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Let's get out of here.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				_event.m.Title = "After the battle...";

				if (this.World.State.getLastLocation() != null)
				{
					this.World.State.getLastLocation().setVisited(false);
				}
			}

		});
	}



	function onUpdateScore()
	{
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
	}

});
