Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B2B38C600
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 13:49:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmlJV2mvJz3dgq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 21:49:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FYf9HYub;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FYf9HYub; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmlCD0N0zz3bvc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 21:44:56 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 ne24-20020a17090b3758b029015f2dafecb0so5847381pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 04:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QOc6qSZUNW+hSxK16g5QcjMHMUSjIJHtRWTVyIC8FWc=;
 b=FYf9HYub6L3WmXbRcJihhtRjZbkz4sEezMyQWhdPZDOHyEN9TLpFzAGpFOI1zWjPnj
 vw/I1oeAIN+jG62jX9Vf5TdjG7Fc/F/7vrBqjlUt5PB/kpYSrVI4W04EyCj3axHWlW56
 NxZLN6xofAUQR7mt9lbNSSo3gnHYOTHU7ZvBFJLU+Sl6TQsh8NCKiX4vnxZoJh1dSfDB
 u2n/h44asHbgbeFRym1eYlbidQ7rsSA7mi4gl9EwUGfPBdm79bpvWVPBiHL0LIkVio/i
 k8At82XNFIUBZFKhI4sg0R8IDWQ6M97o6V+WBUjDqnF1ik6jk3k/X6GLlvrszsH5hxGA
 nweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QOc6qSZUNW+hSxK16g5QcjMHMUSjIJHtRWTVyIC8FWc=;
 b=r5ZUPhpv4Eml6jcnGMUV7/5NyGiB1+CAvC/GxRCwE5w/rMsJwsO6qdJmeIIUuiYNuQ
 sVbcWRU7EOdganC0tqFcoK8d+nGNFvgV/kIibLpCpYd7AAMbSUC2V4b6C4B59YCV1KgR
 UyRS7oph4GJefUz1avOgfH0ZISm0w6t7jzLe523E9HQ87nMB4Ux5WE+QquHVPcCwRxjj
 rjm7XxJxIkHGZ8n9wpDqJgM4d7Jf2aRvXtFZ5qKeZUm+8cAI6iJRNVHpDjSv0aFfwAy6
 02azqXIHQRwRAR6wnUFPTFCap/RZk3dETXW3IVfpdJjg9dlPGBJd5B5a33G44IDpSSLo
 wNmA==
X-Gm-Message-State: AOAM530ROBYzG/46JiI/No80fd0+oqnSg/IcaLqBJSKV84byknKQqAnL
 MwQ8ZCmj4rnz7ZBEaP2Qm3Ub1IHAci0=
X-Google-Smtp-Source: ABdhPJwVeoUQ98RxHKCvXZFTCYBcFiM7Vs8wc4RlJSMrF4sfWOxwEDvflxvqD9vnLiO8IZsGErFqmw==
X-Received: by 2002:a17:90a:a794:: with SMTP id
 f20mr10629804pjq.195.1621597494245; 
 Fri, 21 May 2021 04:44:54 -0700 (PDT)
Received: from bobo.ibm.com (60-241-27-127.tpgi.com.au. [60.241.27.127])
 by smtp.gmail.com with ESMTPSA id f5sm8681390pjp.37.2021.05.21.04.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 04:44:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 10/11] powerpc/64: treat low kernel text as irqs soft-masked
Date: Fri, 21 May 2021 21:44:21 +1000
Message-Id: <20210521114422.3179350-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210521114422.3179350-1-npiggin@gmail.com>
References: <20210521114422.3179350-1-npiggin@gmail.com>
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
 arch/powerpc/include/asm/interrupt.h |  8 ++++++--
 arch/powerpc/kernel/exceptions-64e.S | 12 +++++++++++-
 arch/powerpc/kernel/exceptions-64s.S | 19 +++++++++++--------
 arch/powerpc/kernel/interrupt_64.S   |  6 +++++-
 4 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 49d9a6fd1bb9..fe02fbbd6b06 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -160,6 +160,10 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 		 */
 		if (TRAP(regs) != INTERRUPT_PROGRAM)
 			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
+		BUG_ON(regs->nip < (unsigned long)__end_soft_masked);
+		/* Move this under a debugging check */
+		if (arch_irq_disabled_regs(regs))
+			BUG_ON(search_kernel_restart_table(regs->nip));
 	}
 #endif
 
@@ -254,8 +258,8 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
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

