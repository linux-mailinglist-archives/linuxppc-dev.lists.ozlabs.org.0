Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B131490A30
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 15:21:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcvGL5cVtz30Lr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 01:21:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=E2nS0B3T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=E2nS0B3T; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcvFh5m1cz2yMs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 01:20:39 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id i8so11001533pgt.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 06:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y9C7t1xNtINtph1aAC9wIr8lleaPpcggyvhTav+JFy8=;
 b=E2nS0B3TU/tVJ3UkZtX9g2RiE7wMDwSCzMO0+PfZRCVOnuJsDNm0/AMPKYQjBpYw4/
 gYSyltq8dysohdffnqdIsDCGNz7esnp1BKVKyYxNNC4dgf3nN8qp2E6S6BXbUKbUrNVh
 D9uXApoFnm/Gudw3RTXoPZDtDVhM36Q7P7VHksrShxeonh0ro4cCbiS00GTkEbZIe7Sa
 +bwtlMrMhL13gvt/Ardmu/iPhTaFfcgfUbzvHj9e2m7Vnjw2UfIk9lpJ4HC86WkxnPFI
 +KupYpena3qtAuh9n35fDZGJhyom6Yz7ZenphkPk1jyT540RHyK1dLzaYYB49PFQ/fO9
 zudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y9C7t1xNtINtph1aAC9wIr8lleaPpcggyvhTav+JFy8=;
 b=yxv82l61zFqAJFaswHRYtA9vWG76j1bACGrzbOSFl4Bwc87jTp7HLFvIHi+V41mAU3
 uQXJrc8gyMRWdjsLCEsKpZxEMxCUClG+49NJFGuwNJAX5HC8mmEqP112RCSy+8Dr8qSO
 l6vhDQxh5y9dJCi5JTG/TlXU/vBsPgCDe9kihMZarOBoErytED8pEGlLmBdSFYdFC/vq
 Vqf3AYSJryifpEnlT6ERKDfIAOF7avgAaJQ4N0qHaPxly5YXhzH+ymPF5Oj7bbJp7rPj
 aluDNTxBOspS7QoWKohpTv1hzR9JrASmeaF9z2OT0z7RecTPoy6yPdWj5A8KPlxY0YNW
 v1gQ==
X-Gm-Message-State: AOAM530Iq/UvvjUPelX4VAWOi7JtRLWFztmYv67afxH2aQzZPz2hIfpj
 pgWMFUJZ4Zb2ZOgwgpg3cVpNxQq/dLs=
X-Google-Smtp-Source: ABdhPJw/LlJ5CTBx0kN6xrJcRYBgBoBp3MxsDK8RdJwQUYMpSBjCnFDxXAYdyoxbVnhLHjiJN4+SRw==
X-Received: by 2002:a63:600c:: with SMTP id u12mr11851308pgb.200.1642429235500; 
 Mon, 17 Jan 2022 06:20:35 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (124-171-74-95.tpgi.com.au. [124.171.74.95])
 by smtp.gmail.com with ESMTPSA id y124sm13602777pfg.127.2022.01.17.06.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 06:20:35 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/3] powerpc/64s: Fix system call emulation
Date: Tue, 18 Jan 2022 00:20:28 +1000
Message-Id: <20220117142030.3038465-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

Interrupt return code expects the returned-to irq state to be reconciled
with the returned-to MSR[EE] state. That is, if local irqs are enabled
then MSR[EE] must be set, and if MSR[EE] is not set then local irqs must
be disabled.

System call emulation (both sc and scv 0) does not get this right, it
tries to return to a context with MSR[EE]=0 and local irqs enabled. This
confuses interrupt return and triggers a warning and probably worse.

Fix this by returning to the system call entry points with MSR[EE]=0 and
local irqs disabled. Add a case to deal with this kind of entry in the
system call handler. The difficulty is that the interrupt return changes
from user-mode to kernel mode, so it does not restore everything to the
way it would look when coming from userspace (e.g., CPU accounting, kuap,
the pkey regs, etc).

XXX: I don't know if this is quite the best problem. System call emulation
is much more complicated than it looks due to this return-to-kernel problem.
Even now the patch relies on SOFTE being set in the stack by the interrupt
return reading back the same way by the system call handler that creates
a new stack at the same position (this is how it determines it was an
emulated syscall). Not only that but suspect the IAMR is not being restored
correctly here and the correct user value on the stack gets clobbered.

