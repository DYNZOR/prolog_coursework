%:- consult(et).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% START OF SIMPLIFICATION RULES %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sr([the|X],X).
sr([is|X],X).
sr([are|X],X).
sr([there|X],X).
sr([any|X],X).
sr([what|X],X).
sr([into|X],X).
sr([that|X],X).
sr([please|X],X).
sr([can|X],X).
sr([able|X],X).
sr([you|X],X).
sr([an|X],X).
sr([of|X],X).
sr([from|X],X).
sr([be|X],X).
sr([i|X],X).
sr([in|X],X).
sr([inside|X],X).
sr([within|X],X).
sr([would|X],X).
sr([we|X],X).
sr([to|X],X).
sr([my|X],X).
sr([mine|X],X).
sr([me|X],X).
sr([let|X],X).
sr([display|X],[show|X]).
sr([show|X],X).
sr([see|X],X).
sr([tell|X],X).
sr([place|X], X).
sr([put|X],X).
sr([now|X],X).
sr([possible|X],X).

% SR - Showing all files
sr([everything|X],[all,files|X]).
sr([all,content|X],[all,files|X]).
sr([the,content|X],[all,files|X]).
sr([content|X],[all,files|X]).
sr([all,the,files|X],[all,files|X]).
sr([each|X],[every|X]).



% Execute application
sr([launch|X],[execute|X]).
sr([run|X],[execute|X]).
sr([open|X],[execute|X]).
sr([start|X],[execute|X]).

% SR Web Browser



% SR Shutdown
sr([shutdown|_],[shutdown]).
sr([power,off|_],[shutdown]).
sr([power,off,system|_],[shutdown]).
sr([turn,off|_],[shutdown]).
sr([turn,off,system|_],[shutdown]).

% SR - Show current directory
sr([current,working|X], [current|X]).

% SR - Change
%sr([change|X],[switch|X]).


sr([directory|X],[folder|X]).

% SR - Change the name of file or folder
sr([change,the,name|X],[rename|X]).
sr([edit,the,name|X],[rename|X]).


% SR - Count files in directory/folder
sr([number|X], [count|X]).
sr([quantity|X], [count|X]).
sr([how,many|X], [count|X]).


% SR - Remove files
sr([delete|X],[remove|X]).
sr([erase|X],[remove|X]).
sr([eliminate|X],[remove|X]).


% SR - Move files
sr([carry|X], [move|X]).
sr([migrate|X], [move|X]).
sr([transfer|X], [move|X]).
sr([transport|X], [move|X]).
sr([relocate|X], [move|X]).


% SR - Copy files
sr([duplicate|X], [copy|X]).
sr([replicate|X], [copy|X]).



simplify(List,Result) :-
  sr(List,NewList),
  !,
  simplify(NewList,Result).

simplify([W|Words],[W|NewWords]) :-
  simplify(Words,NewWords).

