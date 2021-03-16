Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F9033D20F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 11:44:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F08zQ63pxz3c2x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 21:44:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=geDN/Cds;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=geDN/Cds; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F08xb6ChXz30Df
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 21:42:27 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 16so15904657pgo.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 03:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=34m56TdPV2JT1m7ppaIH6MYy2vJq4TtTgpfhFKLnysE=;
 b=geDN/CdsnynKca0NPHA7ThBF0rodD3dJJtGH4bf281AuLG5i/Cm6TRjhGp/P5MFZ1Y
 3yiVOGAbEdIJm+7QEWdeQUO/wT+4iLYiZznpoFE9nS8Z9mSR1cFuotXbiQhv/i/WwXpP
 /yQsnHM5Abd55Q6eq+nw8JQe0oCUa4EsteirXsK5uzTDSRgtDbeomM0gWzQ5F0kdQVLK
 Ac1xgiP4XljrwaY3s2FXNPJHWwLQtjcX47XikZmQ5KM/+txSP5YuvtgdXSet42mr3Vsx
 r5bnD4yw+rtSbbfNDR5LxHrXFjjuIT8gvsJgRgFee5EwhzWirDG5TuVT6oxFMfVfxnrB
 eyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=34m56TdPV2JT1m7ppaIH6MYy2vJq4TtTgpfhFKLnysE=;
 b=WTS+jDooP2+gncUmK5rT6qax2G03yYxLAlvwuXIagMqMe2jXP3WHpoue0pWlId3144
 4J1ZtElIvbn4bKZxeqRNRM1MdLfGLrfODptfveRlYGX+LzDyHIU7tkzQm7QUjiNFYOnA
 BHFNu+L3ZhVd4xWC1enucCuMO/0EWHstimWqbbAYMINZQ+tqZsCbLkBFpn3LRpYlfDSl
 Q8rOQ39NkGGgRoRrnXYGPxir4TSsQxY5fLCwXr2yMUWEKU1dfjh7lBn0FwZVyOjsMgxx
 uik7ZuCDZelS0Gt6WAjsZubWfvjH/B8ofFHt4idlDBFkGQr0VcTuAQusXhNdRQw3aq4A
 TZyg==
X-Gm-Message-State: AOAM531Y3W7c1K5n1/pSC6E2DsgmNcQBZ+HvMh9+9Z5FTIgYuxA0RE8Q
 LtXbIFLEoZTqisBE9vzD6uW8hJ4dKzE=
X-Google-Smtp-Source: ABdhPJwqZ4T7EWUq/iEDisTZjob0YkNgKj6ZezQZHTD+LJVek6XYjMGrn6/qUQuZaHCY1w3AwO4EiA==
X-Received: by 2002:a63:f558:: with SMTP id e24mr3532108pgk.153.1615891345495; 
 Tue, 16 Mar 2021 03:42:25 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 r30sm15828489pgu.86.2021.03.16.03.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 03:42:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 03/11] powerpc/interrupt: update common interrupt code for
Date: Tue, 16 Mar 2021 20:41:57 +1000
Message-Id: <20210316104206.407354-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210316104206.407354-1-npiggin@gmail.com>
References: <20210316104206.407354-1-npiggin@gmail.com>
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
Cc: Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This makes adjustments to 64-bit asm and common C interrupt return
code to be usable by the 64e subarchitecture.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_64.S  |  9 +++++++--
 arch/powerpc/kernel/interrupt.c | 35 ++++++++++++++++++++-------------
 2 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 853534b2ae2e..555b3d0a3f38 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -632,7 +632,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	addi	r1,r1,SWITCH_FRAME_SIZE
 	blr
 
-#ifdef CONFIG_PPC_BOOK3S
 	/*
 	 * If MSR EE/RI was never enabled, IRQs not reconciled, NVGPRs not
 	 * touched, no exit work created, then this can be used.
@@ -644,6 +643,7 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
 	kuap_check_amr r3, r4
 	ld	r5,_MSR(r1)
 	andi.	r0,r5,MSR_PR
+#ifdef CONFIG_PPC_BOOK3S
 	bne	.Lfast_user_interrupt_return_amr
 	kuap_kernel_restore r3, r4
 	andi.	r0,r5,MSR_RI
@@ -652,6 +652,10 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unrecoverable_exception
 	b	. /* should not get here */