Better option might be to have per-thread data that sets an emulated
syscall required flag and saves certain things like iamr. Or possibly just
bite the bullet and create new entry points for syscall emulation.
---
 arch/powerpc/kernel/interrupt.c    | 35 ++++++++++++++++++++----------
 arch/powerpc/kernel/interrupt_64.S | 10 ---------
 arch/powerpc/lib/sstep.c           |  9 +++++---
 3 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 7cd6ce3ec423..e73ad5842cb0 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -81,10 +81,31 @@ notrace long system_call_exception(long r3, long r4, long r5,
 {
 	syscall_fn f;
 
-	kuap_lock();
-
 	regs->orig_gpr3 = r3;
 
+	if (IS_ENABLED(CONFIG_PPC64) &&
+			unlikely(arch_irq_disabled_regs(regs))) {
+		irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
+		/*
+		 * The first stack frame entry will have IRQS_ENABLED except
+		 * in the case of syscall emulation, where the syscall entry
+		 * code is returned-to with MSR[EE] disabled, which requires
+		 * regs->softe is IRQS_DISABLED to avoid triggering the
+		 * interrupt return code warning for returning to local irqs
+		 * enabled but MSR[EE]=0. Not a big deal to re-set it here.
+		 */
+#ifdef CONFIG_PPC_BOOK3S_64
+		set_kuap(AMR_KUAP_BLOCKED);
+#endif
+		if (trap_is_scv(regs))
+			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+		/* XXX: pkey save? Did we save the wrong values in stack
+		 * from userspace now? */
+		goto skip_user_entry;
+	}
+
+	kuap_lock();
+
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
 
@@ -95,7 +116,6 @@ notrace long system_call_exception(long r3, long r4, long r5,
 
 	BUG_ON(regs_is_unrecoverable(regs));
 	BUG_ON(!(regs->msr & MSR_PR));
-	BUG_ON(arch_irq_disabled_regs(regs));
 
 #ifdef CONFIG_PPC_PKEY
 	if (mmu_has_feature(MMU_FTR_PKEY)) {
@@ -129,14 +149,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 
 	account_stolen_time();
 
-	/*
-	 * This is not required for the syscall exit path, but makes the
-	 * stack frame look nicer. If this was initialised in the first stack
-	 * frame, or if the unwinder was taught the first stack frame always
-	 * returns to user with IRQS_ENABLED, this store could be avoided!
-	 */
-	irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
-
+skip_user_entry:
 	/*
 	 * If system call is called with TM active, set _TIF_RESTOREALL to
 	 * prevent RFSCV being used to return to userspace, because POWER9
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 7bab2d7de372..6471034c7909 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -219,16 +219,6 @@ system_call_vectored common 0x3000
  */
 system_call_vectored sigill 0x7ff0
 
-
-/*
- * Entered via kernel return set up by kernel/sstep.c, must match entry regs
- */
-	.globl system_call_vectored_emulate
-system_call_vectored_emulate:
-_ASM_NOKPROBE_SYMBOL(system_call_vectored_emulate)
-	li	r10,IRQS_ALL_DISABLED
-	stb	r10,PACAIRQSOFTMASK(r13)
-	b	system_call_vectored_common
 #endif /* CONFIG_PPC_BOOK3S */
 
 	.balign IFETCH_ALIGN_BYTES
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index a94b0cd0bdc5..62d3fd925dde 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -16,7 +16,7 @@
 #include <asm/disassemble.h>
 
 extern char system_call_common[];
-extern char system_call_vectored_emulate[];
+extern char system_call_vectored_common[];
 
 #ifdef CONFIG_PPC64
 /* Bits in SRR1 that are copied from MSR */
@@ -3667,6 +3667,8 @@ int emulate_step(struct pt_regs *regs, ppc_inst_t instr)
 		regs->gpr[11] = regs->nip + 4;
 		regs->gpr[12] = regs->msr & MSR_MASK;
 		regs->gpr[13] = (unsigned long) get_paca();
+		// Return code needs regs->softe to match regs->msr & MSR_EE
+		regs->softe = IRQS_ALL_DISABLED;
 		regs_set_return_ip(regs, (unsigned long) &system_call_common);
 		regs_set_return_msr(regs, MSR_KERNEL);
 		return 1;
@@ -3674,11 +3676,12 @@ int emulate_step(struct pt_regs *regs, ppc_inst_t instr)
 #ifdef CONFIG_PPC_BOOK3S_64
 	case SYSCALL_VECTORED_0:	/* scv 0 */
 		regs->gpr[9] = regs->gpr[13];
-		regs->gpr[10] = MSR_KERNEL;
 		regs->gpr[11] = regs->nip + 4;
 		regs->gpr[12] = regs->msr & MSR_MASK;
 		regs->gpr[13] = (unsigned long) get_paca();
-		regs_set_return_ip(regs, (unsigned long) &system_call_vectored_emulate);
+		// Return code needs regs->softe to match regs->msr & MSR_EE
+		regs->softe = IRQS_ALL_DISABLED;
+		regs_set_return_ip(regs, (unsigned long) &system_call_vectored_common);
 		regs_set_return_msr(regs, MSR_KERNEL);
 		return 1;
 #endif
-- 
2.23.0

