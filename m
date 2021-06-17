Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6513AB801
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:56:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5RVk6kxHz3d7T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:56:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=GtMFpTID;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GtMFpTID; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5RPg4Gdbz3c1J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 01:51:51 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id t9so5301316pgn.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 08:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XTvKMWoOBlniOnnxFrEuRmjRFmLb/M8sNkSxLP8Tu+A=;
 b=GtMFpTIDFBIUog3NsWTV0F0eHRnZzufjFEJkK2UqbGVplp9L/E/ef5iTqgHRb+fqgF
 l+zgSVSoI8nMjaQgk8oSv0lcwPL/oUSgREvNyFUhh7xWjhqeWR4JBrIFaYQ1sKiHMyEJ
 0wVPyIACZMTByDzYRYkxOLRAuCQLQTHT+646q0b4FVjCBcINIbSjMe5TZpAVML8nh44I
 t+1PA7uSR/RFbhFWPO731lOfl90ZqpWEOGDaPmyzxyXYm97jbr0paYwxxfKS1UHGRvwK
 51fcH1Bx7EamSDYEeGljkWKqODXxJZ2Gp3vSJUm/d/0j+H2QkJjo1l1MmGVzo0Bq9yCz
 XlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XTvKMWoOBlniOnnxFrEuRmjRFmLb/M8sNkSxLP8Tu+A=;
 b=F2z2GHvQk+J19+KvpMpuxm9gIRXX+AKalblssaNHCh4nn161kxnzUF28i/TbhhnFdn
 qy79naKmmKwR8Zx1MU6UMbMjjH6tPGT+8a8Z1S/Blodp3kd34wJGv6rUzA/yYTCgKlsi
 rfe1Qf/XdJYrK4AmPIWDyKhxdB4sgWe2JRmcFlzy5BS+Rafs6eWrvwouf1yAf7gzQsll
 e0PR3Vn33+XSTubeKYy8lUSuyilmM0BGWOJnSfiq1TVjgRRnbj1VGm57fNGTS3p4gziJ
 VANC83a+CBr7/j6KC5RT8uExQU//yZSmw8L3jmipNnaxYikfq39eh1GmfTnjFl7lO9hs
 xTUA==
X-Gm-Message-State: AOAM530z9I44qtp7gH/ae90RfKK42/FN+Lu7+2Km0mdexMfzKGCTvcvX
 ZjYGxsOE5OIUICPUh1hAt6M2knwXlnI=
X-Google-Smtp-Source: ABdhPJyfjOJgMIQQHANQO7KlUplMmrhzNdK0u2bzAS8fEpqURb22wRzi33LrtF7d5AXJ18LHCMqgTQ==
X-Received: by 2002:a63:6d8d:: with SMTP id i135mr3584090pgc.350.1623945108246; 
 Thu, 17 Jun 2021 08:51:48 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id a15sm5749733pfl.100.2021.06.17.08.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:51:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 11/17] powerpc/64: treat low kernel text as irqs soft-masked
Date: Fri, 18 Jun 2021 01:51:10 +1000
Message-Id: <20210617155116.2167984-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617155116.2167984-1-npiggin@gmail.com>
References: <20210617155116.2167984-1-npiggin@gmail.com>
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

Treat code below __end_soft_masked as soft-masked for the purpose
of alternate return. 64s already mostly does this for scv entry.

This will be used to exit from interrupts without disabling MSR[EE].

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 11 ++++++++---
 arch/powerpc/kernel/exceptions-64e.S | 12 +++++++++++-
 arch/powerpc/kernel/exceptions-64s.S | 19 +++++++++++--------
 arch/powerpc/kernel/interrupt_64.S   |  6 +++++-
 4 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 49d9a6fd1bb9..88043e46442a 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -158,8 +158,13 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 		 * CT_WARN_ON comes here via program_check_exception,
 		 * so avoid recursion.
 		 */
-		if (TRAP(regs) != INTERRUPT_PROGRAM)
+		if (TRAP(regs) != INTERRUPT_PROGRAM) {
 			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
+			BUG_ON(regs->nip < (unsigned long)__end_soft_masked);
+		}
+		/* Move this under a debugging check */
+		if (arch_irq_disabled_regs(regs))
+			BUG_ON(search_kernel_restart_table(regs->nip));
 	}
 #endif
 
