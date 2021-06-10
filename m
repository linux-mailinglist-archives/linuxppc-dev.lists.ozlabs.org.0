Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B073A2CA1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 15:14:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G14FF5F1gz3cFc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 23:14:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Xr07XqkI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Xr07XqkI; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G14880wk5z3bxM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 23:09:59 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id p13so1610694pfw.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 06:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b5FBSZ3VgiVmEDMItZQEgO8QnkQeRuL2Z76VJn36C14=;
 b=Xr07XqkI2P3cuExnRaZJ9lSGCZlPcbD54gp+HCkDg57reoKbgwHDsNaTSp8tpz/iKE
 GAUlwZWCC6cD7syCORTBXSayZsa4jnyRsqSPL4yYORmiEYlBcLH1pjNihh4LhSHX3GKY
 NlaGZG0MDbNne4HhnY5jrjNvnLRc3aFcp96xfFy3lo+fQ/cutY7LM0PjWfV2Yzv1RJM8
 IJu4aPM8CsQ1gYj+/QlcGqXqd8xmGHcdRAPULFj8oZN6Yr8YOWyJLkzYobH78OBCoI26
 CE9VFZIbI/RX0rV+1tESbT1SrWszseBl60qKPy0dIuDMa54LSuvUywTf3jgaGyXLswav
 s1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b5FBSZ3VgiVmEDMItZQEgO8QnkQeRuL2Z76VJn36C14=;
 b=A90lbSiwQgw5lO4IKfAVd0zVCMc1TdlLmGRii9ZFKSmIVTJQselSwupBLgyEVDfyp7
 VWoLBGNWmzWB9N4WFXKCafOxlasF7db0HlU7WCbz5fcTJGvxFdNBX5aT0b35GSgQVr0h
 2MMpKdwDQ16Qez8oPymDQznjgnr1zDiH/1qjHBS9l8SBXP8e6IGhLbNlCr9ehPCM+5be
 f7lx6q4lUdykv6v5RNmSyqXOJa4g3uHqd5xyDbT29zK/dkTddFPmX82DfIreX6jywOSK
 C+8yhyhtjWlFWuVqWXbBUBU7YDpW2KqyUalgIlh9zH9DEH8A12yErESo8fAg2rlChINU
 w1cA==
X-Gm-Message-State: AOAM531yX/8bTwvNPN/YIH49Q9wKUb15D/fcY4aKPJ9rIaEJHFPNHg+L
 1rlDlLoc0x9o8CYcVPsJBPNmY7kTGgg=
X-Google-Smtp-Source: ABdhPJxpHjfS3kSfsc6ON1LJ87VzgmD4SQ/pqbw2PLnMkB2cFR/MINiEhIhZhJSj5U9rZ0i+9S+FEQ==
X-Received: by 2002:a63:131f:: with SMTP id i31mr4897966pgl.19.1623330596777; 
 Thu, 10 Jun 2021 06:09:56 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id bv3sm7012173pjb.1.2021.06.10.06.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 06:09:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 10/11] powerpc/64: treat low kernel text as irqs soft-masked
Date: Thu, 10 Jun 2021 23:09:20 +1000
Message-Id: <20210610130921.706938-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210610130921.706938-1-npiggin@gmail.com>
References: <20210610130921.706938-1-npiggin@gmail.com>
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
index 3038c831fc5f..cf53293c8498 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -633,4 +633,8 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
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

