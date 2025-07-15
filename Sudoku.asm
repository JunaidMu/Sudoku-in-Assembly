[org 0x0100]

jmp start

;Start Screen
dot: db ' - ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- '
up: db 218,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191
mid: db 179
down: db 192,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,217

main: db 'WELCOME TO SUDOKU!!'
play: db 'Press a to Start'
end: db 'Press ESC to Exit'

lenup:dw 21
lendown: dw 21
lenmain: dw 19
lenplay: dw 16
lenexit: dw 17
lenmid: dw 1
lendot: dw 80

myprint:
push bp
mov bp,sp
push es
push ax
push cx
push si
push di

mov ax,0xb800
mov es,ax
mov al,80
mul byte[bp+10]
add ax,[bp+12]
shl ax,1
mov di,ax
mov si,[bp+6]
mov cx,[bp+4]
mov ah,[bp+8]


cld
nchar:
lodsb
stosw
loop nchar

pop di
pop si
pop cx
pop ax
pop es
pop bp
ret 10



printstart:
   
mov ax,0
push ax
mov ax,3
push ax
mov ax,0x70
push ax
mov ax,dot
push ax
push word[lendot]
call myprint


mov ax,30
push ax
mov ax,8
push ax
mov ax,0x70
push ax
mov ax,up
push ax
push word[lenup]
call myprint

mov ax,30
push ax
mov ax,9
push ax
mov ax,0x70
push ax
mov ax,mid
push ax
push word[lenmid]
call myprint

mov ax,31
push ax
mov ax,9
push ax
mov ax,0xF0
push ax
mov ax,main
push ax
push word[lenmain]
call myprint

mov ax,50
push ax
mov ax,9
push ax
mov ax,0X70
push ax
mov ax,mid
push ax
push word[lenmid]
call myprint

mov ax,30
push ax
mov ax,10
push ax
mov ax,0x70
push ax
mov ax,down
push ax
push word[lendown]
call myprint

mov ax,32
push ax
mov ax,12
push ax
mov ax,0x70
push ax
mov ax,play
push ax
push word[lenplay]
call myprint


mov ax,32
push ax
mov ax,14
push ax
mov ax,0x70
push ax
mov ax,end
push ax
push word[lenexit]
call myprint


mov ax,0
push ax
mov ax,22
push ax
mov ax,0x70
push ax
mov ax,dot
push ax
push word[lendot]
call myprint

ret

oldisr: dd 0
oldtimerisr: dd 0
scrolled: dw 0
started: dw 0
;line1s is the very first row with top left and right corners
line1s: db 218,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,191

;line1m is the middle row of the cell
line1m: db 195,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,180

lsp1:  db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179
line20:db 179,' 5 ',179,'   ',179,'   ',179,'   ',179,' 2 ',179,'   ',179,' 3 ',179,' 6 ',179,'   ',179
lsp2:  db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179

lsp3:  db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179
line21:db 179,'   ',179,'   ',179,'   ',179,' 6 ',179,'   ',179,' 7 ',179,' 5 ',179,' 1 ',179,' 9 ',179
lsp4:  db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179

lsp5:  db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179
line22:db 179,'   ',179,'   ',179,' 6 ',179,' 9 ',179,'   ',179,'   ',179,'   ',179,'   ',179,' 7 ',179
lsp6:  db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179

lsp7:  db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179
line23:db 179,'   ',179,'   ',179,'   ',179,'   ',179,' 1 ',179,'   ',179,'   ',179,'   ',179,'   ',179
lsp8:  db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179

lsp9:  db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179
line24:db 179,'   ',179,' 6 ',179,' 3 ',179,'   ',179,' 4 ',179,'   ',179,'   ',179,' 7 ',179,'   ',179
lsp10: db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179

lsp11: db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179
line25:db 179,' 8 ',179,'   ',179,' 2 ',179,'   ',179,'   ',179,' 6 ',179,' 1 ',179,' 9 ',179,' 5 ',179
lsp12: db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179

lsp13: db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179
line26:db 179,'   ',179,' 5 ',179,' 7 ',179,' 1 ',179,'   ',179,'   ',179,'   ',179,' 3 ',179,'   ',179
lsp14: db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179

lsp15: db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179
line27:db 179,' 4 ',179,'   ',179,'   ',179,' 7 ',179,'   ',179,' 3 ',179,'   ',179,'   ',179,'   ',179
lsp16: db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179

lsp17: db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179
line28:db 179,'   ',179,' 3 ',179,' 1 ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,' 8 ',179
lsp18: db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179





