Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6836B2DCB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 04:15:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WCd13TSvzF4Pb
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 12:15:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U48GTjPR"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WBcT36vLzF5pm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 11:29:29 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id d10so17273056pgo.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 18:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NgsJz1LYZAm8iupDJU5DDnAAGMbosOWXhZfEVN4WCjM=;
 b=U48GTjPRFV6kfbi7UMN2rGq5nR2tSs4uKqV1tlVOsMdSXkIaAt3gYyxXQS2J0WxN2T
 VNxPZa8JrCUq/uKmaKhKb4UPxZIMyJvDTEwyEVEbUiuQ5QzJpwBhEIWFJLhh7h2OcMiD
 +SZoVBpSHr2ZbdVN8/yOR9Qh++2GJy9JRZv0ofmsvY/kODuY8vT9lzhTDVWxJFVpFlRJ
 7eoJaXh953Nx2BRvUy/60Gcm/A3DuJd8sAIgfKriiFlJALJDhCkenh3gWfxV/KT2YgD5
 ppszfsdqzWBYzkNOro33OTWqV805iUhczev6RGu5oAF9GcBoYXlDLU9kcJvTNIuY0jCx
 oPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NgsJz1LYZAm8iupDJU5DDnAAGMbosOWXhZfEVN4WCjM=;
 b=ib98b8CoaDy3OyBJlfho/g/C98ozd05Nf8kKLh2CVNzNTda/mrvmFImsdxs+SThVI+
 lRCL6bxP3k8xPuOwWFHSoESrqHbPUjcMc9aJZBTOAejsMsjFOMOjNFETLvbzQg2br5i1
 7TInrJsjJpJBKGrqZjxRevWmNqUEIMv5OvcyOn8Q7HgDLmGBYl2dTRUvYG165dzztPn0
 NgqU3v5o4POrGto4WGU+syoUTUSF28rpA1ZWqZKMKm8tIvTu5yZxZqyDOWqRnqF/Y7Fp
 k76h3jrF1wTFmZEmCNr19LhsGJMxhR+uTbFdBnPiEy24F6p/2G21cJSrTWmiIQ6w8RXe
 F40g==
X-Gm-Message-State: APjAAAWqZ37QeLyULtOlwcCnoXtgGYRvHK/AaKymBprSzTtySb1dBr27
 11oINl9IUy3AQ79WoNtLWmHHtUEB
X-Google-Smtp-Source: APXvYqwMnQVrLjA1g21wzkAIrz2rl3Vf/uu2lu9NB3Qk84xL2oh7kfaA51C2OEn9zBbP8RuyKBhHRw==
X-Received: by 2002:a17:90a:178d:: with SMTP id
 q13mr355714pja.134.1568510967160; 
 Sat, 14 Sep 2019 18:29:27 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id bt1sm6267043pjb.17.2019.09.14.18.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 18:29:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 22/27] powerpc/64: system call remove non-volatile GPR
 save optimisation
Date: Sun, 15 Sep 2019 11:28:08 +1000
Message-Id: <20190915012813.29317-23-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190915012813.29317-1-npiggin@gmail.com>
References: <20190915012813.29317-1-npiggin@gmail.com>
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc has an optimisation where interrupts avoid saving the
non-volatile (or callee saved) registers to the interrupt stack frame if
they are not required.

Two problems with this are that an interrupt does not always know
whether it will need non-volatiles; and if it does need them, they can
only be saved from the entry-scoped asm code (because we don't control
what the C compiler does with these registers).

system calls are the most difficult: some system calls always require
all registers (e.g., fork, to copy regs into the child).  Sometimes
registers are only required under certain conditions (e.g., tracing,
signal delivery). These cases require ugly logic in the call chains
(e.g., ppc_fork), and require a lot of logic to be implemented in asm.

So remove the optimisation for system calls, and always save NVGPRs on
entry. Modern high performance CPUs are not so sensitive, because the
stores are dense in cache and can be hidden by other expensive work in
the syscall path -- the null syscall selftests benchmark on POWER9 is
not slowed (124.40ns before and 123.64ns after, i.e., within the noise).

