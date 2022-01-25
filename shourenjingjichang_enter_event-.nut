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
			Text = "[img]gfx/ui/events/event_74.png[/img]Вы выходите из огромной крепости, и, к вашему удивлению, это оказывается лагерем орков. Появляются орки, и, к вашему удивлению, они говорят на человеческом языке. Привет, великие воины, эта арена построена мной, меня называют тренером орков, когда я был молод, я был военачальником, впоследствии я построил это место и тренировал молодых орков и сражался, если вы хотите попробовать, добро пожаловать вам сражаться, здесь вы можете найти могущественных врагов снаружи не видно!",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Погнали!",
					function getResult( _event )
					{
						return "B";
					}

				},
				{
					Text = "Не будем тревожить то, что здесь покоится.",
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
			Text = "[img]gfx/ui/events/event_67.png[/img]{Мастер орков вывел вас на арену и сказал, что игра устроена. Если ты хочешь сбежать сейчас, уже слишком поздно. Выбери соперника, включая меня. Потом он посмотрел на тебя с улыбкой.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "/любящий убивать/ Gargarus",
					function getResult( _event )
					{
						return "C";
					}

				},
				{
					Text = "/Великий Вождь/ Blake Andrey",
					function getResult( _event )
					{
						return "D";
					}

				},
				{
					Text = "/Похититель золота/ Kaluares",
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
					Text = "/Звуки из джунглей/ Трудитруды",
					function getResult( _event )
					{
						return "G";
					}

				},

				{
					Text = "Есть ли более сильный противник?",
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
			Text = "[img]gfx/ui/events/event_49.png[/img]{Мастер орков засмеялся после того, как вы выбрали, вы спросили его, почему он улыбается так счастлив, он ничего не сказал, за ним на арену вышел высокий орк, орки вокруг все взбодрились, кажется, что он, хорошо известный на арене, постепенно близко к нему, как вы, вы обнаружите, что дух орков не является нормальным!}",
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
			Text = "[img]gfx/ui/events/event_49.png[/img]{Вы выбрали /Великий Вождь/ Blake Andrey, и тут за дверью встала огромная фигура. Это самый большой и сильный орк, которого вы когда-либо видели. Сейчас уже поздно что-либо говорить. Вы можете выжить, только победив его!!!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Давайте убьем его!",
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
			Text = "[img]gfx/ui/events/event_93.png[/img]{ Вдалеке появился сверкающий орк, одетый в человеческое снаряжение. Он усмехнулся и выглядел так, будто готов был отнять у вас ваше оборудование, но этот парень был настолько богат, что вы могли бы с таким же успехом отрубить ему голову и забрать его коллекцию,}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Этот парень - сокровище. Возьмем его!",
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
			Text = "[img]gfx/ui/events/event_93.png[/img]{К вашему удивлению, вашим противником оказался молодой ORC. Вы спрашиваете мастера орков, что происходит. Он сказал медленно. Этот молодой орк победил трех военачальников орков. Может быть, он здесь самый молодой и самый потенциальный солдат.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Тогда давайте проучим этого юношу!",
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
			Text = "[img]gfx/ui/events/event_25.png[/img]{Волчий зов раздался издалека. Похоже, ваш противник немного необычен. Через мгновение на арену вышел высокий и крепкий орк, а за ним волки!!!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Разве это не арена орков?",
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
			Text = "[img]gfx/ui/events/event_67.png[/img]{Если вам кажется, что вышеперечисленного недостаточно, приглашаем вас бросить вызов более сильным воинам! Конечно, включая меня!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Орк мастер меча",
					function getResult( _event )
					{
						return "I";
					}

				},

				{
					Text = "Орк мастер",
					function getResult( _event )
					{
						return "J";
					}

				},

				{
					Text = "Орк-чернокнижник",
					function getResult( _event )
					{
						return "K";
					}

				},


				{
					Text = "/Орк страх/ Andre Woog",
					function getResult( _event )
					{
						return "L";
					}

				},


				{
					Text = "Тауренское чудовище",
					function getResult( _event )
					{
						return "M";
					}

				},

				{
					Text = "Посмотрим на наших предидущих врагов.",
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
			Text = "[img]gfx/ui/events/event_49.png[/img]{Орк внешне ничем не отличается, но Ваша интуиция подсказывает, что он не прост. Глядя на большой клинок в его руке, вы как будто видите напротив себя фехтовальщика.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Может, он фехтовальщик среди орков?",
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
			Text = "[img]gfx/ui/events/event_49.png[/img]{Мастер орков улыбнулся. Он ничего не сказал. Он повернулся и взял свой топор. После выхода на арену вокруг раздались аплодисменты. В это время он открыл рот. Жду игрока, который победит хозяина арены. Но я никогда этого не видел. Если вы это сделаете, я дам вам свой шлем и пару доспехов, которые я сделал сам. Они принесут вам великую силу, когда вы будете сражаться с орками. Конечно, эти две вещи сейчас на мне, шлем? Это на моей голове. Но с громким грохотом. Повелитель орков бросился ко мне и закричал, ты сможешь победить меня?}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Я покажу Вам, кому принадлежит эта арена.",
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
			Text = "[img]gfx/ui/events/event_29.png[/img]{Вы спрашиваете мастера орков о своем противнике, но он говорит, что не знает. Орк пришел не так давно, но число его сторонников растет день ото дня. Это его первое публичное соревнование. Никто не знает, какими способностями он обладает, но оркские военачальники и оркские солдаты, сражавшиеся с ним раньше, относятся к нему со странным уважением.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Загадочный парень.",
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
			Text = "[img]gfx/ui/events/event_93.png[/img]{Выйдя на арену, вы обнаружите, что ваш противник один. У вас есть подозрение, что что-то не так. На голове и теле орка странные линии, а зрителей вокруг все меньше и меньше. Кажется, что орк малоизвестен.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Это странно.",
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
			Text = "[img]gfx/ui/events/event_146.png[/img]{Мастер орков улыбнулся и сказал, что этот ребенок не наш орк. Я нашел его далеко в дикой природе и привез обратно. Я научил его боевым навыкам, чтобы он не был диким. Иди и попробуй его наемник. Он может быть более сильным, чем я.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Это Орк с коровьей головой!!!",
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
			Text = "[img]gfx/ui/events/event_65.png[/img]{После трудной битвы вы, наконец, победили. Может быть, на свете много таких сильных мужчин, думаете вы с глубоким вздохом. Мастер орков подошел и погладил тебя. Вы сказали, что ваши навыки действительно хороши. Это подарки для Вас. Вы можете продолжить здесь в любое время.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Молодцы ребята.",
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
			Text = "[img]gfx/ui/events/event_88.png[/img]Ты и твои братья были убиты орками! Уцелевшие просили поскорее уйти отсюда после простого переодевания. Мастер орков улыбнулся тебе и сказал: «Надеюсь, ты снова придешь сюда, когда станешь сильным».",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Давай выбираться отсюда.",
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