cgline20: db 179,' 5 ',179,' 7 ',179,' 9 ',179,' 8 ',179,' 2 ',179,' 1 ',179,' 3 ',179,' 6 ',179,' 4 ',179
cgline21: db 179,' 2 ',179,' 8 ',179,' 4 ',179,' 6 ',179,' 3 ',179,' 7 ',179,' 5 ',179,' 1 ',179,' 9 ',179
cgline22: db 179,' 3 ',179,' 1 ',179,' 6 ',179,' 9 ',179,' 5 ',179,' 4 ',179,' 2 ',179,' 8 ',179,' 7 ',179
cgline23: db 179,' 7 ',179,' 9 ',179,' 5 ',179,' 2 ',179,' 1 ',179,' 8 ',179,' 6 ',179,' 4 ',179,' 3 ',179
cgline24: db 179,' 1 ',179,' 6 ',179,' 3 ',179,' 5 ',179,' 4 ',179,' 9 ',179,' 8 ',179,' 7 ',179,' 2 ',179
cgline25: db 179,' 8 ',179,' 4 ',179,' 2 ',179,' 3 ',179,' 7 ',179,' 6 ',179,' 1 ',179,' 9 ',179,' 5 ',179
cgline26: db 179,' 9 ',179,' 5 ',179,' 7 ',179,' 1 ',179,' 8 ',179,' 2 ',179,' 4 ',179,' 3 ',179,' 6 ',179
cgline27: db 179,' 4 ',179,' 2 ',179,' 8 ',179,' 7 ',179,' 6 ',179,' 3 ',179,' 9 ',179,' 5 ',179,' 1 ',179
cgline28: db 179,' 6 ',179,' 3 ',179,' 1 ',179,' 4 ',179,' 9 ',179,' 5 ',179,' 7 ',179,' 2 ',179,' 8 ',179

;line3e is the very last row with bottom left and right corners
line3e: db 192,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,217

;NUMBER CARDS
linestart: db 218,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,191
lsp19: db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179
lsp20: db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179
line29:db 179,' 1 ',179,' 2 ',179,' 3 ',179,' 4 ',179,' 5 ',179,' 6 ',179,' 7 ',179,' 8 ',179,' 9 ',179
lsp21: db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179
lsp22: db 179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179,'   ',179
lineend: db 192,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,217

length1: dw 37
length: dw 37

pointers: dw lsp1,lsp2,lsp3,lsp4,lsp5,lsp6,lsp7,lsp8,lsp9,lsp10,lsp11,lsp12,lsp13,lsp14,lsp15,lsp16,lsp17,lsp18
datapointers:dw line20,line21,line22,line23,line24,line25,line26,line27,line28
cgpointers: dw cgline20,cgline21,cgline22,cgline23,cgline24,cgline25,cgline26,cgline27,cgline28

displaytimer:          db 'TIMER'
statictimer:                db ' : '
lengthstatictimer:     dw 3
tickcount: dw 0
count: dw 0
minute: dw 0,0
countm: dw 0
countp: dw 0


displaymistake:       db 'MISTAKE COUNT'
mistake:              db '0'
displayundo:          db 'UNDO'
undo:                 db '.'
displayscore:         db 'SCORE'
score:                db '0'

lengthdisplaytimer:   dw 5
lengthdisplaymistake: dw 13
lengthdisplayundo:    dw 4
lengthdisplayscore:   dw 5

lengthmistake:       dw 1
lengthscore:         dw 1
lengthundo:          dw 1

title1: db 'RULES OF SUDOKU'
lentitle1: dw 15
rule1: db '- Sudoku consists of a 9x9 grid divided into nine 3x3 subgrid'
lenrule1: dw 61
rule2: db '- Each row must contain the numbers 1-9, without repetitions'
lenrule2: dw 60
rule3: db '- Each col must contain the numbers 1-9, without repetitions'
lenrule3: dw 60
rule4: db '- The digits can only occur one per subgrid'
lenrule4: dw 43
rule5: db '- The sum of every single row, col, and must equal 45'
lenrule5: dw 53
rule6: db '- The puzzle starts with some cells pre-filled with numbers'
lenrule6: dw 59
rule7: db '- Fill all the cells to win the game :)'
lenrule7: dw 39
go: db 'Press any key to continue......'
lengo: dw 31



rownumber: dw 0
colnumber: dw 0
value:db '0'
staticrow: db 'Row:'
staticcol: db 'Column:'
lenrow: dw 4
lencol: dw 7
validrow: dw 0
validcol: dw 0

msg:db 'Value:'
lenmsg:dw 6

error1: db 'Invalid row or col'
lenerror1: dw 18



;End Screen

dotted: db ' - ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- ','- '
upp: db 218,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191
midd: db 179
downn: db 192,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,217

digitcount:dw 0
endscr: db 'GAME ENDED!'
exitmsg: db'ESC->Exit'

lenexitmsg:dw 9
lenupp:dw 21
lendownn: dw 21

lenendscr: dw 11
lenmidd: dw 1
lendotted: dw 80


printend:
    call clr
