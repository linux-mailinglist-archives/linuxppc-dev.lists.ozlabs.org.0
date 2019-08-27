Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AE59DC0B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 05:39:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HZP26hL4zDqpr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 13:39:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fiFlN9dT"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HZCJ5sjHzDqpf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 13:30:52 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id 4so11040793pld.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 20:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y0CEusGeMR6BKaWGMt96JV7gQneFy6WC/pqkhh3twGM=;
 b=fiFlN9dTSAlJw2Olcs4kGc08jNdnT5JxqeVBuEI5hdnA9gDHKQR2TWYRTsICF7ez6b
 EK6zBLuu8lXXqroillDAzYwtEz3+MKYunswDvi3lhZEP0ehO/UI0sC+zpNvgednI0K/m
 NDG6fvex0HJnDV8k6KRUbimuoA8v6fMAkqO7MgjAphqxwN3t2DHNGVS7Ocez270P6CPv
 +W/sG7TTnSvLhDnUqbysFY/I5fKTY+NsHU51BG1LhaflnxTsleUvbo1CD3OY1dGaoUCA
 xChcJ/RYgDra7elCz8VzNZKBsyjv/X7ahfBP4J/PW1Y0l9JXk38mzclMBu5nDJYpDjv7
 R2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y0CEusGeMR6BKaWGMt96JV7gQneFy6WC/pqkhh3twGM=;
 b=EspjTTZB62Hm53LDR4hS2vjQuOVf+geCk5XYXZNkQTULaEP3cQzim3VdpI3x76UmLn
 kcZGcmnisd8Oizf9mj1OaiwN8rzGMLDXwF8kfSMh4wxRnosIAZTA3Dh8YwX0pWU/QyYU
 5YECUeSzapXKY9fe7YTcv3Y2f/U5gKnIiDTUpeEMQJhmtRzTfPEhm9tW6O1JuhcHlUuW
 cX5hMN0d5TANbsz0ZQW/73YkZASMWtyWpYQc12MdbYcndUjH7Jbe5L0MIUh4kQWaHYYa
 +3UsG3qfAH742mjkkeDCFQcXSiEiYqqkW4s7k/04Il8L/gNBGSrDscPXky2dfeVAmm3T
 j1vA==
X-Gm-Message-State: APjAAAVib16QZwGNmPa8SZNZywtVMF32nGnRoubFXGVSV8iJO3LQNfgh
 kk24DNTzjr0KqvxIxboBT/LWWw9a
X-Google-Smtp-Source: APXvYqx7vKhJQKSh//p+hNFBWu6GOrupRpwJ2mQUTRXWokaEdU1Hc9VoKpAzW2nJdQXOy1vYQoet3A==
X-Received: by 2002:a17:902:4201:: with SMTP id
 g1mr22381067pld.300.1566876650868; 
 Mon, 26 Aug 2019 20:30:50 -0700 (PDT)
Received: from bobo.local0.net (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id x24sm11383984pgl.84.2019.08.26.20.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 20:30:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] powerpc/64: system call remove non-volatile GPR save
 optimisation
Date: Tue, 27 Aug 2019 13:30:09 +1000
Message-Id: <20190827033010.28090-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827033010.28090-1-npiggin@gmail.com>
References: <20190827033010.28090-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
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

system calls are about the worst example of this, some system calls
always require all registers (e.g., fork, to copy regs into the child).
Sometimes registers are only required under certain conditions (e.g.,
tracing, signal delivery). This causes weird ugly logic in the call
chains (e.g., ppc_fork), and also prevents moving substantial amounts
of logic to C.

Remove this optimisation for system calls, and always save NVGPRs on
entry. On modern CPUs this doesn't appear to be worth the complexity
because the stores can be hidden by other work quite well the null
syscall selftests benchmark on a POWER9 has (124.40ns before and
123.64ns after, i.e., well within the noise).

Other interrupts are a little less complex in NVGPR handling, many
do less work at entry and also they don't have as clear a fast path
for avoiding the GPR restore as system calls, so this patch does not
remove the facility completely until more tests can be done.

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
index 43f736ed47f2..010b9f445586 100644
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
+435	nospu	clone3				sys_ni_syscall
-- 
2.22.0

