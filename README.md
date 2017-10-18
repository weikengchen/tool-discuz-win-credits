# A tool to win credits in Discuz! BBS systems

Some Discuz! BBS systems provide a reward system as follows:

You are registered in the BBS, and share the content to someone else. The website rewards you with some credit per unregistered user visit. 

There are some rules for this reward:
 - The same IP address counts for one reward during a given period.
 - The user accesses more than one webpage.
 - A few Discuz! BBS systems set a limit on the maximum reward per day.
 
Our system bypasses the IP address requirement by setting fake proxy IP addresses in the HTTP request header.
     
     X-Forwarded-For: AAA.BBB.CCC.DDD
 
where AAA.BBB.CCC.DDD is generated from random.
 
# How to use?
Please check the shuf tool is installed. For Ubuntu, it can be installed by:

     sudo apt install coreutils
     
For Mac, use brew to install:

     brew install coreutils
     
Then, edit the shell script, modify the fromuid to your uid in this website.

     # your user id from the website
     fromuid=47998

And set the website address, not ended by /.

     # the url of the website, not ended by /
     website="http://www.ustcjz.cn"
     
Then run it in the terminal.

     ./go.sh
