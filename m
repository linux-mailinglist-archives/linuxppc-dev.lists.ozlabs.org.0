Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B31D797981
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 14:33:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D6Wv0TH8zDqTQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 22:33:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jrRvlzqm"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D6Jk4MJqzDqlW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 22:23:34 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id gn20so1264308plb.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 05:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MhJd4MdJap19h+fTDfipSU9M4JItmelEmxAvMc2PuYU=;
 b=jrRvlzqmE/hobdD5vQFme7FjQBD/LhzJZmobCx5M1vb2cdDEqJ5QKLTaN6BVgRtjeX
 DnKsdCqO8/d0l+EAoNXC/tJOMz4BsaGE5hEiIXYNbvZUDZAHqcC0eb4HnVwkf2lUKTCM
 TvhiaSKFNrEyD9v3oPBSuFZsiS0tupGBNzlXDyrdsoUR5V4FvFAhWDMFKe8/7gMpMCaA
 IT0eMymSgvuMkm88qPeL4ewpPfFONZ5XA3VV4LYjf9vjhaC6Rm5abvujMCTW66AN5H9+
 MWYyv1S/t5UL3D1RbeW/X2/wavtvz2iCcnQOPl06KnUNIvClQh3odkcJ1Sch+V7nkUfe
 Ql7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MhJd4MdJap19h+fTDfipSU9M4JItmelEmxAvMc2PuYU=;
 b=tls0Lc6xS4uUvQc2hOFR/EkYqXDK1H4ZBNiOY9blN8+KZWJYrr9KeOewdSny/ZnTyr
 mN3LnhYyM+ji0p2R+bOn6RwTGsILNupJ+qzMmuNjd6w0DtQSi4EB7NFwFOn4FgQ3keKP
 X9lHKvNfGVvEfJjiV8YhC7pIOt4j9lmBmXPk8oDRAGHAJL2vJz1tFtveUyQalzjknIoL
 pGQDPjrefTOB8I2nYl10nFnm5Rz+EJ3MVCkdcWwJKzcs5OcP0w7NU4KajfgvmHl2Cu+Z
 DZ5TdrLUjfZ8J38Ud7VubXr0fhBsw8MGwY3atjFyfPSMtTu9jkNiJ6bfMVnPPgiKNW40
 F45Q==
X-Gm-Message-State: APjAAAVsE8KYKsSRDBMybNqe9sxJmB5DcJOnhdij1BCT+ViDYWiAYCDn
 OwBjJOD5A2S5wC/0/GKtGZrWMp1O
X-Google-Smtp-Source: APXvYqxOfGNq82uaD3i2Cwx4lTmslNMVlNcLfbb0gxupnyiYFDm4aTc76Eib9Q4cb8r36Yt30UihCg==
X-Received: by 2002:a17:902:e489:: with SMTP id
 cj9mr28199407plb.327.1566390211843; 
 Wed, 21 Aug 2019 05:23:31 -0700 (PDT)
Received: from bobo.local0.net ([193.114.104.176])
 by smtp.gmail.com with ESMTPSA id a3sm23657819pfc.70.2019.08.21.05.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:23:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/10] powerpc/64s/exception: move soft-mask test to common
 code
Date: Wed, 21 Aug 2019 22:23:08 +1000
Message-Id: <20190821122315.9535-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821122315.9535-1-npiggin@gmail.com>
References: <20190821122315.9535-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S | 108 +++++++++++++--------------
 1 file changed, 51 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 6ea6176de00a..b78167ce6355 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -414,36 +414,6 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
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
@@ -528,6 +498,37 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
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
@@ -2395,18 +2396,12 @@ EXC_VIRT_NONE(0x5800, 0x100)
 
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
+	IHSRR=EXC_STD
+	IAREA=PACA_EXGEN
+	ISTACK=0
+INT_DEFINE_END(soft_nmi)
 
 /*
  * Branch to soft_nmi_interrupt using the emergency stack. The emergency
@@ -2418,19 +2413,16 @@ EXC_VIRT_NONE(0x5800, 0x100)
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
@@ -2449,7 +2441,6 @@ masked_Hinterrupt:
 	.else
 masked_interrupt:
 	.endif
-	std	r11,PACA_EXGEN+EX_R11(r13)
 	lbz	r11,PACAIRQHAPPENED(r13)
 	or	r11,r11,r10
 	stb	r11,PACAIRQHAPPENED(r13)
@@ -2458,26 +2449,30 @@ masked_interrupt:
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
@@ -2485,7 +2480,6 @@ masked_interrupt:
 	RFI_TO_KERNEL
 	.endif
 	b	.
-	MASKED_DEC_HANDLER(\hsrr\())
 .endm
 
 TRAMP_REAL_BEGIN(stf_barrier_fallback)
@@ -2592,7 +2586,7 @@ TRAMP_REAL_BEGIN(hrfi_flush_fallback)
  * instruction code patches (which end up in the common .text area)
  * cannot reach these if they are put there.
  */
-USE_FIXED_SECTION(virt_trampolines)
+USE_TEXT_SECTION()
 	MASKED_INTERRUPT EXC_STD
 	MASKED_INTERRUPT EXC_HV
 
-- 
2.22.0

