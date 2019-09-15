Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D232B2DA9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 03:54:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WC9b6w1RzF3L2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 11:54:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qaMqLEVC"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WBc11QHtzF5pl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 11:29:05 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id i1so11440673pfa.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 18:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aj7YZOgZOtAHss6uJfPeJ7ATUhiqQslhAtrtnvxkTWA=;
 b=qaMqLEVC9d5GB8qW0AHWqbBCRWUX4zbUbn5NuOzD5DClhtfPaqbYG+Ua/4BS+uMEjh
 05G31bZmOlDBGnmFJO+AoU2Hqdi6aNjtsxQ1Iq0iIVKfktZEraFHpyokPFn2jCOE1WDR
 ZNMYYZpLVQkD3tKJ2D0ZCgWhgH4lqAhmk0LV6+BqZMeNGDVmh6aQjVnW8RQuO0mXDFyt
 sqkkbYhBY8RqoG/IzPLQXudFpopx7d8qhtzKZqlHFrM3DXI1WrLACTWF+qzUbjNrDrh5
 ariNWKXuc1MFkvu0M3bQdVcfTP2INsO93kwOw/14JeRdbEQAtWq4EfTQWHLZwgArY4GW
 XlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aj7YZOgZOtAHss6uJfPeJ7ATUhiqQslhAtrtnvxkTWA=;
 b=tX79J8nORZE5U+beEx4EHsT2cP8MvS2di+rXDbvv1UStfbR3sX1pem0yzdhj7/k2kH
 hCoWmfwvyGm+4b8VYLw4jCPgK9KviM1U4Tklg3qLSgMIaxRWha0BLonnH7csLbhwosp3
 R5GekDdPDa/xunNjMa01EjClgRnBS61s2VTYTKgrNvA9MzWDPtkLpZUB7hPL7YP8rsKb
 zZMl5PL5G2ZfXeN7x7xHy9kTRt2kShzjBBsTA/wbjWUypbMfWkYVxFapSksaGj5ygLcC
 QlzMog/Ob0BiBIwdRUZpQ0TF/v3PCUrNDuJEoHqTdLqtoD6wsqhUwUbVwh+ZPMltFRBT
 dphw==
X-Gm-Message-State: APjAAAXykthE32F6CG3VCvlGChZ3R3MBilIO0xeudb9+BaCU6iM07OLM
 guHxt1ysdBN1G0sexbwjA51m2ZVY
X-Google-Smtp-Source: APXvYqz6XHeHL+Co8f7qKXVJpvtIsX4kqb5USeEdeUOeWS+1WBUtsaUmCcj2hVe3jrR89tj8fEp+rw==
X-Received: by 2002:a62:7a12:: with SMTP id v18mr65411843pfc.205.1568510943207; 
 Sat, 14 Sep 2019 18:29:03 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id bt1sm6267043pjb.17.2019.09.14.18.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 18:29:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 13/27] powerpc/64s/exception: remove confusing IEARLY
 option
Date: Sun, 15 Sep 2019 11:27:59 +1000
Message-Id: <20190915012813.29317-14-npiggin@gmail.com>
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

Replace IEARLY=1 and IEARLY=2 with IBRANCH_COMMON, which controls if
the entry code branches to a common handler; and IREALMODE_COMMON,
which controls whether the common handler should remain in real mode.

These special cases no longer avoid loading the SRR registers, there
is no point as most of them load the registers immediately anyway.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 48 ++++++++++++++--------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 7db76e7be0aa..716a95ba814f 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -174,7 +174,8 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define IDAR		.L_IDAR_\name\()
 #define IDSISR		.L_IDSISR_\name\()
 #define ISET_RI		.L_ISET_RI_\name\()
-#define IEARLY		.L_IEARLY_\name\()
+#define IBRANCH_TO_COMMON	.L_IBRANCH_TO_COMMON_\name\()
+#define IREALMODE_COMMON	.L_IREALMODE_COMMON_\name\()
 #define IMASK		.L_IMASK_\name\()
 #define IKVM_SKIP	.L_IKVM_SKIP_\name\()
 #define IKVM_REAL	.L_IKVM_REAL_\name\()
@@ -218,8 +219,15 @@ do_define_int n
 	.ifndef ISET_RI
 		ISET_RI=1
 	.endif
-	.ifndef IEARLY
-		IEARLY=0
+	.ifndef IBRANCH_TO_COMMON
+		IBRANCH_TO_COMMON=1
+	.endif
+	.ifndef IREALMODE_COMMON
+		IREALMODE_COMMON=0
+	.else
+		.if ! IBRANCH_TO_COMMON
+			.error "IREALMODE_COMMON=1 but IBRANCH_TO_COMMON=0"
+		.endif
 	.endif
 	.ifndef IMASK
 		IMASK=0
@@ -353,6 +361,11 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
  */
 
 .macro GEN_BRANCH_TO_COMMON name, virt
