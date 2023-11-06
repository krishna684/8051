org 0000h
mov tmod,#60h
mov th1,#00h
setb p3.5
again: setb tr1
back : mov a,tl1
mov p2,a
jnb tf1,back
clr tf1
clr tr1
sjmp again
end
