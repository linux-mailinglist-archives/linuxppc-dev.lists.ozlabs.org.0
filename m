Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5258378EFA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 17:19:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y3J441KmzDqL8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 01:19:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tBW8Mjfd"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1rx07k0zDqKX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:14:09 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id p184so28104677pfp.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 07:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+dJDKDuMiKt3vBC//EVBkixFcyKDDOAbflBzHouHmPo=;
 b=tBW8Mjfd0mtY6qKov77GwIT59oBI+36NVns41ABdiS7wfDQcufAstUfnNSEgXyASFU
 KVS0jDhwUJRdeqc/eITVc9v8MWeZKZOf08eceRUBsgxmGno9Msp+25BSIriAZ5bB5SwH
 kgD1VXDErZxyL/40H1zLU/MgqMZFP8GyOQrW83567cCdZx6lsoNLklaMEoolSvits5BB
 YvCsafb+n0/Ir6jXR2Sjjdqnf74loR1Ub/RM4+X6eu1/a5FlZ20bdwXXgEQw452ALgwp
 TYLkSKSONRbnS+Jg9nyUJxbHfdiPFSoMOc3djy9Uip7wjbcJMewV5B0WczdUnJCz/Joi
 fj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+dJDKDuMiKt3vBC//EVBkixFcyKDDOAbflBzHouHmPo=;
 b=LBU0NrPrmmrbjEk2Iit9daKrnAESvJHrxCUvrvqAXTeSLXrqo/nhl9tVVOd/5ZfXLS
 c1QgETLpAlojdevTtfNkGPHkPmAGRgVf9obYaahZCGCEYb98nmej4W4duUQlo1i1mQun
 DPGhPDiLYsd1sl8D5Y2E1YX3m9a0uHA0KYgNfHyXJB40SUcXnnmD0XREfCO2UZrEovQY
 IQstbMC4JzvGJ3r1FmcKpTmSjLn/koDN0dm5/DqC7a1ks1idAQyngHi5r/wwsJT7OoAz
 BgIyo+CCWkjZr846P3M/ZpXl2Cls9PbUH7V8JPmDMD79Ryo89Y4XqTdJBf5xcMrujC8p
 uvEw==
X-Gm-Message-State: APjAAAW47PMGBXsnUv3b8Yoqx/VMc7jvBpyOCxXumfiCaP1m4W9+zcb6
 9612C1OfeIswOJtKAiB+bpKBUiMHlSA=
X-Google-Smtp-Source: APXvYqzDg34Ql0cYhtI7JD/HdEOt7Ms9hMm6FE8mEHsdISCF+diZiHgnb0xrFUBvJ75IaRDJW6ihGw==
X-Received: by 2002:aa7:8555:: with SMTP id y21mr24463970pfn.104.1564409646664; 
 Mon, 29 Jul 2019 07:14:06 -0700 (PDT)
Received: from bobo.local0.net (61-68-184-39.tpgi.com.au. [61.68.184.39])
 by smtp.gmail.com with ESMTPSA id u7sm53960083pfm.96.2019.07.29.07.14.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:14:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 17/18] powerpc/64s/exception: move interrupt entry code above
 the common handler
Date: Tue, 30 Jul 2019 00:12:46 +1000
Message-Id: <20190729141247.26762-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729141247.26762-1-npiggin@gmail.com>
References: <20190729141247.26762-1-npiggin@gmail.com>
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

This better reflects the order in which the code is executed.

No generated code change except BUG line number constants.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 450 +++++++++++++--------------
 1 file changed, 225 insertions(+), 225 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 456926439e41..0ee8c4a744c9 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -180,101 +180,6 @@ BEGIN_FTR_SECTION_NESTED(943)						\
 	std	ra,offset(r13);						\
 END_FTR_SECTION_NESTED(ftr,ftr,943)
 