+	.if IREALMODE_COMMON
+	LOAD_HANDLER(r10, \name\()_common)
+	mtctr	r10
+	bctr
+	.else
 	.if \virt
 #ifndef CONFIG_RELOCATABLE
 	b	\name\()_common_virt
@@ -366,6 +379,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	mtctr	r10
 	bctr
 	.endif
+	.endif
 .endm
 
 .macro GEN_INT_ENTRY name, virt, ool=0
@@ -421,11 +435,6 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	stw	r10,IAREA+EX_DSISR(r13)
 	.endif
 
-	.if IEARLY == 2
-	/* nothing more */
-	.elseif IEARLY
-	BRANCH_TO_C000(r11, \name\()_common)
-	.else
 	.if IHSRR == EXC_HV_OR_STD
 	BEGIN_FTR_SECTION
 	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
@@ -441,6 +450,8 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	mfspr	r11,SPRN_SRR0		/* save SRR0 */
 	mfspr	r12,SPRN_SRR1		/* and SRR1 */
 	.endif
+
+	.if IBRANCH_TO_COMMON
 	GEN_BRANCH_TO_COMMON \name \virt
 	.endif
 
@@ -926,6 +937,7 @@ INT_DEFINE_BEGIN(machine_check_early)
 	IVEC=0x200
 	IAREA=PACA_EXMC
 	IVIRT=0 /* no virt entry point */
+	IREALMODE_COMMON=1
 	/*
 	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
 	 * nested machine check corrupts it. machine_check_common enables
@@ -933,7 +945,6 @@ INT_DEFINE_BEGIN(machine_check_early)
 	 */
 	ISET_RI=0
 	ISTACK=0
-	IEARLY=1
 	IDAR=1
 	IDSISR=1
 	IRECONCILE=0
@@ -973,9 +984,6 @@ TRAMP_REAL_BEGIN(machine_check_fwnmi)
 	EXCEPTION_RESTORE_REGS EXC_STD
 
 EXC_COMMON_BEGIN(machine_check_early_common)
-	mfspr	r11,SPRN_SRR0
-	mfspr	r12,SPRN_SRR1
-
 	/*
 	 * Switch to mc_emergency stack and handle re-entrancy (we limit
 	 * the nested MCE upto level 4 to avoid stack overflow).
@@ -1822,7 +1830,7 @@ EXC_COMMON_BEGIN(emulation_assist_common)
 INT_DEFINE_BEGIN(hmi_exception_early)
 	IVEC=0xe60
 	IHSRR=EXC_HV
-	IEARLY=1
+	IREALMODE_COMMON=1
 	ISTACK=0
 	IRECONCILE=0
 	IKUAP=0 /* We don't touch AMR here, we never go to virtual mode */
@@ -1842,8 +1850,6 @@ EXC_REAL_END(hmi_exception, 0xe60, 0x20)
 EXC_VIRT_NONE(0x4e60, 0x20)
 
 EXC_COMMON_BEGIN(hmi_exception_early_common)
-	mfspr	r11,SPRN_HSRR0		/* Save HSRR0 */
-	mfspr	r12,SPRN_HSRR1		/* Save HSRR1 */
 	mr	r10,r1			/* Save r1 */
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack for realmode */
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
@@ -2169,29 +2175,23 @@ EXC_VIRT_NONE(0x5400, 0x100)
 INT_DEFINE_BEGIN(denorm_exception)
 	IVEC=0x1500
 	IHSRR=EXC_HV
-	IEARLY=2
+	IBRANCH_TO_COMMON=0
 	IKVM_REAL=1
 INT_DEFINE_END(denorm_exception)
 
 EXC_REAL_BEGIN(denorm_exception, 0x1500, 0x100)
 	GEN_INT_ENTRY denorm_exception, virt=0
 #ifdef CONFIG_PPC_DENORMALISATION
-	mfspr	r10,SPRN_HSRR1
-	andis.	r10,r10,(HSRR1_DENORM)@h /* denorm? */
+	andis.	r10,r12,(HSRR1_DENORM)@h /* denorm? */
 	bne+	denorm_assist
 #endif
-	mfspr	r11,SPRN_HSRR0
-	mfspr	r12,SPRN_HSRR1
 	GEN_BRANCH_TO_COMMON denorm_exception, virt=0
 EXC_REAL_END(denorm_exception, 0x1500, 0x100)
 #ifdef CONFIG_PPC_DENORMALISATION
 EXC_VIRT_BEGIN(denorm_exception, 0x5500, 0x100)
 	GEN_INT_ENTRY denorm_exception, virt=1
-	mfspr	r10,SPRN_HSRR1
-	andis.	r10,r10,(HSRR1_DENORM)@h /* denorm? */
+	andis.	r10,r12,(HSRR1_DENORM)@h /* denorm? */
 	bne+	denorm_assist
-	mfspr	r11,SPRN_HSRR0
-	mfspr	r12,SPRN_HSRR1
 	GEN_BRANCH_TO_COMMON denorm_exception, virt=1
 EXC_VIRT_END(denorm_exception, 0x5500, 0x100)
 #else
-- 
2.23.0