mov ax,0
push ax
mov ax,3
push ax
mov ax,0x70
push ax
mov ax,dotted
push ax
push word[lendotted]
call myprint


    mov ax, 10
    push ax
    mov ax, 14
    push ax
    mov ax, 0x70
    push ax
    mov ax, displayscore
    push ax
    push word[lengthdisplayscore]
    call printstr

    push 2280
    push word[scoreshow]
    call printnum

    mov ax, 10
    push ax
    mov ax, 15
    push ax
    mov ax, 0x70
    push ax
    mov ax, displaymistake
    push ax
    push word[lengthdisplaymistake]
    call printstr

    push 2448
    push word[mistakeshow]
    call printnum

   
mov ax,35
push ax
mov ax,12
push ax
mov ax,0x70
push ax
mov ax,endscr
push ax
push word[lenendscr]
call myprint



mov ax,0
push ax
mov ax,22
push ax
mov ax,0x70
push ax
mov ax,dotted
push ax
push word[lendotted]
call myprint

ret

printrules:

push bp
mov bp,sp
pusha

    mov ax, 33
    push ax
    mov ax, 0
    push ax
    mov ax, 0xF
    push ax
    mov ax, title1
    push ax
    push word[lentitle1]
    call printstr

mov ax, 0
    push ax
    mov ax, 3
    push ax
    mov ax, 0x70
    push ax
    mov ax, rule1
    push ax
    push word[lenrule1]
    call printstr

mov ax, 0
    push ax
    mov ax, 5
    push ax
    mov ax, 0x70
    push ax
    mov ax, rule2
    push ax
    push word[lenrule2]
    call printstr

mov ax, 0
    push ax
    mov ax, 7
    push ax
    mov ax, 0x70
    push ax
    mov ax, rule3
    push ax
    push word[lenrule3]
    call printstr

mov ax, 0
    push ax
    mov ax, 9
    push ax
    mov ax, 0x70
    push ax
    mov ax, rule4
    push ax
    push word[lenrule4]
    call printstr

mov ax, 0
    push ax
    mov ax, 11
    push ax
    mov ax, 0x70
    push ax
    mov ax, rule5
    push ax
    push word[lenrule5]
    call printstr

mov ax, 0
    push ax
    mov ax, 13
    push ax
    mov ax, 0x70
    push ax
    mov ax, rule6
    push ax
    push word[lenrule6]
    call printstr

mov ax, 0
    push ax
    mov ax, 15
    push ax
    mov ax, 0x70
    push ax
    mov ax, rule7
    push ax
    push word[lenrule7]
    call printstr

mov ax, 0
    push ax
    mov ax, 17
    push ax
    mov ax, 0x70
    push ax
    mov ax, go
    push ax
    push word[lengo]
    call printstr


mov ah,0
int 0x16

pop bp
popa
ret


funcfortimer:
printnumfortimer:
 push bp
 mov bp, sp
 push es
 push ax
 push bx
 push cx
 push dx
 push di
 mov ax, 0xb800
 mov es, ax
 mov ax, [bp+4]
 mov bx, 10
 mov cx, 0
 
nextdigitfortimer:
 mov dx, 0
 div bx
 add dl, 0x30
 push dx
 inc cx
 cmp ax, 0
 jnz nextdigitfortimer
 mov di, 2588
 
nextpossecond:
 pop dx
 mov dh, 0x70
 mov [es:di], dx
 add di, 2
 loop nextpossecond
 pop di
 pop dx
 pop cx
 pop bx
 pop ax
 
 pop es
 pop bp
 ret 2
 
 printmin:
 push bp
 mov bp,sp
 push es
 push ax
 push bx
 push cx
 push dx
 push di
 
 mov ax,0xb800
 mov es,ax
 mov ax,[countp]
 mov bx,10
 mov cx,0
 
 nextdigforminute:
 mov dx,0
 div bx
 add dl,0x30
 push dx
 inc cx
 cmp ax,0
 jnz nextdigforminute
 mov di,2578
 
 nextpossecondforminute:
 pop dx
 mov dh,0x70
 mov [es:di],dx
 add di,2
 loop nextpossecondforminute
 
 pop di
 pop dx
 pop cx
 pop bx
 pop ax
 pop es
 pop bp
 ret
 
timer:
 push ax
 inc word [cs:tickcount]
 cmp word[cs:tickcount],18
 jne skiptime
 inc word[cs:count]
 inc word[cs:countm]
 
 cmp word[cs:countm],60
  jne next
  mov ax,[countp]
 inc ax
 mov word[countp],ax
 mov word[cs:count],0
  mov word[cs:countm],0
  push ax
  mov ax,' '
  mov word[es:2592],ax
  pop ax

 
 next:
   call clrforseconds
 call printmin
 push word [cs:count]
 call printnumfortimer
 mov word[cs:tickcount],0
 
 
 
 skiptime:
 mov al, 0x20
 out 0x20, al
 pop ax
 iret




