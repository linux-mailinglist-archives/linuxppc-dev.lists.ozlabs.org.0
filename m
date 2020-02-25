Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2204016EE15
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:34:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rndf3FCJzDqXw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:34:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=E7U1KilS; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmRp6S17zDqN5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:40:38 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id q39so9187pjc.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g0lgvirRZFtuWiTGY/dPhPtiPNVxFstI5Fb5eV8jN3Q=;
 b=E7U1KilSOXKW8+FZZIBLYwji8aaefUBybnTzAAlUHN8azhmNCGoeImlN3ndmLCOjMv
 yGUZUGMI76o3zjfP6G/+ABkp7bL4glmafP7pgCurSA/etgwZMSgnmKcKxL0k4/TSfSmG
 lVggo5gYIRmeyhjPFDctjJzhLUcEMisZrR4fI5UaSqQE2Bp4eCVVdN59YQg5Om2gf87R
 czM9cp04y9klbSWRQiTKNpa8HbWgiSUoPf1BLhL3Z51f/h8An9iMIRXAsbhG4r+yPXi2
 Sp4B7S3lmszZuSFsjGHVNlbeNKivX0bSpmg9IaSFzZ3l4lH4EkvXsYlt1gOuoAtrPhTv
 lwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g0lgvirRZFtuWiTGY/dPhPtiPNVxFstI5Fb5eV8jN3Q=;
 b=aqqTuKKNBxSxH5dgbr8ehmvHFeMu2rA1XvrdhgdQ8bLs+v+3llwbbBw9EBcq4VVP2u
 SsSedSn5qvNTrt2SpVbGzj/ezOr2r4my/mbYc4gnAFBmrQ7I+LzLVtUwk91zw0x8BlyP
 tk3aI6wBZF/EKu2f5/OmKj9o7OntosTGgXQPqrvikFcKU+0tPCb7IyCT2EX/SdKCZrRG
 A6UPAcI/PWiJ18EyVgHYV8sQ9HUda1VR6CH6yRyMsD9MpmSY1cWJf9jXLftxcgVkhmPn
 WAZu7iXnxS0pXQwdM25c6TeK2GmOxH3TUpqpLq4fMVh5UWMsWYbc0q/vr0hdjtVMm6w4
 xifA==
X-Gm-Message-State: APjAAAXaQR297kjXdhlMSTpp7tcc/yz0Fvh5+ELz7Wj65vwUKqIR8Avw
 SSUtSYryXPiXe4OKKAMuCcATEEiR
X-Google-Smtp-Source: APXvYqyMqz0FdjA4f/qhhlp2b1hvVdrQ/VUz3xV5spKS5KcJXpYFfT1nb66Xb4yrfCjUk6F6fncZ2A==
X-Received: by 2002:a17:90a:a416:: with SMTP id
 y22mr97889pjp.114.1582652435678; 
 Tue, 25 Feb 2020 09:40:35 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:40:35 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 18/32] powerpc/64s/exception: Clean up SRR specifiers
Date: Wed, 26 Feb 2020 03:35:27 +1000
Message-Id: <20200225173541.1549955-19-npiggin@gmail.com>
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

Remove more magic numbers and replace with nicely named bools.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 68 +++++++++++++---------------
 1 file changed, 32 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index ae0e68899f0e..b01ff51892dc 100644
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
@@ -485,7 +484,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 		.abort "Bad maskable vector"
 		.endif
 
-		.if IHSRR == EXC_HV_OR_STD
+		.if IHSRR_IF_HVMODE
 		BEGIN_FTR_SECTION
 		bne	masked_Hinterrupt
 		FTR_SECTION_ELSE
@@ -618,12 +617,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
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
@@ -898,7 +894,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
 
-	EXCEPTION_RESTORE_REGS EXC_STD
+	EXCEPTION_RESTORE_REGS
 	RFI_TO_USER_OR_KERNEL
 
 	GEN_KVM system_reset
@@ -952,7 +948,7 @@ TRAMP_REAL_BEGIN(machine_check_fwnmi)
 	lhz	r12,PACA_IN_MCE(r13);			\
 	subi	r12,r12,1;				\
 	sth	r12,PACA_IN_MCE(r13);			\
-	EXCEPTION_RESTORE_REGS EXC_STD
+	EXCEPTION_RESTORE_REGS
 
 EXC_COMMON_BEGIN(machine_check_early_common)
 	/*
@@ -1321,7 +1317,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 INT_DEFINE_BEGIN(hardware_interrupt)
 	IVEC=0x500
-	IHSRR=EXC_HV_OR_STD
+	IHSRR_IF_HVMODE=1
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 	IKVM_VIRT=1
@@ -1490,7 +1486,7 @@ EXC_COMMON_BEGIN(decrementer_common)
 
 INT_DEFINE_BEGIN(hdecrementer)
 	IVEC=0x980
-	IHSRR=EXC_HV
+	IHSRR=1
 	ISTACK=0
 	IRECONCILE=0
 	IKVM_REAL=1
@@ -1719,7 +1715,7 @@ EXC_COMMON_BEGIN(single_step_common)
 
 INT_DEFINE_BEGIN(h_data_storage)
 	IVEC=0xe00
-	IHSRR=EXC_HV
+	IHSRR=1
 	IDAR=1
 	IDSISR=1
 	IKVM_SKIP=1
@@ -1751,7 +1747,7 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
 
 INT_DEFINE_BEGIN(h_instr_storage)
 	IVEC=0xe20
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_REAL=1
 	IKVM_VIRT=1
 INT_DEFINE_END(h_instr_storage)
@@ -1774,7 +1770,7 @@ EXC_COMMON_BEGIN(h_instr_storage_common)
 
 INT_DEFINE_BEGIN(emulation_assist)
 	IVEC=0xe40
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_REAL=1
 	IKVM_VIRT=1
 INT_DEFINE_END(emulation_assist)
@@ -1802,7 +1798,7 @@ EXC_COMMON_BEGIN(emulation_assist_common)
  */
 INT_DEFINE_BEGIN(hmi_exception_early)
 	IVEC=0xe60
