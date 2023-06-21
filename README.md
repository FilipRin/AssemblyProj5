# AssemblyProj5
C++ structure as assembly code: InputRequest { int* address; int size; InputRequest* next; } 
-------------------------------------------------------------------------------------------
ENG
- The given structure is struct InputRequest { int* address; int size; InputRequest*
next } which represents one request for an input operation using the DMA controller in the burst mode.
The address field contains the address starting from which the loaded data should be placed, the size field
contains how much data to load. Such structures are chained into a single list (field next
contains the address of the next request), and the address of the first structure in the list is 2000h. The last structure in the list
in its field next has the value 0. All fields of the structure are 16 bits wide and there is at least one in the list
a request. Write a program that processes one request at a time until the last one in the list is processed.
The interrupt routine for the DMA controller is located at address 3000h. The IV table is set, as well as the number of inputs
inside the entry register of the DMA controller. The main program should be placed starting from address 1000h.

SRB
- Data je struktura struct InputRequest { int* address; int size; InputRequest*
next; } koja predstavlja jedan zahtev za ulaznom operacijom korišćenjem DMA kontrolera u paketskom
režimu rada. Polje address sadrži adresu počev od koje treba smestiti učitane podatke, polje size
sadrži koliko podataka treba učitati. Ovakve strukture su ulančane u jednostruku listu (polje next
sadrži adresu narednog zahteva), a adresa prve strukture u listi je 2000h. Poslednja struktura u listi
u svom polju next ima vrednost 0. Sva polja strukture su širine 16 bita i u listi postoji bar jedan
zahtev. Napisati program koji obrađuje jedan po jedan zahtev sve dok se ne obradi poslednji u listi.
Prekidna rutina za DMA kontroler nalazi se na adresi 3000h. IV tabela je podešena, kao i broj ulaza
unutar entry registra DMA kontrolera. Glavni program treba smestiti počev od adrese 1000h.
