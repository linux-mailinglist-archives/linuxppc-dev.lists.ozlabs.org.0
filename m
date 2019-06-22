Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 559E84F62F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 16:28:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WHwh2cy6zDqHX
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 00:28:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WB1XUS6s"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WGL76wTlzDqZy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 23:17:03 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id f25so4676551pgv.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 06:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aKiruuW4UxobOh5PCS8u/H19iN9QoQPBF+sUr00a9+c=;
 b=WB1XUS6sx/EY7MQv9clfp++if3pJYGqOFfrnqZlksDWIo0t/d92hiPHg1OfihejIA3
 KBq/XKLpj/xcHzF0INZuI94EXVvfN3PCDaWVQ4x/DdB/meBfNZ5KM70pzLLBgVPKn2dY
 YR0cCcuwrgi/7vUGsgcuWVR62CbG9NGFLJk8x0sa4E3ahpLcW0NelIJt2Ni/degYg6uW
 m+spTn2lq5sXPpFVyY25wY6W27yx/Juh3X/E5ZVQtQ1nhO5GfC2I4PHzHH+4covdhUU2
 iRRE/GbuwzgwA+A3TT2DyKq6KppRakrMwsWaU1EhVIJ6c4seMhgws7DqfwrdJUljVgBd
 jBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aKiruuW4UxobOh5PCS8u/H19iN9QoQPBF+sUr00a9+c=;
 b=CMpJXHd8eIbSO8Y7pIbNMjIjYMHWS4+EGmFDnsE36bqs37v2WaffVciCuhfepAYUvW
 /Wy/9cmJ7mSKsvtwX+cvAF0DTVYYr0r9g/S5xk5Ntuu073qPEb2eLcabYOQqiRDR1TFc
 A6jyY9dB2HWlst4bqmLziRmFOgJba5mZtbRWQMy30OsUfKYyH4gvMH44IN63cgHUadet
 RjGGcg5gDVWxfwqBh+mSTm6kwLyei/U3m0YhkMt41YHU8geq5cAvurVDPrTr5yqrt+GX
 6h41lhPdNnChM4W86m6gfu9LrL3PloTOTXukFyFYdmjcKzq4ehYO1FU1TBeNQ35bTFj/
 v67A==
X-Gm-Message-State: APjAAAXql7dFqSRO44dFVaMER8TwkIZQ7SasBKnhiHxs85cVjddKBkkM
 QeGgAcaU/Nyf7weWX9fMzqlS2BIzrUA=
X-Google-Smtp-Source: APXvYqyY168uG3Vq6Rv7grS58pa1MCFMIhkipo5DdaLwimEB7Pq0fdJTwVJUTL+cnqZJHePOAh2bNQ==
X-Received: by 2002:a17:90a:22aa:: with SMTP id
 s39mr12970920pjc.39.1561209421180; 
 Sat, 22 Jun 2019 06:17:01 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.144.136.2])
 by smtp.gmail.com with ESMTPSA id n1sm5192471pgv.15.2019.06.22.06.16.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 06:17:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 22/25] powerpc/64s/exception: fix indenting irregularities
Date: Sat, 22 Jun 2019 23:15:32 +1000
Message-Id: <20190622131535.20996-23-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190622131535.20996-1-npiggin@gmail.com>
References: <20190622131535.20996-1-npiggin@gmail.com>
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
index 1bd08b90ef82..391ffa0f53be 100644
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

