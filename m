Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C0C4C6E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 07:52:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TrYx3TPwzDqw9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 15:52:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DWvVDkMa"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqlc069czDqwM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:15:40 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id bi6so869244plb.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w7P75guqMu5nHW3TnA8csUbq6D4R032lq3LQbGs4TyQ=;
 b=DWvVDkMacABcmZ9WX80RHzTxqsvgUB3MCekXKv4IgznA89GMPQ76J0MyX22cEBh427
 5aWfptnPTHszFPFa0SNLyq0VYz6pIa2ujTTn2/Jkb84v+i54TG0bDDz++157uBDrp5Ue
 bmHoeEOWBHldOFfQabEAUvZb9t2/pWnEvi8fYpxB/7IArAEaWqx0hqZudsZ+Z8EdUgUn
 Bchfmhqsgl4qU4z5NsmRtEbnXoOCMAlLU8icSNsK/yWS6kvwS3Bwp8upW94iSVGZAUka
 r8/LkieCCw+11ClFb5hEKfa18/dg2UM4ZomZhkNHRsqiHsjq/E5x8/GxDnqGfiaOyHnv
 BOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7P75guqMu5nHW3TnA8csUbq6D4R032lq3LQbGs4TyQ=;
 b=UGFaOtEWKb3j//lEqXn1iDZw7+7Ra8b6KH/trNvcOzOZIuZYaZAGaqrSBnc3kRXILt
 MireulhyvRnlZURiaQOSRFj3E6xDH6fA3YYn0rpQUesSlvHTG02mp1OK9vg824fs08o0
 fTXQ2WNdqJ07Ogo9nfICe2ELETkPJspPA4MT4SYR2eoQz714lUDo6f/+rfU665I7rpYu
 n+SuSKdEOcBXyNTz38jFEKBOTmPJ8uVkwH4cjNlnTfsG8MiBqncdpTRRbGbejQXny7CI
 dkBkUo9jdwbvQUfPxiR+/QTuaeZUQLIDky8WruXn80+xTLraFl19b3m+uL2k67cl9lA3
 fwnw==
X-Gm-Message-State: APjAAAWitxeM33Pp+bxtM0f8AdRpERrLscZMVno2j39FZkexe7wnALC0
 ofaBymZgon7IlN4m/OywAvFULy5z
X-Google-Smtp-Source: APXvYqzfWK7RpyuNqAQBiP1BIThBW+8bu4ZukTF2uJ/bxLdJbExJoULKE2tMabjDKRWAEyhHEb83CA==
X-Received: by 2002:a17:902:28:: with SMTP id
 37mr56133141pla.188.1561007737808; 
 Wed, 19 Jun 2019 22:15:37 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:15:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 18/52] powerpc/64s/exception: move exception-64s.h code to
 exception-64s.S where it is used
Date: Thu, 20 Jun 2019 15:14:25 +1000
Message-Id: <20190620051459.29573-19-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 430 ----------------------
 arch/powerpc/kernel/exceptions-64s.S     | 431 +++++++++++++++++++++++
 2 files changed, 431 insertions(+), 430 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index e996ffe68cf3..9e6712099f7a 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -146,436 +146,6 @@
 	hrfid;								\
 	b	hrfi_flush_fallback
 
