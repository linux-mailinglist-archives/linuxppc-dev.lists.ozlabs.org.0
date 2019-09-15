Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFAAB2D98
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 03:41:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WBtl6KJyzF5tQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 11:41:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hlMeqGm7"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WBbf46qwzF5r6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 11:28:46 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id d3so14959473plr.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 18:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5URTXU9JfwQIy3cGqngaOZ3JyUcUd8lqqX1cjk7yh8A=;
 b=hlMeqGm7BCw8NFS9kTceEEBG03jd9aUxk1EK2q9uuVYa46uuj7Nezfe0X1n+rsDTfp
 3Af+YwfyBNoFyTgkX8TEk8Nvt25U4v96UR6iZfOK9edYZW0a02lhx3z1y6ekCCJgIE7k
 VZZB0J/uZ9Ya2/Cx1bRb4q1ydsdCbND0ZUznZSy1muYHrpzabZYD7rb5TZwFyuK+GMfx
 aYT0WHuaVIThd+Z50VBSvvETO4wssSD6mhn3bP8Sv2YoCeXZIC5HcBW26JUrT4I8ID5B
 g5ROnmbvWpEKHo/siUsy+xkLekf+6agAzUtLL9aIHKV/7xWCthdw0iS1GWZO+ng89dWS
 +0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5URTXU9JfwQIy3cGqngaOZ3JyUcUd8lqqX1cjk7yh8A=;
 b=j1KinWwFiyFEvFhkcc38bLwxiTC52sxXGVp/tmv+dY60tdPkqOwXIl3pF6lhMkzBCx
 gNpZD0i7B40rxYBMajPbknA2Mps3YOUGoYa5dNiVqeasMvbe1FpkbEefV4JmNrojMkol
 WaRlP3JrA8N8alAZif7wW4GHu2cEIHV6SqJRMjT6jRo2qRIX0sWN4e2S0tVpBa+BAKy8
 eHEWsI9gAgEKuA5+CzlMyCNpzfsFrXfUTUEV4Df3ryRXC2wEOo+fuENLHVUup+CiesXx
 U8SbTE5H1y2GG9Qw2VZX3xrc4vGgBiNIY6z0UhmAYhGlVbEVMntx14BPMKVgdRmFA8Bs
 tDdQ==
X-Gm-Message-State: APjAAAXHyBR2/hlM1/5ZaE6kc3hCGqsWg8Mm0HOYVX0n/1ydNGwPEaKF
 a0yKrzhWBvDHeRJ+hqA9cVo77pQD
X-Google-Smtp-Source: APXvYqxeokg8EE2VJt6/vjhbED2UgsceCnFgTJfZ2Cw0hIirb8ZyI+kvUViaHalujzicZ2BcO3Myjg==
X-Received: by 2002:a17:902:ff02:: with SMTP id
 f2mr11783705plj.126.1568510923954; 
 Sat, 14 Sep 2019 18:28:43 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id bt1sm6267043pjb.17.2019.09.14.18.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 18:28:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 06/27] powerpc/64s/exception: Remove old INT_ENTRY macro
Date: Sun, 15 Sep 2019 11:27:52 +1000
Message-Id: <20190915012813.29317-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190915012813.29317-1-npiggin@gmail.com>
References: <20190915012813.29317-1-npiggin@gmail.com>
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 68 ++++++++++++----------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b5decc9a0cbf..ba2dcd91aaaf 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -482,13 +482,13 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
  * - Fall through and continue executing in real, unrelocated mode.
  *   This is done if early=2.
  */
-.macro INT_HANDLER name, vec, ool=0, early=0, virt=0, hsrr=0, area=PACA_EXGEN, ri=1, dar=0, dsisr=0, bitmask=0, kvm=0
+.macro GEN_INT_ENTRY name, virt, ool=0
 	SET_SCRATCH0(r13)			/* save r13 */
 	GET_PACA(r13)
-	std	r9,\area\()+EX_R9(r13)		/* save r9 */
+	std	r9,IAREA+EX_R9(r13)		/* save r9 */
 	OPT_GET_SPR(r9, SPRN_PPR, CPU_FTR_HAS_PPR)
 	HMT_MEDIUM
-	std	r10,\area\()+EX_R10(r13)	/* save r10 - r12 */
+	std	r10,IAREA+EX_R10(r13)		/* save r10 - r12 */
 	OPT_GET_SPR(r10, SPRN_CFAR, CPU_FTR_CFAR)
 	.if \ool
 	.if !\virt
@@ -502,47 +502,47 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	.endif
 	.endif
 
-	OPT_SAVE_REG_TO_PACA(\area\()+EX_PPR, r9, CPU_FTR_HAS_PPR)
-	OPT_SAVE_REG_TO_PACA(\area\()+EX_CFAR, r10, CPU_FTR_CFAR)
+	OPT_SAVE_REG_TO_PACA(IAREA+EX_PPR, r9, CPU_FTR_HAS_PPR)
+	OPT_SAVE_REG_TO_PACA(IAREA+EX_CFAR, r10, CPU_FTR_CFAR)
 	INTERRUPT_TO_KERNEL
