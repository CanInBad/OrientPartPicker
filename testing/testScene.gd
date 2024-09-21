extends SceneBase

func _init():
    sceneID = "partOrientTester"

func _run():
    match state:
        "":
            playAnimationForceReset(StageScene.Solo, "stand")
            sayn("[say=pc][b]The FitnessGram Pacer Test[/b] is a multistage aerobic capacity test that progressively gets more difficult as it continues. The 20 meter pacer test will begin in 30 seconds. Line up at the start. The running speed starts slowly but gets faster each minute after you hear this signal [i]*bodeboop*[/i]. A single lap should be completed every time you hear this sound. [i]*ding*[/i] Remember to run in a straight line and run as long as possible. The second time you fail to complete a lap before the sound, your test is over.\n\nThe test will begin on the word start.\n\nOn your mark.\n\nGet ready!…\n\n[b]Start.[/b][/say]")
            addButton("start first animation","Start the FitnessGram Pacer Test", "firstAnim")
            addButton("exit","THEY HAVE THE BALLS! TO GIVE ONE OF THE GREATEST SUPERHEROS OF ALL TIME A BAT CREDIT CARD??!!?!?","exit")
        "firstAnim":
            playAnimation(StageScene.Duo, "stand", {
                "npc": "pc",
            })
            sayn("duo normal")
            addButton("(reset) start second animation","","secondAnim")
            addButton("start third animation", "", "thirdAnim")
            addButton("go back", "", "")
        "secondAnim":
            sayn("reset then duo flipped")
            playAnimationForceReset(StageScene.Duo, "stand", {
                "npc": "pc",
                "flipNPC": true
            })
            addButton("(no reset) back to first anim","","firstAnim")
        "thirdAnim":
            sayn("duo flipped without resetting")
            playAnimation(StageScene.Duo, "stand", {
                "npc": "pc",
                "flipNPC": true
            })
            addButton("(no reset) back to first anim","","firstAnim")

        _:
            saynn("error")
            addButton("back to empty string state","the fitgram? real?","")

func _react(_action:String, _args):
    match _action:
        "exit":
            endScene()
            return
    
    setState(_action)