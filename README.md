 

Most of the samples are not particularly interesting yet with the exception of BouncingBalls and Canon.
These are definitely worth checking out.
The code is complicated for beginners but just running them can be fun.


It should run with just a standard install of Processing, no libraries needed.



Installing Processing:

1) Go to Processing.org
2) Click Download on the left side
3) Click on your operating system (likely Windows 64-bit or Max OS X)
   This will download a zip archive named: processing-3.3.7-windows64.zip
4) The zip will need to be extracted, click on "Extract all" (toolbar, far right)
   Enter a location to extract, this can be anywhere.
   I'd recommend creating a folder \java for your programming tools.
5) In your folder you'll see a folder processing-3.3.7 with processing.exe
6) I'd recommend starting processing then right click on the icon in the taskbar to Pin.

Installing/Using Git:
Git is not required to see code, you can see it on the website. It is needed for testing/editing the code in Processing, VSCode, Etc.
INTIAL SETUP
1) https://git-scm.com/
2) Click Download on the right, it should detect your operating system.
3) Open the file. Don't change the defaults for the prefrences, just keep hitting next. It will install.
4) Make a folder named "Github" in your Documents.
GETTING TO GIT
5) WINDOWS: Open the search bar, and type "cmd". Open "Command Prompt".
6) type "cd Documents\Github"
USING GIT/COMMANDS
7) You are now in your github folder. Here, you can use
  git clone REPO_URL          Downloads a repository from the link. The link is available by clicking on the green "Clone/Download" 
                              button
  Our repositories are located in Team4567, https://github.com/Team4567. Ex. Processing, T-Shirt-Bot, PowerUp2018
8) You can use command prompt to do commands within these repos after they are cloned to your folder. 
  To enter a repo, type "cd REPO_NAME"
   Most of the time, you can start typing the repo name and hit TAB, and it should automatically complete the name.
9) Inside of these repos, you have these commands
  git status                  See if someone made changes after the version you have on your computer (if its up to date) if not, use 
                              git pull
  git pull                    Pulls the latest version of the repo to your computer if someone else has changed it since you cloned it
  git add --all               If you are contributing to it, after you save your changes, type this. It will detect your changes and 
                              prepare them for COMMIT and PUSH (Below)
  git commit -m "WHATEVER YOU WANT"                   Turns whatever was changed when you did git add --all into a commit, which can be                                                       sent to git for everyone to see in the quotes, write what you did.
  git push                    Sends your commit to github. Now your changes are public. Congrats!
  Read the command prompt, if theres an error it will commonly tell you why and how to fix it.
  We'll be adding more commands as time goes on. 
  
  To access any of these again, repeat 5-6