-.macro INT_SAVE_SRR_AND_JUMP label, hsrr, set_ri
-	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
-	.if ! \set_ri
-	xori	r10,r10,MSR_RI		/* Clear MSR_RI */
-	.endif
-	.if \hsrr == EXC_HV_OR_STD
-	BEGIN_FTR_SECTION
-	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
-	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
-	mtspr	SPRN_HSRR1,r10
-	FTR_SECTION_ELSE
-	mfspr	r11,SPRN_SRR0		/* save SRR0 */
-	mfspr	r12,SPRN_SRR1		/* and SRR1 */
-	mtspr	SPRN_SRR1,r10
-	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-	.elseif \hsrr
-	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
-	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
-	mtspr	SPRN_HSRR1,r10
-	.else
-	mfspr	r11,SPRN_SRR0		/* save SRR0 */
-	mfspr	r12,SPRN_SRR1		/* and SRR1 */
-	mtspr	SPRN_SRR1,r10
-	.endif
-	LOAD_HANDLER(r10, \label\())
-	.if \hsrr == EXC_HV_OR_STD
-	BEGIN_FTR_SECTION
-	mtspr	SPRN_HSRR0,r10
-	HRFI_TO_KERNEL
-	FTR_SECTION_ELSE
-	mtspr	SPRN_SRR0,r10
-	RFI_TO_KERNEL
-	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-	.elseif \hsrr
-	mtspr	SPRN_HSRR0,r10
-	HRFI_TO_KERNEL
-	.else
-	mtspr	SPRN_SRR0,r10
-	RFI_TO_KERNEL
-	.endif
-	b	.	/* prevent speculative execution */
-.endm
-
-/* INT_SAVE_SRR_AND_JUMP works for real or virt, this is faster but virt only */
-.macro INT_VIRT_SAVE_SRR_AND_JUMP label, hsrr
-#ifdef CONFIG_RELOCATABLE
-	.if \hsrr == EXC_HV_OR_STD
-	BEGIN_FTR_SECTION
-	mfspr	r11,SPRN_HSRR0	/* save HSRR0 */
-	FTR_SECTION_ELSE
-	mfspr	r11,SPRN_SRR0	/* save SRR0 */
-	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-	.elseif \hsrr
-	mfspr	r11,SPRN_HSRR0	/* save HSRR0 */
-	.else
-	mfspr	r11,SPRN_SRR0	/* save SRR0 */
-	.endif
-	LOAD_HANDLER(r12, \label\())
-	mtctr	r12
-	.if \hsrr == EXC_HV_OR_STD
-	BEGIN_FTR_SECTION
-	mfspr	r12,SPRN_HSRR1	/* and HSRR1 */
-	FTR_SECTION_ELSE
-	mfspr	r12,SPRN_SRR1	/* and HSRR1 */
-	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-	.elseif \hsrr
-	mfspr	r12,SPRN_HSRR1	/* and HSRR1 */
-	.else
-	mfspr	r12,SPRN_SRR1	/* and HSRR1 */
-	.endif
-	li	r10,MSR_RI
-	mtmsrd 	r10,1		/* Set RI (EE=0) */
-	bctr
-#else
-	.if \hsrr == EXC_HV_OR_STD
-	BEGIN_FTR_SECTION
-	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
-	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
-	FTR_SECTION_ELSE
-	mfspr	r11,SPRN_SRR0		/* save SRR0 */
-	mfspr	r12,SPRN_SRR1		/* and SRR1 */
-	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-	.elseif \hsrr
-	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
-	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
-	.else
-	mfspr	r11,SPRN_SRR0		/* save SRR0 */
-	mfspr	r12,SPRN_SRR1		/* and SRR1 */
-	.endif
-	li	r10,MSR_RI
-	mtmsrd 	r10,1			/* Set RI (EE=0) */
-	b	\label
-#endif
-.endm
-
 /*
  * Branch to label using its 0xC000 address. This results in instruction
  * address suitable for MSR[IR]=0 or 1, which allows relocation to be turned
@@ -288,6 +193,15 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	mtctr	reg;							\
 	bctr
 
+.macro INT_KVM_HANDLER vec, hsrr, area, skip
+	.if \hsrr
+	TRAMP_KVM_BEGIN(do_kvm_H\vec\())
+	.else
+	TRAMP_KVM_BEGIN(do_kvm_\vec\())
+	.endif
+	KVM_HANDLER \vec, \hsrr, \area, \skip
+.endm
+
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 /*
@@ -390,6 +304,222 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 .endm
 #endif
 
+.macro INT_SAVE_SRR_AND_JUMP label, hsrr, set_ri
+	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
+	.if ! \set_ri
+	xori	r10,r10,MSR_RI		/* Clear MSR_RI */
+	.endif
+	.if \hsrr == EXC_HV_OR_STD
+	BEGIN_FTR_SECTION
+	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
+	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
+	mtspr	SPRN_HSRR1,r10
+	FTR_SECTION_ELSE
+	mfspr	r11,SPRN_SRR0		/* save SRR0 */
+	mfspr	r12,SPRN_SRR1		/* and SRR1 */
+	mtspr	SPRN_SRR1,r10
+	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	.elseif \hsrr
+	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
+	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
+	mtspr	SPRN_HSRR1,r10
+	.else
+	mfspr	r11,SPRN_SRR0		/* save SRR0 */
+	mfspr	r12,SPRN_SRR1		/* and SRR1 */
+	mtspr	SPRN_SRR1,r10
+	.endif
+	LOAD_HANDLER(r10, \label\())
+	.if \hsrr == EXC_HV_OR_STD
+	BEGIN_FTR_SECTION
+	mtspr	SPRN_HSRR0,r10
+	HRFI_TO_KERNEL
+	FTR_SECTION_ELSE
+	mtspr	SPRN_SRR0,r10
+	RFI_TO_KERNEL
+	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	.elseif \hsrr
+	mtspr	SPRN_HSRR0,r10
+	HRFI_TO_KERNEL
+	.else
+	mtspr	SPRN_SRR0,r10
+	RFI_TO_KERNEL
+	.endif
+	b	.	/* prevent speculative execution */
+.endm
+
+/* INT_SAVE_SRR_AND_JUMP works for real or virt, this is faster but virt only */
+.macro INT_VIRT_SAVE_SRR_AND_JUMP label, hsrr
+#ifdef CONFIG_RELOCATABLE
+	.if \hsrr == EXC_HV_OR_STD
+	BEGIN_FTR_SECTION
+	mfspr	r11,SPRN_HSRR0	/* save HSRR0 */
+	FTR_SECTION_ELSE
+	mfspr	r11,SPRN_SRR0	/* save SRR0 */
+	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	.elseif \hsrr
+	mfspr	r11,SPRN_HSRR0	/* save HSRR0 */
+	.else
+	mfspr	r11,SPRN_SRR0	/* save SRR0 */
+	.endif
+	LOAD_HANDLER(r12, \label\())
+	mtctr	r12
+	.if \hsrr == EXC_HV_OR_STD
+	BEGIN_FTR_SECTION
+	mfspr	r12,SPRN_HSRR1	/* and HSRR1 */
+	FTR_SECTION_ELSE
+	mfspr	r12,SPRN_SRR1	/* and HSRR1 */
+	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	.elseif \hsrr
+	mfspr	r12,SPRN_HSRR1	/* and HSRR1 */
+	.else
+	mfspr	r12,SPRN_SRR1	/* and HSRR1 */
+	.endif
+	li	r10,MSR_RI
+	mtmsrd 	r10,1		/* Set RI (EE=0) */
+	bctr
+#else
+	.if \hsrr == EXC_HV_OR_STD
+	BEGIN_FTR_SECTION
+	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
+	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
+	FTR_SECTION_ELSE
+	mfspr	r11,SPRN_SRR0		/* save SRR0 */
+	mfspr	r12,SPRN_SRR1		/* and SRR1 */
+	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	.elseif \hsrr
+	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
+	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
+	.else
+	mfspr	r11,SPRN_SRR0		/* save SRR0 */
+	mfspr	r12,SPRN_SRR1		/* and SRR1 */
+	.endif
+	li	r10,MSR_RI
+	mtmsrd 	r10,1			/* Set RI (EE=0) */
+	b	\label
+#endif
+.endm
+
+/*
+ * This is the BOOK3S interrupt entry code macro.
+ *
+ * This can result in one of several things happening:
+ * - Branch to the _common handler, relocated, in virtual mode.
+ *   These are normal interrupts (synchronous and asynchronous) handled by
+ *   the kernel.
+ * - Branch to KVM, relocated but real mode interrupts remain in real mode.
+ *   These occur when HSTATE_IN_GUEST is set. The interrupt may be caused by
+ *   / intended for host or guest kernel, but KVM must always be involved
+ *   because the machine state is set for guest execution.
+ * - Branch to the masked handler, unrelocated.
+ *   These occur when maskable asynchronous interrupts are taken with the
+ *   irq_soft_mask set.
+ * - Branch to an "early" handler in real mode but relocated.
+ *   This is done if early=1. MCE and HMI use these to handle errors in real
+ *   mode.
+ * - Fall through and continue executing in real, unrelocated mode.
+ *   This is done if early=2.
+ */
+.macro INT_HANDLER name, vec, ool, early, virt, hsrr, area, ri, dar, dsisr, bitmask, kvm
+	SET_SCRATCH0(r13)			/* save r13 */
+	GET_PACA(r13)
+	std	r9,\area\()+EX_R9(r13)		/* save r9 */
+	OPT_GET_SPR(r9, SPRN_PPR, CPU_FTR_HAS_PPR)
+	HMT_MEDIUM
+	std	r10,\area\()+EX_R10(r13)	/* save r10 - r12 */
+	OPT_GET_SPR(r10, SPRN_CFAR, CPU_FTR_CFAR)
+	.if \ool
+	.if !\virt
+	b	tramp_real_\name
+	.pushsection .text
+	TRAMP_REAL_BEGIN(tramp_real_\name)
+	.else
+	b	tramp_virt_\name
+	.pushsection .text
+	TRAMP_VIRT_BEGIN(tramp_virt_\name)
+	.endif
+	.endif
+
+	OPT_SAVE_REG_TO_PACA(\area\()+EX_PPR, r9, CPU_FTR_HAS_PPR)
+	OPT_SAVE_REG_TO_PACA(\area\()+EX_CFAR, r10, CPU_FTR_CFAR)
+	INTERRUPT_TO_KERNEL
+	SAVE_CTR(r10, \area\())
+	mfcr	r9
+	.if \kvm
+		KVMTEST \hsrr \vec
+	.endif
+	.if \bitmask
+		lbz	r10,PACAIRQSOFTMASK(r13)
+		andi.	r10,r10,\bitmask
+		/* Associate vector numbers with bits in paca->irq_happened */
+		.if \vec == 0x500 || \vec == 0xea0
+		li	r10,PACA_IRQ_EE
+		.elseif \vec == 0x900
+		li	r10,PACA_IRQ_DEC
+		.elseif \vec == 0xa00 || \vec == 0xe80
+		li	r10,PACA_IRQ_DBELL
+		.elseif \vec == 0xe60
+		li	r10,PACA_IRQ_HMI
+		.elseif \vec == 0xf00
+		li	r10,PACA_IRQ_PMI
+		.else
+		.abort "Bad maskable vector"
+		.endif
+
+		.if \hsrr == EXC_HV_OR_STD
+		BEGIN_FTR_SECTION
+		bne	masked_Hinterrupt
+		FTR_SECTION_ELSE
+		bne	masked_interrupt
+		ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+		.elseif \hsrr
+		bne	masked_Hinterrupt
+		.else
+		bne	masked_interrupt
+		.endif
+	.endif
+
+	std	r11,\area\()+EX_R11(r13)
+	std	r12,\area\()+EX_R12(r13)
+
+	/*
+	 * DAR/DSISR, SCRATCH0 must be read before setting MSR[RI],
+	 * because a d-side MCE will clobber those registers so is
+	 * not recoverable if they are live.
+	 */
+	GET_SCRATCH0(r10)
+	std	r10,\area\()+EX_R13(r13)
+	.if \dar
+	.if \hsrr
+	mfspr	r10,SPRN_HDAR
+	.else
+	mfspr	r10,SPRN_DAR
+	.endif
+	std	r10,\area\()+EX_DAR(r13)
+	.endif
+	.if \dsisr
+	.if \hsrr
+	mfspr	r10,SPRN_HDSISR
+	.else
+	mfspr	r10,SPRN_DSISR
+	.endif
+	stw	r10,\area\()+EX_DSISR(r13)
+	.endif
+
+	.if \early == 2
+	/* nothing more */
+	.elseif \early
+	mfctr	r10			/* save ctr, even for !RELOCATABLE */
+	BRANCH_TO_C000(r11, \name\()_early_common)
+	.elseif !\virt
+	INT_SAVE_SRR_AND_JUMP \name\()_common, \hsrr, \ri
+	.else
+	INT_VIRT_SAVE_SRR_AND_JUMP \name\()_common, \hsrr
+	.endif
+	.if \ool
+	.popsection
+	.endif
+.endm
+
 /*
  * On entry r13 points to the paca, r9-r13 are saved in the paca,
  * r9 contains the saved CR, r11 and r12 contain the saved SRR0 and
@@ -555,136 +685,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 #define FINISH_NAP
 #endif
 
-/*
- * This is the BOOK3S interrupt entry code macro.
- *
- * This can result in one of several things happening:
- * - Branch to the _common handler, relocated, in virtual mode.
- *   These are normal interrupts (synchronous and asynchronous) handled by
- *   the kernel.
- * - Branch to KVM, relocated but real mode interrupts remain in real mode.
- *   These occur when HSTATE_IN_GUEST is set. The interrupt may be caused by
- *   / intended for host or guest kernel, but KVM must always be involved
- *   because the machine state is set for guest execution.
- * - Branch to the masked handler, unrelocated.
- *   These occur when maskable asynchronous interrupts are taken with the
- *   irq_soft_mask set.
- * - Branch to an "early" handler in real mode but relocated.
- *   This is done if early=1. MCE and HMI use these to handle errors in real
- *   mode.
- * - Fall through and continue executing in real, unrelocated mode.
- *   This is done if early=2.
- */
-.macro INT_HANDLER name, vec, ool, early, virt, hsrr, area, ri, dar, dsisr, bitmask, kvm
-	SET_SCRATCH0(r13)			/* save r13 */
-	GET_PACA(r13)
-	std	r9,\area\()+EX_R9(r13)		/* save r9 */
-	OPT_GET_SPR(r9, SPRN_PPR, CPU_FTR_HAS_PPR)
-	HMT_MEDIUM
-	std	r10,\area\()+EX_R10(r13)	/* save r10 - r12 */
-	OPT_GET_SPR(r10, SPRN_CFAR, CPU_FTR_CFAR)
-	.if \ool
-	.if !\virt
-	b	tramp_real_\name
-	.pushsection .text
-	TRAMP_REAL_BEGIN(tramp_real_\name)
-	.else
-	b	tramp_virt_\name
-	.pushsection .text
-	TRAMP_VIRT_BEGIN(tramp_virt_\name)
-	.endif
-	.endif
-
-	OPT_SAVE_REG_TO_PACA(\area\()+EX_PPR, r9, CPU_FTR_HAS_PPR)
-	OPT_SAVE_REG_TO_PACA(\area\()+EX_CFAR, r10, CPU_FTR_CFAR)
-	INTERRUPT_TO_KERNEL
-	SAVE_CTR(r10, \area\())
-	mfcr	r9
-	.if \kvm
-		KVMTEST \hsrr \vec
-	.endif
-	.if \bitmask
-		lbz	r10,PACAIRQSOFTMASK(r13)
-		andi.	r10,r10,\bitmask
-		/* Associate vector numbers with bits in paca->irq_happened */
-		.if \vec == 0x500 || \vec == 0xea0
-		li	r10,PACA_IRQ_EE
-		.elseif \vec == 0x900
-		li	r10,PACA_IRQ_DEC
-		.elseif \vec == 0xa00 || \vec == 0xe80
-		li	r10,PACA_IRQ_DBELL
-		.elseif \vec == 0xe60
-		li	r10,PACA_IRQ_HMI
-		.elseif \vec == 0xf00
-		li	r10,PACA_IRQ_PMI
-		.else
-		.abort "Bad maskable vector"
-		.endif
-
-		.if \hsrr == EXC_HV_OR_STD
-		BEGIN_FTR_SECTION
-		bne	masked_Hinterrupt
-		FTR_SECTION_ELSE
-		bne	masked_interrupt
-		ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-		.elseif \hsrr
-		bne	masked_Hinterrupt
-		.else
-		bne	masked_interrupt
-		.endif
-	.endif
-
-	std	r11,\area\()+EX_R11(r13)
-	std	r12,\area\()+EX_R12(r13)
-
-	/*
-	 * DAR/DSISR, SCRATCH0 must be read before setting MSR[RI],
-	 * because a d-side MCE will clobber those registers so is
-	 * not recoverable if they are live.
-	 */
-	GET_SCRATCH0(r10)
-	std	r10,\area\()+EX_R13(r13)
-	.if \dar
-	.if \hsrr
-	mfspr	r10,SPRN_HDAR
-	.else
-	mfspr	r10,SPRN_DAR
-	.endif
-	std	r10,\area\()+EX_DAR(r13)
-	.endif
-	.if \dsisr
-	.if \hsrr
-	mfspr	r10,SPRN_HDSISR
-	.else
-	mfspr	r10,SPRN_DSISR
-	.endif
-	stw	r10,\area\()+EX_DSISR(r13)
-	.endif
-
-	.if \early == 2
-	/* nothing more */
-	.elseif \early
-	mfctr	r10			/* save ctr, even for !RELOCATABLE */
-	BRANCH_TO_C000(r11, \name\()_early_common)
-	.elseif !\virt
-	INT_SAVE_SRR_AND_JUMP \name\()_common, \hsrr, \ri
-	.else
-	INT_VIRT_SAVE_SRR_AND_JUMP \name\()_common, \hsrr
-	.endif
-	.if \ool
-	.popsection
-	.endif
-.endm
-
-.macro INT_KVM_HANDLER vec, hsrr, area, skip
-	.if \hsrr
-	TRAMP_KVM_BEGIN(do_kvm_H\vec\())
-	.else
-	TRAMP_KVM_BEGIN(do_kvm_\vec\())
-	.endif
-	KVM_HANDLER \vec, \hsrr, \area, \skip
-.endm
-
 #define EXC_COMMON(name, realvec, hdlr)					\
 	EXC_COMMON_BEGIN(name);						\
 	INT_COMMON realvec, PACA_EXGEN, 1, 1, 1, 0, 0 ;			\
-- 
2.22.0

