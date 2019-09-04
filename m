Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE2EA82B7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 14:48:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NkCL3kXqzDqyp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 22:48:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OlRYaeak"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nj3V41r3zDqWt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 21:56:54 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id 4so7577938pgm.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2019 04:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RJXUNnzpk5yd3yGIwzkdmDkNn2ArnB7L5+X2GtOA8YI=;
 b=OlRYaeakxx7DkUeDnrEnOGZByTbZfy4AEPaxokMfb2Oaxd0Bcq73A2Y5WGoDqkY8gl
 T4/oqKZQvHficf+HZCvbbEqjtxnwRDOjzbCv9p8vG1s76YWTAS8AajfgK7ZvsLfhL0y0
 DfFO9Ueq7s1us1/QYb8Mkkc2Yqjcs3q7w0V2Okzk5GXSziteuXZI6urDhisuK0drmSQ4
 yWZZy8ersg7nUetoVBfTFrwIhhM/4oMG1o6XVDVBkq34GpmvyTHSwuNfh9FcUCXhhKMR
 pOPRtzs5A5Ckgx/iHFF7AltM06YQXCelCF52GRyQJyIpZDvOWDDSkjXB54lk5Q3iCjFR
 FTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RJXUNnzpk5yd3yGIwzkdmDkNn2ArnB7L5+X2GtOA8YI=;
 b=k4gwrk2nge5EuSHFkfh6IrRcxhgURtKzbMmNRvQFQL4C403CsLmGo2zl6Q623Ddnec
 dgkf0ybgAjIUqG1ZwO9C5oUJx5tginLCK+O9axn7Gwy/UiEihwL5Arn+0MINNwaocF22
 YeGVX89u8J/FLdXjRaDfDauUL0WUXws/o+Q/AIsG0mhmLT49QUtw6o5ZEIVvtFgjl0G1
 qBucdnDFasYnrLlJ6jz40myMLOoEorUwiaKisiRxz8GSR/BSmFmNwZw7eRgEHgYUqbag
 GwN13VqzsM9n2d3txBWz5eb2sMPInPk7tNpCx7IroOlWgAAHxJfuYdfdf72cVJafJiEP
 gKaA==
X-Gm-Message-State: APjAAAX6izKBHklty6fnZ+tCIYxVcxL8YooJKevGBQ79kmLNAQWWmOr6
 FViDQTw2ealS2ZuVXsd1cgf6tNbw
X-Google-Smtp-Source: APXvYqyBbHkuozuewMSiDAYZ3XaHEjyAMeShtYu/a7G1SfG2BKYeJJF7O624mRWIEQ7oiBMucMw6Sg==
X-Received: by 2002:a63:125c:: with SMTP id 28mr34645672pgs.255.1567598211940; 
 Wed, 04 Sep 2019 04:56:51 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id g18sm19554789pgm.9.2019.09.04.04.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 04:56:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 18/20] powerpc/64s/exception: Clean up SRR specifiers
Date: Wed,  4 Sep 2019 21:55:33 +1000
Message-Id: <20190904115535.18559-19-npiggin@gmail.com>
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

Remove more magic numbers and replace with nicely named bools.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 68 +++++++++++++---------------
 1 file changed, 32 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 696aa19592e2..413876293659 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -105,11 +105,6 @@ name:
 	ori	reg,reg,(ABS_ADDR(label))@l;				\
 	addis	reg,reg,(ABS_ADDR(label))@h
 
-/* Exception register prefixes */
-#define EXC_HV_OR_STD	2 /* depends on HVMODE */
-#define EXC_HV		1
-#define EXC_STD		0
-
 /*
  * Branch to label using its 0xC000 address. This results in instruction
  * address suitable for MSR[IR]=0 or 1, which allows relocation to be turned
@@ -128,6 +123,7 @@ name:
  */
 #define IVEC		.L_IVEC_\name\()
 #define IHSRR		.L_IHSRR_\name\()
+#define IHSRR_IF_HVMODE	.L_IHSRR_IF_HVMODE_\name\()
 #define IAREA		.L_IAREA_\name\()
 #define IVIRT		.L_IVIRT_\name\()
 #define IISIDE		.L_IISIDE_\name\()
@@ -159,7 +155,10 @@ do_define_int n
 		.error "IVEC not defined"
 	.endif
 	.ifndef IHSRR
-		IHSRR=EXC_STD
+		IHSRR=0
+	.endif
+	.ifndef IHSRR_IF_HVMODE
+		IHSRR_IF_HVMODE=0
 	.endif
 	.ifndef IAREA
 		IAREA=PACA_EXGEN