+#else
+	bne	.Lfast_user_interrupt_return
+	b	.Lfast_kernel_interrupt_return
+#endif
 
 	.balign IFETCH_ALIGN_BYTES
 	.globl interrupt_return
@@ -665,8 +669,10 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 	cmpdi	r3,0
 	bne-	.Lrestore_nvgprs
 
+#ifdef CONFIG_PPC_BOOK3S
 .Lfast_user_interrupt_return_amr:
 	kuap_user_restore r3, r4
+#endif
 .Lfast_user_interrupt_return:
 	ld	r11,_NIP(r1)
 	ld	r12,_MSR(r1)
@@ -775,7 +781,6 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
 	RFI_TO_KERNEL
 	b	.	/* prevent speculative execution */
-#endif /* CONFIG_PPC_BOOK3S */
 
 #ifdef CONFIG_PPC_RTAS
 /*
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index fbabb49888d3..381a618b5b5b 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -235,6 +235,10 @@ static notrace void booke_load_dbcr0(void)
 #endif
 }
 
+/* temporary hack for context tracking, removed in later patch */
+#include <linux/sched/debug.h>
+asmlinkage __visible void __sched schedule_user(void);
+
 /*
  * This should be called after a syscall returns, with r3 the return value
  * from the syscall. If this function returns non-zero, the system call
@@ -292,7 +296,11 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
 		local_irq_enable();
 		if (ti_flags & _TIF_NEED_RESCHED) {
+#ifdef CONFIG_PPC_BOOK3E_64
+			schedule_user();
+#else
 			schedule();
+#endif
 		} else {
 			/*
 			 * SIGPENDING must restore signal handler function
@@ -349,18 +357,13 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 
 	account_cpu_user_exit();
 
-#ifndef CONFIG_PPC_BOOK3E_64 /* BOOK3E not using this */
-	/*
-	 * We do this at the end so that we do context switch with KERNEL AMR
-	 */
+	/* Restore user access locks last */
 	kuap_user_restore(regs);
-#endif
 	kuep_unlock();
 
 	return ret;
 }
 
-#ifndef CONFIG_PPC_BOOK3E_64 /* BOOK3E not yet using this */
 notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
 {
 	unsigned long ti_flags;
@@ -372,7 +375,9 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	BUG_ON(!(regs->msr & MSR_PR));
 	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(arch_irq_disabled_regs(regs));
+#ifdef CONFIG_PPC_BOOK3S_64
 	CT_WARN_ON(ct_state() == CONTEXT_USER);
+#endif
 
 	/*
 	 * We don't need to restore AMR on the way back to userspace for KUAP.
@@ -387,7 +392,11 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
 		local_irq_enable(); /* returning to user: may enable */
 		if (ti_flags & _TIF_NEED_RESCHED) {
+#ifdef CONFIG_PPC_BOOK3E_64
+			schedule_user();
+#else
 			schedule();
+#endif
 		} else {
 			if (ti_flags & _TIF_SIGPENDING)
 				ret |= _TIF_RESTOREALL;
@@ -432,10 +441,9 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 
 	account_cpu_user_exit();
 
-	/*
-	 * We do this at the end so that we do context switch with KERNEL AMR
-	 */
+	/* Restore user access locks last */
 	kuap_user_restore(regs);
+
 	return ret;
 }
 
@@ -456,7 +464,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	 * CT_WARN_ON comes here via program_check_exception,
 	 * so avoid recursion.
 	 */
-	if (TRAP(regs) != 0x700)
+	if (IS_ENABLED(CONFIG_BOOKS) && TRAP(regs) != 0x700)
 		CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	kuap = kuap_get_and_assert_locked();
@@ -497,12 +505,11 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 #endif
 
 	/*
-	 * Don't want to mfspr(SPRN_AMR) here, because this comes after mtmsr,
-	 * which would cause Read-After-Write stalls. Hence, we take the AMR
-	 * value from the check above.
+	 * 64s does not want to mfspr(SPRN_AMR) here, because this comes after
+	 * mtmsr, which would cause Read-After-Write stalls. Hence, take the
+	 * AMR value from the check above.
 	 */
 	kuap_kernel_restore(regs, kuap);
 
 	return ret;
 }
-#endif
-- 
2.23.0

