 * on joue dans la console, qui doit faire 80x24
 * chaque case peut être vide, ou contenir un pnj ou le joueur
 * le joueur commence en case `(0,23)` et a pour but de parvenir à la case `(79,0)`. à chaque instant il peut se déplacer vers les cases adjacentes.
 * les pnj commencent un peu partout
 * il y a un algorithme de classification qui observe le terminal, par exemple un réseau de neurones. l'input de ce réseau de neurones est 80x24x8, c'est-à-dire qu'il voit l'état de chaque case dans les 8 dernières positions du terminal (la position actuelle, plus l'historique des 7 instants précédents). mais pour chaque case, le réseau de neurone voit seulement "vide" ou "occupée", sans distinction entre les pnj et le joueur
 * l'output du réseau de neurones est 80x24 : pour chaque case, il doit indiquer un score entre 0% (je suis sûr que cette case ne contient pas le joueur) et 100% (je suis sûr que cette case contient le joueur)
 * le joueur commence avec une vie à 100%.
 * si le joueur se trouve sur la même case qu'un pnj à un instant donné, il occasionne des dégâts égaux à : `max(s - 50%, 0%)` où s est le score donné par le réseau de neurones à la case sur laquelle il se trouve. autrement dit, le joueur peut se trouver sur la même case qu'un pnj sans problèmes si le réseau de neurones l'a repéré à moins de 50%, mais il prend des dégâts s'il est repéré à plus de 50%. il va mourir très vite (en deux instants) s'il est sur la même case qu'un pnj en étant repéré à près de 100%.
 * initialement, les pnj se déplacent en suivant des patterns répétitives (par exemple, ils tournent en carré). mais en plus de ça, ils sont attirés par les cases auxquelles le réseau de neurones donne un score élevé.
