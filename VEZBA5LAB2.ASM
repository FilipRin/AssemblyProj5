! inicijalizacija simulacije
dc x.4000, x.2000
dc x.2, x.2001
dc x.2100, x.2002
dc x.5000, x.2100
dc x.3, x.2101
dc x.2200, x.2102
dc x.6000, x.2200
dc x.4, x.2201
dc x.0, x.2202
ondma x.1, x.1
dmareg 1, r0, x.a
dmareg 1, r1, x.b
dmareg 1, r2, x.c
dmareg 1, r3, x.d
dmareg 1, interrupt, x.1
reg pc, x.1000
reg ivtp, x.0
dc x.3000, x.1
! kraj inicijalizacije

!gl prog
org x.1000

!init dma1.1
ldimm x.2000,r0 	!adresa prve strukt u r0
loop: ldrid [r0]x.0,r1	!u r1 adresa od koje treba smestati podatke, polje address se nalazi na r0+0h
	stmem x.f006,r1	!u AddressDest registart dma1.1
	ldrid [r0]x.1,r1	!size
	stmem x.f004,r1	!u count reg dma kontrolera
	
	clr r2		!semafor
	
	ldimm x.8f,r1
	stmem x.f000,r1 !start dma
	
	!ceka se da dma zavrsi obradu jednog zahteva
	ldimm x.1,r1	!za test
	wait: cmp r1,r2
		bneq wait	
	!prelazimo na sledeci zahtev
	ldrid [r0]x.2,r0	!next, smestamo ga ovde jer se u r0 nalazi adresa
	clr r1	!u r1 nula
	cmp r0,r1
	bneq loop
halt

!prek rutina dma
org x.3000
push r0
ldimm x.1,r2
clr r0
stmem x.f000,r0
pop r0
rti
	