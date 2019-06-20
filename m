Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8FB4C70F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:03:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Trpc4MjqzDqkf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:03:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kqJGAKhO"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqlq0JCGzDqvp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:15:51 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id d126so978615pfd.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xwHEzrUQ6k3b5oX10xZBicfcHu3XZ7ClVajrvwL+WxY=;
 b=kqJGAKhO+rY9GkgyqW09lEYXBkpKU5zuJgaLeqbZ3yI2vJRtHoQjCVJbDQOT5i7tXr
 bcuzS73rheXzAMbuDOfuiRJzl5roYXqLwYnk/uPgBg3MHOIcIPNFwweHx3Vb/stGYKMX
 aYnWkF8Pcd1mMDS4yilDdsVvOb1FIx9scGE7vkjeOoJZpC+sCi6so0akvcp/MJl8OXnu
 xqq5knxefXSuuw48DHUSUt12HutPt0YEF82sQgSETSGWxjvl7KKloUDvJcP2MwsyWNp1
 XPg7f5I4hoTNE8uDv1QDsk8KA4S/A4tCGtaGs6769/iThvXRSBnvuwrEzM5vKl/ywumk
 CFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xwHEzrUQ6k3b5oX10xZBicfcHu3XZ7ClVajrvwL+WxY=;
 b=kLKfi3z6JnLz0kGo/h+q7uEKjT+VoDLcil6zTutGoUuDMVgdgh5oP3eukjT7L2xbxd
 bhMQp9g53sIH4M4IMJtjeNrYFbil6QcyrTJXmxPw9cnVGhDJ6JRWyu6hhZpGI1B0g+KK
 j/QMl2OnE0ywZWo2U40pSIsk0i3sDzjnj0tBsxaHhSJ22F/MTfLjKXGep5etkQmHJrSO
 hWEIUl1IzkLbc+P9OyZlIDI5Yexe/9bZDeO89zGSDCj0FL4vhqzNsixAN3V15VJTwVl6
 WIF3FBruINPIjRMw/ubfB/bFU9Rx0c4x4/Ctr7umAflzXwpYWS10ZMvGX1Wtns+xNrB8
 o+9Q==
X-Gm-Message-State: APjAAAVsgSxXdD2q6ZFh8Ak/WMv9Mhn60p0DAjFAm1V+jgJe73veQweq
 J8d3OJJ+BmOqdVSRg76OP04V5r80
X-Google-Smtp-Source: APXvYqwlbfgvaBqhKDzhPVEUznHEwGnjbguMoqrzf9R2Oe5TextJBuNlltixwT41gnda5cKGgCGIdw==
X-Received: by 2002:a17:90b:f0e:: with SMTP id
 br14mr1078484pjb.117.1561007748957; 
 Wed, 19 Jun 2019 22:15:48 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:15:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 23/52] powerpc/64s/exception: fix indenting irregularities
Date: Thu, 20 Jun 2019 15:14:30 +1000
Message-Id: <20190620051459.29573-24-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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
index f7b6634bcc75..02b4722b7c64 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -261,16 +261,16 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
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
@@ -372,10 +372,10 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
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
 
@@ -794,7 +794,7 @@ EXC_REAL_BEGIN(system_reset, 0x100, 0x100)
 	 * but we branch to the 0xc000... address so we can turn on relocation
 	 * with mtmsr.
 	 */
-	BEGIN_FTR_SECTION
+BEGIN_FTR_SECTION
 	mfspr	r10,SPRN_SRR1
 	rlwinm.	r10,r10,47-31,30,31
 	beq-	1f
@@ -803,7 +803,7 @@ EXC_REAL_BEGIN(system_reset, 0x100, 0x100)
 	bltlr	cr1	/* no state loss, return to idle caller */
 	BRANCH_TO_C000(r10, system_reset_idle_common)
 1:
-	END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 #endif
 
 	KVMTEST EXC_STD 0x100
@@ -1151,10 +1151,10 @@ END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
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
@@ -1261,13 +1261,13 @@ EXC_COMMON_BEGIN(mce_return)
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
@@ -1280,9 +1280,9 @@ EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x300, 0
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
@@ -1315,24 +1315,24 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
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
@@ -1415,25 +1415,25 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
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
@@ -1442,25 +1442,25 @@ EXC_COMMON_ASYNC(hardware_interrupt_common, 0x500, do_IRQ)
 
 
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