printlabels:
    push ax

    mov ax, 10
    push ax
    mov ax, 2
    push ax
    mov ax, 0x70
    push ax
    mov ax, displayscore
    push ax
    push word[lengthdisplayscore]
    call printstr

    push 504
    push word[scoreshow]
    call printnum

    mov ax, 10
    push ax
    mov ax, 15
    push ax
    mov ax, 0x70
    push ax
    mov ax, displaytimer
    push ax
    push word[lengthdisplaytimer]
    call printstr

    mov ax, 11
    push ax
    mov ax, 16
    push ax
    mov ax, 0x70
    push ax
    mov ax, statictimer
    push ax
    push word[lengthstatictimer]
    call printstr

    mov ax, 60
    push ax
    mov ax, 2
    push ax
    mov ax, 0x70
    push ax
    mov ax, displaymistake
    push ax
    push word[lengthdisplaymistake]
    call printstr

    push 612
    push word[mistakeshow]
    call printnum
    mov word[digitcount],0
   
   

    mov ax, 64
    push ax
    mov ax, 15
    push ax
    mov ax, 0x70
    push ax
    mov ax, displayundo
    push ax
    push word[lengthdisplayundo]
    call printstr

    mov ax, 65
    push ax
    mov ax, 16
    push ax
    mov ax, 0x70
    push ax
    mov ax, undo
    push ax
    push word[lengthundo]
    call printstr

    mov ax,62
    push ax
    mov ax,18
    push ax
    mov ax,0x70
    push ax
    mov ax,exitmsg
    push ax
    push word[lenexitmsg]
    call myprint



   
   
    pop ax
    ret


    ;[bp+6] has address of the video memory
    ;[bp+4] has the number
 printnum: push bp
 mov bp, sp
 push es
 push ax
 push bx
 push cx
 push dx
 push di

 mov ax, 0xb800
 mov es, ax
 mov ax, [bp+4]
 mov bx, 10  
 mov cx, 0
nextdigit: mov dx, 0
 div bx
 add dl, 0x30
 push dx
 inc cx
 cmp ax, 0
 jnz nextdigit
 mov di, [bp+6]
 nextpos: pop dx
 mov dh, 0x70
 mov [es:di], dx
 add di, 2
 loop nextpos

 pop di
 pop dx
 pop cx
 pop bx
 pop ax
 pop es
 pop bp
 ret 4


count1: dw 0
count2: dw 0
count3: dw 0
count4: dw 0
count5: dw 0
count6: dw 0
count7: dw 0
count8: dw 0
count9: dw 0

calculatelocation:
    push bp
    mov bp,sp
    push ax
    push bx
   
    push dx

    mov bx, [bp+6]
    dec bx
    shl bx, 1
    mov di, [datapointers + bx]

    add di, 2
    cmp byte [colnumber], 49;ascii of '1'
    je donothing
   
    mov bx, [bp+4]
    dec bx
    mov al, 4
    mul bl
    add di, ax
donothing:
   
    pop dx
    pop bx
    pop ax
    pop bp
    ret 4
numbercards:
    push bp
    mov bp, sp
    push di

    mov cx, 1            ; Row counter (1 to 9)
outer2:
    mov dx, 1            ; Column counter (1 to 9)

inner:
    push cx
    push dx
    call calculatelocation  ; Now we have the address of the location in di

    cmp byte [di], '1'    ; Compare the value in di with '1'
    je incone
    cmp byte [di], '2'    ; Compare the value in di with '2'
    je inctwo
    cmp byte [di], '3'    ; Compare the value in di with '3'
    je incthree
    cmp byte [di], '4'    ; Compare the value in di with '4'
    je incfour
    cmp byte [di], '5'    ; Compare the value in di with '5'
    je incfive
    cmp byte [di], '6'    ; Compare the value in di with '6'
    je incsix
    cmp byte [di], '7'    ; Compare the value in di with '7'
    je incseven
    cmp byte [di], '8'    ; Compare the value in di with '8'
    je inceight
    cmp byte [di], '9'    ; Compare the value in di with '9'
    je incnine

    jmp outing

incone:
    inc word [count1]
    jmp outing

inctwo:
    inc word [count2]
    jmp outing

incthree:
    inc word [count3]
    jmp outing

incfour:
    inc word [count4]
    jmp outing

incfive:
    inc word [count5]
    jmp outing

incsix:
    inc word [count6]
    jmp outing

incseven:
    inc word [count7]
    jmp outing

inceight:
    inc word [count8]
    jmp outing

incnine:
    inc word [count9]
    jmp outing

outing:
    inc dx
    cmp dx, 10           ; Stop when dx reaches 10 (after 9 columns)
    jne inner

    inc cx
    cmp cx, 10           ; Stop when cx reaches 10 (after 9 rows)
    jne outer2

leavesub:
    pop di
    pop bp
    ret


clr:
    push es
    push ax
    push cx
    push di

    mov ax, 0xb800
    mov es, ax
    xor di, di

    mov ax, 0x7020
    mov cx, 2000

    cld
    rep stosw

    pop di
    pop cx
    pop ax
    pop es
    ret

