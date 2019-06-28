Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D22355939D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 07:47:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zm482NrSzDr1x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 15:47:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RDsJjKaN"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zlmk2Y3DzDqnB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 15:33:42 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id c85so2389829pfc.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 22:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XTehm5p/s27ykgAs7YjlzjL71uBSuFb2qcy9OTQZFjg=;
 b=RDsJjKaNWrFQ64xdlGf7w1FPWgm6pK8ZVPimD2i/8GWvmBJRU9Wxbm/OyhFFVJ8B13
 mU9Iqzf3ZgZ/l9WH+Lu5byd6PyA8t+LlbUmDWOQBoVPCceTzcbYbLMiAKpzeu1jLyqsC
 tsLASFuTcNKbTIh+MUrPbyUzemEPkgK8nSTpR2dtraSvGrmFYrJg4LnaH7GGt2S/HgJj
 wPtiYmLY1Oh8g1N30m/PCY/231qbdyxxf47SLEJLxE8c8D5hJYLvhqJv7jGGLdvseMrj
 UNyvJ1Ityy6jMnvh996Pokgaf+CPPwewhqKH/z8W1j9LzmGp8ScSvBJbWA2DQ7H5ZLn7
 3fIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XTehm5p/s27ykgAs7YjlzjL71uBSuFb2qcy9OTQZFjg=;
 b=VI/TxHVimZJBa7hnaTgRiXr2c9IAZHXNcfnnWlDoIB8VqVwiErcHEE4e02i32R2zAO
 Oh4vepPplQTolJBmHTh+ZBFW499kpR7KvsDO8IcLawt23PM1sGhd9SSOKU3eJMx4TpXC
 bHtPo0DO9i0tA/m2vmugxZghehFkqadIzXKupsrM72hioOYGOqV3VCSeMs2fQCeBkbNJ
 LgXlkAWcdoGaj+McRhkt0tZoluI64zRj+Zzyetf8uRA6q8SyO3H2+yBMZGdCXaUwXSfl
 9EKhbowR7fwMs0nI9WH3lvyl9iwHaHtpgYR9ci7gBYDYNQuZ6xMc6jisUGieJ80srp5F
 WyuQ==
X-Gm-Message-State: APjAAAWBzI0oj00wlo/BQr6C7JaddqskTHelLIkrsbWh4YLRKzpFkyDg
 GOP53BxVjVrLtX7xPh4iq0vz9aHD
X-Google-Smtp-Source: APXvYqyi1y1KWZ7emrEhl429pvSPa52oSzvke/qG88mz5htGi5vG+mFJ4lQm9KsyOhetGxWATNF++w==
X-Received: by 2002:a17:90b:d8b:: with SMTP id
 bg11mr10831275pjb.30.1561700020458; 
 Thu, 27 Jun 2019 22:33:40 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 125sm1272614pfg.23.2019.06.27.22.33.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 22:33:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 08/13] powerpc/64s/exception: use common macro for windup
Date: Fri, 28 Jun 2019 15:33:27 +1000
Message-Id: <20190628053332.22366-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628053332.22366-1-npiggin@gmail.com>
References: <20190628053332.22366-1-npiggin@gmail.com>
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

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 112 +++++++++------------------
 1 file changed, 36 insertions(+), 76 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 228fa51b9050..2b3a7d928df6 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -424,6 +424,38 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
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
@@ -901,29 +933,7 @@ EXC_COMMON_BEGIN(system_reset_common)
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
 
 #ifdef CONFIG_PPC_PSERIES
@@ -1082,24 +1092,7 @@ EXC_COMMON_BEGIN(machine_check_common)
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
@@ -1779,48 +1772,15 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
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