@@ -257,7 +256,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r9,IAREA+EX_R9(r13)
 	ld	r10,IAREA+EX_R10(r13)
 	/* HSRR variants have the 0x2 bit added to their trap number */
-	.if IHSRR == EXC_HV_OR_STD
+	.if IHSRR_IF_HVMODE
 	BEGIN_FTR_SECTION
 	ori	r12,r12,(IVEC + 0x2)
 	FTR_SECTION_ELSE
@@ -278,7 +277,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r10,IAREA+EX_R10(r13)
 	ld	r11,IAREA+EX_R11(r13)
 	ld	r12,IAREA+EX_R12(r13)
-	.if IHSRR == EXC_HV_OR_STD
+	.if IHSRR_IF_HVMODE
 	BEGIN_FTR_SECTION
 	b	kvmppc_skip_Hinterrupt
 	FTR_SECTION_ELSE
@@ -403,7 +402,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	stw	r10,IAREA+EX_DSISR(r13)
 	.endif
 
-	.if IHSRR == EXC_HV_OR_STD
+	.if IHSRR_IF_HVMODE
 	BEGIN_FTR_SECTION
 	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
 	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
@@ -482,7 +481,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 		.abort "Bad maskable vector"
 		.endif
 
-		.if IHSRR == EXC_HV_OR_STD
+		.if IHSRR_IF_HVMODE
 		BEGIN_FTR_SECTION
 		bne	masked_Hinterrupt
 		FTR_SECTION_ELSE
@@ -610,12 +609,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
  * Restore all registers including H/SRR0/1 saved in a stack frame of a
  * standard exception.
  */
-.macro EXCEPTION_RESTORE_REGS hsrr
+.macro EXCEPTION_RESTORE_REGS hsrr=0
 	/* Move original SRR0 and SRR1 into the respective regs */
 	ld	r9,_MSR(r1)
-	.if \hsrr == EXC_HV_OR_STD
-	.error "EXC_HV_OR_STD Not implemented for EXCEPTION_RESTORE_REGS"
-	.endif
 	.if \hsrr
 	mtspr	SPRN_HSRR1,r9
 	.else
@@ -890,7 +886,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
 
-	EXCEPTION_RESTORE_REGS EXC_STD
+	EXCEPTION_RESTORE_REGS
 	RFI_TO_USER_OR_KERNEL
 
 	GEN_KVM system_reset
@@ -944,7 +940,7 @@ TRAMP_REAL_BEGIN(machine_check_fwnmi)
 	lhz	r12,PACA_IN_MCE(r13);			\
 	subi	r12,r12,1;				\
 	sth	r12,PACA_IN_MCE(r13);			\
-	EXCEPTION_RESTORE_REGS EXC_STD
+	EXCEPTION_RESTORE_REGS
 
 EXC_COMMON_BEGIN(machine_check_early_common)
 	/*
@@ -1313,7 +1309,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 INT_DEFINE_BEGIN(hardware_interrupt)
 	IVEC=0x500
-	IHSRR=EXC_HV_OR_STD
+	IHSRR_IF_HVMODE=1
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 	IKVM_VIRT=1
@@ -1482,7 +1478,7 @@ EXC_COMMON_BEGIN(decrementer_common)
 
 INT_DEFINE_BEGIN(hdecrementer)
 	IVEC=0x980
-	IHSRR=EXC_HV
+	IHSRR=1
 	ISTACK=0
 	IRECONCILE=0
 	IKVM_REAL=1
@@ -1724,7 +1720,7 @@ EXC_COMMON_BEGIN(single_step_common)
 
 INT_DEFINE_BEGIN(h_data_storage)
 	IVEC=0xe00
-	IHSRR=EXC_HV
+	IHSRR=1
 	IDAR=1
 	IDSISR=1
 	IKVM_SKIP=1
@@ -1756,7 +1752,7 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
 
 INT_DEFINE_BEGIN(h_instr_storage)
 	IVEC=0xe20
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_REAL=1
 	IKVM_VIRT=1
 INT_DEFINE_END(h_instr_storage)
@@ -1779,7 +1775,7 @@ EXC_COMMON_BEGIN(h_instr_storage_common)
 
 INT_DEFINE_BEGIN(emulation_assist)
 	IVEC=0xe40
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_REAL=1
 	IKVM_VIRT=1
 INT_DEFINE_END(emulation_assist)
@@ -1807,7 +1803,7 @@ EXC_COMMON_BEGIN(emulation_assist_common)
  */
 INT_DEFINE_BEGIN(hmi_exception_early)
 	IVEC=0xe60
