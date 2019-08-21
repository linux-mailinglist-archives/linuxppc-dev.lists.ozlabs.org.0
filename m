Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7914397997
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 14:38:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D6df2xmMzDqKf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 22:38:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I2WSNXV5"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D6Jr0QsMzDqlW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 22:23:39 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id x15so1224150pgg.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 05:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SEWi5XMt/RVO3qLXVyRzgJGBxcGIyAZJqvOg4InEPVo=;
 b=I2WSNXV5Utk5Uw3okuY8/K4DkIIlMZnshc3ApUXfP/ij2UHmFfZziUDnFP1Pnp2rlb
 YJtRWUd2bmVZifgr23+E50hcAg32hyHOyO/3Wx7yy75Ort+c5bjw21qaar69UHk2kVXb
 k1SrPk4s0l5mDIw92KFHY3xtz0Vp8MeIXKd8tZLRPwT8GSvB1SZtGqxDcuvTy8aQJxLi
 ULtMGeKQlh8IRtW3pe9JSuL4QVkOxB7ovyVgbVkpBP2x5ewJe6JDxUFbIR0xZhuGh1qI
 G83EcGlm0aA/yfYzv5ChnyCTHQiFdmnjzBBgw5b3yNEiesrRr45N1gkfGSCkjm7GMUVF
 IpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SEWi5XMt/RVO3qLXVyRzgJGBxcGIyAZJqvOg4InEPVo=;
 b=sE9PC1nzk7K6zGN792zg8lMJ6Cc8q+KtnTnFvrAQi57lFBiBqIquJpEmsi5EX80TY+
 2P6uRIROOligB8PaP06BFkgSETfv14HwuPd8WKvg7wPN/FRNqTljfP8SzLJgzGQ5Y9X9
 +IiGpq8dCWKnV00tgdRngnReZNoF/ztepVxgKfwXKHVAPXWVOHnzHTrHE9wEhVti5XTT
 dnk8QMrXYocGp0HUNodJeV53WPRIgd0u35FkIYSl/yen54fMH62ObHeqR4w5PHP0wuYa
 WtzNmCUTN5uScxh5DQLEEBUzivG/kcZ+zpSOA7IyL0zZt6jqQ2Nmz5oK0LO+ZZnFjnod
 nqKQ==
X-Gm-Message-State: APjAAAXs+rsj9yYRSWej+Q1hCGFakeJbzNcUB5M5BssB0aa5+g/HSGj+
 vM2PXnh5qorqs+/GpDLhFXezVthd
X-Google-Smtp-Source: APXvYqzIoEb7n/4iA5WRk9EeNtmnrbyZP7NPWKif42f96hFfUAe2PmNdzgviMRkY01jftycupjt1Gw==
X-Received: by 2002:a17:90a:8c01:: with SMTP id
 a1mr4740958pjo.82.1566390216857; 
 Wed, 21 Aug 2019 05:23:36 -0700 (PDT)
Received: from bobo.local0.net ([193.114.104.176])
 by smtp.gmail.com with ESMTPSA id a3sm23657819pfc.70.2019.08.21.05.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:23:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/10] powerpc/64s/exception: remove confusing IEARLY option
Date: Wed, 21 Aug 2019 22:23:10 +1000
Message-Id: <20190821122315.9535-6-npiggin@gmail.com>
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
index e5d5d81d6107..705cca95e03c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -174,7 +174,8 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define IDAR		.L_IDAR_\name\()
 #define IDSISR		.L_IDSISR_\name\()
 #define ISET_RI		.L_ISET_RI_\name\()
-#define IEARLY		.L_IEARLY_\name\()
+#define IBRANCH_COMMON	.L_IBRANCH_COMMON_\name\()
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
+	.ifndef IBRANCH_COMMON
+		IBRANCH_COMMON=1
+	.endif
+	.ifndef IREALMODE_COMMON
+		IREALMODE_COMMON=0
+	.else
+		.if ! IBRANCH_COMMON
+			.error "IREALMODE_COMMON=1 but IBRANCH_COMMON=0"
+		.endif
 	.endif
 	.ifndef IMASK
 		IMASK=0
@@ -356,6 +364,11 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 #define GEN_OOL		1
 
 .macro GEN_BRANCH_TO_COMMON name virt
+	.if IREALMODE_COMMON
+	LOAD_HANDLER(r10, \name\()_common)
+	mtctr	r10
+	bctr
+	.else
 	.if \virt
 #ifndef CONFIG_RELOCATABLE
 	b	\name\()_common_virt
