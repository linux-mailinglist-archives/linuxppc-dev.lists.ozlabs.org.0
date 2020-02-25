Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E4916EDEE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:24:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RnQ36c1gzDqGL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:24:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tXWgSyLw; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmRb2RVSzDqNJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:40:27 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id y5so7550495pfb.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dJBrkXfRKDlV+ZoTzRqKqA4igvrDVZ5jQyjkH1vMQUw=;
 b=tXWgSyLwdU/IGA5rsHoayDbOqaDVAMpcUg541y9NTHrPVbGlq3NQatGiMrVxe+qrfZ
 Va14OCUXAukQ429vCMJyJ7S2Vdym8xiBdgW9uJzN7KVbAcnz9bSoJAC6KEUPZ1bPLln3
 QG8WSr2Yr1R4JHFwkVKSbFg22qDPHYpqNkHHrPgf7JmtXCSYtM4iSmdpSH2DfLLYxe9Y
 Zidbq/ZMtpzpIikgug67zWfJop30IoypUvMsNtA4exkgp6FNOlyqq6Pdj4cZtYKUnoPy
 kWGIloJu7PHWfDrM1wFUsbUdjq6PSC43vHB8hVzPAGLbT07WCWmtJvwtGUtWslAB2+p5
 XllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dJBrkXfRKDlV+ZoTzRqKqA4igvrDVZ5jQyjkH1vMQUw=;
 b=WtkM98BuFoM1lZLaGGCbJFEjNba6mHQ21H+J6ShZPLfFKEm7LntUN6AX6XR/g92xzL
 5MM16YAbjbQg6tow1E1hqgh76g60TgcngeWjmp+4FWJvgbfed6wn7MYE9p8znzBw+XY1
 ysI0yENdKIOwFMFH+QyrD4VTApZGVRiKtqY0eRuls7XHg+NehjTIFs2T+LsaWgPdevr6
 CmjI26IPl1jRq55cWlYKDoHnhUmHwfaTRKh8FmTrxJhFEsNft12Tf3rIuxjx6b11UqBh
 7p4sfKayuyO62Hp/NA67s+3ZlBJrFv74pLcXt2EV9IhseoOIW/obmrsR9Hevo0RYhbB+
 IK0Q==
X-Gm-Message-State: APjAAAWQ54EQcPYLi+3VXrdEkQ9YE9kLMZ06m8TsoDu6AJjyDIW/iGHa
 uJHwJdQLESOfSU1kS3AzqHJV4qpp
X-Google-Smtp-Source: APXvYqzQ4Je9u9cR1+ysyANMJkeeDwzz+7xFyPf9IWyuU/hX1G0bRYRorOp/fvySyK6OzNbwbW9ykQ==
X-Received: by 2002:a65:6841:: with SMTP id q1mr9388266pgt.261.1582652421798; 
 Tue, 25 Feb 2020 09:40:21 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:40:21 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 13/32] powerpc/64s/exception: remove confusing IEARLY option
Date: Wed, 26 Feb 2020 03:35:22 +1000
Message-Id: <20200225173541.1549955-14-npiggin@gmail.com>
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
index eb2f6ee4d652..f4f35d01fe00 100644
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
@@ -1809,7 +1817,7 @@ EXC_COMMON_BEGIN(emulation_assist_common)
 INT_DEFINE_BEGIN(hmi_exception_early)
 	IVEC=0xe60
 	IHSRR=EXC_HV
-	IEARLY=1
+	IREALMODE_COMMON=1
 	ISTACK=0
 	IRECONCILE=0
 	IKUAP=0 /* We don't touch AMR here, we never go to virtual mode */
@@ -1829,8 +1837,6 @@ EXC_REAL_END(hmi_exception, 0xe60, 0x20)
 EXC_VIRT_NONE(0x4e60, 0x20)
 
 EXC_COMMON_BEGIN(hmi_exception_early_common)
-	mfspr	r11,SPRN_HSRR0		/* Save HSRR0 */
-	mfspr	r12,SPRN_HSRR1		/* Save HSRR1 */
 	mr	r10,r1			/* Save r1 */
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack for realmode */
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
@@ -2156,29 +2162,23 @@ EXC_VIRT_NONE(0x5400, 0x100)
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

