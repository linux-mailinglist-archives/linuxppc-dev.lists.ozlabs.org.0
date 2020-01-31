Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6E914EBCA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 12:37:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488FYs5BB5zDqfS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 22:37:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=aeiX9vMP; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488FWS25YxzDqdG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 22:34:59 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 488FWK5yhzz9vC1W;
 Fri, 31 Jan 2020 12:34:53 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=aeiX9vMP; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4UsLE8b4flK3; Fri, 31 Jan 2020 12:34:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 488FWK4xF3z9vBmg;
 Fri, 31 Jan 2020 12:34:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580470493; bh=BUW5lQV+Csf1KeTqEbGi3Cdg7D5W/o2cjPxvnhrGHRs=;
 h=From:Subject:To:Cc:Date:From;
 b=aeiX9vMPRU4ua65XWVCVcKqRX5tJEezn5PbXD/hr18tIw2xl4GpvzcySZ6yRwDili
 e0cq3mfyo4VRdlxmaUPKqMZJ2BfJ5vqxWb+Eg7FKpVhBV3QyN45E77LveZuzLHk5EF
 XdXDF1Yh9GSRLysSWe7VQR4ugO9OA8RSjKbaqn9Q=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E20308B89E;
 Fri, 31 Jan 2020 12:34:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zG4KXddnSNxz; Fri, 31 Jan 2020 12:34:54 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B33B78B890;
 Fri, 31 Jan 2020 12:34:54 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 82E9D65288; Fri, 31 Jan 2020 11:34:54 +0000 (UTC)
Message-Id: <8ee3bdbbdfdfc64ca7001e90c43b2aee6f333578.1580470482.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 1/2] powerpc/32: Warn and return ENOSYS on syscalls from
 kernel
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 31 Jan 2020 11:34:54 +0000 (UTC)
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

Since commit b86fb88855ea ("powerpc/32: implement fast entry for
syscalls on non BOOKE") and commit 1a4b739bbb4f ("powerpc/32:
implement fast entry for syscalls on BOOKE"), syscalls from
kernel are unexpected and can have catastrophic consequences
as it will destroy the kernel stack.

Test MSR_PR on syscall entry. In case syscall is from kernel,
emit a warning and return ENOSYS error.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v2: Rebased on powerpc/next-test, ie on top of VMAP_STACK series

v3:
- Rebased on today's powerpc/merge.
- Reloading both SRR0 and SRR1 in ret_from_kernel_syscall allthough
SRR1 is already in r9 at the time being, allows more flexibility and
less prone to risk of errors for future changes in the syscall entry.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_32.S   | 27 +++++++++++++++++++++++++++
 arch/powerpc/kernel/head_32.h    | 16 +++++++++-------
 arch/powerpc/kernel/head_booke.h |  5 ++++-
 3 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 77abbc34bbe0..e808626ff230 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -575,6 +575,33 @@ syscall_exit_work:
 	bl	do_syscall_trace_leave
 	b	ret_from_except_full
 
+	/*
+	 * System call was called from kernel. We get here with SRR1 in r9.
+	 * Mark the exception as recoverable once we have retrieved SRR0,
+	 * trap a warning and return ENOSYS with CR[SO] set.
+	 */
+	.globl	ret_from_kernel_syscall
+ret_from_kernel_syscall:
+	mfspr	r9, SPRN_SRR0
+	mfspr	r10, SPRN_SRR1
+#if !defined(CONFIG_4xx) && !defined(CONFIG_BOOKE)
+	LOAD_REG_IMMEDIATE(r11, MSR_KERNEL & ~(MSR_IR|MSR_DR))
+	mtmsr	r11
+#endif
+
+0:	trap
+	EMIT_BUG_ENTRY 0b,__FILE__,__LINE__, BUGFLAG_WARNING
+
+	li	r3, ENOSYS
+	crset	so
+#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
+	mtspr	SPRN_NRI, r0
+#endif
+	mtspr	SPRN_SRR0, r9
+	mtspr	SPRN_SRR1, r10
+	SYNC
+	RFI
+
 /*
  * The fork/clone functions need to copy the full register set into
  * the child process. Therefore we need to save all the nonvolatile
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index a6a5fbbf8504..0e7bf28fe53a 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -111,14 +111,16 @@
 
 .macro SYSCALL_ENTRY trapno
 	mfspr	r12,SPRN_SPRG_THREAD
+	mfspr	r9, SPRN_SRR1
 #ifdef CONFIG_VMAP_STACK
-	mfspr	r9, SPRN_SRR0
-	mfspr	r11, SPRN_SRR1
-	stw	r9, SRR0(r12)
-	stw	r11, SRR1(r12)
+	mfspr	r11, SPRN_SRR0
+	stw	r11, SRR0(r12)
+	stw	r9, SRR1(r12)
 #endif
 	mfcr	r10
+	andi.	r11, r9, MSR_PR
 	lwz	r11,TASK_STACK-THREAD(r12)
+	beq-	99f
 	rlwinm	r10,r10,0,4,2	/* Clear SO bit in CR */
 	addi	r11, r11, THREAD_SIZE - INT_FRAME_SIZE
 #ifdef CONFIG_VMAP_STACK
@@ -128,15 +130,14 @@
 #endif
 	tovirt_vmstack r12, r12
 	tophys_novmstack r11, r11
-	mflr	r9
 	stw	r10,_CCR(r11)		/* save registers */
-	stw	r9, _LINK(r11)
+	mflr	r10
+	stw	r10, _LINK(r11)
 #ifdef CONFIG_VMAP_STACK
 	lwz	r10, SRR0(r12)
 	lwz	r9, SRR1(r12)
 #else
 	mfspr	r10,SPRN_SRR0
-	mfspr	r9,SPRN_SRR1
 #endif
 	stw	r1,GPR1(r11)
 	stw	r1,0(r11)
@@ -209,6 +210,7 @@
 	mtspr	SPRN_SRR0,r11
 	SYNC
 	RFI				/* jump to handler, enable MMU */
+99:	b	ret_from_kernel_syscall
 .endm
 
 .macro save_dar_dsisr_on_stack reg1, reg2, sp
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 37fc84ed90e3..bd2e5ed8dd50 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -104,16 +104,18 @@ FTR_SECTION_ELSE
 #ifdef CONFIG_KVM_BOOKE_HV
 ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 #endif
+	mfspr	r9, SPRN_SRR1
 	BOOKE_CLEAR_BTB(r11)
+	andi.	r11, r9, MSR_PR
 	lwz	r11, TASK_STACK - THREAD(r10)
 	rlwinm	r12,r12,0,4,2	/* Clear SO bit in CR */
+	beq-	99f
 	ALLOC_STACK_FRAME(r11, THREAD_SIZE - INT_FRAME_SIZE)
 	stw	r12, _CCR(r11)		/* save various registers */
 	mflr	r12
 	stw	r12,_LINK(r11)
 	mfspr	r12,SPRN_SRR0
 	stw	r1, GPR1(r11)
-	mfspr	r9,SPRN_SRR1
 	stw	r1, 0(r11)
 	mr	r1, r11
 	stw	r12,_NIP(r11)
@@ -176,6 +178,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	mtspr	SPRN_SRR0,r11
 	SYNC
 	RFI				/* jump to handler, enable MMU */
+99:	b	ret_from_kernel_syscall
 .endm
 
 /* To handle the additional exception priority levels on 40x and Book-E
-- 
2.25.0

