Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 059C45FBFCB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 06:04:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnJvL6t6Qz3dsd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 15:04:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PqB0yhjx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PqB0yhjx;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnJsP5l13z2xHw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 15:03:03 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id i6so10061032pli.12
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 21:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6fsq8d8o8NqkJCmcTaHLZmccIkhkF64BPG0szpw2iUs=;
        b=PqB0yhjx3Rg5XJ/kmvvAbowt92Uur0/5ynpFy4qrX0GE/TQXiTP17Vm5H1vUuqe/sp
         /yhLfvsnEVLVLd6ndZs4bEtZ+UW5yElzzcBmahf4BKLl3+lgn8qAHAAdXganU2cVlEcJ
         GH+k0FKASdSdd0qEkrhbJ+S+LJDHNtpI17qvYdug1QO+AAZp90CW/PhZlgOlScB0UM+Y
         fCBymU4zgvJG6C68yLqQc4QhQLB1HrvK4k2cmk8I9y5eltZdKN86EwiyCkQvunclp7ws
         2bEC7F+0LlQuagUPhAGeM9IdKzCRsf6vj5D6KrUWSZn97IJnC94kfDetqw0jRYO6x2zZ
         CNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fsq8d8o8NqkJCmcTaHLZmccIkhkF64BPG0szpw2iUs=;
        b=7w2rUlMMO3U/fSh/yteiJDgGWEqEimYIlbjZxKEtMNa+VVO6PN1m7LKKKByBtBvoHq
         FclL5J5+mO6X9xxmQ+Mv391wguta4n3Wz0kUJiQ5nexfA4fvmIyd8oSO9feo3vNJ6eQ1
         gCUvasoVdmE/sxcRq1G62jO3EKj8p/XdKbJL9Sde+nkP0Pn225tJWcOaou2ii4V/vnNb
         ZL6jTX+8CgcfRW75dIHwnaPFqifKYDyiRFWwUCju0Quu/LpDoZER4wmSoQW1hRRmSXr7
         g7vV/3tREl5IACXN2FtYaxuA4vvhUVLB5alPyVtv/chmj9grYVURxYzHQPrxChscY+nH
         cIaQ==
X-Gm-Message-State: ACrzQf0WcLJal4KfVwj1lNuOQ787ky43XzQ6cE1+Am/IWjauU5RDAevq
	A2v/OjtaWoQpjtI4V9xtjxB+YkRv610=
X-Google-Smtp-Source: AMsMyM5iSOJfmrP1vfjH33E3RZab7LJr2mI5mOKNJ1Of0Bydv/zNPlf9nlvXAvgaGA+hlK4OYoeUcg==
X-Received: by 2002:a17:902:7043:b0:184:40e5:b5e7 with SMTP id h3-20020a170902704300b0018440e5b5e7mr2952497plt.98.1665547379126;
        Tue, 11 Oct 2022 21:02:59 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id w11-20020a170902e88b00b0017e64da44c5sm9447140plg.203.2022.10.11.21.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 21:02:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/32: fix syscall wrappers with 64-bit arguments of unaligned register-pairs
Date: Wed, 12 Oct 2022 13:53:34 +1000
Message-Id: <20221012035335.866440-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc 32-bit system call (and function) calling convention for 64-bit
arguments requires the next available odd-pair (two sequential registers
with the first being odd-numbered) from the standard register argument
allocation.

The first argument register is r3, so a 64-bit argument that appears at
an even position in the argument list must skip a register (unless there
were preceeding 64-bit arguments, which might throw things off). This
requires non-standard compat definitions to deal with the holes in the
argument register allocation.

With pt_regs syscall wrappers which use a standard mapper to map pt_regs
GPRs to function arguments, 32-bit kernels hit the same basic problem,
the standard definitions don't cope with the unused argument registers.

Fix this by having 32-bit kernels share those syscall definitions with
compat.

Thanks to Jason for spending a lot of time finding and bisecting this and
developing a trivial reproducer. The perfect bug report.

Reported-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since posting the patch in the bug thread:
- dropped sync_file_range2 from the ppc32 syscalls.
- updated some comments on sys_ppc32.c, which now has a different
  purpose.
- still have not explicitly tested all convrted syscalls on ppc32
  (I don't have a great ppc32 environment to test such things,
  will have to try rectify that...).
- Build fixes from mpe.
- Thanks to jms and mpe for helping with debugging.

