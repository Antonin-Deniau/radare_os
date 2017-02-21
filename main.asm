BITS 64

jmp main
%include "./lib/int.asm"
%include "./lib/screen.asm"
%include "./lib/gol.asm"

main:
  push rbx
  mov rbx, rsp

  mov dword [rbp-4], 0 ; loop

  call screen_init
  call gol_create_glider

  main_loop:
		call int_refresh_screen

		mov rdi, 1
		call int_sleep

		call gol_do_iteration
		call gol_display_buffer

		inc dword [rbp-4]
		cmp dword [rbp-4], 20
		jg main_loop


  mov rdi, 1
  call int_sleep

  call int_exit

  pop rbx
  ret

data:
  screen db ""
