Project not longer maintained, use https://github.com/ShockwaveNN/pocket-sinatra-interface instead

feedly-to-pocket
================
Semi-automatic export from feedly 'Saved for later' list to pocket

##Usage##

1. Login to your feedly account using Google Chrome
2. Open 'Saved for later' list
3. Scroll down to end of list (to load all items)
4. Open JavaScript Console
5. Insert this JS code: https://gist.github.com/ShockwaveNN/a0baf2ca26d1711f10e2
6. After step 5. browser will download file. Copy path of this file and use it as `filename` varibale in `feedly_to_pocket.rb`
7. `ruby feedly_to_pocket.rb`