clrforseconds:
    push es
    push ax
    push cx
    push di

    mov ax, 0xb800
    mov es, ax
    mov di,2590

    mov ax, 0x7020
    mov cx, 2

    cld
    rep stosw

    pop di
    pop cx
    pop ax
    pop es
    ret


clrforrowerror:
    push es
    push ax
    push cx
    push di

    mov ax, 0xb800
    mov es, ax
    mov di,0

    mov ax, 0x7020
    mov cx, 18

    cld
    rep stosw

    pop di
    pop cx
    pop ax
    pop es
    ret

clrforcolerror:
    push es
    push ax
    push cx
    push di

    mov ax, 0xb800
    mov es, ax
    mov di,160

    mov ax, 0x7020
    mov cx, 18

    cld
    rep stosw

    pop di
    pop cx
    pop ax
    pop es
    ret
printstr:
    push bp
    mov bp, sp
    push es
    push ax
    push cx
    push si
    push di

    mov ax, 0xb800
    mov es, ax

    mov al, 80
    mul byte [bp + 10]     ; al multiplied with y position
    add ax, [bp + 12]      ; total added with x position
    shl ax, 1

    mov di, ax              ; beginning point of the printing on the screen loaded in di
    mov si, [bp + 6]       ; offset of the source to be printed
    mov cx, [bp + 4]       ; length of the str loaded in cx
    mov ah, [bp + 8]       ; attribute

    cld
nextchar:
    lodsb                   ; loads a byte from source str to al, which is paired with the attribute
    stosw                   ; stores ax in es:di which is pointed towards video memory
    loop nextchar           ; repeat the process till the length of str ends, already saved in cx

    pop di
    pop si
    pop cx
    pop ax
    pop es
    pop bp
    ret 10

nextspace:
    inc bx
    mov ax, 21
    push ax
    mov ax, bx
    push ax
    mov ax, 0X70
    push ax
    mov ax, lsp19
    push ax
    push word[length]
    call printstr

    loop nextspace
    pop cx
    ret


scrollup:
    push bp
    mov bp,sp
    push ax
    push cx
    push si
    push di
    push es
    push ds

    mov ax,80
    mov bl,21
    mul bl;y coordinate
    add si,0;
    mov si,ax
    push si
    shl si,1
    mov cx,4000
    sub cx,ax
    mov ax,0xb800
    mov es,ax
    mov ds,ax
   
    xor di,di
    cld
    rep movsb

    mov ax,0x7020
    pop cx
    rep stosw

    mov word[scrolled],1
    pop ds
    pop es
    pop di
    pop si
    pop cx
    pop ax
    pop bp
    ret



upperhalf:
    call clr
    mov bx, 1   ;y location
    mov ax, 21  ;x location
    push ax

    mov ax, bx
    push ax
    mov ax, 0X70    ;black on white
    push ax
    mov ax, line1s  ;very first row
    push ax
    push word[length]
    call printstr
   
    inc bx
    mov ax, 21
    push ax
    mov ax, bx
    push ax
    mov ax, 0X70
    push ax
    xor si,si
    mov ax, [pointers+si]
    add si,2
    push ax
    push word[length]
    call printstr
    inc bx

    mov ax, 21
    push ax
    mov ax, bx
    push ax
    mov ax, 0X70
    push ax
    xor di,di   ;di made 0
    mov dx,[datapointers+di]
    add di,2
    mov ax, dx
    push ax
    push word[length1]
    call printstr
    inc bx

    mov ax, 21
    push ax
    mov ax, bx
    push ax
    mov ax, 0X70
    push ax
    mov ax, [pointers+si]
    add si,2
    push ax
    push word[length]
    call printstr

    mov cx, 6   ;the loop prints only 6 rows
    mov dx, [datapointers+di]
    add di,2

   
middle:
    inc bx
    mov ax, 21
    push ax
    mov ax, bx
    push ax
    mov ax, 0X70
    push ax
    mov ax, line1m
    push ax
    push word[length]
    call printstr

    inc bx
    mov ax, 21
    push ax
    mov ax, bx
    push ax
    mov ax, 0X70
    push ax
    mov ax, [pointers+si]
    add si,2
    push ax
    push word[length]
    call printstr

    inc bx
    mov ax, 21
    push ax
    mov ax, bx
    push ax
    mov ax, 0X70
    push ax
    mov ax, dx
    push ax
    push word[length1]
    call printstr
    inc bx

    mov ax, 21
    push ax
    mov ax, bx
    push ax
    mov ax, 0X70
    push ax
    mov ax, [pointers+si]
    add si,2
    push ax
    push word[length]
    call printstr
    mov dx,[datapointers+di]
    add di,2

    loop middle
    call printlabels
    mov word[scrolled],0
   
    ret


