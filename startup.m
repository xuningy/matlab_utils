% save starting directory
startdir = pwd ;
% specify arbitrary directory containing pathdef.m
pathdir = userpath ;
% change directory so that target 'pathdef.m' has highest precedence
% in the MATLAB search path
cd(pathdir)
% set the MATLAB search path using PATH
path(pathdef)
% change directory back to the starting directory
cd(startdir)