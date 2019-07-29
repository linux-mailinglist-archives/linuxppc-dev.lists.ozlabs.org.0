Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C444E78E55
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 16:47:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y2bB40nQzDqNZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 00:47:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mdTr8++1"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1rW2f8MzDqC8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:13:47 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id s1so22035523pgr.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o/l0oHn4F5iDXj6UPyQPHT2nI3CWmzabG3bUrEKdUvA=;
 b=mdTr8++1FrJAPOH65GPX9ah0OBUvlMBEfjmTFcunYcVXUZ+fJ8xg2lvpibKCw2LAcE
 9l3ZyB0kRPHsMGIOWQl1+oqUh/OufRvRcoJEUymcN1vWnl69sxmtA49pP5vEz4eDW7m5
 O1ZPb/yml//e6eSTKljNVqQCJDdGfCNsHikhUBHTS10HnOJdTJMYhzL1mufa2Rm3g+Gw
 FQPD2uke6wUQx0yAPLSuZ7jUQxxxh78k09Iw72glv840Q/SMSnaMP1kwOILKGxBtoyN8
 FqCPTxVM0KkYjx2syK8srYyKAy1ezId8qrFbJAGZGXzwO64eCUPIx2myRZJ6j0X2f9Mv
 j4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o/l0oHn4F5iDXj6UPyQPHT2nI3CWmzabG3bUrEKdUvA=;
 b=U1PKlylGwT4YKKCN5W75Jp152BrV3/TwLmaLnF8eUeQyW9Kir8bXXtf3NlTP84GrXV
 Xhja2mTp+iqEv4Xecn/f9tQZhPOI+OLh1U/BydPHMlzuwrZqGWBgLN9du/CTXxee8pFq
 Xgmf43QVFx3A+Be6sQO30F2Z5zft7dq87y9LgUg3E4NlBkmj0ctz5Lqx87fS8HC69Iij
 h9RG6NYNMFZ7WpKNbSOBpdMozGVAjdSLU1FMDkqMGIv5qYu7Vt1sPhvhNI/261Lib/es
 Hubkt3KhAFOoEX/s0T0KAdbHRNy4iFkq6jUry0cKK2wsXrsouTRiJiTUkF9OYDXc1JO/
 jTTw==
X-Gm-Message-State: APjAAAVOQJg/NBl+XaeAqD7gxE3R6cG4oe6aqFc/JGeeUlQxBmqmWNZr
 Qe/mzRtQaZrp+m7iDi6xLiGiZW8JfVo=
X-Google-Smtp-Source: APXvYqySe4AWPWOAO3JDS0b8IxmuOOKLSdjngS4WmzSZyo+jreVHj9gtvMozCNfA3xF0jwF87G3M6Q==
X-Received: by 2002:a63:e44b:: with SMTP id i11mr56429128pgk.297.1564409624274; 
 Mon, 29 Jul 2019 07:13:44 -0700 (PDT)
Received: from bobo.local0.net (61-68-184-39.tpgi.com.au. [61.68.184.39])
 by smtp.gmail.com with ESMTPSA id u7sm53960083pfm.96.2019.07.29.07.13.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:13:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/18] powerpc/64s/exception: remove EXCEPTION_PROLOG_0/1,
 rename _2
Date: Tue, 30 Jul 2019 00:12:36 +1000
Message-Id: <20190729141247.26762-8-npiggin@gmail.com>
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

EXCEPTION_PROLOG_0 and _1 have only a single caller, so expand them
into it.

Rename EXCEPTION_PROLOG_2_REAL to INT_SAVE_SRR_AND_JUMP and
EXCEPTION_PROLOG_2_VIRT to INT_VIRT_SAVE_SRR_AND_JUMP, which are
more descriptive.

No generated code change except BUG line number constants.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 151 +++++++++++++--------------
 1 file changed, 73 insertions(+), 78 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b07de1106d9e..94f885c58022 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -180,77 +180,7 @@ BEGIN_FTR_SECTION_NESTED(943)						\
 	std	ra,offset(r13);						\
 END_FTR_SECTION_NESTED(ftr,ftr,943)
 