@@ -369,6 +382,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	mtctr	r10
 	bctr
 	.endif
+	.endif
 .endm
 
 .macro GEN_INT_ENTRY name virt ool=0
@@ -424,11 +438,6 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
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
@@ -444,6 +453,8 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	mfspr	r11,SPRN_SRR0		/* save SRR0 */
 	mfspr	r12,SPRN_SRR1		/* and SRR1 */
 	.endif
+
+	.if IBRANCH_COMMON
 	GEN_BRANCH_TO_COMMON \name \virt
 	.endif
 
@@ -923,6 +934,7 @@ INT_DEFINE_BEGIN(machine_check_early)
 	IHSRR=EXC_STD
 	IAREA=PACA_EXMC
 	IVIRT=0 /* no virt entry point */
+	IREALMODE_COMMON=1
 	/*
 	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
 	 * nested machine check corrupts it. machine_check_common enables
@@ -930,7 +942,6 @@ INT_DEFINE_BEGIN(machine_check_early)
 	 */
 	ISET_RI=0
 	ISTACK=0
-	IEARLY=1
 	IDAR=1
 	IDSISR=1
 	IRECONCILE=0
@@ -971,9 +982,6 @@ TRAMP_REAL_BEGIN(machine_check_fwnmi)
 	EXCEPTION_RESTORE_REGS EXC_STD
 
 EXC_COMMON_BEGIN(machine_check_early_common)
-	mfspr	r11,SPRN_SRR0
-	mfspr	r12,SPRN_SRR1
-
 	/*
 	 * Switch to mc_emergency stack and handle re-entrancy (we limit
 	 * the nested MCE upto level 4 to avoid stack overflow).
@@ -1849,7 +1857,7 @@ INT_DEFINE_BEGIN(hmi_exception_early)
 	IHSRR=EXC_HV
 	IAREA=PACA_EXGEN
 	IVIRT=0 /* no virt entry point */
-	IEARLY=1
+	IREALMODE_COMMON=1
 	ISTACK=0
 	IRECONCILE=0
 	IKUAP=0 /* We don't touch AMR here, we never go to virtual mode */
@@ -1871,8 +1879,6 @@ EXC_REAL_END(hmi_exception, 0xe60, 0x20)
 EXC_VIRT_NONE(0x4e60, 0x20)
 
 EXC_COMMON_BEGIN(hmi_exception_early_common)
-	mfspr	r11,SPRN_HSRR0		/* Save HSRR0 */
-	mfspr	r12,SPRN_HSRR1		/* Save HSRR1 */
 	mr	r10,r1			/* Save r1 */
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack for realmode */
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
@@ -2213,29 +2219,23 @@ INT_DEFINE_BEGIN(denorm_exception)
 	IVEC=0x1500
 	IHSRR=EXC_HV
 	IAREA=PACA_EXGEN
-	IEARLY=2
+	IBRANCH_COMMON=0
 	IKVM_REAL=1
 INT_DEFINE_END(denorm_exception)
 
 EXC_REAL_BEGIN(denorm_exception, 0x1500, 0x100)
 	GEN_INT_ENTRY denorm_exception, GEN_REAL
 #ifdef CONFIG_PPC_DENORMALISATION
-	mfspr	r10,SPRN_HSRR1
-	andis.	r10,r10,(HSRR1_DENORM)@h /* denorm? */
+	andis.	r10,r12,(HSRR1_DENORM)@h /* denorm? */
 	bne+	denorm_assist
 #endif
-	mfspr	r11,SPRN_HSRR0
-	mfspr	r12,SPRN_HSRR1
 	GEN_BRANCH_TO_COMMON denorm_exception, GEN_REAL
 EXC_REAL_END(denorm_exception, 0x1500, 0x100)
 #ifdef CONFIG_PPC_DENORMALISATION
 EXC_VIRT_BEGIN(denorm_exception, 0x5500, 0x100)
 	GEN_INT_ENTRY denorm_exception, GEN_VIRT
-	mfspr	r10,SPRN_HSRR1
-	andis.	r10,r10,(HSRR1_DENORM)@h /* denorm? */
+	andis.	r10,r12,(HSRR1_DENORM)@h /* denorm? */
 	bne+	denorm_assist
-	mfspr	r11,SPRN_HSRR0
-	mfspr	r12,SPRN_HSRR1
 	GEN_BRANCH_TO_COMMON denorm_exception, GEN_VIRT
 EXC_VIRT_END(denorm_exception, 0x5500, 0x100)
 #else
-- 
2.22.0

