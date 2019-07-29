Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C0E78E1A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 16:35:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y2KK495YzDqMt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 00:35:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="h2DAkGkv"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1rL6HgQzDqC8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:13:38 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id r7so28116134pfl.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WF9GVfl5PSQnBT2EaL7sDoTMy6s6tawzUS/cbhLQO9k=;
 b=h2DAkGkvrGV+80WkTRodBsFcYqrjlbUoR0CcudpBULMvibrDX7j0ogQC8jnfwOgwUY
 QalaoBKa1PGTqdeEKR938GTG7TEij68/2ZCa+7VjPfHDX6J/cH+c5c2JkXwjBlR5AXab
 /S/8HXz5rVsazdgXkablZWfZZmTN7WqIDM6FCYLDR+IhlROJSsphA/f4qA17X4Mo4pZs
 SyrltHKiTvEEx6Wt/M0fupio9SZBWASaQbjc86V36fFC+9Kv75vPG++ANCf0kBZ6eVhS
 YYBp8aSHQPRY8NYNbBKI5CwlknH5fCyXiFfUWW3W6/4JNAXCkkv8CKgNFZr+oF+AAM5G
 RpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WF9GVfl5PSQnBT2EaL7sDoTMy6s6tawzUS/cbhLQO9k=;
 b=Tg+Th1syM3Xet1UBs50IysKo5moDXaMeo/sJEJ9Vo6El5it88FexBhugLFRxawIbNe
 8aggYwvK6aCpYxV25ZeqeJia8/47hzpNaggQBBlDbBLypBEHyt/s0ohGIE3c44h+m7lJ
 luq1NWwiDXo01J189qFuoIbOWmSolXjtTkl8Lss2idkCcZhhTs+ctR0otnBARRy5nQAa
 uHzHETxCCQ+z1Q4WzN+f6S49JiwJsA3qEI3+9k8b2vLAUNnxxoPHZl4gy6lpgAhrr1i8
 peH4OTpy1NG45QiZWpmNI3BadjYLy/bvpRzugN1oQi1FMHn2uv06ia//7/226QLc8RLy
 mmMQ==
X-Gm-Message-State: APjAAAVIJFb2OE76wTyx19opRj9Q/aeZD0HO1Bhu2nBhZ64RsIgANpxH
 qIvIzfR8uOxS7xXkzp1q5H6/5G6y/B8=
X-Google-Smtp-Source: APXvYqzCK/MVwH0OffYRlvmMjcspocFt/UiNQkFOrFYNOKPkJXsiwmX53QmR/E/2OEtbcy0vi/J1oA==
X-Received: by 2002:a62:ae02:: with SMTP id q2mr36032426pff.1.1564409614803;
 Mon, 29 Jul 2019 07:13:34 -0700 (PDT)
Received: from bobo.local0.net (61-68-184-39.tpgi.com.au. [61.68.184.39])
 by smtp.gmail.com with ESMTPSA id u7sm53960083pfm.96.2019.07.29.07.13.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:13:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/18] powerpc/64s/exception: Add EXC_HV_OR_STD,
 for HSRR if HV=1 else SRR
Date: Tue, 30 Jul 2019 00:12:32 +1000
Message-Id: <20190729141247.26762-4-npiggin@gmail.com>
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

Use EXC_HV_OR_STD to de-duplicate the 0x500 external interrupt.
This helps with consolidation in future.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 102 +++++++++++++++++++++------
 1 file changed, 79 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 1fb46fb24696..60969992e9e0 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -109,6 +109,7 @@ name:
 	addis	reg,reg,(ABS_ADDR(label))@h
 
 /* Exception register prefixes */
+#define EXC_HV_OR_STD	2 /* depends on HVMODE */
 #define EXC_HV		1
 #define EXC_STD		0
 
@@ -205,7 +206,13 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 		.abort "Bad maskable vector"
 		.endif
 
-		.if \hsrr
+		.if \hsrr == EXC_HV_OR_STD
+		BEGIN_FTR_SECTION
+		bne	masked_Hinterrupt
+		FTR_SECTION_ELSE
+		bne	masked_interrupt
+		ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+		.elseif \hsrr
 		bne	masked_Hinterrupt
 		.else
 		bne	masked_interrupt
@@ -237,7 +244,17 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	.if ! \set_ri
 	xori	r10,r10,MSR_RI		/* Clear MSR_RI */
 	.endif
-	.if \hsrr
+	.if \hsrr == EXC_HV_OR_STD
+	BEGIN_FTR_SECTION
+	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
+	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
+	mtspr	SPRN_HSRR1,r10
+	FTR_SECTION_ELSE
+	mfspr	r11,SPRN_SRR0		/* save SRR0 */
+	mfspr	r12,SPRN_SRR1		/* and SRR1 */
+	mtspr	SPRN_SRR1,r10
+	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	.elseif \hsrr
 	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
 	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
 	mtspr	SPRN_HSRR1,r10
@@ -247,7 +264,15 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	mtspr	SPRN_SRR1,r10
 	.endif
 	LOAD_HANDLER(r10, \label\())