-	SAVE_CTR(r10, \area\())
+	SAVE_CTR(r10, IAREA)
 	mfcr	r9
-	.if \kvm
-		KVMTEST \name \hsrr \vec
+	.if (!\virt && IKVM_REAL) || (\virt && IKVM_VIRT)
+		KVMTEST \name IHSRR IVEC
 	.endif
-	.if \bitmask
+	.if IMASK
 		lbz	r10,PACAIRQSOFTMASK(r13)
-		andi.	r10,r10,\bitmask
+		andi.	r10,r10,IMASK
 		/* Associate vector numbers with bits in paca->irq_happened */
-		.if \vec == 0x500 || \vec == 0xea0
+		.if IVEC == 0x500 || IVEC == 0xea0
 		li	r10,PACA_IRQ_EE
-		.elseif \vec == 0x900
+		.elseif IVEC == 0x900
 		li	r10,PACA_IRQ_DEC
-		.elseif \vec == 0xa00 || \vec == 0xe80
+		.elseif IVEC == 0xa00 || IVEC == 0xe80
 		li	r10,PACA_IRQ_DBELL
-		.elseif \vec == 0xe60
+		.elseif IVEC == 0xe60
 		li	r10,PACA_IRQ_HMI
-		.elseif \vec == 0xf00
+		.elseif IVEC == 0xf00
 		li	r10,PACA_IRQ_PMI
 		.else
 		.abort "Bad maskable vector"
 		.endif
 
-		.if \hsrr == EXC_HV_OR_STD
+		.if IHSRR == EXC_HV_OR_STD
 		BEGIN_FTR_SECTION
 		bne	masked_Hinterrupt
 		FTR_SECTION_ELSE
 		bne	masked_interrupt
 		ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-		.elseif \hsrr
+		.elseif IHSRR
 		bne	masked_Hinterrupt
 		.else
 		bne	masked_interrupt
 		.endif
 	.endif
 
-	std	r11,\area\()+EX_R11(r13)
-	std	r12,\area\()+EX_R12(r13)
+	std	r11,IAREA+EX_R11(r13)
+	std	r12,IAREA+EX_R12(r13)
 
 	/*
 	 * DAR/DSISR, SCRATCH0 must be read before setting MSR[RI],
@@ -550,47 +550,39 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	 * not recoverable if they are live.
 	 */
 	GET_SCRATCH0(r10)
-	std	r10,\area\()+EX_R13(r13)
-	.if \dar == 1
-	.if \hsrr
+	std	r10,IAREA+EX_R13(r13)
+	.if IDAR == 1
+	.if IHSRR
 	mfspr	r10,SPRN_HDAR
 	.else
 	mfspr	r10,SPRN_DAR
 	.endif
-	std	r10,\area\()+EX_DAR(r13)
+	std	r10,IAREA+EX_DAR(r13)
 	.endif
-	.if \dsisr == 1
-	.if \hsrr
+	.if IDSISR == 1
+	.if IHSRR
 	mfspr	r10,SPRN_HDSISR
 	.else
 	mfspr	r10,SPRN_DSISR
 	.endif
-	stw	r10,\area\()+EX_DSISR(r13)
+	stw	r10,IAREA+EX_DSISR(r13)
 	.endif
 
-	.if \early == 2
+	.if IEARLY == 2
 	/* nothing more */
-	.elseif \early
+	.elseif IEARLY
 	mfctr	r10			/* save ctr, even for !RELOCATABLE */
 	BRANCH_TO_C000(r11, \name\()_common)
 	.elseif !\virt
-	INT_SAVE_SRR_AND_JUMP \name\()_common, \hsrr, \ri
+	INT_SAVE_SRR_AND_JUMP \name\()_common, IHSRR, ISET_RI
 	.else
-	INT_VIRT_SAVE_SRR_AND_JUMP \name\()_common, \hsrr
+	INT_VIRT_SAVE_SRR_AND_JUMP \name\()_common, IHSRR
 	.endif
 	.if \ool
 	.popsection
 	.endif
 .endm
 
-.macro GEN_INT_ENTRY name, virt, ool=0
-	.if ! \virt
-		INT_HANDLER \name, IVEC, \ool, IEARLY, \virt, IHSRR, IAREA, ISET_RI, IDAR, IDSISR, IMASK, IKVM_REAL
-	.else
-		INT_HANDLER \name, IVEC, \ool, IEARLY, \virt, IHSRR, IAREA, ISET_RI, IDAR, IDSISR, IMASK, IKVM_VIRT
-	.endif
-.endm
-
 /*
  * On entry r13 points to the paca, r9-r13 are saved in the paca,
  * r9 contains the saved CR, r11 and r12 contain the saved SRR0 and
-- 
2.23.0

