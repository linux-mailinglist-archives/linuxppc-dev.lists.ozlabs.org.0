Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CFBA827F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 14:36:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Njwq6DbvzDqtl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 22:36:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cQBI+Xte"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nj3J4PCSzDqWt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 21:56:44 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id d3so9503484plr.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2019 04:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GymWcnENspSE9I2oBGq1H1IW1widA6W5fKLJFeu/V+A=;
 b=cQBI+XteeF6WLHJ44q6K3+R6z6uS662BW9PzerNwluJZomWadWsu7MF7TXU+R3/qOX
 Ie6a2XL8KGQm/b71LZPCo6BtZkWfzMwnB8a6vQODF0bbR3uSX5g1eM7THj7EBSvQri6P
 KENgaR05wKGSJ/AqCOReTlw/SNXxrSSwQU6up0uQ0a+NTISEYQMJZ1KmpmPOn8rs+kHF
 xcTXFod/uI5z98K9Cf1AG66jlyD4DqOP/TDtp9eG6Pj6FgksdfMucHdsIDlIwrxJ9jWT
 jL/JQ0YYxRNAKbTJ+cmK4CAYdu2wGWI2zsN3Es3AXc7027nJVdBpax2tPV2lXv6AkF9w
 i//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GymWcnENspSE9I2oBGq1H1IW1widA6W5fKLJFeu/V+A=;
 b=l1ndvXr9YRNHvGwNkqGRvd/BhApcKM4Fi4QGRnwxQwTDi3fWcEBGuTJuDahO0FtrWp
 g1jdEJUOru4JxOoCVz1ZGlVu5fj32KLHjEaAhDFkigeODDNc7BgsSxnU/zXuDQ5XD0t0
 tAYN1CF8/xezmqskkrGz03+cMBO6TS3WP0XB+ydMH1/YCj8kAqETzRqek3WZjW30njJ+
 B8tSk65enWhvJG2sFlxP98w4F4u4FJXHR/jOSKWd/6BnbF/1hcc+qQka/15v6egq2c5b
 dDep7GAvbQRbhEf/47P9Il7kkewTiIbUcc4dHbJ5aLYlB9s4E26a9u9rWak5DLeu4hOp
 SWjQ==
X-Gm-Message-State: APjAAAUk7gktuObPw+jvN62ls84Jie2XdOOeNBj00wgiKZVNkgEitUIQ
 zKp62iPHiIErrJ8riW7U/LNxWs8z
X-Google-Smtp-Source: APXvYqzhakUdPNTnoZ2kseO8b4nwT/FHk3m71Qrk671j53u8kVwJ2jIdlAnIgNw92ySDgal1+BqPmw==
X-Received: by 2002:a17:902:860b:: with SMTP id
 f11mr39775598plo.48.1567598200598; 
 Wed, 04 Sep 2019 04:56:40 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id g18sm19554789pgm.9.2019.09.04.04.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 04:56:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 13/20] powerpc/64s/exception: remove confusing IEARLY option
Date: Wed,  4 Sep 2019 21:55:28 +1000
Message-Id: <20190904115535.18559-14-npiggin@gmail.com>
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
index 3bc3336182c7..c46e4911cff6 100644
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
 
@@ -918,6 +929,7 @@ INT_DEFINE_BEGIN(machine_check_early)
 	IVEC=0x200
 	IAREA=PACA_EXMC
 	IVIRT=0 /* no virt entry point */
+	IREALMODE_COMMON=1
 	/*
 	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
 	 * nested machine check corrupts it. machine_check_common enables
@@ -925,7 +937,6 @@ INT_DEFINE_BEGIN(machine_check_early)
 	 */
 	ISET_RI=0
 	ISTACK=0
-	IEARLY=1
 	IDAR=1
 	IDSISR=1
 	IRECONCILE=0
@@ -965,9 +976,6 @@ TRAMP_REAL_BEGIN(machine_check_fwnmi)
 	EXCEPTION_RESTORE_REGS EXC_STD
 
 EXC_COMMON_BEGIN(machine_check_early_common)
-	mfspr	r11,SPRN_SRR0
-	mfspr	r12,SPRN_SRR1
-
 	/*
 	 * Switch to mc_emergency stack and handle re-entrancy (we limit
 	 * the nested MCE upto level 4 to avoid stack overflow).
@@ -1814,7 +1822,7 @@ EXC_COMMON_BEGIN(emulation_assist_common)
 INT_DEFINE_BEGIN(hmi_exception_early)
 	IVEC=0xe60
 	IHSRR=EXC_HV
-	IEARLY=1
+	IREALMODE_COMMON=1
 	ISTACK=0
 	IRECONCILE=0
 	IKUAP=0 /* We don't touch AMR here, we never go to virtual mode */
@@ -1834,8 +1842,6 @@ EXC_REAL_END(hmi_exception, 0xe60, 0x20)
 EXC_VIRT_NONE(0x4e60, 0x20)
 
 EXC_COMMON_BEGIN(hmi_exception_early_common)
-	mfspr	r11,SPRN_HSRR0		/* Save HSRR0 */
-	mfspr	r12,SPRN_HSRR1		/* Save HSRR1 */
 	mr	r10,r1			/* Save r1 */
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack for realmode */
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
@@ -2161,29 +2167,23 @@ EXC_VIRT_NONE(0x5400, 0x100)
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
2.22.0

