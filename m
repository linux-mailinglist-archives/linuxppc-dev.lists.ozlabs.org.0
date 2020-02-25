Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4408516ED84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:09:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rn5K0l3rzDqMl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:09:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Vbues8bZ; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmRV0QyQzDqN0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:40:19 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id t14so71477plr.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wkyiU1PPBEztNue8uonkCRhf7XewPP1PnyuMzYGcL4w=;
 b=Vbues8bZOxzdV/r3xDine+guMD7oOl/ujFkXPYerHQ6dJgx77eT1aNXbe84zj+yJTX
 osfRp7YinGCjZWmOCCEFthWJEwkjYD0ofMEXhTJ595ZBX16YDaQDaLrRuqnYPrEnVVTB
 pJJkCqkiQFwP3em7Q2BERZtbekNtC+EJxY2PakQ5VOmV83idzWVwBydTdGaXrmVcJ0K/
 WKNtwlf3RWerumG8dCsA5QUUSVtZa4ymP4fA3Rg3C0zNeyw6aFrwf2inRsDMQg41T1ws
 ZTDZJlBv8xL65X2D2GZca3BmbLrCNJ46t/bjUBbQagyt+2ZXqkA+Fr0AilRy5im7V0OA
 WMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wkyiU1PPBEztNue8uonkCRhf7XewPP1PnyuMzYGcL4w=;
 b=jto02/ixyLm9HFgUCwkFt/Q5d9WrCgTPgOwfm7Oj7QnG5H0Mcob8iYuDUUki4Iora/
 al8sm6s7okxJdyhGVMI+9xxFI6uYepaFLCYN4q4Q4seEU3Cii7Ong+dFeCGsPN7/S8D9
 Y0hs8h4yrHLWJmQCBD2x0cF93NEQHlVLz6++b+8zI1M71AMBAl6qSUTXaVEzX8lywiLQ
 Io/WXLyQJcg6Z0I+xRDuledG1KWGvb6lQvNNDeMu670ANn92SZm3d/LDBjaIpyygCeZH
 Ex7YzF0uIhd+SdnUvRQ52otgxD0Ze9nWHqATUNddMurZEsO9zX9JOaVs5inhCZz92azx
 75Cg==
X-Gm-Message-State: APjAAAUndjfFPBhGLl7vEmNH0SBspqIHnwRxxHzhSKAkgqI/ra3Y25xB
 wLH+r4+fLPtl76sGhwKUHcrdDjwK
X-Google-Smtp-Source: APXvYqyM/89gtohVeoNDaT7LAdfiYuROwJNFFAJA//mGs41tlRtoxFsSOzZzcwfXKWXMk5JRj20sqA==
X-Received: by 2002:a17:90a:30e8:: with SMTP id
 h95mr130037pjb.30.1582652415834; 
 Tue, 25 Feb 2020 09:40:15 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:40:15 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 11/32] powerpc/64s/exception: move soft-mask test to common
 code
Date: Wed, 26 Feb 2020 03:35:20 +1000
Message-Id: <20200225173541.1549955-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225173541.1549955-1-npiggin@gmail.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As well as moving code out of the unrelocated vectors, this allows the
masked handlers to be moved to common code, and allows the soft_nmi
handler to be generated more like a regular handler.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 106 +++++++++++++--------------
 1 file changed, 49 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 112cdb446e03..a23f2450f9ed 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -411,36 +411,6 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	.if (!\virt && IKVM_REAL) || (\virt && IKVM_VIRT)
 		KVMTEST \name IHSRR IVEC
 	.endif
-	.if IMASK
-		lbz	r10,PACAIRQSOFTMASK(r13)
-		andi.	r10,r10,IMASK
-		/* Associate vector numbers with bits in paca->irq_happened */
-		.if IVEC == 0x500 || IVEC == 0xea0
-		li	r10,PACA_IRQ_EE
-		.elseif IVEC == 0x900
-		li	r10,PACA_IRQ_DEC
-		.elseif IVEC == 0xa00 || IVEC == 0xe80
-		li	r10,PACA_IRQ_DBELL
-		.elseif IVEC == 0xe60
-		li	r10,PACA_IRQ_HMI
-		.elseif IVEC == 0xf00
-		li	r10,PACA_IRQ_PMI
-		.else
-		.abort "Bad maskable vector"
-		.endif
-
-		.if IHSRR == EXC_HV_OR_STD
-		BEGIN_FTR_SECTION
-		bne	masked_Hinterrupt
-		FTR_SECTION_ELSE
-		bne	masked_interrupt
-		ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-		.elseif IHSRR
-		bne	masked_Hinterrupt
-		.else
-		bne	masked_interrupt
-		.endif
-	.endif
 
 	std	r11,IAREA+EX_R11(r13)
 	std	r12,IAREA+EX_R12(r13)
@@ -524,6 +494,37 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 .endm
 
 .macro __GEN_COMMON_BODY name
