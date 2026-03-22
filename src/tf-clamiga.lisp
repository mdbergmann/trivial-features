;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;;
;;; tf-clamiga.lisp --- CL-Amiga trivial-features implementation.
;;;
;;; CL-Amiga is a Common Lisp for AmigaOS 3+ (68020+) with a bytecode VM.
;;; It pushes the following *features* from C:
;;;   Always:   :CL-AMIGA :COMMON-LISP
;;;   AmigaOS:  :M68K :AMIGAOS
;;;   POSIX:    :POSIX :UNIX

(in-package :cl-user)

;;;; Endianness

;;; M68K is always big-endian; host platforms (x86-64, ARM64) are little-endian.
#+m68k  (pushnew :big-endian *features*)
#-m68k  (pushnew :little-endian *features*)

;;;; OS

;;; CL-Amiga already pushes :UNIX on POSIX hosts.
;;; On AmigaOS, :AMIGAOS is already present (no POSIX/UNIX features).

;;;; CPU

;;; CL-Amiga already pushes :M68K on AmigaOS.
;;; M68K has 32-bit registers.
#+m68k (pushnew :32-bit *features*)