-	IHSRR=EXC_HV
+	IHSRR=1
 	IREALMODE_COMMON=1
 	ISTACK=0
 	IRECONCILE=0
@@ -1817,7 +1813,7 @@ INT_DEFINE_END(hmi_exception_early)
 
 INT_DEFINE_BEGIN(hmi_exception)
 	IVEC=0xe60
-	IHSRR=EXC_HV
+	IHSRR=1
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 INT_DEFINE_END(hmi_exception)
@@ -1839,7 +1835,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	cmpdi	cr0,r3,0
 	bne	1f
 
-	EXCEPTION_RESTORE_REGS EXC_HV
+	EXCEPTION_RESTORE_REGS hsrr=1
 	HRFI_TO_USER_OR_KERNEL
 
 1:
@@ -1847,7 +1843,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	 * Go to virtual mode and pull the HMI event information from
 	 * firmware.
 	 */
-	EXCEPTION_RESTORE_REGS EXC_HV
+	EXCEPTION_RESTORE_REGS hsrr=1
 	GEN_INT_ENTRY hmi_exception, virt=0
 
 	GEN_KVM hmi_exception_early
@@ -1866,7 +1862,7 @@ EXC_COMMON_BEGIN(hmi_exception_common)
 
 INT_DEFINE_BEGIN(h_doorbell)
 	IVEC=0xe80
-	IHSRR=EXC_HV
+	IHSRR=1
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 	IKVM_VIRT=1
@@ -1895,7 +1891,7 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 
 INT_DEFINE_BEGIN(h_virt_irq)
 	IVEC=0xea0
-	IHSRR=EXC_HV
+	IHSRR=1
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 	IKVM_VIRT=1
@@ -2065,7 +2061,7 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
 
 INT_DEFINE_BEGIN(h_facility_unavailable)
 	IVEC=0xf80
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_REAL=1
 	IKVM_VIRT=1
 INT_DEFINE_END(h_facility_unavailable)
@@ -2101,7 +2097,7 @@ EXC_VIRT_NONE(0x5100, 0x100)
 #ifdef CONFIG_CBE_RAS
 INT_DEFINE_BEGIN(cbe_system_error)
 	IVEC=0x1200
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_SKIP=1
 	IKVM_REAL=1
 INT_DEFINE_END(cbe_system_error)
@@ -2152,8 +2148,8 @@ EXC_VIRT_NONE(0x5400, 0x100)
 
 INT_DEFINE_BEGIN(denorm_exception)
 	IVEC=0x1500
-	IHSRR=EXC_HV
-	IBRANCH_TO_COMMON=0
+	IHSRR=1
+	IBRANCH_COMMON=0
 	IKVM_REAL=1
 INT_DEFINE_END(denorm_exception)
 
@@ -2261,7 +2257,7 @@ EXC_COMMON_BEGIN(denorm_exception_common)
 #ifdef CONFIG_CBE_RAS
 INT_DEFINE_BEGIN(cbe_maintenance)
 	IVEC=0x1600
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_SKIP=1
 	IKVM_REAL=1
 INT_DEFINE_END(cbe_maintenance)
@@ -2313,7 +2309,7 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 #ifdef CONFIG_CBE_RAS
 INT_DEFINE_BEGIN(cbe_thermal)
 	IVEC=0x1800
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_SKIP=1
 	IKVM_REAL=1
 INT_DEFINE_END(cbe_thermal)
@@ -2376,7 +2372,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
  * - Else it is one of PACA_IRQ_MUST_HARD_MASK, so hard disable and return.
  * This is called with r10 containing the value to OR to the paca field.
  */
-.macro MASKED_INTERRUPT hsrr
+.macro MASKED_INTERRUPT hsrr=0
 	.if \hsrr
 masked_Hinterrupt:
 	.else
@@ -2523,8 +2519,8 @@ TRAMP_REAL_BEGIN(hrfi_flush_fallback)
 	hrfid
 
 USE_TEXT_SECTION()
-	MASKED_INTERRUPT EXC_STD
-	MASKED_INTERRUPT EXC_HV
+	MASKED_INTERRUPT
+	MASKED_INTERRUPT hsrr=1
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 kvmppc_skip_interrupt:
-- 
2.22.0

