Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 585233B7A60
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 00:21:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDzV117c8z3cZp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 08:21:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Ybu2AiuA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ybu2AiuA; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDzSF1g23z2yXX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 08:20:13 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 mn20-20020a17090b1894b02901707fc074e8so2715167pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 15:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jkoQ/Q00S4CjH/5/CaN7eqDAVsQTIU5K4TFAA2pC0U0=;
 b=Ybu2AiuAQZcPRXPE+nClDyPy/ZiKHSeYD41wx2MT93869zVvdZRhvkPdhyi3W65ZzQ
 9Zr8JMFoAX3UdKAEqR5Vxvo4b8uXQd3aIa959pf7D+OqcU5gqzjU/7Aj1Lc+FP5KpaKf
 jWcYsKgIJ7x9Gtv4cNYntlc7KvunMGIRynMVUx/pjM9QYsKE0bOPjGVVtT2y//Wb7N+m
 8cGq+cEQFtcSzgc6V0YR/E/Qit1q14y3XoAWV8ZHCfYcMDRUxJVm20cBbYfzNawWUsXC
 P0DXKk02wkr1/6KAwas1w37NaEtWzL2Oir0loOJvKd6IEjtLA2rrhc43/PHdNUEsJfP4
 LHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jkoQ/Q00S4CjH/5/CaN7eqDAVsQTIU5K4TFAA2pC0U0=;
 b=tGcEKKqM9kQ/Sw8hISUyPYIMrfo+ScOXUhAWV0eWytwSDG230A1klWUYX91oW8DzrI
 roRGrBW8gy9+SUE/BN/Jr4LtJ5fibk12JDiRThw7piX69Pc3TH6RqZ6oMX3o1BrHeUo8
 uqX8jDzqeAT4s6LRcuaGvvc6CS7sc/H3ZVeLc/rXd79HRsG9zz9zqQtfJmuwawhUy638
 ba7PB2Zy/HxCgzdlXUSSjCcpiiTdm9qTkebNTaDEM/b3vJWwUETS2s8wc3/fF48Ogbhw
 dqL9pmnwJDHkoUJSSEvztV04vIWmY47651lHby57NRXxdO4tJEw9zN/gPvMJ5WdlveAG
 rdkw==
X-Gm-Message-State: AOAM532GycrEkpu1gw8mmzYhZSEpCLTmi7mIyJANkN3qnJ9eSI/qEe7S
 zPFl3azYu/LzEykTtIvWHCI1kFzBRMw=
X-Google-Smtp-Source: ABdhPJyUvZjkkf+6iB4BegciJI2QRWj+9x5SxdCLJSSDJ5plVh25bfIJp05B0xquBxf9T7bi83TERw==
X-Received: by 2002:a17:902:7c92:b029:111:2ca8:3d8e with SMTP id
 y18-20020a1709027c92b02901112ca83d8emr29095286pll.77.1625005210647; 
 Tue, 29 Jun 2021 15:20:10 -0700 (PDT)
Received: from bobo.ibm.com (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id l7sm19316583pgb.19.2021.06.29.15.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 15:20:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/9] powerpc/64e: remove implicit soft-masking and
 interrupt exit restart logic
Date: Wed, 30 Jun 2021 08:19:51 +1000
Message-Id: <20210629221957.1947577-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210629221957.1947577-1-npiggin@gmail.com>
References: <20210629221957.1947577-1-npiggin@gmail.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The implicit soft-masking to speed up interrupt return was going to be
used by 64e as well, but it was not ready in time. 64e always disables
MSR[EE] when exiting from interrupt and syscall.

Disable it for now.

Fixes: 9d1988ca87dd ("powerpc/64: treat low kernel text as irqs soft-masked")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 33 ++++++++++++++++++++--------
 arch/powerpc/kernel/exceptions-64e.S | 12 +---------
 arch/powerpc/kernel/interrupt_64.S   | 16 +++++++++++++-
 3 files changed, 40 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 8b4b1e84e110..f13c93b033c7 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -73,20 +73,34 @@
 #include <asm/kprobes.h>
 #include <asm/runlatch.h>
 
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3S_64
 extern char __end_soft_masked[];
 unsigned long search_kernel_restart_table(unsigned long addr);