lowerhalf:
    push di
    push cx
    push bx
    push si
    mov cx,2
    mov di,14
    mov si,22
    mov bx,7
   
ending:

    inc bx
    mov ax, 21
    push ax

    mov ax, bx
    push ax
   
    mov ax, 0X70
    push ax
   
    mov ax, line1m
    push ax
   
    push word[length]
    call printstr

    inc bx
    mov ax, 21
    push ax
    mov ax, bx
    push ax
    mov ax, 0X70
    push ax
    mov ax, [pointers+si]
    add si,2
    push ax
    push word[length]
    call printstr

    inc bx
    mov ax, 21
    push ax
    mov ax, bx
    push ax
    mov ax, 0X70
    push ax
   
    mov dx,[datapointers+di]
   
    mov ax, dx
    push ax
    push word[length1]
    call printstr
    add di,2

    inc bx
    mov ax, 21
    push ax
    mov ax, bx
    push ax
    mov ax, 0X70
    push ax
    mov ax, [pointers+si]
    add si,2
    push ax
    push word[length]
    call printstr
    loop ending

    inc bx
    mov ax, 21
    push ax
    mov ax, bx
    push ax
    mov ax, 0X70
    push ax
    mov ax, line3e
    push ax
    push word[length]
    call printstr

    ;starting y location is bx
    ;starting x location is 0

    inc bx
    mov ax, 21
    push ax
    mov ax, bx
    push ax
    mov ax, 0X0A
    push ax
    mov ax, linestart
    push ax
    push word[length]
    call printstr

    inc bx
    mov ax, 21
    push ax
    mov ax, bx
    push ax
    mov ax, 0X0A
    push ax
    mov ax, line29;number cards
    push ax
    push word[length]
    call printstr
    ;+2 6 10 14 18 22 26 30 34

   
   

    inc bx
    mov ax, 21
    push ax
    mov ax, bx
    push ax
    mov ax, 0X0A
    push ax
    mov ax, lineend
    push ax
    push word[length]
    call printstr

    call printlabels

    call numbercards
    push 3246
    push word[count1]
    call printnum

    push 3254
    push word[count2]
    call printnum
    push 3262
    push word[count3]
    call printnum
    push 3270
    push word[count4]
    call printnum
    push 3278
    push word[count5]
    call printnum
    push 3286
    push word[count6]
    call printnum
    push 3294
    push word[count7]
    call printnum
    push 3302
    push word[count8]
    call printnum
    push 3310
    push word[count9]
    call printnum

   

    mov word[scrolled],1
    pop di
    pop cx
    pop bx
    pop si
    ret




update:
    push ax
    push bx
    push di
    push dx

    mov bx, [rownumber]
    dec bx
    shl bx, 1
    mov di, [datapointers + bx]

    add di, 2
    cmp byte [colnumber], 49;ascii of '1'
    je nochange1
   
    mov bx, [colnumber]
    dec bx
    mov al, 4
    mul bl
    add di, ax

nochange1:
    push di
    call clearbox

    mov al, [value]

    mov byte [di], al
    mov dx, di
    mov word [addressforundo], dx
noupdate:
    pop dx
    pop di
    pop bx
    pop ax
    ret


notes:
    push ax
    push bx
    push di
    push dx

    mov bx, [rownumber]
    dec bx
    shl bx, 1
    mov di, [datapointers + bx]

    add di, 2
    cmp byte [colnumber], 49;ascii of '1'
    je nochange11
   
    mov bx, [colnumber]
    dec bx
    mov al, 4
    mul bl
    add di, ax

nochange11:
    mov al, [value]
    ;cmp byte[di],' '
    ;je exiting

    cmp byte[value],'1'
    jne note2
    sub di,38
    jmp exiting

note2:
    cmp byte[value],'2'
    jne note3
    sub di,37
    jmp exiting

note3:
    cmp byte[value],'3'
    jne note4
    sub di,36
    jmp exiting
note4:
    cmp byte[value],'4'
    jne note5
    sub di,1
    jmp exiting
note5:
    cmp byte[value],'5'
    jne note6
    jmp exiting
   
note6:
    cmp byte[value],'6'
    jne note7
    add di,1
    jmp exiting
note7:
    cmp byte[value],'7'
    jne note8
    add di,36
    jmp exiting  
note8:
    cmp byte[value],'8'
    jne note9
    add di,37
    jmp exiting
note9:
    cmp byte[value],'9'
    add di,38

exiting:
    mov byte[di],al
    pop dx
    pop di
    pop bx
    pop ax
    ret


clearbox:
    push bp
    mov bp,sp
    push di
   
    mov di,[bp+4]
    mov byte[di],32;5
    inc di
    mov byte[di],32;6
    sub di,2
    mov byte[di],32;4
    inc di
    sub di,37
    mov byte[di],32

    inc di
    mov byte[di],32;6
    sub di,2
    mov byte[di],32;4

    add di,1
    add di,74
    mov byte[di],32
    inc di
    mov byte[di],32;6
    sub di,2
    mov byte[di],32;4

    pop di
    pop bp

    ret 2
   
   