Other interrupts retain the NVGPR optimisation for now.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_64.S           | 72 +++++-------------------
 arch/powerpc/kernel/syscalls/syscall.tbl | 22 +++++---
 2 files changed, 28 insertions(+), 66 deletions(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 6467bdab8d40..5a3e0b5c9ad1 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -98,13 +98,14 @@ END_BTB_FLUSH_SECTION
 	std	r11,_XER(r1)
 	std	r11,_CTR(r1)
 	std	r9,GPR13(r1)
+	SAVE_NVGPRS(r1)
 	mflr	r10
 	/*
 	 * This clears CR0.SO (bit 28), which is the error indication on
 	 * return from this system call.
 	 */
 	rldimi	r2,r11,28,(63-28)
-	li	r11,0xc01
+	li	r11,0xc00
 	std	r10,_LINK(r1)
 	std	r11,_TRAP(r1)
 	std	r3,ORIG_GPR3(r1)
@@ -323,7 +324,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
 /* Traced system call support */
 .Lsyscall_dotrace:
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_syscall_trace_enter
 
@@ -408,7 +408,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	mtmsrd	r10,1
 #endif /* CONFIG_PPC_BOOK3E */
 
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_syscall_trace_leave
 	b	ret_from_except
@@ -442,62 +441,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 _ASM_NOKPROBE_SYMBOL(system_call_common);
 _ASM_NOKPROBE_SYMBOL(system_call_exit);
 
-/* Save non-volatile GPRs, if not already saved. */
-_GLOBAL(save_nvgprs)
-	ld	r11,_TRAP(r1)
-	andi.	r0,r11,1
-	beqlr-
-	SAVE_NVGPRS(r1)
-	clrrdi	r0,r11,1
-	std	r0,_TRAP(r1)
-	blr
-_ASM_NOKPROBE_SYMBOL(save_nvgprs);
-
-	
-/*
- * The sigsuspend and rt_sigsuspend system calls can call do_signal
- * and thus put the process into the stopped state where we might
- * want to examine its user state with ptrace.  Therefore we need
- * to save all the nonvolatile registers (r14 - r31) before calling
- * the C code.  Similarly, fork, vfork and clone need the full
- * register state on the stack so that it can be copied to the child.
- */
-
-_GLOBAL(ppc_fork)
-	bl	save_nvgprs
-	bl	sys_fork
-	b	.Lsyscall_exit
-
-_GLOBAL(ppc_vfork)
-	bl	save_nvgprs
-	bl	sys_vfork
-	b	.Lsyscall_exit
-
-_GLOBAL(ppc_clone)
-	bl	save_nvgprs
-	bl	sys_clone
-	b	.Lsyscall_exit
-
-_GLOBAL(ppc_clone3)
-       bl      save_nvgprs
-       bl      sys_clone3
-       b       .Lsyscall_exit
-
-_GLOBAL(ppc32_swapcontext)
-	bl	save_nvgprs
-	bl	compat_sys_swapcontext
-	b	.Lsyscall_exit
-
-_GLOBAL(ppc64_swapcontext)
-	bl	save_nvgprs
-	bl	sys_swapcontext
-	b	.Lsyscall_exit
-
-_GLOBAL(ppc_switch_endian)
-	bl	save_nvgprs
-	bl	sys_switch_endian
-	b	.Lsyscall_exit
-
 _GLOBAL(ret_from_fork)
 	bl	schedule_tail
 	REST_NVGPRS(r1)
@@ -516,6 +459,17 @@ _GLOBAL(ret_from_kernel_thread)
 	li	r3,0
 	b	.Lsyscall_exit
 
+/* Save non-volatile GPRs, if not already saved. */
+_GLOBAL(save_nvgprs)
+	ld	r11,_TRAP(r1)
+	andi.	r0,r11,1
+	beqlr-
+	SAVE_NVGPRS(r1)
+	clrrdi	r0,r11,1
+	std	r0,_TRAP(r1)
+	blr
+_ASM_NOKPROBE_SYMBOL(save_nvgprs);
+
 #ifdef CONFIG_PPC_BOOK3S_64
 
 #define FLUSH_COUNT_CACHE	\
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index 43f736ed47f2..d899bcb5343e 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -9,7 +9,9 @@
 #
 0	nospu	restart_syscall			sys_restart_syscall
 1	nospu	exit				sys_exit
-2	nospu	fork				ppc_fork
+2	32	fork				ppc_fork			sys_fork
+2	64	fork				sys_fork
+2	spu	fork				sys_ni_syscall
 3	common	read				sys_read
 4	common	write				sys_write
 5	common	open				sys_open			compat_sys_open
@@ -158,7 +160,9 @@
 119	32	sigreturn			sys_sigreturn			compat_sys_sigreturn
 119	64	sigreturn			sys_ni_syscall
 119	spu	sigreturn			sys_ni_syscall
-120	nospu	clone				ppc_clone
+120	32	clone				ppc_clone			sys_clone
+120	64	clone				sys_clone
+120	spu	clone				sys_ni_syscall
 121	common	setdomainname			sys_setdomainname
 122	common	uname				sys_newuname
 123	common	modify_ldt			sys_ni_syscall
@@ -240,7 +244,9 @@
 186	spu	sendfile			sys_sendfile64
 187	common	getpmsg				sys_ni_syscall
 188	common 	putpmsg				sys_ni_syscall
-189	nospu	vfork				ppc_vfork
+189	32	vfork				ppc_vfork			sys_vfork
+189	64	vfork				sys_vfork
+189	spu	vfork				sys_ni_syscall
 190	common	ugetrlimit			sys_getrlimit			compat_sys_getrlimit
 191	common	readahead			sys_readahead			compat_sys_readahead
 192	32	mmap2				sys_mmap2			compat_sys_mmap2
@@ -316,8 +322,8 @@
 248	32	clock_nanosleep			sys_clock_nanosleep_time32
 248	64	clock_nanosleep			sys_clock_nanosleep
 248	spu	clock_nanosleep			sys_clock_nanosleep
-249	32	swapcontext			ppc_swapcontext			ppc32_swapcontext
-249	64	swapcontext			ppc64_swapcontext
+249	32	swapcontext			ppc_swapcontext			compat_sys_swapcontext
+249	64	swapcontext			sys_swapcontext
 249	spu	swapcontext			sys_ni_syscall
 250	common	tgkill				sys_tgkill
 251	32	utimes				sys_utimes_time32
@@ -456,7 +462,7 @@
 361	common	bpf				sys_bpf
 362	nospu	execveat			sys_execveat			compat_sys_execveat
 363	32	switch_endian			sys_ni_syscall
-363	64	switch_endian			ppc_switch_endian
+363	64	switch_endian			sys_switch_endian
 363	spu	switch_endian			sys_ni_syscall
 364	common	userfaultfd			sys_userfaultfd
 365	common	membarrier			sys_membarrier
@@ -516,4 +522,6 @@
 432	common	fsmount				sys_fsmount
 433	common	fspick				sys_fspick
 434	common	pidfd_open			sys_pidfd_open
-435	nospu	clone3				ppc_clone3
+435	32	clone3				ppc_clone3			sys_clone3
+435	64	clone3				sys_clone3
+435	spu	clone3				sys_ni_syscall
-- 
2.23.0

