Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB7F4C782
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:32:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TsRq4V8rzDr7B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:32:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rgyL0cGS"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TqmM411fzDqwJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:19 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id m4so324699pgk.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LDvyEhCoq60N22yRfNaRDTQuhVe2ymM7WSkpUSNHrZM=;
 b=rgyL0cGSVivQe6XY60pu3ch/56tWb2XVVAND2C+xac+j5N9jLQl9H5g7nnLdrntvLk
 n+lw4GJvGiRJAD0hfPpJ+DDzL3WedLMCe/6vKkm+XIXXUWnwhYys7CEk7SFHsYlr+EG8
 vzonoZKjtgSgZOTabOPpz2rw3AckoiVyqsRjiQ+3JfqUEmCC1xK6UAfE3Ak4XY/7DMN/
 dXcRXOD7CX2bYnsVdypV+VTFViqmt+XYoC1jOElJ/P4OR7tsBT2kd9QauVy63ry1UKfb
 8J4WYSECpKfm4Cl/PhbtukVgTLbm9ulKT4Rd0OMsH9FxAG7yPSRyClOFRBjpYVSnfLx+
 FCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LDvyEhCoq60N22yRfNaRDTQuhVe2ymM7WSkpUSNHrZM=;
 b=TGl1D1tVBExWbGp1nkF8l84mCM8pGlqNEqWWd/wIinXQKnX4rT9tvD8bVr3BsQzf1F
 dbNWo63wW6n1oOm565cBcd69s7BvaJbVDP22QPwKrAwpyqz2p7Me5+Vg3aqBmQp1iAtl
 q2KT1wPw0ofXiG2cGde3kXJRsKFpQojhGZFHGjAZO62HSg+ExNCmwJ/yJetgxSJ+dWqE
 e8ePJb6nbsckTmadD18/ZN0kd2u9tQdeoBrsAnx1GxPl/u8yJci8z1X0NFx6NY2E8MSk
 EnuAl/yU5U+VfSBvSu3OQnZswEQ1VtZcCv3ia2GfdSeFtJHzBlQitWmUmTpc0EBUdFfE
 Wm2Q==
X-Gm-Message-State: APjAAAUfPrh2tWYZFIVFMl0fQcwmjBYQSsvjTOASza1rsmanKtCOakZ3
 iNFOqnPZXhbGGnn3RZHoTKGDeo31
X-Google-Smtp-Source: APXvYqzhPUNPk3hvvXTWAUmSwVBxXn6854cKbBhTRXaGtB/c1PQRWQ8wT9gqSdaAyTOD0QzD1ZlySg==
X-Received: by 2002:a17:90a:d983:: with SMTP id
 d3mr1112504pjv.88.1561007776826; 
 Wed, 19 Jun 2019 22:16:16 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 36/52] powerpc/64s/exception: use common macro for windup
Date: Thu, 20 Jun 2019 15:14:43 +1000
Message-Id: <20190620051459.29573-37-npiggin@gmail.com>
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

No generated code change. File is change is in bug table line numbers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 112 +++++++++------------------
 1 file changed, 36 insertions(+), 76 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index cce75adf2095..2412b5269e25 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -417,6 +417,38 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
 	EXCEPTION_PROLOG_COMMON_2(area);			\
 	EXCEPTION_PROLOG_COMMON_3(trap)
 
+/*
+ * Restore all registers including H/SRR0/1 saved in a stack frame of a
+ * standard exception.
+ */
+.macro EXCEPTION_RESTORE_REGS hsrr
+	/* Move original SRR0 and SRR1 into the respective regs */
+	ld	r9,_MSR(r1)
+	.if \hsrr
+	mtspr	SPRN_HSRR1,r9
+	.else
+	mtspr	SPRN_SRR1,r9
+	.endif
+	ld	r9,_NIP(r1)
+	.if \hsrr
+	mtspr	SPRN_HSRR0,r9
+	.else
+	mtspr	SPRN_SRR0,r9
+	.endif
+	ld	r9,_CTR(r1)
+	mtctr	r9
+	ld	r9,_XER(r1)
+	mtxer	r9
+	ld	r9,_LINK(r1)
+	mtlr	r9
+	ld	r9,_CCR(r1)
+	mtcr	r9
+	REST_8GPRS(2, r1)
+	REST_4GPRS(10, r1)
+	REST_GPR(0, r1)
+	/* restore original r1. */
+	ld	r1,GPR1(r1)
+.endm
 
 #define RUNLATCH_ON				\
 BEGIN_FTR_SECTION				\