addressforundo: dw 0
undodone: dw 0

funcforundo:
    push ax
    push di

    mov di, [addressforundo]
    mov ah, 0
    int 0x16
    call simplesound

    cmp al, '.'
    jne noundo

    mov al, ' '
    mov byte [di], al
    mov word [undodone], 1

    cmp word[correctmove],0
    jne decscore
    mov ax, [mistakeshow]
    dec ax
    mov word [mistakeshow], ax
decscore:
    mov ax, [scoreshow]
    dec ax
    mov word [scoreshow], ax
noundo:
    pop di
    pop ax
    ret

scoreshow: dw 33
mistakeshow: dw 0
correctmove: dw 1
comparisonwithgrid:
    push ax
    push bx
    push di
    push si

    mov bx, [rownumber]
    dec bx
    shl bx, 1
    mov di, [cgpointers + bx]

    add di, 2
    cmp byte [colnumber], 49
    je comparison

    mov bx, [colnumber]
    dec bx
    mov al, 4
    mul bl
    add di, ax

comparison:
    mov si, [addressforundo] ; address of the most recent move
    mov al, [si]
    mov bl, [di]             ; location of the point from the solved game (in di)
    cmp al, bl
    je scoreincrement
    jne mistakeincrement

    mov ax, 0xb800
    mov es, ax

scoreincrement:
    call simplesound
    mov word[correctmove],1
    mov ax, [scoreshow]
    inc ax
    mov word [scoreshow], ax
    jmp exit3

mistakeincrement:
    call errorsound
    mov word[correctmove],0
    push si
    call wrong
    mov ax, [mistakeshow]
    inc ax
    mov word [mistakeshow], ax
   
    cmp word [mistakeshow],3
    jne exit3
    jmp terminategame

exit3:
    pop si
    pop di
    pop bx
    pop ax
    ret

wrongin: db 'Mistake Made!'
wronginlen: dw 13

wrong:
    push ax
    push dx
    push cx

    mov ax, 0
    push ax
    mov ax, 9
    push ax
    mov ax, 0x70
    push ax
    mov ax, wrongin
    push ax
    push word [wronginlen]
    call printstr
   
    mov dx, 50
lopedd:
    mov cx, 50000
lopingd:
    loop lopingd
    mov cx, 50000
loping2d:
    loop loping2d
    mov cx, 50000
loping3d:
    loop loping3d
    sub dx, 1
    jnz lopedd

    mov di, [bp + 4]
    mov al, ' '
    mov byte [di], al

    pop cx
    pop dx
    pop ax
    ret 2




errorsound:
    push cx
    mov cx,0
playing:    
    call playsound
    push cx
    mov cx,50000
delay:
    loop delay
    pop cx
    inc cx
    cmp cx ,10
    jne playing

    pop cx
    ret

simplesound:
    call playsound
    ret
playsound:
    push ax
    push cx
    push dx
    ; Step 1: Set up the PIT to generate a frequency
    mov al, 0xB6        ; Select mode 3 (square wave generator) for channel 2
    out 0x43, al        ; Send control word to PIT command port
    mov ax, 1193180 / 440 ; Calculate PIT count for 440 Hz (A4 note)
    out 0x42, al        ; Send low byte to channel 2 data port
    mov al, ah
    out 0x42, al        ; Send high byte to channel 2 data port

    ; Step 2: Turn on the speaker
    in al, 0x61         ; Read current value of port 0x61
    or al, 3            ; Set bits 0 and 1 to enable the speaker
    out 0x61, al        ; Write back to port 0x61
    mov dx,10
outer:
    mov cx,5000
    delaying:
        loop delaying
    dec dx
    jne outer

    ; Step 4: Turn off the speaker
    in al, 0x61         ; Read current value of port 0x61
    and al, 0xFC        ; Clear bits 0 and 1 to disable the speaker
    out 0x61, al        ; Write back to port 0x61

    pop dx
    pop cx
    pop ax

    ret


start:
    call clr
call printrules
call clr
    call printstart
   
getinput:
    mov word[count1],0
    mov word[count2],0
    mov word[count3],0
    mov word[count4],0
    mov word[count5],0
    mov word[count6],0
    mov word[count7],0
    mov word[count8],0
    mov word[count9],0
    mov ah, 0
    int 0x16

    call simplesound

    cmp al, 97 ; check for ASCII of 'a'
    jne nextcmp

    cmp word [started], 1
    je getinput

    xor ax, ax
    mov es, ax
    mov ax, [es:8*4]
    mov [oldtimerisr], ax
    mov ax, [es:8*4 + 2]
    mov [oldtimerisr + 2], ax

    cli
    mov word [es:8*4], timer
    mov [es:8*4 + 2], cs
    sti

    call upperhalf
    mov word [started], 1
    jmp getinput