simplify([],[]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% START OF TRANSLATION RULES %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Exit Commands - Translation Rules %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TR - System exiting

tr([quit],[quit]).
tr([exit],[quit]).
tr([leave],[quit]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Shutdown and Restart Commands - Translation Rules %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TR - Shutdown
tr([shutdown], ['sudo shutdown -s now']).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Switch and Show Directory Commands - Translation Rules %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TR - Show current working directory
tr([current,folder],['pwd']).

% TR - Switch current working directory
tr([switch,folder,X],['cd ',X]).
tr([switch,current,folder,X],['cd ',X]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% File Count Commands - Translation Rules %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TR - File count in directory/folder

tr([count,files,folder,X],['ls ',X,' | wc -l']).
tr([count,files,X,folder],['ls ',X,' | wc -l']).
tr([count,files,X],['ls ',X,' | wc -l']).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Execute Application Commands - Translation Rules %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% TR - Execute Google Chrome

tr([execute,chrome],['open -a "Google Chrome" --args']).
tr([execute,google,chrome],['open -a "Google Chrome" --args']).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Listing Commands - Translation Rules %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% TR - List all files in folder

tr([all,files,folder,X],['ls -l ',X]).
tr([all,files,X,folder],['ls -l ',X]).
tr([all,files,X],['ls -l ',X]).
tr([every,file,folder,X],['ls -l ',X]).
tr([every,file,X,folder],['ls -l ',X]).
tr([every,file,X],['ls -l ',X]).
tr([list,all,files,folder,X],['ls -l ',X]).
tr([list,all,files,X,folder],['ls -l ',X]).
tr([list,all,files,X],['ls -l ',X]).
tr([list,every,file,folder,X],['ls -l ',X]).
tr([list,every,file,X,folder],['ls -l ',X]).
tr([list,every,file,X],['ls -l ',X]).

% TR - List all files of type in folder

tr([all,Y,files,folder,X],['ls -l ',X,'/*.',Y]).
tr([all,Y,files,X,folder],['ls -l ',X,'/*.',Y]).
tr([all,Y,files,X],['ls -l ',X,'/*.',Y]).
tr([every,Y,file,folder,X],['ls -l ',X,'/*.',Y]).
tr([every,Y,file,X,folder],['ls -l ',X,'/*.',Y]).
tr([every,Y,file,X],['ls -l ',X,'/*.',Y]).
tr([list,all,Y,files,folder,X],['ls -l ',X,'/*.',Y]).
tr([list,all,Y,files,X,folder],['ls -l ',X,'/*.',Y]).
tr([list,all,Y,files,X],['ls -l ',X,'/*.',Y]).
tr([list,Y,files,folder,X],['ls -l ',X,'/*.',Y]).
tr([list,Y,files,X,folder],['ls -l ',X,'/*.',Y]).
tr([list,Y,files,X],['ls -l ',X,'/*.',Y]).
tr([list,every,Y,file,folder,X],['ls -l ',X,'/*.',Y]).
tr([list,every,Y,file,X,folder],['ls -l ',X,'/*.',Y]).
tr([list,every,Y,file,X],['ls -l ',X,'/*.',Y]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Copying Commands - Translation Rules %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TR - Copy all files from folder/directory to folder/directory

tr([copy,files,folder,X,folder,Y], ['cp -r ',X,'/* ',Y]).
tr([copy,files,X,folder,Y,folder], ['cp -r ',X,'/* ',Y]).
tr([copy,files,X,Y], ['cp -r ',X,'/* ',Y]).
tr([copy,all,files,folder,X,folder,Y], ['cp -r ',X,'/* ',Y]).
tr([copy,all,files,X,folder,Y,folder], ['cp -r ',X,'/* ',Y]).
tr([copy,all,files,X,Y], ['cp -r ',X,'/* ',Y]).
tr([copy,every,file,folder,X,folder,Y], ['cp -r ',X,'/* ',Y]).
tr([copy,every,file,X,folder,Y,folder], ['cp -r ',X,'/* ',Y]).
tr([copy,every,file,X,Y], ['cp -r ',X,'/* ',Y]).

% TR - Copy all files of type from folder/directory to folder/directory

tr([copy,Z,files,folder,X,folder,Y], ['cp ',X,'/*.',Z,' ',Y]).
tr([copy,Z,files,X,folder,Y,folder], ['cp ',X,'/*.',Z,' ',Y]).
tr([copy,Z,files,folder,X], ['cp *.',Z,' ',X]).
tr([copy,Z,files,X,folder], ['cp *.',Z,' ',X]).
tr([copy,all,Z,files,folder,X,folder,Y], ['cp ',X,'/*.',Z,' ',Y]).
tr([copy,all,Z,files,X,folder,Y,folder], ['cp ',X,'/*.',Z,' ',Y]).
tr([copy,all,Z,files,folder,X], ['cp *.',Z,' ',X]).
tr([copy,all,Z,files,X,folder], ['cp *.',Z,' ',X]).
tr([copy,every,Z,file,folder,X,folder,Y], ['cp ',X,'/*.',Z,' ',Y]).
tr([copy,every,Z,file,X,folder,Y,folder], ['cp ',X,'/*.',Z,' ',Y]).
tr([copy,every,Z,file,folder,X], ['cp *.',Z,' ',X]).
tr([copy,every,Z,file,X,folder], ['cp *.',Z,' ',X]).

% TR - Copy specific file/folder from folder/directory to folder/directory

tr([copy,file,Z,folder,X,folder,Y], ['cp ',X,'/',Z,' ',Y]).
tr([copy,file,Z,X,folder,Y,folder], ['cp ',X,'/',Z,' ',Y]).
tr([copy,file,Z,X,Y], ['cp ',X,'/',Z,' ',Y]).
tr([copy,folder,Z,folder,X,folder,Y], ['cp ',X,'/',Z,' ',Y]).
tr([copy,Z,folder,X,folder,Y,folder], ['cp ',X,'/',Z,' ',Y]).
tr([copy,folder,Z,X,Y], ['cp ',X,'/',Z,' ',Y]).
tr([copy,Z,folder,X,Y], ['cp ',X,'/',Z,' ',Y]).
tr([copy,file,Z,folder,X], ['cp ',Z,' ',X]).
tr([copy,file,Z,X,folder], ['cp ',Z,' ',X]).
tr([copy,file,Z,X], ['cp ',Z,' ',X]).
tr([copy,folder,Z,folder,X], ['cp ',Z,' ',X]).
tr([copy,Z,folder,X,folder], ['cp ',Z,' ',X]).
tr([copy,folder,Z,X], ['cp ',Z,' ',X]).
tr([copy,Z,folder,X,folder,Y], ['cp ',X,'/',Z,' ',Y]).
tr([copy,Z,X,folder,Y,folder], ['cp ',X,'/',Z,' ',Y]).
tr([copy,Z,X], ['cp ',Z,' ',X]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Removing Commands - Translation Rules %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% - Remove files from folder/directory

tr([remove,files,folder,X], ['rm -rf ',X,'/*']).
tr([remove,files,X,folder], ['rm -rf ',X,'/*']).
tr([remove,files,X], ['rm -rf ',X,'/*']).
tr([remove,all,files,folder,X], ['rm -rf ',X,'/*']).
tr([remove,all,files,X,folder], ['rm -rf ',X,'/*']).
tr([remove,all,files,X], ['rm -rf ',X,'/*']).
tr([remove,every,file,folder,X], ['rm -rf ',X,'/*']).
tr([remove,every,file,X,folder], ['rm -rf ',X,'/*']).
tr([remove,every,file,X], ['rm -rf ',X,'/*']).

% - Remove files of type from folder/directory

tr([remove,Y,files,folder,X], ['rm -rf ',X,'/*.',Y]).
tr([remove,Y,files,X,folder], ['rm -rf ',X,'/*.',Y]).
tr([remove,Y,files,X], ['rm -rf ',X,'/*.',Y]).
tr([remove,all,Y,files,folder,X], ['rm -rf ',X,'/*.',Y]).
tr([remove,all,Y,files,X,folder], ['rm -rf ',X,'/*.',Y]).
tr([remove,all,Y,files,X], ['rm -rf ',X,'/*.',Y]).
tr([remove,every,Y,file,folder,X], ['rm -rf ',X,'/*.',Y]).
tr([remove,every,Y,file,X,folder], ['rm -rf ',X,'/*.',Y]).
tr([remove,every,Y,file,X], ['rm -rf ',X,'/*.',Y]).

% TR - Remove specific file or folder from folder/directory

tr([remove,file,Y,folder,X], ['rm -rfi ',X,'/',Y]).
tr([remove,file,Y,X,folder], ['rm -rfi',X,'/',Y]).
tr([remove,folder,Y,folder,X], ['rm -rfi',X,'/',Y]).
tr([remove,Y,folder,X,folder], ['rm -rfi ',X,'/',Y]).
tr([remove,Y,folder,X], ['rm -rfi',X,'/',Y]).
tr([remove,folder,Z], ['rm -rfi',Z]).
tr([remove,Z,folder], ['rm -rfi',Z]).
tr([remove,file,Z], ['rm -rfi ',Z]).
tr([remove,Z], ['rm -rfi ',Z]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Moving Commands - Translation Rules %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TR - Move all files from folder/directory to another folder/directory

tr([move,files,folder,X,folder,Y], ['mv ',X,'/* ',Y]).
tr([move,files,X,folder,Y,folder], ['mv ',X,'/* ',Y]).
tr([move,files,X,Y], ['mv ',X,'/* ',Y]).
tr([move,files,Y], ['mv * ',Y]).
tr([move,all,files,folder,X,folder,Y], ['mv ',X,'/* ',Y]).
tr([move,all,files,X,folder,Y,folder], ['mv ',X,'/* ',Y]).
tr([move,all,files,X,Y], ['mv ',X,'/* ',Y]).
tr([move,all,files,Y], ['mv * ',Y]).
tr([move,every,file,folder,X,folder,Y], ['mv ',X,'/* ',Y]).
tr([move,every,file,X,folder,Y,folder], ['mv ',X,'/* ',Y]).
tr([move,every,file,X,Y], ['mv ',X,'/* ',Y]).
tr([move,every,file,Y], ['mv * ',Y]).

% TR - Move files of type from folder/directory to another folder/directory

tr([move,Z,files,folder,X,folder,Y], ['mv ',X,'/*.',Z,' ',Y]).
tr([move,Z,files,X,folder,Y,folder], ['mv ',X,'/*.',Z,' ',Y]).
tr([move,Z,files,X,Y], ['mv ',X,'/*.',Z,' ',Y]).
tr([move,Z,files,X,folder], ['mv *.',Z,' ',X]).
tr([move,Z,files,folder,X], ['mv *.',Z,' ',X]).

tr([move,all,Z,files,folder,X,folder,Y], ['mv ',X,'/*.',Z,' ',Y]).
tr([move,all,Z,files,X,folder,Y,folder], ['mv ',X,'/*.',Z,' ',Y]).
tr([move,all,Z,files,X,Y], ['mv ',X,'/*.',Z,' ',Y]).
tr([move,all,Z,files,folder,X], ['mv *.',Z,' ',X]).
tr([move,all,Z,files,X,folder], ['mv *.',Z,' ',X]).

tr([move,every,Z,file,folder,X,folder,Y], ['mv ',X,'/*.',Z,' ',Y]).
tr([move,every,Z,file,X,folder,Y,folder], ['mv ',X,'/*.',Z,' ',Y]).
tr([move,every,Z,file,X,Y], ['mv ',X,'/*.',Z,' ',Y]).
tr([move,every,Z,file,folder,X], ['mv *.',Z,' ',X]).
tr([move,every,Z,file,X,folder], ['mv *.',Z,' ',X]).

% TR - Move specific file or folder from folder/directory to another folder/directory

tr([move,file,Z,folder,X,folder,Y], ['mv ',X,'/',Z,' ',Y]).
tr([move,file,Z,X,folder,Y,folder], ['mv ',X,'/',Z,' ',Y]).
tr([move,file,Z,X,Y], ['mv ',X,'/',Z,' ',Y]).
tr([move,Z,X,folder,Y,folder], ['mv ',X,'/',Z,' ',Y]).
tr([move,Z,folder,X,folder,Y], ['mv ',X,'/',Z,' ',Y]).
tr([move,folder,Z,folder,X,folder,Y], ['mv ',X,'/',Z,' ',Y]).
tr([move,Z,folder,X,folder,Y,folder], ['mv ',X,'/',Z,' ',Y]).
tr([move,Z,folder,X,Y], ['mv ',X,'/',Z,' ',Y]).
tr([move,file,Z,X,folder], ['mv ',Z,' ',X]).
tr([move,file,Z,folder,X], ['mv ',Z,' ',X]).
tr([move,folder,Z,folder,X], ['mv ',Z,' ',X]).
tr([move,Z,folder,X,folder], ['mv ',Z,' ',X]).
tr([move,Z,folder,X], ['mv ',Z,' ',X]).
tr([move,Z,X,Y], ['mv ',X,'/',Z,' ',Y]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Renaming Commands - Translation Rules %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TR - Rename file or folder from X to Y
tr([rename,file,X,Y], ['mv ',X,' ',Y]).
tr([rename,X,file,Y], ['mv ',X,' ',Y]).
tr([rename,folder,X,Y], ['mv ',X,' ',Y]).
tr([rename,X,folder,Y], ['mv ',X,' ',Y]).
tr([rename,X,Y], ['mv ',X,' ',Y]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Size Commands - Translation Rules %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tr([size,folder,X],['du -cksh ',X,' | cut -f1 | tail -n1']).
tr([size,X,folder],['du -cksh ',X,' | cut -f1 | tail -n1']).
tr([how,big,folder,X],['du -cksh ',X,' | cut -f1 | tail -n1']).
tr([how,big,X,folder],['du -cksh ',X,' | cut -f1 | tail -n1']).
tr([size,file,X],['du -h ',X,' | cut -f1']).
tr([how,big,file,X],['du -h ',X,' | cut -f1']).
tr([size,X],['du -cksh ',X,' | cut -f1 | tail -n1']).
tr([how,big,X],['du -cksh ',X,' | cut -f1 | tail -n1']).
tr([size,file,X,folder,Y],['du -h ',Y,'/',X,' | cut -f1']).
tr([size,file,X,Y,folder],['du -h ',Y,'/',X,' | cut -f1']).


translate(Input,Result) :-
   tr(Input,Result),
   !.

translate(_,[]) :-
   write('I did not understand that command. Please try again...'),
   nl.

process_commands :-
  write('Hello? Is anyone there? I am a simple Prolog NLP application created by DMF'), nl,
  write('What do I do may you be asking?'), nl,
  write('At the moment I have been programmed to understand and translate to the following MacOs/Linux bash shell commands: '), nl,
  write('-- Shutdown the computer'), nl,
  write('-- Reboot the computer'), nl,
  write('-- Launch web browser'), nl,
  write('-- Show the current directory'), nl,
  write('-- Show files in a directory'), nl,
  write('-- Show the number of files in a directory'), nl,
  write('-- Show the size of a file or directory'), nl,
  write('-- Copy files'), nl,
  write('-- Move files'), nl,
  write('-- Delete files'), nl,
   repeat,
      nl, write('What can I do for you? - '), nl,
      tokenize_line(user,X),
      tokens_words(X,What),
      simplify(What,SimplifiedWords),
      translate(SimplifiedWords,Command),
      pass_to_os(Command),
      Command == [quit],
   !.

pass_to_os([])     :- !.

pass_to_os([quit]) :- !.

pass_to_os(Command) :-
   concat(Command,String),
   shell(String, show).


concat([H|T],Result) :-
   name(H,Hstring),
   concat(T,Tstring),
   append(Hstring,Tstring,Result).

concat([],[]).

append([H|T],L,[H|Rest]) :- append(T,L,Rest).
append([],L,L).
