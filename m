Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDBC3026CC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 16:20:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPYTM47pYzDqlw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 02:20:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPXmc3dxtzDqfY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 01:48:32 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DPXmS1NGMz9v0Hl;
 Mon, 25 Jan 2021 15:48:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EkPXsMuex3eP; Mon, 25 Jan 2021 15:48:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DPXmS0365z9v0Hk;
 Mon, 25 Jan 2021 15:48:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 895728B79E;
 Mon, 25 Jan 2021 15:48:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cE-EMZBN0A4D; Mon, 25 Jan 2021 15:48:29 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A8A38B79B;
 Mon, 25 Jan 2021 15:48:29 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4EE1F66AD8; Mon, 25 Jan 2021 14:48:29 +0000 (UTC)
Message-Id: <35e22ae59d0e1810ab7954918bdb1078b06d6bbd.1611585031.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1611585031.git.christophe.leroy@csgroup.eu>
References: <cover.1611585031.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 16/23] powerpc/32: Always save non volatile GPRs at syscall
 entry
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Mon, 25 Jan 2021 14:48:29 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for porting syscall entry/exit to C, inconditionally
save non volatile general purpose registers.

Commit 965dd3ad3076 ("powerpc/64/syscall: Remove non-volatile GPR save
optimisation") provides detailed explanation.

This increases the number of cycles by 24 cycles on 8xx with
null_syscall benchmark (280 => 304 cycles)

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S           | 46 +-----------------------
 arch/powerpc/kernel/head_32.h            |  2 +-
 arch/powerpc/kernel/head_booke.h         |  2 +-
 arch/powerpc/kernel/syscalls/syscall.tbl | 20 +++--------
 4 files changed, 8 insertions(+), 62 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index b1e36602c013..97dc28a68465 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -351,6 +351,7 @@ trace_syscall_entry_irq_off:
 
 	.globl	transfer_to_syscall
 transfer_to_syscall:
+	SAVE_NVGPRS(r1)
 #ifdef CONFIG_PPC_BOOK3S_32
 	kuep_lock r11, r12
 #endif
@@ -614,51 +615,6 @@ ret_from_kernel_syscall:
 #endif
 _ASM_NOKPROBE_SYMBOL(ret_from_kernel_syscall)
 
-/*
- * The fork/clone functions need to copy the full register set into
- * the child process. Therefore we need to save all the nonvolatile
- * registers (r13 - r31) before calling the C code.
- */
-	.globl	ppc_fork
-ppc_fork:
-	SAVE_NVGPRS(r1)
-	lwz	r0,_TRAP(r1)
-	rlwinm	r0,r0,0,0,30		/* clear LSB to indicate full */
-	stw	r0,_TRAP(r1)		/* register set saved */
-	b	sys_fork
-
-	.globl	ppc_vfork
-ppc_vfork:
-	SAVE_NVGPRS(r1)
-	lwz	r0,_TRAP(r1)
-	rlwinm	r0,r0,0,0,30		/* clear LSB to indicate full */
-	stw	r0,_TRAP(r1)		/* register set saved */
-	b	sys_vfork
-
-	.globl	ppc_clone
-ppc_clone:
-	SAVE_NVGPRS(r1)
-	lwz	r0,_TRAP(r1)
-	rlwinm	r0,r0,0,0,30		/* clear LSB to indicate full */
-	stw	r0,_TRAP(r1)		/* register set saved */
-	b	sys_clone
-
-	.globl	ppc_clone3
-ppc_clone3:
-	SAVE_NVGPRS(r1)
-	lwz	r0,_TRAP(r1)
-	rlwinm	r0,r0,0,0,30		/* clear LSB to indicate full */
-	stw	r0,_TRAP(r1)		/* register set saved */
-	b	sys_clone3
-
-	.globl	ppc_swapcontext
-ppc_swapcontext:
-	SAVE_NVGPRS(r1)
-	lwz	r0,_TRAP(r1)
-	rlwinm	r0,r0,0,0,30		/* clear LSB to indicate full */
-	stw	r0,_TRAP(r1)		/* register set saved */
-	b	sys_swapcontext
-
 /*
  * Top-level page fault handling.
  * This is in assembler because if do_page_fault tells us that
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 24dc326e0d56..7b12736ec546 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -148,7 +148,7 @@
 	stw	r2,GPR2(r11)
 	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
 	stw	r9,_MSR(r11)
-	li	r2, \trapno + 1
+	li	r2, \trapno
 	stw	r10,8(r11)
 	stw	r2,_TRAP(r11)
 	SAVE_GPR(0, r11)
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index b3c502c503a0..626e716576ce 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -124,7 +124,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	stw	r2,GPR2(r11)
 	addi	r12, r12, STACK_FRAME_REGS_MARKER@l
 	stw	r9,_MSR(r11)
-	li	r2, \trapno + 1
+	li	r2, \trapno
 	stw	r12, 8(r11)
 	stw	r2,_TRAP(r11)
 	SAVE_GPR(0, r11)
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index f744eb5cba88..96b2157f0371 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -9,9 +9,7 @@
 #
 0	nospu	restart_syscall			sys_restart_syscall
 1	nospu	exit				sys_exit
-2	32	fork				ppc_fork			sys_fork
-2	64	fork				sys_fork
-2	spu	fork				sys_ni_syscall
+2	nospu	fork				sys_fork
 3	common	read				sys_read
 4	common	write				sys_write
 5	common	open				sys_open			compat_sys_open
@@ -160,9 +158,7 @@
 119	32	sigreturn			sys_sigreturn			compat_sys_sigreturn
 119	64	sigreturn			sys_ni_syscall
 119	spu	sigreturn			sys_ni_syscall
-120	32	clone				ppc_clone			sys_clone
-120	64	clone				sys_clone
-120	spu	clone				sys_ni_syscall
+120	nospu	clone				sys_clone
 121	common	setdomainname			sys_setdomainname
 122	common	uname				sys_newuname
 123	common	modify_ldt			sys_ni_syscall
@@ -244,9 +240,7 @@
 186	spu	sendfile			sys_sendfile64
 187	common	getpmsg				sys_ni_syscall
 188	common 	putpmsg				sys_ni_syscall
-189	32	vfork				ppc_vfork			sys_vfork
-189	64	vfork				sys_vfork
-189	spu	vfork				sys_ni_syscall
+189	nospu	vfork				sys_vfork
 190	common	ugetrlimit			sys_getrlimit			compat_sys_getrlimit
 191	common	readahead			sys_readahead			compat_sys_readahead
 192	32	mmap2				sys_mmap2			compat_sys_mmap2
@@ -322,9 +316,7 @@
 248	32	clock_nanosleep			sys_clock_nanosleep_time32
 248	64	clock_nanosleep			sys_clock_nanosleep
 248	spu	clock_nanosleep			sys_clock_nanosleep
-249	32	swapcontext			ppc_swapcontext			compat_sys_swapcontext
-249	64	swapcontext			sys_swapcontext
-249	spu	swapcontext			sys_ni_syscall
+249	nospu	swapcontext			sys_swapcontext			compat_sys_swapcontext
 250	common	tgkill				sys_tgkill
 251	32	utimes				sys_utimes_time32
 251	64	utimes				sys_utimes
@@ -522,9 +514,7 @@
 432	common	fsmount				sys_fsmount
 433	common	fspick				sys_fspick
 434	common	pidfd_open			sys_pidfd_open
-435	32	clone3				ppc_clone3			sys_clone3
-435	64	clone3				sys_clone3
-435	spu	clone3				sys_ni_syscall
+435	nospu	clone3				sys_clone3
 436	common	close_range			sys_close_range
 437	common	openat2				sys_openat2
 438	common	pidfd_getfd			sys_pidfd_getfd
-- 
2.25.0