@@ -906,29 +938,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
 
-	/*
-	 * Keep below code in synch with MACHINE_CHECK_HANDLER_WINDUP.
-	 * Should share common bits...
-	 */
-
-	/* Move original SRR0 and SRR1 into the respective regs */
-	ld	r9,_MSR(r1)
-	mtspr	SPRN_SRR1,r9
-	ld	r9,_NIP(r1)
-	mtspr	SPRN_SRR0,r9
-	ld	r9,_CTR(r1)
-	mtctr	r9
-	ld	r9,_XER(r1)
-	mtxer	r9
-	ld	r9,_LINK(r1)
-	mtlr	r9
-	ld	r9,_CCR(r1)
-	mtcr	r9
-	REST_8GPRS(2, r1)
-	REST_4GPRS(10, r1)
-	REST_GPR(0, r1)
-	/* restore original r1. */
-	ld	r1,GPR1(r1)
+	EXCEPTION_RESTORE_REGS EXC_STD
 	RFI_TO_USER_OR_KERNEL
 
 
@@ -1074,24 +1084,7 @@ EXC_COMMON_BEGIN(machine_check_common)
 	lhz	r12,PACA_IN_MCE(r13);			\
 	subi	r12,r12,1;				\
 	sth	r12,PACA_IN_MCE(r13);			\
-	/* Move original SRR0 and SRR1 into the respective regs */	\
-	ld	r9,_MSR(r1);				\
-	mtspr	SPRN_SRR1,r9;				\
-	ld	r9,_NIP(r1);				\
-	mtspr	SPRN_SRR0,r9;				\
-	ld	r9,_CTR(r1);				\
-	mtctr	r9;					\
-	ld	r9,_XER(r1);				\
-	mtxer	r9;					\
-	ld	r9,_LINK(r1);				\
-	mtlr	r9;					\
-	ld	r9,_CCR(r1);				\
-	mtcr	r9;					\
-	REST_8GPRS(2, r1);				\
-	REST_4GPRS(10, r1);				\
-	REST_GPR(0, r1);				\
-	/* restore original r1. */			\
-	ld	r1,GPR1(r1)
+	EXCEPTION_RESTORE_REGS EXC_STD
 
 #ifdef CONFIG_PPC_P7_NAP
 /*
@@ -1774,48 +1767,15 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
 	cmpdi	cr0,r3,0
 	bne	1f
 
-	/* Windup the stack. */
-	/* Move original HSRR0 and HSRR1 into the respective regs */
-	ld	r9,_MSR(r1)
-	mtspr	SPRN_HSRR1,r9
-	ld	r9,_NIP(r1)
-	mtspr	SPRN_HSRR0,r9
-	ld	r9,_CTR(r1)
-	mtctr	r9
-	ld	r9,_XER(r1)
-	mtxer	r9
-	ld	r9,_LINK(r1)
-	mtlr	r9
-	ld	r9,_CCR(r1)
-	mtcr	r9
-	REST_8GPRS(2, r1)
-	REST_4GPRS(10, r1)
-	REST_GPR(0, r1)
-	ld	r1,GPR1(r1)
+	EXCEPTION_RESTORE_REGS EXC_HV
 	HRFI_TO_USER_OR_KERNEL
 
 1:
-	ld	r9,_MSR(r1)
-	mtspr	SPRN_HSRR1,r9
-	ld	r9,_NIP(r1)
-	mtspr	SPRN_HSRR0,r9
-	ld	r9,_CTR(r1)
-	mtctr	r9
-	ld	r9,_XER(r1)
-	mtxer	r9
-	ld	r9,_LINK(r1)
-	mtlr	r9
-	ld	r9,_CCR(r1)
-	mtcr	r9
-	REST_8GPRS(2, r1)
-	REST_4GPRS(10, r1)
-	REST_GPR(0, r1)
-	ld	r1,GPR1(r1)
-
 	/*
 	 * Go to virtual mode and pull the HMI event information from
 	 * firmware.
 	 */
+	EXCEPTION_RESTORE_REGS EXC_HV
 	SET_SCRATCH0(r13)
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 	b	tramp_real_hmi_exception
-- 
2.20.1

