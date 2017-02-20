; rdi x
; rsi y
; rdx char
draw_dot:
  push rbx
  mov rbx, rsp

  mov rax, rdi

  imul rax, 100
  add rax, rsi
  mov [screen + rax], dl

  pop rbx
  ret

; rdi x
; rsi y
test_in_screen:
  push rbx
  mov rbx, rsp

  mov rax, 0

  ; test if x > 100
	cmp rdi, 100
	jg test_in_screen_end

  ; test if x < 0
	cmp rdi, 0
	jl test_in_screen_end

  ; test if y > 50
	cmp rsi, 50
	jg test_in_screen_end

  ; test if y < 0
	cmp rsi, 0
	jl test_in_screen_end

  mov rax, 1
	test_in_screen_end:

  pop rbx
  ret

; rdi x
; rsi y
get_dot:
  push rbx
  mov rbx, rsp

  mov rax, rdi

  imul rax, 100
  add rax, rsi
  mov rax, [screen + rax]

  pop rbx
  ret

exit:
  push rbx
  mov rbx, rsp

  int 0xFF

  pop rbx
  ret

; edi lenght
sleep:
  push rbx
  mov rbx, rsp

  mov eax, edi
  int 0x2

  pop rbx
  ret

refresh_screen:
  push rbx
  mov rbx, rsp

  mov rax, screen
  int 0x1

  pop rbx
  ret

init_screen:
  push rbx
  mov rbx, rsp

  mov r12, 0
  loop:
    mov byte [screen + r12], 0x20

    inc r12
    cmp r12, 5000
    jle loop

  pop rbx
  ret