+	.if IMASK
+		lbz	r10,PACAIRQSOFTMASK(r13)
+		andi.	r10,r10,IMASK
+		/* Associate vector numbers with bits in paca->irq_happened */
+		.if IVEC == 0x500 || IVEC == 0xea0
+		li	r10,PACA_IRQ_EE
+		.elseif IVEC == 0x900
+		li	r10,PACA_IRQ_DEC
+		.elseif IVEC == 0xa00 || IVEC == 0xe80
+		li	r10,PACA_IRQ_DBELL
+		.elseif IVEC == 0xe60
+		li	r10,PACA_IRQ_HMI
+		.elseif IVEC == 0xf00
+		li	r10,PACA_IRQ_PMI
+		.else
+		.abort "Bad maskable vector"
+		.endif
+
+		.if IHSRR == EXC_HV_OR_STD
+		BEGIN_FTR_SECTION
+		bne	masked_Hinterrupt
+		FTR_SECTION_ELSE
+		bne	masked_interrupt
+		ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+		.elseif IHSRR
+		bne	masked_Hinterrupt
+		.else
+		bne	masked_interrupt
+		.endif
+	.endif
+
 	.if ISTACK
 	andi.	r10,r12,MSR_PR		/* See if coming from user	*/
 	mr	r10,r1			/* Save r1			*/
@@ -2330,18 +2331,10 @@ EXC_VIRT_NONE(0x5800, 0x100)
 
 #ifdef CONFIG_PPC_WATCHDOG
 
-#define MASKED_DEC_HANDLER_LABEL 3f
-
-#define MASKED_DEC_HANDLER(_H)				\
-3: /* soft-nmi */					\
-	std	r12,PACA_EXGEN+EX_R12(r13);		\
-	GET_SCRATCH0(r10);				\
-	std	r10,PACA_EXGEN+EX_R13(r13);		\
-	mfspr	r11,SPRN_SRR0;		/* save SRR0 */	\
-	mfspr	r12,SPRN_SRR1;		/* and SRR1 */	\
-	LOAD_HANDLER(r10, soft_nmi_common);		\
-	mtctr	r10;					\
-	bctr
+INT_DEFINE_BEGIN(soft_nmi)
+	IVEC=0x900
+	ISTACK=0
+INT_DEFINE_END(soft_nmi)
 
 /*
  * Branch to soft_nmi_interrupt using the emergency stack. The emergency
@@ -2353,19 +2346,16 @@ EXC_VIRT_NONE(0x5800, 0x100)
  * and run it entirely with interrupts hard disabled.
  */
 EXC_COMMON_BEGIN(soft_nmi_common)
+	mfspr	r11,SPRN_SRR0
 	mr	r10,r1
 	ld	r1,PACAEMERGSP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
-	__ISTACK(decrementer)=0
-	__GEN_COMMON_BODY decrementer
+	__GEN_COMMON_BODY soft_nmi
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	soft_nmi_interrupt
 	b	ret_from_except
 
-#else /* CONFIG_PPC_WATCHDOG */
-#define MASKED_DEC_HANDLER_LABEL 2f /* normal return */
-#define MASKED_DEC_HANDLER(_H)
 #endif /* CONFIG_PPC_WATCHDOG */
 
 /*
@@ -2384,7 +2374,6 @@ masked_Hinterrupt:
 	.else
 masked_interrupt:
 	.endif
-	std	r11,PACA_EXGEN+EX_R11(r13)
 	lbz	r11,PACAIRQHAPPENED(r13)
 	or	r11,r11,r10
 	stb	r11,PACAIRQHAPPENED(r13)
@@ -2393,26 +2382,30 @@ masked_interrupt:
 	lis	r10,0x7fff
 	ori	r10,r10,0xffff
 	mtspr	SPRN_DEC,r10
-	b	MASKED_DEC_HANDLER_LABEL
+#ifdef CONFIG_PPC_WATCHDOG
+	b	soft_nmi_common
+#else
+	b	2f
+#endif
 1:	andi.	r10,r10,PACA_IRQ_MUST_HARD_MASK
 	beq	2f
+	xori	r12,r12,MSR_EE	/* clear MSR_EE */
 	.if \hsrr
-	mfspr	r10,SPRN_HSRR1
-	xori	r10,r10,MSR_EE	/* clear MSR_EE */
-	mtspr	SPRN_HSRR1,r10
+	mtspr	SPRN_HSRR1,r12
 	.else
-	mfspr	r10,SPRN_SRR1
-	xori	r10,r10,MSR_EE	/* clear MSR_EE */
-	mtspr	SPRN_SRR1,r10
+	mtspr	SPRN_SRR1,r12
 	.endif
 	ori	r11,r11,PACA_IRQ_HARD_DIS
 	stb	r11,PACAIRQHAPPENED(r13)
 2:	/* done */
+	ld	r10,PACA_EXGEN+EX_CTR(r13)
+	mtctr	r10
 	mtcrf	0x80,r9
 	std	r1,PACAR1(r13)
 	ld	r9,PACA_EXGEN+EX_R9(r13)
 	ld	r10,PACA_EXGEN+EX_R10(r13)
 	ld	r11,PACA_EXGEN+EX_R11(r13)
+	ld	r12,PACA_EXGEN+EX_R12(r13)
 	/* returns to kernel where r13 must be set up, so don't restore it */
 	.if \hsrr
 	HRFI_TO_KERNEL
@@ -2420,7 +2413,6 @@ masked_interrupt:
 	RFI_TO_KERNEL
 	.endif
 	b	.
-	MASKED_DEC_HANDLER(\hsrr\())
 .endm
 
 TRAMP_REAL_BEGIN(stf_barrier_fallback)
@@ -2527,7 +2519,7 @@ TRAMP_REAL_BEGIN(hrfi_flush_fallback)
  * instruction code patches (which end up in the common .text area)
  * cannot reach these if they are put there.
  */
-USE_FIXED_SECTION(virt_trampolines)
+USE_TEXT_SECTION()
 	MASKED_INTERRUPT EXC_STD
 	MASKED_INTERRUPT EXC_HV
 
-- 
2.23.0