-#endif
 
-#ifdef CONFIG_PPC_BOOK3S_64
 DECLARE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
 
+static inline bool is_implicit_soft_masked(struct pt_regs *regs)
+{
+	if (regs->msr & MSR_PR)
+		return false;
+
+	if (regs->nip >= (unsigned long)__end_soft_masked)
+		return false;
+
+	return true;
+}
+
 static inline void srr_regs_clobbered(void)
 {
 	local_paca->srr_valid = 0;
 	local_paca->hsrr_valid = 0;
 }
 #else
+static inline bool is_implicit_soft_masked(struct pt_regs *regs)
+{
+	return false;
+}
+
 static inline void srr_regs_clobbered(void)
 {
 }
@@ -150,11 +164,13 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 		 */
 		if (TRAP(regs) != INTERRUPT_PROGRAM) {
 			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
-			BUG_ON(regs->nip < (unsigned long)__end_soft_masked);
+			BUG_ON(is_implicit_soft_masked(regs));
 		}
+#ifdef CONFIG_PPC_BOOK3S
 		/* Move this under a debugging check */
 		if (arch_irq_disabled_regs(regs))
 			BUG_ON(search_kernel_restart_table(regs->nip));
+#endif
 	}
 #endif
 
@@ -244,10 +260,9 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 	local_paca->irq_soft_mask = IRQS_ALL_DISABLED;
 	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !(regs->msr & MSR_PR) &&
