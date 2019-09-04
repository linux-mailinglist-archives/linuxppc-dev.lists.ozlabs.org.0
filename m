Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF369A8253
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 14:25:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Njhq5xrLzDqRL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 22:25:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Udb42M/g"; 
 dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nj3B2vHszDqfX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 21:56:38 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id t1so1222158plq.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2019 04:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cxOpLUe1j29ZUVbR+ZNqnqDCqeMYavi2xx1o+C6Y3rE=;
 b=Udb42M/gmGcP8T3wXH189bZot/qX+k9FBNUDd2B+W5fpOsF4c1HkiULuT2rPKJqn5F
 vNiqOq0uoElPJH2Ox8yVWSUQgc0grhXt1PmI5JpnSOnEF+fxBBm9TB9TPLIjlB3vE8Q6
 X7N6ieeD5QQ6KnrRlpofTw+eXL8XKQ+Rzd2kCNn/vWuMs+GMXFXe2OGXGVpzrOuxxlee
 LzSlevU7sl2YiRUSZHt29922pxkC+UdqMqAPbSjUjqWRm7iejtjm1wPMA8+8cNpOaFlV
 Tlr1R7Chz22EOwpUAG48SEnmVIMzSor7+8XZon8LsL+iAlaa2HjB6W58oVvaQPKr6Pmw
 916w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cxOpLUe1j29ZUVbR+ZNqnqDCqeMYavi2xx1o+C6Y3rE=;
 b=laPtkOHW717QEeeGod6k+uHwO/MiBndRRH4Ne/btKsa9Awd2NwNS78MfLk1t8vlNCG
 9F97JIOYrTctLwY/0hfSthtr696/djbYtbKqIZ9FN3t5X36fx0W7o9IUT7mWh1XhYrCS
 KE6vHgV3YoNF2AkadfxIHI24zzAK+Tc+ksHUf9z6RFE1DRxLH49joNIHKECxiMF5NV4+
 8xckedZRMu4Cr1WTDYi4FkGykD/uLi0/PSH25vGz//CL8VnnWLUdYuQgJ2pT5FfIWxBD
 FQxy7aE7MAM7yxnHVrCBJs4pfxeQ4y6VJBA/QWnWPJdJcqAu853cgWr1yD7HfAKpN5Pe
 pScA==
X-Gm-Message-State: APjAAAW8fCWWUIz8kEi8ObFRE+qdsXiyJjRNhAnIZlN5KOpGxPCdqE/o
 SA2WkO2jMiaxFlQgetgx1CSWm0jZ
X-Google-Smtp-Source: APXvYqzZ8mB5kcnIx/p5dIOQ55qnrrmtu5FRdNVKeHf2yiZGMWlYfLdXTDbY917a096GfuV2tM9KQA==
X-Received: by 2002:a17:902:e48d:: with SMTP id
 cj13mr39756441plb.177.1567598195510; 
 Wed, 04 Sep 2019 04:56:35 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id g18sm19554789pgm.9.2019.09.04.04.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 04:56:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 11/20] powerpc/64s/exception: move soft-mask test to common
 code
Date: Wed,  4 Sep 2019 21:55:26 +1000
Message-Id: <20190904115535.18559-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190904115535.18559-1-npiggin@gmail.com>
References: <20190904115535.18559-1-npiggin@gmail.com>
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

As well as moving code out of the unrelocated vectors, this allows the
masked handlers to be moved to common code, and allows the soft_nmi
handler to be generated more like a regular handler.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 106 +++++++++++++--------------
 1 file changed, 49 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 473ba1fa7bbe..af41de2dbc75 100644
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
@@ -525,6 +495,37 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
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
@@ -2339,18 +2340,10 @@ EXC_VIRT_NONE(0x5800, 0x100)
 
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
@@ -2362,19 +2355,16 @@ EXC_VIRT_NONE(0x5800, 0x100)
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
@@ -2393,7 +2383,6 @@ masked_Hinterrupt:
 	.else
 masked_interrupt:
 	.endif
-	std	r11,PACA_EXGEN+EX_R11(r13)
 	lbz	r11,PACAIRQHAPPENED(r13)
 	or	r11,r11,r10
 	stb	r11,PACAIRQHAPPENED(r13)
@@ -2402,26 +2391,30 @@ masked_interrupt:
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
@@ -2429,7 +2422,6 @@ masked_interrupt:
 	RFI_TO_KERNEL
 	.endif
 	b	.
-	MASKED_DEC_HANDLER(\hsrr\())
 .endm
 
 TRAMP_REAL_BEGIN(stf_barrier_fallback)
@@ -2536,7 +2528,7 @@ TRAMP_REAL_BEGIN(hrfi_flush_fallback)
  * instruction code patches (which end up in the common .text area)
  * cannot reach these if they are put there.
  */
-USE_FIXED_SECTION(virt_trampolines)
+USE_TEXT_SECTION()
 	MASKED_INTERRUPT EXC_STD
 	MASKED_INTERRUPT EXC_HV
 
-- 
2.22.0

