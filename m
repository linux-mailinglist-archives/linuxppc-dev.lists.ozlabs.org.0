Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FFA7F62A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:43:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460QKW6CvFzDqlw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:43:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WspF1XVC"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PMb6rbgzDqdR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:27 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id f5so27077126pgu.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=boCEqvJ/vdpxP+4jXFpswfYdkHwqIfY1f7FtYaIa0eQ=;
 b=WspF1XVCaRfbfpsneHNIf0Cp/eEuIKuSzBIft1KZKVp4FET9qeH5TinqZp7kEGvDMV
 pfnhD7jyLTamOZWxTBzhlyGy4oySzL0f1BLt0ZBirDqHTBwhdtYv96RTKLW74VMgCQPj
 N79JM4EzuWyQ61WuxxTRFnQ5tHH/c+LprABbaUJuiDnqZpU1AmbhnkNY8T6s2J8q5z7C
 4ch/n76Z7Xt1Nj5u3tDBHedLPlSDk9pSCh3XWdd5Fi9rt7Jxl+zt/HThNNepuCxyQfDq
 6ksAOgRtBDA+8NY444fkyj4XHWXkUPk4HSWwJ+aukLO7gbwgGR9ySPm1w38pwcFRw46n
 qQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=boCEqvJ/vdpxP+4jXFpswfYdkHwqIfY1f7FtYaIa0eQ=;
 b=bda9+xLTW9oBg2FeASdwGqhckVasm4YF/Fohvr8IVECyX9AhKjrlNiTJAn4w2CMiYp
 ESG3rDtctMK9nv1JUoCUU3IN5Fsh34zZ5W1//6PGo5COQLSL/+gDnryTj8EgJ/Pfqp1W
 Pi9Vfq1yqKxwOYOd4S5B6djqf9wj0A/6O10zoocMp0gsWDiILDpKuJyZY55zopay59pU
 wsz4Ii3XvTn3bhccMiWHyvo9p0utvyK5S4mUx2GhidiNfF3kEvzV9sAk1g0LsXLOWIUU
 8uGDj76x8TBHMMTrkywFvnX23/sCwT3M75KrUd2lr8gYgo2FUGJCa1myLuzTNDEJ8nAQ
 7CpQ==
X-Gm-Message-State: APjAAAU5Bj0G+XrGZT4YV6WR/xwCl3MeLF0ZDRLwg6yeTitzQuMC2opw
 4Wf/3ulH96DY093Anu/ESr5j2tMConQ=
X-Google-Smtp-Source: APXvYqyG3RiARh1xa1xhs0I54gjHDsapQ/yYEaddbqPMNZZ/EjlO2/pJ3/1lpgKKqCuoCV4p95anDg==
X-Received: by 2002:a65:6284:: with SMTP id f4mr67122288pgv.416.1564743625204; 
 Fri, 02 Aug 2019 04:00:25 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:24 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 19/44] powerpc/64s/exception: Add EXC_HV_OR_STD,
 which selects HSRR if HVMODE
Date: Fri,  2 Aug 2019 20:56:44 +1000
Message-Id: <20190802105709.27696-20-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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

Add EXC_HV_OR_STD and use it to consolidate the 0x500 external
interrupt.

Executed code is unchanged.

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

