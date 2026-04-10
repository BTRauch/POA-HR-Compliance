@echo off

net use G: /del
net use H: /del
net use J: /del
net use K: /del
net use Q: /del
net use R: /del
net use U: /del
net use X: /del
net use W: /del
net use Z: /del

net use J: \\10.130.5.14\Common
net use Q: \\10.130.5.10\apps
net use R: \\10.130.5.14\Images
net use X: \\10.130.5.16\POA
net use Z: \\10.130.5.16\db


\\10.130.5.10\distrib$\PAR_Login.vbsc