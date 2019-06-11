Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2083D10B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:39:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NZ102h4JzDqhS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:39:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tqPn+Spc"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZh0fHZzDqTn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:36 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id bh12so5212506plb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7+antyYbkKVuV+vDDKfshFXYuZvGzG+Wf58TnfvmI8A=;
 b=tqPn+SpcAqO5jhbRTkNYHeh45wDTKzHlVOMH/BQGUBE3VkuHMv0jZCdnzOxAsi6hFC
 gWj2W7W8N6SFOkb+Q1YvKPHAEMvYyh5bSGQpqk3eP/mEosRFW46EmZ3ykZjQFhImy02w
 aVdjxdMbV8sAPPVbpxt/vebUeX99EmDcrh23eL7tABJVQHEmJA3cN29UohJxTyyY9Vf5
 QWAAC/An+DNqg7BC04kC053gOGxI/qfLg0e7KGg1siFCD/mCKqPZnrC5kOSnXgTpEskO
 mpwmXdh4imV0vkSsJvsShygLkBnSnVnPH7sn2hHzE4Akt2zmNuRzdY/XlqJR6gpe1K8o
 0YkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7+antyYbkKVuV+vDDKfshFXYuZvGzG+Wf58TnfvmI8A=;
 b=nwWXr8e2jsP8DpTsAmyxl4aoW7fFAPPS6RuzFe1FELyoji1uUIN+HUhA2ivzVD2GAx
 gfemi+0nl9m7kVGDdST+tcAxdvrnZd5TDj3aSAfEN8SD3/dG6/pDFVi0fCwdNbaroBSk
 l1dSAx+hiRbT7VOl4CSwi/DQEwHiC+M5+RfhFAsG1tkg5o9DYxxOWLzPZsJyWqbnXCrl
 uDIfWVUkeQ0C4k7RPNtAAV280JlPJzIN0EUwuPSkDHpVHWp44V02CemOB7QWChx9cKZ0
 6hXA1bSP6yOn1DHlqymdAFK5FHzGkWvvFBLVPuNZwCh+7PjFB4UuZzLApJnuxWXRNuoE
 WBXg==
X-Gm-Message-State: APjAAAWxwF11QNY0PmUZcI2di9DoY1o9XyfgPyOgF4WRma/0kyNrytbs
 e6auQ53Cf+VCcn5CfTZxh/uJDNxe
X-Google-Smtp-Source: APXvYqwFuIh2nlJD+4FEQfQc4qT2Wj+lY8kI9vDXtvRZ9thEInM6v5o4mldhk9DG7HAadZmT1OhZ2w==
X-Received: by 2002:a17:902:8a87:: with SMTP id
 p7mr59510686plo.124.1560263674068; 
 Tue, 11 Jun 2019 07:34:34 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.34.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:34:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 22/28] powerpc/64s/exception: fix indenting irregularities
Date: Wed, 12 Jun 2019 00:30:34 +1000
Message-Id: <20190611143040.7834-23-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611143040.7834-1-npiggin@gmail.com>
References: <20190611143040.7834-1-npiggin@gmail.com>
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

Generally, macros that result in instructions being expanded are
indented by a tab, and those that don't have no indent. Fix the
obvious cases that go contrary to style.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 92 ++++++++++++++--------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 1c11a7330856..a0721c3fc097 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -269,16 +269,16 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	cmpwi	r10,KVM_GUEST_MODE_SKIP
 	beq	89f
 	.else
-	BEGIN_FTR_SECTION_NESTED(947)
+BEGIN_FTR_SECTION_NESTED(947)
 	ld	r10,\area+EX_CFAR(r13)
 	std	r10,HSTATE_CFAR(r13)
-	END_FTR_SECTION_NESTED(CPU_FTR_CFAR,CPU_FTR_CFAR,947)
+END_FTR_SECTION_NESTED(CPU_FTR_CFAR,CPU_FTR_CFAR,947)
 	.endif
 