@@ -254,8 +259,8 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !(regs->msr & MSR_PR) &&
-				regs->nip < (unsigned long)__end_interrupts) {
-		// Kernel code running below __end_interrupts is
+				regs->nip < (unsigned long)__end_soft_masked) {
+		// Kernel code running below __end_soft_masked is
 		// implicitly soft-masked.
 		regs->softe = IRQS_ALL_DISABLED;
 	}
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 1b79f8a75298..22fcd95dd8dc 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -342,7 +342,17 @@ ret_from_mc_except:
 #define PROLOG_ADDITION_MASKABLE_GEN(n)					    \
 	lbz	r10,PACAIRQSOFTMASK(r13);	/* are irqs soft-masked? */ \
 	andi.	r10,r10,IRQS_DISABLED;	/* yes -> go out of line */ \
-	bne	masked_interrupt_book3e_##n
+	bne	masked_interrupt_book3e_##n;				    \
+	/* Kernel code below __end_soft_masked is implicitly masked */	    \
+	andi.	r10,r11,MSR_PR;						    \
+	bne	1f;			/* user -> not masked */	    \
+	std	r14,PACA_EXGEN+EX_R14(r13);				    \
+	LOAD_REG_IMMEDIATE_SYM(r14, r10, __end_soft_masked);		    \
+	mfspr	r10,SPRN_SRR0;						    \
+	cmpld	r10,r14;						    \
+	ld	r14,PACA_EXGEN+EX_R14(r13);				    \
+	blt	masked_interrupt_book3e_##n;				    \
+1:
 
 /*
  * Additional regs must be re-loaded from paca before EXCEPTION_COMMON* is
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 17a213f25c92..2d980addc88c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -508,10 +508,13 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 		andi.	r10,r12,MSR_PR
 		bne	2f
 
-		/* Kernel code running below __end_interrupts is implicitly
-		 * soft-masked */
-		LOAD_HANDLER(r10, __end_interrupts)
+		/*
+		 * Kernel code running below __end_soft_masked is implicitly
+		 * soft-masked
+		 */
+		LOAD_HANDLER(r10, __end_soft_masked)
 		cmpld	r11,r10
+
 		li	r10,IMASK
 		blt-	1f
 
@@ -824,17 +827,17 @@ __start_interrupts:
  * scv instructions enter the kernel without changing EE, RI, ME, or HV.
  * In particular, this means we can take a maskable interrupt at any point
  * in the scv handler, which is unlike any other interrupt. This is solved
- * by treating the instruction addresses below __end_interrupts as being
+ * by treating the instruction addresses below __end_soft_masked as being
  * soft-masked.
  *
  * AIL-0 mode scv exceptions go to 0x17000-0x17fff, but we set AIL-3 and
  * ensure scv is never executed with relocation off, which means AIL-0
  * should never happen.
  *
- * Before leaving the below __end_interrupts text, at least of the following
- * must be true:
+ * Before leaving the following inside-__end_soft_masked text, at least of the
+ * following must be true:
  * - MSR[PR]=1 (i.e., return to userspace)
- * - MSR_EE|MSR_RI is set (no reentrant exceptions)
+ * - MSR_EE|MSR_RI is clear (no reentrant exceptions)
  * - Standard kernel environment is set up (stack, paca, etc)
  *
  * Call convention:
@@ -3099,7 +3102,7 @@ kvmppc_skip_Hinterrupt:
 
 USE_FIXED_SECTION(virt_trampolines)
 	/*
-	 * All code below __end_interrupts is treated as soft-masked. If
+	 * All code below __end_soft_masked is treated as soft-masked. If
 	 * any code runs here with MSR[EE]=1, it must then cope with pending
 	 * soft interrupt being raised (i.e., by ensuring it is replayed).
 	 *
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index ab6b99609d0e..33ee83791487 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -632,4 +632,8 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 interrupt_return_macro srr
 #ifdef CONFIG_PPC_BOOK3S
 interrupt_return_macro hsrr
-#endif
+#endif /* CONFIG_PPC_BOOK3S */
+
+	.globl __end_soft_masked
+__end_soft_masked:
+DEFINE_FIXED_SYMBOL(__end_soft_masked)
-- 
2.23.0