-.macro EXCEPTION_PROLOG_0 area
-	SET_SCRATCH0(r13)			/* save r13 */
-	GET_PACA(r13)
-	std	r9,\area\()+EX_R9(r13)		/* save r9 */
-	OPT_GET_SPR(r9, SPRN_PPR, CPU_FTR_HAS_PPR)
-	HMT_MEDIUM
-	std	r10,\area\()+EX_R10(r13)	/* save r10 - r12 */
-	OPT_GET_SPR(r10, SPRN_CFAR, CPU_FTR_CFAR)
-.endm
-
-.macro EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, dar, dsisr, bitmask
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
-	mfspr	r10,SPRN_DAR
-	std	r10,\area\()+EX_DAR(r13)
-	.endif
-	.if \dsisr
-	mfspr	r10,SPRN_DSISR
-	stw	r10,\area\()+EX_DSISR(r13)
-	.endif
-.endm
-
-.macro EXCEPTION_PROLOG_2_REAL label, hsrr, set_ri
+.macro INT_SAVE_SRR_AND_JUMP label, hsrr, set_ri
 	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
 	.if ! \set_ri
 	xori	r10,r10,MSR_RI		/* Clear MSR_RI */
@@ -293,7 +223,8 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	b	.	/* prevent speculative execution */
 .endm
 
-.macro EXCEPTION_PROLOG_2_VIRT label, hsrr
+/* INT_SAVE_SRR_AND_JUMP works for real or virt, this is faster but virt only */
+.macro INT_VIRT_SAVE_SRR_AND_JUMP label, hsrr
 #ifdef CONFIG_RELOCATABLE
 	.if \hsrr == EXC_HV_OR_STD
 	BEGIN_FTR_SECTION
@@ -620,7 +551,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
  *   This is done if early=2.
  */
 .macro INT_HANDLER name, vec, ool, early, virt, hsrr, area, ri, dar, dsisr, bitmask, kvm
-	EXCEPTION_PROLOG_0 \area
+	SET_SCRATCH0(r13)			/* save r13 */
+	GET_PACA(r13)
+	std	r9,\area\()+EX_R9(r13)		/* save r9 */
+	OPT_GET_SPR(r9, SPRN_PPR, CPU_FTR_HAS_PPR)
+	HMT_MEDIUM
+	std	r10,\area\()+EX_R10(r13)	/* save r10 - r12 */
+	OPT_GET_SPR(r10, SPRN_CFAR, CPU_FTR_CFAR)
 	.if \ool
 	.if !\virt
 	b	tramp_real_\name
@@ -632,16 +569,74 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	TRAMP_VIRT_BEGIN(tramp_virt_\name)
 	.endif
 	.endif
-	EXCEPTION_PROLOG_1 \hsrr, \area, \kvm, \vec, \dar, \dsisr, \bitmask
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
+	mfspr	r10,SPRN_DAR
+	std	r10,\area\()+EX_DAR(r13)
+	.endif
+	.if \dsisr
+	mfspr	r10,SPRN_DSISR
+	stw	r10,\area\()+EX_DSISR(r13)
+	.endif
+
 	.if \early == 2
 	/* nothing more */
 	.elseif \early
 	mfctr	r10			/* save ctr, even for !RELOCATABLE */
 	BRANCH_TO_C000(r11, \name\()_early_common)
 	.elseif !\virt
-	EXCEPTION_PROLOG_2_REAL \name\()_common, \hsrr, \ri
+	INT_SAVE_SRR_AND_JUMP \name\()_common, \hsrr, \ri
 	.else
-	EXCEPTION_PROLOG_2_VIRT \name\()_common, \hsrr
+	INT_VIRT_SAVE_SRR_AND_JUMP \name\()_common, \hsrr
 	.endif
 	.if \ool
 	.popsection
@@ -1853,7 +1848,7 @@ EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
 	bne+	denorm_assist
 #endif
 	KVMTEST EXC_HV 0x1500
-	EXCEPTION_PROLOG_2_REAL denorm_common, EXC_HV, 1
+	INT_SAVE_SRR_AND_JUMP denorm_common, EXC_HV, 1
 EXC_REAL_END(denorm_exception_hv, 0x1500, 0x100)
 
 #ifdef CONFIG_PPC_DENORMALISATION
@@ -1987,7 +1982,7 @@ EXC_VIRT_NONE(0x5800, 0x100)
 	std	r12,PACA_EXGEN+EX_R12(r13);		\
 	GET_SCRATCH0(r10);				\
 	std	r10,PACA_EXGEN+EX_R13(r13);		\
-	EXCEPTION_PROLOG_2_REAL soft_nmi_common, _H, 1
+	INT_SAVE_SRR_AND_JUMP soft_nmi_common, _H, 1
 
 /*
  * Branch to soft_nmi_interrupt using the emergency stack. The emergency
-- 
2.22.0