Thanks,
Nick

 arch/powerpc/include/asm/syscalls.h      | 16 ++++++++++
 arch/powerpc/kernel/Makefile             |  1 +
 arch/powerpc/kernel/sys_ppc32.c          | 38 ++++++++++++++++++------
 arch/powerpc/kernel/syscalls/syscall.tbl | 16 ++++++----
 4 files changed, 56 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index 9840d572da55..a1142496cd58 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -89,6 +89,22 @@ long compat_sys_rt_sigreturn(void);
  * responsible for combining parameter pairs.
  */
 
+#ifdef CONFIG_PPC32
+long sys_ppc_pread64(unsigned int fd,
+		     char __user *ubuf, compat_size_t count,
+		     u32 reg6, u32 pos1, u32 pos2);
+long sys_ppc_pwrite64(unsigned int fd,
+		      const char __user *ubuf, compat_size_t count,
+		      u32 reg6, u32 pos1, u32 pos2);
+long sys_ppc_readahead(int fd, u32 r4,
+		       u32 offset1, u32 offset2, u32 count);
+long sys_ppc_truncate64(const char __user *path, u32 reg4,
+		        unsigned long len1, unsigned long len2);
+long sys_ppc_ftruncate64(unsigned int fd, u32 reg4,
+			 unsigned long len1, unsigned long len2);
+long sys_ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
+			 size_t len, int advice);
+#endif
 #ifdef CONFIG_COMPAT
 long compat_sys_mmap2(unsigned long addr, size_t len,
 		      unsigned long prot, unsigned long flags,
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 1f121c188805..d382564034a7 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -73,6 +73,7 @@ obj-y				:= cputable.o syscalls.o \
 obj-y				+= ptrace/
 obj-$(CONFIG_PPC64)		+= setup_64.o irq_64.o\
 				   paca.o nvram_64.o note.o
+obj-$(CONFIG_PPC32)		+= sys_ppc32.o
 obj-$(CONFIG_COMPAT)		+= sys_ppc32.o signal_32.o
 obj-$(CONFIG_VDSO32)		+= vdso32_wrapper.o
 obj-$(CONFIG_PPC_WATCHDOG)	+= watchdog.o
diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc32.c
index dcc3c9fd4cfd..6bdfe11a7689 100644
--- a/arch/powerpc/kernel/sys_ppc32.c
+++ b/arch/powerpc/kernel/sys_ppc32.c
@@ -1,13 +1,23 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * sys_ppc32.c: Conversion between 32bit and 64bit native syscalls.
+ * sys_ppc32.c: 32-bit system calls with complex calling conventions.
  *
  * Copyright (C) 2001 IBM
  * Copyright (C) 1997,1998 Jakub Jelinek (jj@sunsite.mff.cuni.cz)
  * Copyright (C) 1997 David S. Miller (davem@caip.rutgers.edu)
  *
- * These routines maintain argument size conversion between 32bit and 64bit
- * environment.
+ * 32-bit system calls with 64-bit arguments pass those in register pairs.
+ * This must be specially dealt with on 64-bit kernels. The compat_arg_u64_dual
+ * in generic compat syscalls is not always usable because the register
+ * pairing is constrained depending on preceeding arguments.
+ *
+ * An analogous problem exists on 32-bit kernels with ARCH_HAS_SYSCALL_WRAPPER,
+ * the defined system call functions take the pt_regs as an argument, and there
+ * is a mapping macro which maps registers to arguments
+ * (SC_POWERPC_REGS_TO_ARGS) which also does not deal with these 64-bit
+ * arguments.
+ *
+ * This file contains these system calls.
  */
 
 #include <linux/kernel.h>
@@ -47,7 +57,17 @@
 #include <asm/syscalls.h>
 #include <asm/switch_to.h>
 
-COMPAT_SYSCALL_DEFINE6(ppc_pread64,
+#ifdef CONFIG_PPC32
+#define PPC32_SYSCALL_DEFINE4	SYSCALL_DEFINE4
+#define PPC32_SYSCALL_DEFINE5	SYSCALL_DEFINE5
+#define PPC32_SYSCALL_DEFINE6	SYSCALL_DEFINE6
+#else
+#define PPC32_SYSCALL_DEFINE4	COMPAT_SYSCALL_DEFINE4
+#define PPC32_SYSCALL_DEFINE5	COMPAT_SYSCALL_DEFINE5
+#define PPC32_SYSCALL_DEFINE6	COMPAT_SYSCALL_DEFINE6
+#endif
+
+PPC32_SYSCALL_DEFINE6(ppc_pread64,
 		       unsigned int, fd,
 		       char __user *, ubuf, compat_size_t, count,
 		       u32, reg6, u32, pos1, u32, pos2)
@@ -55,7 +75,7 @@ COMPAT_SYSCALL_DEFINE6(ppc_pread64,
 	return ksys_pread64(fd, ubuf, count, merge_64(pos1, pos2));
 }
 
-COMPAT_SYSCALL_DEFINE6(ppc_pwrite64,
+PPC32_SYSCALL_DEFINE6(ppc_pwrite64,
 		       unsigned int, fd,
 		       const char __user *, ubuf, compat_size_t, count,
 		       u32, reg6, u32, pos1, u32, pos2)
@@ -63,28 +83,28 @@ COMPAT_SYSCALL_DEFINE6(ppc_pwrite64,
 	return ksys_pwrite64(fd, ubuf, count, merge_64(pos1, pos2));
 }
 
-COMPAT_SYSCALL_DEFINE5(ppc_readahead,
+PPC32_SYSCALL_DEFINE5(ppc_readahead,
 		       int, fd, u32, r4,
 		       u32, offset1, u32, offset2, u32, count)
 {
 	return ksys_readahead(fd, merge_64(offset1, offset2), count);
 }
 
-COMPAT_SYSCALL_DEFINE4(ppc_truncate64,
+PPC32_SYSCALL_DEFINE4(ppc_truncate64,
 		       const char __user *, path, u32, reg4,
 		       unsigned long, len1, unsigned long, len2)
 {
 	return ksys_truncate(path, merge_64(len1, len2));
 }
 
-COMPAT_SYSCALL_DEFINE4(ppc_ftruncate64,
+PPC32_SYSCALL_DEFINE4(ppc_ftruncate64,
 		       unsigned int, fd, u32, reg4,
 		       unsigned long, len1, unsigned long, len2)
 {
 	return ksys_ftruncate(fd, merge_64(len1, len2));
 }
 
-COMPAT_SYSCALL_DEFINE6(ppc32_fadvise64,
+PPC32_SYSCALL_DEFINE6(ppc32_fadvise64,
 		       int, fd, u32, unused, u32, offset1, u32, offset2,
 		       size_t, len, int, advice)
 {
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index 2bca64f96164..e9e0df4f9a61 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -228,8 +228,10 @@
 176	64	rt_sigtimedwait			sys_rt_sigtimedwait
 177	nospu 	rt_sigqueueinfo			sys_rt_sigqueueinfo		compat_sys_rt_sigqueueinfo
 178	nospu 	rt_sigsuspend			sys_rt_sigsuspend		compat_sys_rt_sigsuspend
-179	common	pread64				sys_pread64			compat_sys_ppc_pread64
-180	common	pwrite64			sys_pwrite64			compat_sys_ppc_pwrite64
+179	32	pread64				sys_ppc_pread64			compat_sys_ppc_pread64
+179	64	pread64				sys_pread64
+180	32	pwrite64			sys_ppc_pwrite64		compat_sys_ppc_pwrite64
+180	64	pwrite64			sys_pwrite64
 181	common	chown				sys_chown
 182	common	getcwd				sys_getcwd
 183	common	capget				sys_capget
@@ -242,10 +244,11 @@
 188	common 	putpmsg				sys_ni_syscall
 189	nospu	vfork				sys_vfork
 190	common	ugetrlimit			sys_getrlimit			compat_sys_getrlimit
-191	common	readahead			sys_readahead			compat_sys_ppc_readahead
+191	32	readahead			sys_ppc_readahead		compat_sys_ppc_readahead
+191	64	readahead			sys_readahead
 192	32	mmap2				sys_mmap2			compat_sys_mmap2
-193	32	truncate64			sys_truncate64			compat_sys_ppc_truncate64
-194	32	ftruncate64			sys_ftruncate64			compat_sys_ppc_ftruncate64
+193	32	truncate64			sys_ppc_truncate64		compat_sys_ppc_truncate64
+194	32	ftruncate64			sys_ppc_ftruncate64		compat_sys_ppc_ftruncate64
 195	32	stat64				sys_stat64
 196	32	lstat64				sys_lstat64
 197	32	fstat64				sys_fstat64
@@ -288,7 +291,8 @@
 230	common	io_submit			sys_io_submit			compat_sys_io_submit
 231	common	io_cancel			sys_io_cancel
 232	nospu	set_tid_address			sys_set_tid_address
-233	common	fadvise64			sys_fadvise64			compat_sys_ppc32_fadvise64
+233	32	fadvise64			sys_ppc32_fadvise64		compat_sys_ppc32_fadvise64
+233	64	fadvise64			sys_fadvise64
 234	nospu	exit_group			sys_exit_group
 235	nospu	lookup_dcookie			sys_lookup_dcookie		compat_sys_lookup_dcookie
 236	common	epoll_create			sys_epoll_create
-- 
2.37.2