-	BEGIN_FTR_SECTION_NESTED(948)
+BEGIN_FTR_SECTION_NESTED(948)
 	ld	r10,\area+EX_PPR(r13)
 	std	r10,HSTATE_PPR(r13)
-	END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
+END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	ld	r10,\area+EX_R10(r13)
 	std	r12,HSTATE_SCRATCH0(r13)
 	sldi	r12,r9,32
@@ -380,10 +380,10 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	std	r9,GPR11(r1);						   \
 	std	r10,GPR12(r1);						   \
 	std	r11,GPR13(r1);						   \
-	BEGIN_FTR_SECTION_NESTED(66);					   \
+BEGIN_FTR_SECTION_NESTED(66);						   \
 	ld	r10,area+EX_CFAR(r13);					   \
 	std	r10,ORIG_GPR3(r1);					   \
-	END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);		   \
+END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
 	GET_CTR(r10, area);						   \
 	std	r10,_CTR(r1);
 
@@ -802,7 +802,7 @@ EXC_REAL_BEGIN(system_reset, 0x100, 0x100)
 	 * but we branch to the 0xc000... address so we can turn on relocation
 	 * with mtmsr.
 	 */
-	BEGIN_FTR_SECTION
+BEGIN_FTR_SECTION
 	mfspr	r10,SPRN_SRR1
 	rlwinm.	r10,r10,47-31,30,31
 	beq-	1f
@@ -811,7 +811,7 @@ EXC_REAL_BEGIN(system_reset, 0x100, 0x100)
 	bltlr	cr1	/* no state loss, return to idle caller */
 	BRANCH_TO_C000(r10, system_reset_idle_common)
 1:
-	END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 #endif
 
 	KVMTEST EXC_STD 0x100
@@ -1159,10 +1159,10 @@ END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
 	 *
 	 * Go back to nap/sleep/winkle mode again if (b) is true.
 	 */
-	BEGIN_FTR_SECTION
+BEGIN_FTR_SECTION
 	rlwinm.	r11,r12,47-31,30,31
 	bne	machine_check_idle_common
-	END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 #endif
 
 	/*
@@ -1269,13 +1269,13 @@ EXC_COMMON_BEGIN(mce_return)
 	b	.
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
-SET_SCRATCH0(r13)		/* save r13 */
-EXCEPTION_PROLOG_0 PACA_EXGEN
+	SET_SCRATCH0(r13)		/* save r13 */
+	EXCEPTION_PROLOG_0 PACA_EXGEN
 	b	tramp_real_data_access
 EXC_REAL_END(data_access, 0x300, 0x80)
 
 TRAMP_REAL_BEGIN(tramp_real_data_access)
-EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x300, 0
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x300, 0
 	/*
 	 * DAR/DSISR must be read before setting MSR[RI], because
 	 * a d-side MCE will clobber those registers so is not
@@ -1288,9 +1288,9 @@ EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x300, 0
 EXCEPTION_PROLOG_2_REAL data_access_common, EXC_STD, 1
 
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
-SET_SCRATCH0(r13)		/* save r13 */
-EXCEPTION_PROLOG_0 PACA_EXGEN
-EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x300, 0
+	SET_SCRATCH0(r13)		/* save r13 */
+	EXCEPTION_PROLOG_0 PACA_EXGEN
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x300, 0
 	mfspr	r10,SPRN_DAR
 	mfspr	r11,SPRN_DSISR
 	std	r10,PACA_EXGEN+EX_DAR(r13)
@@ -1323,24 +1323,24 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
 EXC_REAL_BEGIN(data_access_slb, 0x380, 0x80)
-SET_SCRATCH0(r13)		/* save r13 */
-EXCEPTION_PROLOG_0 PACA_EXSLB
+	SET_SCRATCH0(r13)		/* save r13 */
+	EXCEPTION_PROLOG_0 PACA_EXSLB
 	b	tramp_real_data_access_slb
 EXC_REAL_END(data_access_slb, 0x380, 0x80)
 
 TRAMP_REAL_BEGIN(tramp_real_data_access_slb)
-EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 1, 0x380, 0
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 1, 0x380, 0
 	mfspr	r10,SPRN_DAR
 	std	r10,PACA_EXSLB+EX_DAR(r13)
-EXCEPTION_PROLOG_2_REAL data_access_slb_common, EXC_STD, 1
+	EXCEPTION_PROLOG_2_REAL data_access_slb_common, EXC_STD, 1
 
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
-SET_SCRATCH0(r13)		/* save r13 */
-EXCEPTION_PROLOG_0 PACA_EXSLB
-EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 0, 0x380, 0
+	SET_SCRATCH0(r13)		/* save r13 */
+	EXCEPTION_PROLOG_0 PACA_EXSLB
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 0, 0x380, 0
 	mfspr	r10,SPRN_DAR
 	std	r10,PACA_EXSLB+EX_DAR(r13)
-EXCEPTION_PROLOG_2_VIRT data_access_slb_common, EXC_STD
+	EXCEPTION_PROLOG_2_VIRT data_access_slb_common, EXC_STD
 EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
 
 TRAMP_KVM_SKIP(PACA_EXSLB, 0x380)
@@ -1423,25 +1423,25 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 EXC_REAL_BEGIN(hardware_interrupt, 0x500, 0x100)
 	SET_SCRATCH0(r13)	/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
-	BEGIN_FTR_SECTION
-		EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
-		EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_HV, 1
-	FTR_SECTION_ELSE
-		EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
-		EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_STD, 1
-	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+BEGIN_FTR_SECTION
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
+	EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_HV, 1
+FTR_SECTION_ELSE
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
+	EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_STD, 1
+ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 EXC_REAL_END(hardware_interrupt, 0x500, 0x100)
 
 EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
 	SET_SCRATCH0(r13)	/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
-	BEGIN_FTR_SECTION
-		EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
-		EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_HV
-	FTR_SECTION_ELSE
-		EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
-		EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_STD
-	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
+BEGIN_FTR_SECTION
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
+	EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_HV
+FTR_SECTION_ELSE
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
+	EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_STD
+ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 
 TRAMP_KVM(PACA_EXGEN, 0x500)
@@ -1450,25 +1450,25 @@ EXC_COMMON_ASYNC(hardware_interrupt_common, 0x500, do_IRQ)
 
 
 EXC_REAL_BEGIN(alignment, 0x600, 0x100)
-SET_SCRATCH0(r13)		/* save r13 */
-EXCEPTION_PROLOG_0 PACA_EXGEN
-EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x600, 0
+	SET_SCRATCH0(r13)		/* save r13 */
+	EXCEPTION_PROLOG_0 PACA_EXGEN
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x600, 0
 	mfspr	r10,SPRN_DAR
 	mfspr	r11,SPRN_DSISR
 	std	r10,PACA_EXGEN+EX_DAR(r13)
 	stw	r11,PACA_EXGEN+EX_DSISR(r13)
-EXCEPTION_PROLOG_2_REAL alignment_common, EXC_STD, 1
+	EXCEPTION_PROLOG_2_REAL alignment_common, EXC_STD, 1
 EXC_REAL_END(alignment, 0x600, 0x100)
 
 EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
-SET_SCRATCH0(r13)		/* save r13 */
-EXCEPTION_PROLOG_0 PACA_EXGEN
-EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x600, 0
+	SET_SCRATCH0(r13)		/* save r13 */
+	EXCEPTION_PROLOG_0 PACA_EXGEN
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x600, 0
 	mfspr	r10,SPRN_DAR
 	mfspr	r11,SPRN_DSISR
 	std	r10,PACA_EXGEN+EX_DAR(r13)
 	stw	r11,PACA_EXGEN+EX_DSISR(r13)
-EXCEPTION_PROLOG_2_VIRT alignment_common, EXC_STD
+	EXCEPTION_PROLOG_2_VIRT alignment_common, EXC_STD
 EXC_VIRT_END(alignment, 0x4600, 0x100)
 
 TRAMP_KVM(PACA_EXGEN, 0x600)
-- 
2.20.1