-	.if \hsrr
+	.if \hsrr == EXC_HV_OR_STD
+	BEGIN_FTR_SECTION
+	mtspr	SPRN_HSRR0,r10
+	HRFI_TO_KERNEL
+	FTR_SECTION_ELSE
+	mtspr	SPRN_SRR0,r10
+	RFI_TO_KERNEL
+	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	.elseif \hsrr
 	mtspr	SPRN_HSRR0,r10
 	HRFI_TO_KERNEL
 	.else
@@ -259,14 +284,26 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 
 .macro EXCEPTION_PROLOG_2_VIRT label, hsrr
 #ifdef CONFIG_RELOCATABLE
-	.if \hsrr
+	.if \hsrr == EXC_HV_OR_STD
+	BEGIN_FTR_SECTION
+	mfspr	r11,SPRN_HSRR0	/* save HSRR0 */
+	FTR_SECTION_ELSE
+	mfspr	r11,SPRN_SRR0	/* save SRR0 */
+	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	.elseif \hsrr
 	mfspr	r11,SPRN_HSRR0	/* save HSRR0 */
 	.else
 	mfspr	r11,SPRN_SRR0	/* save SRR0 */
 	.endif
 	LOAD_HANDLER(r12, \label\())
 	mtctr	r12
-	.if \hsrr
+	.if \hsrr == EXC_HV_OR_STD
+	BEGIN_FTR_SECTION
+	mfspr	r12,SPRN_HSRR1	/* and HSRR1 */
+	FTR_SECTION_ELSE
+	mfspr	r12,SPRN_SRR1	/* and HSRR1 */
+	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	.elseif \hsrr
 	mfspr	r12,SPRN_HSRR1	/* and HSRR1 */
 	.else
 	mfspr	r12,SPRN_SRR1	/* and HSRR1 */
@@ -275,7 +312,15 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	mtmsrd 	r10,1		/* Set RI (EE=0) */
 	bctr
 #else
-	.if \hsrr
+	.if \hsrr == EXC_HV_OR_STD
+	BEGIN_FTR_SECTION
+	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
+	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
+	FTR_SECTION_ELSE
+	mfspr	r11,SPRN_SRR0		/* save SRR0 */
+	mfspr	r12,SPRN_SRR1		/* and SRR1 */
+	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	.elseif \hsrr
 	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
 	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
 	.else
@@ -316,7 +361,13 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 .macro KVMTEST hsrr, n
 	lbz	r10,HSTATE_IN_GUEST(r13)
 	cmpwi	r10,0
-	.if \hsrr
+	.if \hsrr == EXC_HV_OR_STD
+	BEGIN_FTR_SECTION
+	bne	do_kvm_H\n
+	FTR_SECTION_ELSE
+	bne	do_kvm_\n
+	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	.elseif \hsrr
 	bne	do_kvm_H\n
 	.else
 	bne	do_kvm_\n
@@ -342,7 +393,13 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	std	r12,HSTATE_SCRATCH0(r13)
 	sldi	r12,r9,32
 	/* HSRR variants have the 0x2 bit added to their trap number */
-	.if \hsrr
+	.if \hsrr == EXC_HV_OR_STD
+	BEGIN_FTR_SECTION
+	ori	r12,r12,(\n + 0x2)
+	FTR_SECTION_ELSE
+	ori	r12,r12,(\n)
+	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	.elseif \hsrr
 	ori	r12,r12,(\n + 0x2)
 	.else
 	ori	r12,r12,(\n)
@@ -370,7 +427,13 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 89:	mtocrf	0x80,r9
 	ld	r9,\area+EX_R9(r13)
 	ld	r10,\area+EX_R10(r13)
-	.if \hsrr
+	.if \hsrr == EXC_HV_OR_STD
+	BEGIN_FTR_SECTION
+	b	kvmppc_skip_Hinterrupt
+	FTR_SECTION_ELSE
+	b	kvmppc_skip_interrupt
+	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	.elseif \hsrr
 	b	kvmppc_skip_Hinterrupt
 	.else
 	b	kvmppc_skip_interrupt
@@ -469,6 +532,9 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
 .macro EXCEPTION_RESTORE_REGS hsrr
 	/* Move original SRR0 and SRR1 into the respective regs */
 	ld	r9,_MSR(r1)
+	.if \hsrr == EXC_HV_OR_STD
+	.error "EXC_HV_OR_STD Not implemented for EXCEPTION_RESTORE_REGS"
+	.endif
 	.if \hsrr
 	mtspr	SPRN_HSRR1,r9
 	.else
@@ -1363,24 +1429,14 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 EXC_REAL_BEGIN(hardware_interrupt, 0x500, 0x100)
 	EXCEPTION_PROLOG_0 PACA_EXGEN
-BEGIN_FTR_SECTION
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
-	EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_HV, 1
-FTR_SECTION_ELSE
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
-	EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_STD, 1
-ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	EXCEPTION_PROLOG_1 EXC_HV_OR_STD, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
+	EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_HV_OR_STD, 1
 EXC_REAL_END(hardware_interrupt, 0x500, 0x100)
 
 EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
 	EXCEPTION_PROLOG_0 PACA_EXGEN
-BEGIN_FTR_SECTION
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
-	EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_HV
-FTR_SECTION_ELSE
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
-	EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_STD
-ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
+	EXCEPTION_PROLOG_1 EXC_HV_OR_STD, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
+	EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_HV_OR_STD
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 
 TRAMP_KVM(PACA_EXGEN, 0x500)
-- 
2.22.0

