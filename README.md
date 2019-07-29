# gameOf3
A  game with two independent players 1 &amp; 2, leveraging interprocess communication (IPC).

![Alt Text](https://github.com/divyanshu-rawat/gameof3/blob/master/Workflow/gameof3.gif)

### GOAL ★

* When a player starts, it incepts a random (whole) number and sends it to the second player as an
  approach of starting the game.

*  The receiving player can now always choose between adding one of {-1,0,1} to get to a number that is divisible by 3.

* Divide it by three. The resulting whole number is thensent back to the original sender.