-				regs->nip < (unsigned long)__end_soft_masked) {
-		// Kernel code running below __end_soft_masked is
-		// implicitly soft-masked.
+	if (is_implicit_soft_masked(regs)) {
+		// Adjust regs->softe soft implicit soft-mask, so
+		// arch_irq_disabled_regs(regs) behaves as expected.
 		regs->softe = IRQS_ALL_DISABLED;
 	}
 
@@ -282,6 +297,7 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 	 */
 
 #ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3S
 	if (arch_irq_disabled_regs(regs)) {
 		unsigned long rst = search_kernel_restart_table(regs->nip);
 		if (rst)
@@ -289,7 +305,6 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 	}
 #endif
 
-#ifdef CONFIG_PPC64
 	if (nmi_disables_ftrace(regs))
 		this_cpu_set_ftrace_enabled(state->ftrace_enabled);
 
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index d634bfceed2c..1401787b0b93 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -342,17 +342,7 @@ ret_from_mc_except:
 #define PROLOG_ADDITION_MASKABLE_GEN(n)					    \
 	lbz	r10,PACAIRQSOFTMASK(r13);	/* are irqs soft-masked? */ \
 	andi.	r10,r10,IRQS_DISABLED;	/* yes -> go out of line */ \
-	bne	masked_interrupt_book3e_##n;				    \
-	/* Kernel code below __end_soft_masked is implicitly masked */	    \
-	andi.	r10,r11,MSR_PR;						    \
-	bne	1f;			/* user -> not masked */	    \
-	std	r14,PACA_EXGEN+EX_R14(r13);				    \
-	LOAD_REG_IMMEDIATE_SYM(r14, r10, __end_soft_masked);		    \
-	mfspr	r10,SPRN_SRR0;						    \
-	cmpld	r10,r14;						    \
-	ld	r14,PACA_EXGEN+EX_R14(r13);				    \
-	blt	masked_interrupt_book3e_##n;				    \
-1:
+	bne	masked_interrupt_book3e_##n
 
 /*
  * Additional regs must be re-loaded from paca before EXCEPTION_COMMON* is
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index e7a50613a570..0a8afec6c07b 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -196,6 +196,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	RFI_TO_USER
 .Lsyscall_vectored_\name\()_rst_end:
 
+#ifdef CONFIG_PPC_BOOK3S
 syscall_vectored_\name\()_restart:
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
@@ -209,6 +210,7 @@ syscall_vectored_\name\()_restart:
 	b	.Lsyscall_vectored_\name\()_rst_start
 
 RESTART_TABLE(.Lsyscall_vectored_\name\()_rst_start, .Lsyscall_vectored_\name\()_rst_end, syscall_vectored_\name\()_restart)
+#endif
 
 .endm
 
@@ -320,10 +322,12 @@ END_BTB_FLUSH_SECTION
 	li	r5,0 /* !scv */
 	bl	syscall_exit_prepare
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+#ifdef CONFIG_PPC_BOOK3S
 .Lsyscall_rst_start:
 	lbz	r11,PACAIRQHAPPENED(r13)
 	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
 	bne-	syscall_restart
+#endif
 	li	r11,IRQS_ENABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
 	li	r11,0
@@ -396,6 +400,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	b	.Lsyscall_restore_regs_cont
 .Lsyscall_rst_end:
 
+#ifdef CONFIG_PPC_BOOK3S
 syscall_restart:
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
@@ -409,6 +414,7 @@ syscall_restart:
 	b	.Lsyscall_rst_start
 
 RESTART_TABLE(.Lsyscall_rst_start, .Lsyscall_rst_end, syscall_restart)
+#endif
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 tabort_syscall:
@@ -504,10 +510,12 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
 	bne-	.Lrestore_nvgprs_\srr
 .Lrestore_nvgprs_\srr\()_cont:
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+#ifdef CONFIG_PPC_BOOK3S
 .Linterrupt_return_\srr\()_user_rst_start:
 	lbz	r11,PACAIRQHAPPENED(r13)
 	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
 	bne-	interrupt_return_\srr\()_user_restart
+#endif
 	li	r11,IRQS_ENABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
 	li	r11,0
@@ -590,6 +598,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	REST_NVGPRS(r1)
 	b	.Lrestore_nvgprs_\srr\()_cont
 
+#ifdef CONFIG_PPC_BOOK3S
 interrupt_return_\srr\()_user_restart:
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
@@ -602,6 +611,7 @@ interrupt_return_\srr\()_user_restart:
 	b	.Linterrupt_return_\srr\()_user_rst_start
 
 RESTART_TABLE(.Linterrupt_return_\srr\()_user_rst_start, .Linterrupt_return_\srr\()_user_rst_end, interrupt_return_\srr\()_user_restart)
+#endif
 
 	.balign IFETCH_ALIGN_BYTES
 .Lkernel_interrupt_return_\srr\():
@@ -615,9 +625,11 @@ RESTART_TABLE(.Linterrupt_return_\srr\()_user_rst_start, .Linterrupt_return_\srr
 	cmpwi	r11,IRQS_ENABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
 	bne	1f
+#ifdef CONFIG_PPC_BOOK3S
 	lbz	r11,PACAIRQHAPPENED(r13)
 	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
 	bne-	interrupt_return_\srr\()_kernel_restart
+#endif
 	li	r11,0
 	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
 1:
@@ -717,6 +729,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	b	.	/* prevent speculative execution */
 .Linterrupt_return_\srr\()_kernel_rst_end:
 
+#ifdef CONFIG_PPC_BOOK3S
 interrupt_return_\srr\()_kernel_restart:
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
@@ -729,14 +742,15 @@ interrupt_return_\srr\()_kernel_restart:
 	b	.Linterrupt_return_\srr\()_kernel_rst_start
 
 RESTART_TABLE(.Linterrupt_return_\srr\()_kernel_rst_start, .Linterrupt_return_\srr\()_kernel_rst_end, interrupt_return_\srr\()_kernel_restart)
+#endif
 
 .endm
 
 interrupt_return_macro srr
 #ifdef CONFIG_PPC_BOOK3S
 interrupt_return_macro hsrr
-#endif /* CONFIG_PPC_BOOK3S */
 
 	.globl __end_soft_masked
 __end_soft_masked:
 DEFINE_FIXED_SYMBOL(__end_soft_masked)
+#endif /* CONFIG_PPC_BOOK3S */
-- 
2.23.0