-/*
- * We're short on space and time in the exception prolog, so we can't
- * use the normal LOAD_REG_IMMEDIATE macro to load the address of label.
- * Instead we get the base of the kernel from paca->kernelbase and or in the low
- * part of label. This requires that the label be within 64KB of kernelbase, and
- * that kernelbase be 64K aligned.
- */
-#define LOAD_HANDLER(reg, label)					\
-	ld	reg,PACAKBASE(r13);	/* get high part of &label */	\
-	ori	reg,reg,FIXED_SYMBOL_ABS_ADDR(label)
-
-#define __LOAD_HANDLER(reg, label)					\
-	ld	reg,PACAKBASE(r13);					\
-	ori	reg,reg,(ABS_ADDR(label))@l
-
-/*
- * Branches from unrelocated code (e.g., interrupts) to labels outside
- * head-y require >64K offsets.
- */
-#define __LOAD_FAR_HANDLER(reg, label)					\
-	ld	reg,PACAKBASE(r13);					\
-	ori	reg,reg,(ABS_ADDR(label))@l;				\
-	addis	reg,reg,(ABS_ADDR(label))@h
-
-/* Exception register prefixes */
-#define EXC_HV		1
-#define EXC_STD		0
-
-#if defined(CONFIG_RELOCATABLE)
-/*
- * If we support interrupts with relocation on AND we're a relocatable kernel,
- * we need to use CTR to get to the 2nd level handler.  So, save/restore it
- * when required.
- */
-#define SAVE_CTR(reg, area)	mfctr	reg ; 	std	reg,area+EX_CTR(r13)
-#define GET_CTR(reg, area) 			ld	reg,area+EX_CTR(r13)
-#define RESTORE_CTR(reg, area)	ld	reg,area+EX_CTR(r13) ; mtctr reg
-#else
-/* ...else CTR is unused and in register. */
-#define SAVE_CTR(reg, area)
-#define GET_CTR(reg, area) 	mfctr	reg
-#define RESTORE_CTR(reg, area)
-#endif
-
-/*
- * PPR save/restore macros used in exceptions_64s.S  
- * Used for P7 or later processors
- */
-#define SAVE_PPR(area, ra)						\
-BEGIN_FTR_SECTION_NESTED(940)						\
-	ld	ra,area+EX_PPR(r13);	/* Read PPR from paca */	\
-	std	ra,_PPR(r1);						\
-END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,940)
-
-#define RESTORE_PPR_PACA(area, ra)					\
-BEGIN_FTR_SECTION_NESTED(941)						\
-	ld	ra,area+EX_PPR(r13);					\
-	mtspr	SPRN_PPR,ra;						\
-END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,941)
-
-/*
- * Get an SPR into a register if the CPU has the given feature
- */
-#define OPT_GET_SPR(ra, spr, ftr)					\
-BEGIN_FTR_SECTION_NESTED(943)						\
-	mfspr	ra,spr;							\
-END_FTR_SECTION_NESTED(ftr,ftr,943)
-
-/*
- * Set an SPR from a register if the CPU has the given feature
- */
-#define OPT_SET_SPR(ra, spr, ftr)					\
-BEGIN_FTR_SECTION_NESTED(943)						\
-	mtspr	spr,ra;							\
-END_FTR_SECTION_NESTED(ftr,ftr,943)
-
-/*
- * Save a register to the PACA if the CPU has the given feature
- */
-#define OPT_SAVE_REG_TO_PACA(offset, ra, ftr)				\
-BEGIN_FTR_SECTION_NESTED(943)						\
-	std	ra,offset(r13);						\
-END_FTR_SECTION_NESTED(ftr,ftr,943)
-
-.macro EXCEPTION_PROLOG_0 area
-	GET_PACA(r13)
-	std	r9,\area\()+EX_R9(r13)		/* save r9 */
-	OPT_GET_SPR(r9, SPRN_PPR, CPU_FTR_HAS_PPR)
-	HMT_MEDIUM
-	std	r10,\area\()+EX_R10(r13)	/* save r10 - r12 */
-	OPT_GET_SPR(r10, SPRN_CFAR, CPU_FTR_CFAR)
-.endm
-
-.macro EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, bitmask
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
-		.elseif \vec == 0x900 || \vec == 0xea0
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
-		.if \hsrr
-		bne	masked_Hinterrupt
-		.else
-		bne	masked_interrupt
-		.endif
-	.endif
-
-	std	r11,\area\()+EX_R11(r13)
-	std	r12,\area\()+EX_R12(r13)
-	GET_SCRATCH0(r10)
-	std	r10,\area\()+EX_R13(r13)
-.endm
-
-.macro EXCEPTION_PROLOG_2_REAL label, hsrr, set_ri
-	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
-	.if ! \set_ri
-	xori	r10,r10,MSR_RI		/* Clear MSR_RI */
-	.endif
-	.if \hsrr
-	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
-	.else
-	mfspr	r11,SPRN_SRR0		/* save SRR0 */
-	.endif
-	LOAD_HANDLER(r12, \label\())
-	.if \hsrr
-	mtspr	SPRN_HSRR0,r12
-	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
-	mtspr	SPRN_HSRR1,r10
-	HRFI_TO_KERNEL
-	.else
-	mtspr	SPRN_SRR0,r12
-	mfspr	r12,SPRN_SRR1		/* and SRR1 */
-	mtspr	SPRN_SRR1,r10
-	RFI_TO_KERNEL
-	.endif
-	b	.	/* prevent speculative execution */
-.endm
-
-.macro EXCEPTION_PROLOG_2_VIRT label, hsrr
-#ifdef CONFIG_RELOCATABLE
-	.if \hsrr
-	mfspr	r11,SPRN_HSRR0	/* save HSRR0 */
-	.else
-	mfspr	r11,SPRN_SRR0	/* save SRR0 */
-	.endif
-	LOAD_HANDLER(r12, \label\())
-	mtctr	r12
-	.if \hsrr
-	mfspr	r12,SPRN_HSRR1	/* and HSRR1 */
-	.else
-	mfspr	r12,SPRN_SRR1	/* and HSRR1 */
-	.endif
-	li	r10,MSR_RI
-	mtmsrd 	r10,1		/* Set RI (EE=0) */
-	bctr
-#else
-	.if \hsrr
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
-/*
- * Branch to label using its 0xC000 address. This results in instruction
- * address suitable for MSR[IR]=0 or 1, which allows relocation to be turned
- * on using mtmsr rather than rfid.
- *
- * This could set the 0xc bits for !RELOCATABLE as an immediate, rather than
- * load KBASE for a slight optimisation.
- */
-#define BRANCH_TO_C000(reg, label)					\
-	__LOAD_HANDLER(reg, label);					\
-	mtctr	reg;							\
-	bctr
-
-#ifdef CONFIG_RELOCATABLE
-#define BRANCH_TO_COMMON(reg, label)					\
-	__LOAD_HANDLER(reg, label);					\
-	mtctr	reg;							\
-	bctr
-
-#define BRANCH_LINK_TO_FAR(label)					\
-	__LOAD_FAR_HANDLER(r12, label);					\
-	mtctr	r12;							\
-	bctrl
-
-#else
-#define BRANCH_TO_COMMON(reg, label)					\
-	b	label
-
-#define BRANCH_LINK_TO_FAR(label)					\
-	bl	label
-#endif
-
-#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
-
-#ifdef CONFIG_RELOCATABLE
-/*
- * KVM requires __LOAD_FAR_HANDLER.
- *
- * __BRANCH_TO_KVM_EXIT branches are also a special case because they
- * explicitly use r9 then reload it from PACA before branching. Hence
- * the double-underscore.
- */
-#define __BRANCH_TO_KVM_EXIT(area, label)				\
-	mfctr	r9;							\
-	std	r9,HSTATE_SCRATCH1(r13);				\
-	__LOAD_FAR_HANDLER(r9, label);					\
-	mtctr	r9;							\
-	ld	r9,area+EX_R9(r13);					\
-	bctr
-
-#else
-#define __BRANCH_TO_KVM_EXIT(area, label)				\
-	ld	r9,area+EX_R9(r13);					\
-	b	label
-#endif
-
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-/*
- * If hv is possible, interrupts come into to the hv version
- * of the kvmppc_interrupt code, which then jumps to the PR handler,
- * kvmppc_interrupt_pr, if the guest is a PR guest.
- */
-#define kvmppc_interrupt kvmppc_interrupt_hv
-#else
-#define kvmppc_interrupt kvmppc_interrupt_pr
-#endif
-
-.macro KVMTEST hsrr, n
-	lbz	r10,HSTATE_IN_GUEST(r13)
-	cmpwi	r10,0
-	.if \hsrr
-	bne	do_kvm_H\n
-	.else
-	bne	do_kvm_\n
-	.endif
-.endm
-
-.macro KVM_HANDLER area, hsrr, n, skip
-	.if \skip
-	cmpwi	r10,KVM_GUEST_MODE_SKIP
-	beq	89f
-	.else
-	BEGIN_FTR_SECTION_NESTED(947)
-	ld	r10,\area+EX_CFAR(r13)
-	std	r10,HSTATE_CFAR(r13)
-	END_FTR_SECTION_NESTED(CPU_FTR_CFAR,CPU_FTR_CFAR,947)
-	.endif
-
-	BEGIN_FTR_SECTION_NESTED(948)
-	ld	r10,\area+EX_PPR(r13)
-	std	r10,HSTATE_PPR(r13)
-	END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
-	ld	r10,\area+EX_R10(r13)
-	std	r12,HSTATE_SCRATCH0(r13)
-	sldi	r12,r9,32
-	/* HSRR variants have the 0x2 bit added to their trap number */
-	.if \hsrr
-	ori	r12,r12,(\n + 0x2)
-	.else
-	ori	r12,r12,(\n)
-	.endif
-	/* This reloads r9 before branching to kvmppc_interrupt */
-	__BRANCH_TO_KVM_EXIT(\area, kvmppc_interrupt)
-
-	.if \skip
-89:	mtocrf	0x80,r9
-	ld	r9,\area+EX_R9(r13)
-	ld	r10,\area+EX_R10(r13)
-	.if \hsrr
-	b	kvmppc_skip_Hinterrupt
-	.else
-	b	kvmppc_skip_interrupt
-	.endif
-	.endif
-.endm
-
-#else
-.macro KVMTEST hsrr, n
-.endm
-.macro KVM_HANDLER area, hsrr, n, skip
-.endm
-#endif
-
-#define EXCEPTION_PROLOG_COMMON_1()					   \
-	std	r9,_CCR(r1);		/* save CR in stackframe	*/ \
-	std	r11,_NIP(r1);		/* save SRR0 in stackframe	*/ \
-	std	r12,_MSR(r1);		/* save SRR1 in stackframe	*/ \
-	std	r10,0(r1);		/* make stack chain pointer	*/ \
-	std	r0,GPR0(r1);		/* save r0 in stackframe	*/ \
-	std	r10,GPR1(r1);		/* save r1 in stackframe	*/ \
-
-
-/*
- * The common exception prolog is used for all except a few exceptions
- * such as a segment miss on a kernel address.  We have to be prepared
- * to take another exception from the point where we first touch the
- * kernel stack onwards.
- *
- * On entry r13 points to the paca, r9-r13 are saved in the paca,
- * r9 contains the saved CR, r11 and r12 contain the saved SRR0 and
- * SRR1, and relocation is on.
- */
-#define EXCEPTION_PROLOG_COMMON(n, area)				   \
-	andi.	r10,r12,MSR_PR;		/* See if coming from user	*/ \
-	mr	r10,r1;			/* Save r1			*/ \
-	subi	r1,r1,INT_FRAME_SIZE;	/* alloc frame on kernel stack	*/ \
-	beq-	1f;							   \
-	ld	r1,PACAKSAVE(r13);	/* kernel stack to use		*/ \
-1:	cmpdi	cr1,r1,-INT_FRAME_SIZE;	/* check if r1 is in userspace	*/ \
-	blt+	cr1,3f;			/* abort if it is		*/ \
-	li	r1,(n);			/* will be reloaded later	*/ \
-	sth	r1,PACA_TRAP_SAVE(r13);					   \
-	std	r3,area+EX_R3(r13);					   \
-	addi	r3,r13,area;		/* r3 -> where regs are saved*/	   \
-	RESTORE_CTR(r1, area);						   \
-	b	bad_stack;						   \
-3:	EXCEPTION_PROLOG_COMMON_1();					   \
-	kuap_save_amr_and_lock r9, r10, cr1, cr0;			   \
-	beq	4f;			/* if from kernel mode		*/ \
-	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10);				   \
-	SAVE_PPR(area, r9);						   \
-4:	EXCEPTION_PROLOG_COMMON_2(area)					   \
-	EXCEPTION_PROLOG_COMMON_3(n)					   \
-	ACCOUNT_STOLEN_TIME
-
-/* Save original regs values from save area to stack frame. */
-#define EXCEPTION_PROLOG_COMMON_2(area)					   \
-	ld	r9,area+EX_R9(r13);	/* move r9, r10 to stackframe	*/ \
-	ld	r10,area+EX_R10(r13);					   \
-	std	r9,GPR9(r1);						   \
-	std	r10,GPR10(r1);						   \
-	ld	r9,area+EX_R11(r13);	/* move r11 - r13 to stackframe	*/ \
-	ld	r10,area+EX_R12(r13);					   \
-	ld	r11,area+EX_R13(r13);					   \
-	std	r9,GPR11(r1);						   \
-	std	r10,GPR12(r1);						   \
-	std	r11,GPR13(r1);						   \
-	BEGIN_FTR_SECTION_NESTED(66);					   \
-	ld	r10,area+EX_CFAR(r13);					   \
-	std	r10,ORIG_GPR3(r1);					   \
-	END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);		   \
-	GET_CTR(r10, area);						   \
-	std	r10,_CTR(r1);
-
-#define EXCEPTION_PROLOG_COMMON_3(n)					   \
-	std	r2,GPR2(r1);		/* save r2 in stackframe	*/ \
-	SAVE_4GPRS(3, r1);		/* save r3 - r6 in stackframe   */ \
-	SAVE_2GPRS(7, r1);		/* save r7, r8 in stackframe	*/ \
-	mflr	r9;			/* Get LR, later save to stack	*/ \
-	ld	r2,PACATOC(r13);	/* get kernel TOC into r2	*/ \
-	std	r9,_LINK(r1);						   \
-	lbz	r10,PACAIRQSOFTMASK(r13);				   \
-	mfspr	r11,SPRN_XER;		/* save XER in stackframe	*/ \
-	std	r10,SOFTE(r1);						   \
-	std	r11,_XER(r1);						   \
-	li	r9,(n)+1;						   \
-	std	r9,_TRAP(r1);		/* set trap number		*/ \
-	li	r10,0;							   \
-	ld	r11,exception_marker@toc(r2);				   \
-	std	r10,RESULT(r1);		/* clear regs->result		*/ \
-	std	r11,STACK_FRAME_OVERHEAD-16(r1); /* mark the frame	*/
-
-#define RUNLATCH_ON				\
-BEGIN_FTR_SECTION				\
-	ld	r3, PACA_THREAD_INFO(r13);	\
-	ld	r4,TI_LOCAL_FLAGS(r3);		\
-	andi.	r0,r4,_TLF_RUNLATCH;		\
-	beql	ppc64_runlatch_on_trampoline;	\
-END_FTR_SECTION_IFSET(CPU_FTR_CTRL)
-
-#define EXCEPTION_COMMON(area, trap)				\
-	EXCEPTION_PROLOG_COMMON(trap, area);			\
-
-/*
- * Exception where stack is already set in r1, r1 is saved in r10
- */
-#define EXCEPTION_COMMON_STACK(area, trap)			\
-	EXCEPTION_PROLOG_COMMON_1();				\
-	kuap_save_amr_and_lock r9, r10, cr1;			\
-	EXCEPTION_PROLOG_COMMON_2(area);			\
-	EXCEPTION_PROLOG_COMMON_3(trap)
-
-/*
- * When the idle code in power4_idle puts the CPU into NAP mode,
- * it has to do so in a loop, and relies on the external interrupt
- * and decrementer interrupt entry code to get it out of the loop.
- * It sets the _TLF_NAPPING bit in current_thread_info()->local_flags
- * to signal that it is in the loop and needs help to get out.
- */
-#ifdef CONFIG_PPC_970_NAP
-#define FINISH_NAP				\
-BEGIN_FTR_SECTION				\
-	ld	r11, PACA_THREAD_INFO(r13);	\
-	ld	r9,TI_LOCAL_FLAGS(r11);		\
-	andi.	r10,r9,_TLF_NAPPING;		\
-	bnel	power4_fixup_nap;		\
-END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
-#else
-#define FINISH_NAP
-#endif
-
 #endif /* __ASSEMBLY__ */
 
 #endif	/* _ASM_POWERPC_EXCEPTION_H */
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index d35a9fa4651e..5e26245efb02 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -21,6 +21,437 @@
 #include <asm/feature-fixups.h>
 #include <asm/kup.h>
 
