Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB00333C90F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 23:08:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzrD45X3Kz3dGn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 09:08:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WcaukZQL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WcaukZQL; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzr7B3srZz30G0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 09:04:38 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso236776pji.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 15:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zaFntCPHeyQEsJxCZhwqE16LKhdIhd4v8YJ7AueayGQ=;
 b=WcaukZQLKc7ky4rHCMtU+DYmargYbOgtuW9vkFJHBAg+cHdvCn3lep2rN8h5WkNpXS
 Ie0JRLrJxo56PzLtQMAlMOxhiJGWQ6AyHuaucpEDASWFLH96PS1wpzv1gJqWAIwakTNj
 Hn7udlUtLEiZiyT36J0qp24wa+p0X2Dn86PORoa3YMug3ktdPlBYxAzGajSevMEjmllh
 k3kUpgJ32Pn1MxZhszRpirKO8CqC8HWDb4jSKILSm+SkYNwFUqDZi+e+Qi6iSqL9qQ3y
 YenoCkA/jGTLNVknHOasZxVPZ2QZBl0ikS44r3zWg4xoKa/2hPMu7YBpq5WF0BuhrtRz
 hdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zaFntCPHeyQEsJxCZhwqE16LKhdIhd4v8YJ7AueayGQ=;
 b=Uh/8vB+X4WXMJ/H6qDI29UAc2PeRmDedDq6B968t9O07jGT714PnZp4hUziTyNLa/v
 mOnsbLVCzU3xEpN0oAw5AHIOPt1QPNjbasZORiMaGrxma+6TrFV+e9BkPPPd68BUPZtC
 8oSZq1qWTgufFreF9PDAZUjCj2YPdhf8g14UTGxYIcToO2BPPcbb88wRwWnSn5sfnFJD
 256NR75QANLke9usH7f+Hm/dHwUAJ0Z9h4a0zzc88i4wxXVWYLml3aBa5W2zV9eaVv48
 Y5RCXR34F2jlhbbllHgZfBE9j1pKhZhbWakbqU/GUm7C/TGi+mHi8KJV86r5kOmnyTWS
 MjTA==
X-Gm-Message-State: AOAM533fxqCcwhNMsthK/XhLd0pDokyHqrmehlAum3AaK27yPOVw2Nme
 +soxfh+McdcY5TcuJfD1DJqsmUtuUV4=
X-Google-Smtp-Source: ABdhPJy4dWRnY1xq9V9foSREB97PTTxn/aR/7vMbzS8YdD56EKKtSf+HzVmmhjdQd3/B1DtneFMNCA==
X-Received: by 2002:a17:90a:1502:: with SMTP id
 l2mr1204126pja.149.1615845875755; 
 Mon, 15 Mar 2021 15:04:35 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 y9sm14740338pgc.9.2021.03.15.15.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 15:04:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/14] powerpc/64: treat low kernel text as irqs soft-masked
Date: Tue, 16 Mar 2021 08:03:57 +1000
Message-Id: <20210315220402.260594-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210315220402.260594-1-npiggin@gmail.com>
References: <20210315220402.260594-1-npiggin@gmail.com>
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
 arch/powerpc/include/asm/interrupt.h |  8 ++++++++
 arch/powerpc/kernel/exceptions-64e.S | 12 +++++++++++-
 arch/powerpc/kernel/exceptions-64s.S |  3 ++-
 arch/powerpc/kernel/interrupt_64.S   |  6 +++++-
 4 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 5cdbd3630254..8796eb4630c9 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -72,6 +72,10 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 		 */
 		if (TRAP(regs) != 0x700)
 			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
+		BUG_ON(regs->nip < (unsigned long)__end_soft_masked);
+		/* Move this under a debugging check */
+		if (arch_irq_disabled_regs(regs))
+			BUG_ON(search_kernel_restart_table(regs->nip));
 	}
 #endif
 
@@ -147,6 +151,10 @@ static inline bool nmi_disables_ftrace(struct pt_regs *regs)
 static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
 {
 #ifdef CONFIG_PPC64
+	/* Ensure arch_irq_disabled_regs(regs) looks right. */
+	if (!(regs->msr & MSR_PR) && regs->nip < (unsigned long)__end_soft_masked)
+		regs->softe = IRQS_ALL_DISABLED;
+
 	state->irq_soft_mask = local_paca->irq_soft_mask;
 	state->irq_happened = local_paca->irq_happened;
 
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 69d0d63cee85..87fe307b4da8 100644
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
 
 #define PROLOG_ADDITION_2REGS_GEN(n)					    \
 	std	r14,PACA_EXGEN+EX_R14(r13);				    \
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 32b11431ac4a..bd0c82ac9de5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -514,8 +514,9 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 
 		/* Kernel code running below __end_interrupts is implicitly
 		 * soft-masked */
-		LOAD_HANDLER(r10, __end_interrupts)
+		LOAD_HANDLER(r10, __end_soft_masked)
 		cmpld	r11,r10
+
 		li	r10,IMASK
 		blt-	1f
 
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 8a2b8188108b..c6a0349dde59 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -642,4 +642,8 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
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