nextcmp:
    cmp al, 120 ; 'x'
    je handle_left_shift

    cmp al, 122 ; 'z'
    je handle_right_shift

    cmp al, 'n' ; 'n'
    je handle_n

    cmp al, 32  ; check for space
    je handle_space

finalcheck:
    cmp ah, 1
    jne getinput
    cmp word[started],1
    jne simpleend
terminategame:
    xor ax, ax
    mov es, ax
    ; Restore old timer ISR
    mov ax, [oldtimerisr]
    mov bx, [oldtimerisr + 2]
    cli
    mov [es:8*4], ax
    mov [es:8*4 + 2], bx
    sti
simpleend:
    call printend
    mov ax, 0x4c00
    int 0x21

handle_left_shift:
    cmp word [started], 1
    jne getinput
    call upperhalf
    jmp getinput

handle_right_shift:
    cmp word [started], 1
    jne getinput
    cmp word [scrolled], 1
    je getinput
    call scrollup
    call lowerhalf
    jmp getinput

handle_space:
    cmp word [started], 0
    je getinput
    call keyboardinrow
    call rowvaliditycheck
    jmp normalin
    ;jmp getinput

handle_n:
    cmp word [started], 0
    je getinput
    call keyboardinrow
    call rowvaliditycheck
    jmp notesin
    ;jmp getinput
keyboardinrow:
    push ax
    push es

    mov ax, 0
    push ax
    mov ax, 6
    push ax
    mov ax, 0x70
    push ax
    mov ax, staticrow
    push ax
    push word [lenrow]
    call printstr

    mov ax, 0xb800
    mov es, ax
    xor ax, ax

    mov ah, 0
    int 0x16 ; row input
    call simplesound
    cmp ah, 1
    je finalcheck

    mov ah, 0x70
    mov word [es:972], ax
    xor ah, ah
    sub ax, '0'
    mov word [rownumber], ax

    ; Input for column now
    mov ax, 0xb800
    mov es, ax
    xor ax, ax

    mov ax, 0
    push ax
    mov ax, 7
    push ax
    mov ax, 0x70
    push ax
    mov ax, staticcol
    push ax
    push word [lencol]
    call printstr

    mov ah, 0
    int 0x16
    call simplesound
    cmp ah, 1
    je finalcheck
   
    mov ah, 0x70
    mov word [es:1136], ax
    xor ah, ah
    sub ax, '0'
    mov word [colnumber], ax

    ; Both row and col numbers have been saved and printed
    mov ax, 0
    push ax
    mov ax, 8
    push ax
    mov ax, 0x70
    push ax
    mov ax, msg
    push ax
    push word [lenmsg]
    call printstr

    mov ah, 0
    int 0x16
    call simplesound
    cmp ah, 1
    je finalcheck
   
    mov ah, 0x70
    mov word [es:1294], ax
    mov byte [value], al
   
    mov dx, 50
loopedd:
    mov cx, 50000
loopingd:
    loop loopingd
    mov cx, 50000
looping2d:
    loop looping2d
    mov cx, 50000
looping3d:
    loop looping3d
    sub dx, 1
    jnz loopedd

    pop es
    pop ax
    ret

errormsg: db 'Oops! Invalid input'
lenerrormsg: dw 19

errorinput:
    mov ax, 0
    push ax
    mov ax, 9
    push ax
    mov ax, 0x70
    push ax
    mov ax, errormsg
    push ax
    push word [lenerrormsg]
call errorsound
    call printstr

    mov dx, 50
looped:
    mov cx, 50000
looping:
    loop looping
    mov cx, 50000
looping2:
    loop looping2
    mov cx, 50000
looping3:
    loop looping3
    sub dx, 1
    jnz looped

    call clr
    call upperhalf
    jmp handle_space

rowvaliditycheck:
    cmp word [rownumber], 1
    jae nextcheckforrow
    jmp errorinput  

nextcheckforrow:
    cmp word [rownumber], 9
    jbe colvaliditycheck
    jmp errorinput  

colvaliditycheck:
    cmp word [colnumber], 1
    jae nextcheckforcol
    jmp errorinput  

nextcheckforcol:
    cmp word [colnumber], 9
    ja errorinput  

valuevalid:
    cmp byte [value], 49
    jae nextcheckforval
    jmp errorinput  

nextcheckforval:
    cmp byte [value], 57
    ja errorinput  
    ret
normalin:
    ; Putting values in the grid
    mov word [undodone], 0
    call update
    jmp afternormal
notesin:
    mov word [undodone], 0
    call notes
    call upperhalf
    jmp afternotes
afternormal:
    call comparisonwithgrid
    call upperhalf

afternotes:
    call funcforundo
    call upperhalf
    cmp word [undodone], 1
    je getinput

cmp word[scoreshow],81
je terminategame
jmp getinput