-	IHSRR=EXC_HV
+	IHSRR=1
 	IREALMODE_COMMON=1
 	ISTACK=0
 	IRECONCILE=0
@@ -1812,7 +1808,7 @@ INT_DEFINE_END(hmi_exception_early)
 
 INT_DEFINE_BEGIN(hmi_exception)
 	IVEC=0xe60
-	IHSRR=EXC_HV
+	IHSRR=1
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 INT_DEFINE_END(hmi_exception)
@@ -1834,7 +1830,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	cmpdi	cr0,r3,0
 	bne	1f
 
-	EXCEPTION_RESTORE_REGS EXC_HV
+	EXCEPTION_RESTORE_REGS hsrr=1
 	HRFI_TO_USER_OR_KERNEL
 
 1:
@@ -1842,7 +1838,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	 * Go to virtual mode and pull the HMI event information from
 	 * firmware.
 	 */
-	EXCEPTION_RESTORE_REGS EXC_HV
+	EXCEPTION_RESTORE_REGS hsrr=1
 	GEN_INT_ENTRY hmi_exception, virt=0
 
 	GEN_KVM hmi_exception_early
@@ -1861,7 +1857,7 @@ EXC_COMMON_BEGIN(hmi_exception_common)
 
 INT_DEFINE_BEGIN(h_doorbell)
 	IVEC=0xe80
-	IHSRR=EXC_HV
+	IHSRR=1
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 	IKVM_VIRT=1
@@ -1890,7 +1886,7 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 
 INT_DEFINE_BEGIN(h_virt_irq)
 	IVEC=0xea0
-	IHSRR=EXC_HV
+	IHSRR=1
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 	IKVM_VIRT=1
@@ -2060,7 +2056,7 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
 
 INT_DEFINE_BEGIN(h_facility_unavailable)
 	IVEC=0xf80
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_REAL=1
 	IKVM_VIRT=1
 INT_DEFINE_END(h_facility_unavailable)
@@ -2096,7 +2092,7 @@ EXC_VIRT_NONE(0x5100, 0x100)
 #ifdef CONFIG_CBE_RAS
 INT_DEFINE_BEGIN(cbe_system_error)
 	IVEC=0x1200
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_SKIP=1
 	IKVM_REAL=1
 INT_DEFINE_END(cbe_system_error)
@@ -2147,8 +2143,8 @@ EXC_VIRT_NONE(0x5400, 0x100)
 
 INT_DEFINE_BEGIN(denorm_exception)
 	IVEC=0x1500
-	IHSRR=EXC_HV
-	IBRANCH_TO_COMMON=0
+	IHSRR=1
+	IBRANCH_COMMON=0
 	IKVM_REAL=1
 INT_DEFINE_END(denorm_exception)
 
@@ -2256,7 +2252,7 @@ EXC_COMMON_BEGIN(denorm_exception_common)
 #ifdef CONFIG_CBE_RAS
 INT_DEFINE_BEGIN(cbe_maintenance)
 	IVEC=0x1600
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_SKIP=1
 	IKVM_REAL=1
 INT_DEFINE_END(cbe_maintenance)
@@ -2308,7 +2304,7 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 #ifdef CONFIG_CBE_RAS
 INT_DEFINE_BEGIN(cbe_thermal)
 	IVEC=0x1800
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_SKIP=1
 	IKVM_REAL=1
 INT_DEFINE_END(cbe_thermal)
@@ -2371,7 +2367,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
  * - Else it is one of PACA_IRQ_MUST_HARD_MASK, so hard disable and return.
  * This is called with r10 containing the value to OR to the paca field.
  */
-.macro MASKED_INTERRUPT hsrr
+.macro MASKED_INTERRUPT hsrr=0
 	.if \hsrr
 masked_Hinterrupt:
 	.else
@@ -2518,8 +2514,8 @@ TRAMP_REAL_BEGIN(hrfi_flush_fallback)
 	hrfid
 
 USE_TEXT_SECTION()
-	MASKED_INTERRUPT EXC_STD
-	MASKED_INTERRUPT EXC_HV
+	MASKED_INTERRUPT
+	MASKED_INTERRUPT hsrr=1
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 kvmppc_skip_interrupt:
-- 
2.23.0