+/*
+ * We're short on space and time in the exception prolog, so we can't
+ * use the normal LOAD_REG_IMMEDIATE macro to load the address of label.
+ * Instead we get the base of the kernel from paca->kernelbase and or in the low
+ * part of label. This requires that the label be within 64KB of kernelbase, and
+ * that kernelbase be 64K aligned.
+ */
+#define LOAD_HANDLER(reg, label)					\
+	ld	reg,PACAKBASE(r13);	/* get high part of &label */	\
+	ori	reg,reg,FIXED_SYMBOL_ABS_ADDR(label)
+
+#define __LOAD_HANDLER(reg, label)					\
+	ld	reg,PACAKBASE(r13);					\
+	ori	reg,reg,(ABS_ADDR(label))@l
+
+/*
+ * Branches from unrelocated code (e.g., interrupts) to labels outside
+ * head-y require >64K offsets.
+ */
+#define __LOAD_FAR_HANDLER(reg, label)					\
+	ld	reg,PACAKBASE(r13);					\
+	ori	reg,reg,(ABS_ADDR(label))@l;				\
+	addis	reg,reg,(ABS_ADDR(label))@h
+
+/* Exception register prefixes */
+#define EXC_HV		1
+#define EXC_STD		0
+
+#if defined(CONFIG_RELOCATABLE)
+/*
+ * If we support interrupts with relocation on AND we're a relocatable kernel,
+ * we need to use CTR to get to the 2nd level handler.  So, save/restore it
+ * when required.
+ */
+#define SAVE_CTR(reg, area)	mfctr	reg ; 	std	reg,area+EX_CTR(r13)
+#define GET_CTR(reg, area) 			ld	reg,area+EX_CTR(r13)
+#define RESTORE_CTR(reg, area)	ld	reg,area+EX_CTR(r13) ; mtctr reg
+#else
+/* ...else CTR is unused and in register. */
+#define SAVE_CTR(reg, area)
+#define GET_CTR(reg, area) 	mfctr	reg
+#define RESTORE_CTR(reg, area)
+#endif
+
+/*
+ * PPR save/restore macros used in exceptions_64s.S  
+ * Used for P7 or later processors
+ */
+#define SAVE_PPR(area, ra)						\
+BEGIN_FTR_SECTION_NESTED(940)						\
+	ld	ra,area+EX_PPR(r13);	/* Read PPR from paca */	\
+	std	ra,_PPR(r1);						\
+END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,940)
+
+#define RESTORE_PPR_PACA(area, ra)					\
+BEGIN_FTR_SECTION_NESTED(941)						\
+	ld	ra,area+EX_PPR(r13);					\
+	mtspr	SPRN_PPR,ra;						\
+END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,941)
+
+/*
+ * Get an SPR into a register if the CPU has the given feature
+ */
+#define OPT_GET_SPR(ra, spr, ftr)					\
+BEGIN_FTR_SECTION_NESTED(943)						\
+	mfspr	ra,spr;							\
+END_FTR_SECTION_NESTED(ftr,ftr,943)
+
+/*
+ * Set an SPR from a register if the CPU has the given feature
+ */
+#define OPT_SET_SPR(ra, spr, ftr)					\
+BEGIN_FTR_SECTION_NESTED(943)						\
+	mtspr	spr,ra;							\
+END_FTR_SECTION_NESTED(ftr,ftr,943)
+
+/*
+ * Save a register to the PACA if the CPU has the given feature
+ */
+#define OPT_SAVE_REG_TO_PACA(offset, ra, ftr)				\
+BEGIN_FTR_SECTION_NESTED(943)						\
+	std	ra,offset(r13);						\
+END_FTR_SECTION_NESTED(ftr,ftr,943)
+
+.macro EXCEPTION_PROLOG_0 area
+	GET_PACA(r13)
+	std	r9,\area\()+EX_R9(r13)		/* save r9 */
+	OPT_GET_SPR(r9, SPRN_PPR, CPU_FTR_HAS_PPR)
+	HMT_MEDIUM
+	std	r10,\area\()+EX_R10(r13)	/* save r10 - r12 */
+	OPT_GET_SPR(r10, SPRN_CFAR, CPU_FTR_CFAR)
+.endm
+
+.macro EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, bitmask
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
+		.elseif \vec == 0x900 || \vec == 0xea0
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
+		.if \hsrr
+		bne	masked_Hinterrupt
+		.else
+		bne	masked_interrupt
+		.endif
+	.endif
+
+	std	r11,\area\()+EX_R11(r13)
+	std	r12,\area\()+EX_R12(r13)
+	GET_SCRATCH0(r10)
+	std	r10,\area\()+EX_R13(r13)
+.endm
+
+.macro EXCEPTION_PROLOG_2_REAL label, hsrr, set_ri
+	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
+	.if ! \set_ri
+	xori	r10,r10,MSR_RI		/* Clear MSR_RI */
+	.endif
+	.if \hsrr
+	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
+	.else
+	mfspr	r11,SPRN_SRR0		/* save SRR0 */
+	.endif
+	LOAD_HANDLER(r12, \label\())
+	.if \hsrr
+	mtspr	SPRN_HSRR0,r12
+	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
+	mtspr	SPRN_HSRR1,r10
+	HRFI_TO_KERNEL
+	.else
+	mtspr	SPRN_SRR0,r12
+	mfspr	r12,SPRN_SRR1		/* and SRR1 */
+	mtspr	SPRN_SRR1,r10
+	RFI_TO_KERNEL
+	.endif
+	b	.	/* prevent speculative execution */
+.endm
+
+.macro EXCEPTION_PROLOG_2_VIRT label, hsrr
+#ifdef CONFIG_RELOCATABLE
+	.if \hsrr
+	mfspr	r11,SPRN_HSRR0	/* save HSRR0 */
+	.else
+	mfspr	r11,SPRN_SRR0	/* save SRR0 */
+	.endif
+	LOAD_HANDLER(r12, \label\())
+	mtctr	r12
+	.if \hsrr
+	mfspr	r12,SPRN_HSRR1	/* and HSRR1 */
+	.else
+	mfspr	r12,SPRN_SRR1	/* and HSRR1 */
+	.endif
+	li	r10,MSR_RI
+	mtmsrd 	r10,1		/* Set RI (EE=0) */
+	bctr
+#else
+	.if \hsrr
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
+ * Branch to label using its 0xC000 address. This results in instruction
+ * address suitable for MSR[IR]=0 or 1, which allows relocation to be turned
+ * on using mtmsr rather than rfid.
+ *
+ * This could set the 0xc bits for !RELOCATABLE as an immediate, rather than
+ * load KBASE for a slight optimisation.
+ */
+#define BRANCH_TO_C000(reg, label)					\
+	__LOAD_HANDLER(reg, label);					\
+	mtctr	reg;							\
+	bctr
+
+#ifdef CONFIG_RELOCATABLE
+#define BRANCH_TO_COMMON(reg, label)					\
+	__LOAD_HANDLER(reg, label);					\
+	mtctr	reg;							\
+	bctr
+
+#define BRANCH_LINK_TO_FAR(label)					\
+	__LOAD_FAR_HANDLER(r12, label);					\
+	mtctr	r12;							\
+	bctrl
+
+#else
+#define BRANCH_TO_COMMON(reg, label)					\
+	b	label
+
+#define BRANCH_LINK_TO_FAR(label)					\
+	bl	label
+#endif
+
+#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
+
+#ifdef CONFIG_RELOCATABLE
+/*
+ * KVM requires __LOAD_FAR_HANDLER.
+ *
+ * __BRANCH_TO_KVM_EXIT branches are also a special case because they
+ * explicitly use r9 then reload it from PACA before branching. Hence
+ * the double-underscore.
+ */
+#define __BRANCH_TO_KVM_EXIT(area, label)				\
+	mfctr	r9;							\
+	std	r9,HSTATE_SCRATCH1(r13);				\
+	__LOAD_FAR_HANDLER(r9, label);					\
+	mtctr	r9;							\
+	ld	r9,area+EX_R9(r13);					\
+	bctr
+
+#else
+#define __BRANCH_TO_KVM_EXIT(area, label)				\
+	ld	r9,area+EX_R9(r13);					\
+	b	label
+#endif
+
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+/*
+ * If hv is possible, interrupts come into to the hv version
+ * of the kvmppc_interrupt code, which then jumps to the PR handler,
+ * kvmppc_interrupt_pr, if the guest is a PR guest.
+ */
+#define kvmppc_interrupt kvmppc_interrupt_hv
+#else
+#define kvmppc_interrupt kvmppc_interrupt_pr
+#endif
+
+.macro KVMTEST hsrr, n
+	lbz	r10,HSTATE_IN_GUEST(r13)
+	cmpwi	r10,0
+	.if \hsrr
+	bne	do_kvm_H\n
+	.else
+	bne	do_kvm_\n
+	.endif
+.endm
+
+.macro KVM_HANDLER area, hsrr, n, skip
+	.if \skip
+	cmpwi	r10,KVM_GUEST_MODE_SKIP
+	beq	89f
+	.else
+	BEGIN_FTR_SECTION_NESTED(947)
+	ld	r10,\area+EX_CFAR(r13)
+	std	r10,HSTATE_CFAR(r13)
+	END_FTR_SECTION_NESTED(CPU_FTR_CFAR,CPU_FTR_CFAR,947)
+	.endif
+
+	BEGIN_FTR_SECTION_NESTED(948)
+	ld	r10,\area+EX_PPR(r13)
+	std	r10,HSTATE_PPR(r13)
+	END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
+	ld	r10,\area+EX_R10(r13)
+	std	r12,HSTATE_SCRATCH0(r13)
+	sldi	r12,r9,32
+	/* HSRR variants have the 0x2 bit added to their trap number */
+	.if \hsrr
+	ori	r12,r12,(\n + 0x2)
+	.else
+	ori	r12,r12,(\n)
+	.endif
+	/* This reloads r9 before branching to kvmppc_interrupt */
+	__BRANCH_TO_KVM_EXIT(\area, kvmppc_interrupt)
+
+	.if \skip
+89:	mtocrf	0x80,r9
+	ld	r9,\area+EX_R9(r13)
+	ld	r10,\area+EX_R10(r13)
+	.if \hsrr
+	b	kvmppc_skip_Hinterrupt
+	.else
+	b	kvmppc_skip_interrupt
+	.endif
+	.endif
+.endm
+
+#else
+.macro KVMTEST hsrr, n
+.endm
+.macro KVM_HANDLER area, hsrr, n, skip
+.endm
+#endif
+
+#define EXCEPTION_PROLOG_COMMON_1()					   \
+	std	r9,_CCR(r1);		/* save CR in stackframe	*/ \
+	std	r11,_NIP(r1);		/* save SRR0 in stackframe	*/ \
+	std	r12,_MSR(r1);		/* save SRR1 in stackframe	*/ \
+	std	r10,0(r1);		/* make stack chain pointer	*/ \
+	std	r0,GPR0(r1);		/* save r0 in stackframe	*/ \
+	std	r10,GPR1(r1);		/* save r1 in stackframe	*/ \
+
+
+/*
+ * The common exception prolog is used for all except a few exceptions
+ * such as a segment miss on a kernel address.  We have to be prepared
+ * to take another exception from the point where we first touch the
+ * kernel stack onwards.
+ *
+ * On entry r13 points to the paca, r9-r13 are saved in the paca,
+ * r9 contains the saved CR, r11 and r12 contain the saved SRR0 and
+ * SRR1, and relocation is on.
+ */
+#define EXCEPTION_PROLOG_COMMON(n, area)				   \
+	andi.	r10,r12,MSR_PR;		/* See if coming from user	*/ \
+	mr	r10,r1;			/* Save r1			*/ \
+	subi	r1,r1,INT_FRAME_SIZE;	/* alloc frame on kernel stack	*/ \
+	beq-	1f;							   \
+	ld	r1,PACAKSAVE(r13);	/* kernel stack to use		*/ \
+1:	cmpdi	cr1,r1,-INT_FRAME_SIZE;	/* check if r1 is in userspace	*/ \
+	blt+	cr1,3f;			/* abort if it is		*/ \
+	li	r1,(n);			/* will be reloaded later	*/ \
+	sth	r1,PACA_TRAP_SAVE(r13);					   \
+	std	r3,area+EX_R3(r13);					   \
+	addi	r3,r13,area;		/* r3 -> where regs are saved*/	   \
+	RESTORE_CTR(r1, area);						   \
+	b	bad_stack;						   \
+3:	EXCEPTION_PROLOG_COMMON_1();					   \
+	kuap_save_amr_and_lock r9, r10, cr1, cr0;			   \
+	beq	4f;			/* if from kernel mode		*/ \
+	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10);				   \
+	SAVE_PPR(area, r9);						   \
+4:	EXCEPTION_PROLOG_COMMON_2(area)					   \
+	EXCEPTION_PROLOG_COMMON_3(n)					   \
+	ACCOUNT_STOLEN_TIME
+
+/* Save original regs values from save area to stack frame. */
+#define EXCEPTION_PROLOG_COMMON_2(area)					   \
+	ld	r9,area+EX_R9(r13);	/* move r9, r10 to stackframe	*/ \
+	ld	r10,area+EX_R10(r13);					   \
+	std	r9,GPR9(r1);						   \
+	std	r10,GPR10(r1);						   \
+	ld	r9,area+EX_R11(r13);	/* move r11 - r13 to stackframe	*/ \
+	ld	r10,area+EX_R12(r13);					   \
+	ld	r11,area+EX_R13(r13);					   \
+	std	r9,GPR11(r1);						   \
+	std	r10,GPR12(r1);						   \
+	std	r11,GPR13(r1);						   \
+	BEGIN_FTR_SECTION_NESTED(66);					   \
+	ld	r10,area+EX_CFAR(r13);					   \
+	std	r10,ORIG_GPR3(r1);					   \
+	END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);		   \
+	GET_CTR(r10, area);						   \
+	std	r10,_CTR(r1);
+
+#define EXCEPTION_PROLOG_COMMON_3(n)					   \
+	std	r2,GPR2(r1);		/* save r2 in stackframe	*/ \
+	SAVE_4GPRS(3, r1);		/* save r3 - r6 in stackframe   */ \
+	SAVE_2GPRS(7, r1);		/* save r7, r8 in stackframe	*/ \
+	mflr	r9;			/* Get LR, later save to stack	*/ \
+	ld	r2,PACATOC(r13);	/* get kernel TOC into r2	*/ \
+	std	r9,_LINK(r1);						   \
+	lbz	r10,PACAIRQSOFTMASK(r13);				   \
+	mfspr	r11,SPRN_XER;		/* save XER in stackframe	*/ \
+	std	r10,SOFTE(r1);						   \
+	std	r11,_XER(r1);						   \
+	li	r9,(n)+1;						   \
+	std	r9,_TRAP(r1);		/* set trap number		*/ \
+	li	r10,0;							   \
+	ld	r11,exception_marker@toc(r2);				   \
+	std	r10,RESULT(r1);		/* clear regs->result		*/ \
+	std	r11,STACK_FRAME_OVERHEAD-16(r1); /* mark the frame	*/
+
+#define RUNLATCH_ON				\
+BEGIN_FTR_SECTION				\
+	ld	r3, PACA_THREAD_INFO(r13);	\
+	ld	r4,TI_LOCAL_FLAGS(r3);		\
+	andi.	r0,r4,_TLF_RUNLATCH;		\
+	beql	ppc64_runlatch_on_trampoline;	\
+END_FTR_SECTION_IFSET(CPU_FTR_CTRL)
+
+#define EXCEPTION_COMMON(area, trap)				\
+	EXCEPTION_PROLOG_COMMON(trap, area);			\
+
+/*
+ * Exception where stack is already set in r1, r1 is saved in r10
+ */
+#define EXCEPTION_COMMON_STACK(area, trap)			\
+	EXCEPTION_PROLOG_COMMON_1();				\
+	kuap_save_amr_and_lock r9, r10, cr1;			\
+	EXCEPTION_PROLOG_COMMON_2(area);			\
+	EXCEPTION_PROLOG_COMMON_3(trap)
+
+/*
+ * When the idle code in power4_idle puts the CPU into NAP mode,
+ * it has to do so in a loop, and relies on the external interrupt
+ * and decrementer interrupt entry code to get it out of the loop.
+ * It sets the _TLF_NAPPING bit in current_thread_info()->local_flags
+ * to signal that it is in the loop and needs help to get out.
+ */
+#ifdef CONFIG_PPC_970_NAP
+#define FINISH_NAP				\
+BEGIN_FTR_SECTION				\
+	ld	r11, PACA_THREAD_INFO(r13);	\
+	ld	r9,TI_LOCAL_FLAGS(r11);		\
+	andi.	r10,r9,_TLF_NAPPING;		\
+	bnel	power4_fixup_nap;		\
+END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
+#else
+#define FINISH_NAP
+#endif
+
+
 /*
  * There are a few constraints to be concerned with.
  * - Real mode exceptions code/data must be located at their physical location.
-- 
2.20.1

