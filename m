Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B45C4F5E9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 15:35:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WGlj0byQzDqfG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 23:35:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WHrPF1OF"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WGKL2VWwzDqZw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 23:16:21 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id m30so4972975pff.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 06:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zk82K3CPa1krjh+TW0C6AKuJlpL0RwKcwrPhMIJEFuU=;
 b=WHrPF1OFxFBhy6+hcy4cDFHhRfzgnojDa7Gf1ZjCOquuLW5Aan/FT7fZSppHHNLcbQ
 kYIAcAgfaOLrghlk61cUnZn6pJ5SklPi/ydFZ0tx3FqrOMT37LKNgR6IZHBEvzRp6LlU
 9m8GUjYXJBxEnaQT39y6cykvj+DTY+wrOSJxEYa0ca0WL5wMKqIMwkanAt2PFeTdNTZC
 u8yOtZCfoEw/xBn8F6luDyzg4U9V5rBUlZ10kYqOxdV1Av0cLV/ka81/gCzCQOC/E/bU
 UVwG631bMNsaHMKoOKpH3w1i9IRqX883O6SIGoUsRWFrPoSf5tQg3rCIM2gWfW4d2bBE
 w+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zk82K3CPa1krjh+TW0C6AKuJlpL0RwKcwrPhMIJEFuU=;
 b=F8Z13po600Nzx/nrQhaBBDo7kWk/aI/9rXtzVW1P8HjjsPtxwcQqxSSP6eEEgfKCWt
 70O8boM0xC7vZ0cv9gvizGDgrV0/OhsPfJcWZJO8szCqq9A/GWw532gcrNxCcXRxT1SC
 n7Wl3m0KYSAE22iK8LKdTesnxA5B3II8zsVroi0IIEnNCDcPmWe1M6DnOTOujcsQcriF
 05SXZiMpSX2naadfZFokUFnffjTAzyC+l2+IxRI8Lx5oNv9SHTuH7rTwPGbH3w0+rxdN
 VzPL3Dh7DY1Ugl13EuDHseXrnY07vok3zMf8i/mOiqEEvge8uAWkZ4WBZ1K+ZzDX2pVA
 Hqvw==
X-Gm-Message-State: APjAAAX4eIo7ivURLRwhCix4xGVjxFD6+Kz2peF7hTDK05J5DRgolEAe
 4Si/HNzeV0Bhto9atLlTwVbU/ApJMtY=
X-Google-Smtp-Source: APXvYqwDgQ6B2UicJR2ClLhC+lKWn4aT9NzgRfu5tlhTT9tYBwnAEhJjkWtMRhr45QvgYLwqaNCuHQ==
X-Received: by 2002:a17:90a:22aa:: with SMTP id
 s39mr12967513pjc.39.1561209379009; 
 Sat, 22 Jun 2019 06:16:19 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.144.136.2])
 by smtp.gmail.com with ESMTPSA id n1sm5192471pgv.15.2019.06.22.06.16.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 06:16:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 05/25] powerpc/64s/exception: remove the "extra" macro
 parameter
Date: Sat, 22 Jun 2019 23:15:15 +1000
Message-Id: <20190622131535.20996-6-npiggin@gmail.com>
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

Rather than pass in the soft-masking and KVM tests via macro that is
passed to another macro to expand it, switch to usig gas macros and
conditionally expand the soft-masking and KVM tests.

The system reset with its idle test is open coded as it is a one-off.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 158 ++++++++++-------------
 arch/powerpc/kernel/exceptions-64s.S     |  78 ++++++-----
 2 files changed, 114 insertions(+), 122 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 4aef70defcdd..e1b449e2c9ea 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -231,10 +231,10 @@
  * rfid. Save CTR in case we're CONFIG_RELOCATABLE, in which case
  * EXCEPTION_PROLOG_2_VIRT will be using CTR.
  */
-#define EXCEPTION_RELON_PROLOG(area, label, hsrr, extra, vec)		\
+#define EXCEPTION_RELON_PROLOG(area, label, hsrr, kvm, vec)		\
 	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0(area);					\
-	EXCEPTION_PROLOG_1(area, extra, vec);				\
+	EXCEPTION_PROLOG_1 hsrr, area, kvm, vec ;			\
 	EXCEPTION_PROLOG_2_VIRT label, hsrr
 
 /* Exception register prefixes */
@@ -321,31 +321,58 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 /*
  * This version of the EXCEPTION_PROLOG_1 will carry
  * addition parameter called "bitmask" to support
- * checking of the interrupt maskable level in the SOFTEN_TEST.
+ * checking of the interrupt maskable level.
  * Intended to be used in MASKABLE_EXCPETION_* macros.
  */
-#define MASKABLE_EXCEPTION_PROLOG_1(area, extra, vec, bitmask)			\
-	__EXCEPTION_PROLOG_1_PRE(area);					\
-	extra(vec, bitmask);						\
-	__EXCEPTION_PROLOG_1_POST(area)
+.macro MASKABLE_EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, bitmask
+	__EXCEPTION_PROLOG_1_PRE(\area\())
+	.if \kvm
+		KVMTEST \hsrr \vec
+	.endif
+
+	lbz	r10,PACAIRQSOFTMASK(r13)
+	andi.	r10,r10,\bitmask
+	/* This associates vector numbers with bits in paca->irq_happened */
+	.if \vec == 0x500 || \vec == 0xea0
+	li	r10,PACA_IRQ_EE
+	.elseif \vec == 0x900 || \vec == 0xea0
+	li	r10,PACA_IRQ_DEC
+	.elseif \vec == 0xa00 || \vec == 0xe80
+	li	r10,PACA_IRQ_DBELL
+	.elseif \vec == 0xe60
+	li	r10,PACA_IRQ_HMI
+	.elseif \vec == 0xf00
+	li	r10,PACA_IRQ_PMI
+	.else
+	.abort "Bad maskable vector"
+	.endif
+
+	.if \hsrr
+	bne	masked_Hinterrupt
+	.else
+	bne	masked_interrupt
+	.endif
+
+	__EXCEPTION_PROLOG_1_POST(\area\())
+.endm
 
 /*
  * This version of the EXCEPTION_PROLOG_1 is intended
  * to be used in STD_EXCEPTION* macros
  */
-#define _EXCEPTION_PROLOG_1(area, extra, vec)				\
-	__EXCEPTION_PROLOG_1_PRE(area);					\
-	extra(vec);							\
-	__EXCEPTION_PROLOG_1_POST(area)
-
-#define EXCEPTION_PROLOG_1(area, extra, vec)				\
-	_EXCEPTION_PROLOG_1(area, extra, vec)
+.macro EXCEPTION_PROLOG_1 hsrr, area, kvm, vec
+	__EXCEPTION_PROLOG_1_PRE(\area\())
+	.if \kvm
+		KVMTEST \hsrr \vec
+	.endif
+	__EXCEPTION_PROLOG_1_POST(\area\())
+.endm
 
-#define EXCEPTION_PROLOG(area, label, h, extra, vec)			\
+#define EXCEPTION_PROLOG(area, label, hsrr, kvm, vec)			\
 	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0(area);					\
-	EXCEPTION_PROLOG_1(area, extra, vec);				\
-	EXCEPTION_PROLOG_2_REAL label, h, 1
+	EXCEPTION_PROLOG_1 hsrr, area, kvm, vec ;			\
+	EXCEPTION_PROLOG_2_REAL label, hsrr, 1
 
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 /*
@@ -411,10 +438,10 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #endif
 
 /* Do not enable RI */
-#define EXCEPTION_PROLOG_NORI(area, label, h, extra, vec)		\
+#define EXCEPTION_PROLOG_NORI(area, label, hsrr, kvm, vec)		\
 	EXCEPTION_PROLOG_0(area);					\
-	EXCEPTION_PROLOG_1(area, extra, vec);				\
-	EXCEPTION_PROLOG_2_REAL label, h, 0
+	EXCEPTION_PROLOG_1 hsrr, area, kvm, vec ;			\
+	EXCEPTION_PROLOG_2_REAL label, hsrr, 0
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 .macro KVMTEST hsrr, n
@@ -476,8 +503,6 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 .endm
 #endif
 
-#define NOTEST(n)
-
 #define EXCEPTION_PROLOG_COMMON_1()					   \
 	std	r9,_CCR(r1);		/* save CR in stackframe	*/ \
 	std	r11,_NIP(r1);		/* save SRR0 in stackframe	*/ \
@@ -561,7 +586,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
  * Exception vectors.
  */
 #define STD_EXCEPTION(vec, label)				\
-	EXCEPTION_PROLOG(PACA_EXGEN, label, EXC_STD, KVMTEST_PR, vec);
+	EXCEPTION_PROLOG(PACA_EXGEN, label, EXC_STD, 1, vec);
 
 /* Version of above for when we have to branch out-of-line */
 #define __OOL_EXCEPTION(vec, label, hdlr)			\
@@ -570,112 +595,69 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	b hdlr
 
 #define STD_EXCEPTION_OOL(vec, label)				\
-	EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_PR, vec);	\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec ;	\
 	EXCEPTION_PROLOG_2_REAL label, EXC_STD, 1
 
 #define STD_EXCEPTION_HV(loc, vec, label)			\
-	EXCEPTION_PROLOG(PACA_EXGEN, label, EXC_HV, KVMTEST_HV, vec)
+	EXCEPTION_PROLOG(PACA_EXGEN, label, EXC_HV, 1, vec)
 
 #define STD_EXCEPTION_HV_OOL(vec, label)			\
-	EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_HV, vec);	\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec ;		\
 	EXCEPTION_PROLOG_2_REAL label, EXC_HV, 1
 
 #define STD_RELON_EXCEPTION(loc, vec, label)		\
 	/* No guest interrupts come through here */	\
-	EXCEPTION_RELON_PROLOG(PACA_EXGEN, label, EXC_STD, NOTEST, vec)
+	EXCEPTION_RELON_PROLOG(PACA_EXGEN, label, EXC_STD, 0, vec)
 
 #define STD_RELON_EXCEPTION_OOL(vec, label)			\
-	EXCEPTION_PROLOG_1(PACA_EXGEN, NOTEST, vec);		\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, vec ;	\
 	EXCEPTION_PROLOG_2_VIRT label, EXC_STD
 
-#define STD_RELON_EXCEPTION_HV(loc, vec, label)		\
-	EXCEPTION_RELON_PROLOG(PACA_EXGEN, label, EXC_HV, KVMTEST_HV, vec)
+#define STD_RELON_EXCEPTION_HV(loc, vec, label)			\
+	EXCEPTION_RELON_PROLOG(PACA_EXGEN, label, EXC_HV, 1, vec)
 
 #define STD_RELON_EXCEPTION_HV_OOL(vec, label)			\
-	EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_HV, vec);	\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec;		\
 	EXCEPTION_PROLOG_2_VIRT label, EXC_HV
 
-.macro SOFTEN_TEST hsrr, vec, bitmask
-	lbz	r10, PACAIRQSOFTMASK(r13)
-	andi.	r10, r10, \bitmask
-	/* This associates vector numbers with bits in paca->irq_happened */
-	.if \vec == 0x500 || \vec == 0xea0
-	li	r10, PACA_IRQ_EE
-	.elseif \vec == 0x900 || \vec == 0xea0
-	li	r10, PACA_IRQ_DEC
-	.elseif \vec == 0xa00 || \vec == 0xe80
-	li	r10, PACA_IRQ_DBELL
-	.elseif \vec == 0xe60
-	li	r10, PACA_IRQ_HMI
-	.elseif \vec == 0xf00
-	li	r10, PACA_IRQ_PMI
-	.else
-	.abort "Bad maskable vector"
-	.endif
-
-
-	.if \hsrr
-	bne	masked_Hinterrupt
-	.else
-	bne	masked_interrupt
-	.endif
-.endm
-
-#define SOFTEN_TEST_PR(vec, bitmask)					\
-	KVMTEST EXC_STD, vec ;						\
-	SOFTEN_TEST EXC_STD, vec, bitmask
-
-#define SOFTEN_TEST_HV(vec, bitmask)					\
-	KVMTEST EXC_HV, vec ;						\
-	SOFTEN_TEST EXC_HV, vec, bitmask
-
-#define KVMTEST_PR(vec)							\
-	KVMTEST EXC_STD, vec
-
-#define KVMTEST_HV(vec)							\
-	KVMTEST EXC_HV, vec
-
-#define SOFTEN_NOTEST_PR(vec, bitmask)	SOFTEN_TEST EXC_STD, vec, bitmask
-#define SOFTEN_NOTEST_HV(vec, bitmask)	SOFTEN_TEST EXC_HV, vec, bitmask
-
-#define __MASKABLE_EXCEPTION(vec, label, h, extra, bitmask)		\
+#define __MASKABLE_EXCEPTION(vec, label, hsrr, kvm, bitmask)		\
 	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0(PACA_EXGEN);					\
-	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, extra, vec, bitmask);	\
-	EXCEPTION_PROLOG_2_REAL label, h, 1
+	MASKABLE_EXCEPTION_PROLOG_1 hsrr, PACA_EXGEN, kvm, vec, bitmask ; \
+	EXCEPTION_PROLOG_2_REAL label, hsrr, 1
 
 #define MASKABLE_EXCEPTION(vec, label, bitmask)				\
-	__MASKABLE_EXCEPTION(vec, label, EXC_STD, SOFTEN_TEST_PR, bitmask)
+	__MASKABLE_EXCEPTION(vec, label, EXC_STD, 1, bitmask)
 
 #define MASKABLE_EXCEPTION_OOL(vec, label, bitmask)			\
-	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, SOFTEN_TEST_PR, vec, bitmask);\
+	MASKABLE_EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, bitmask ; \
 	EXCEPTION_PROLOG_2_REAL label, EXC_STD, 1
 
 #define MASKABLE_EXCEPTION_HV(vec, label, bitmask)			\
-	__MASKABLE_EXCEPTION(vec, label, EXC_HV, SOFTEN_TEST_HV, bitmask)
+	__MASKABLE_EXCEPTION(vec, label, EXC_HV, 1, bitmask)
 
 #define MASKABLE_EXCEPTION_HV_OOL(vec, label, bitmask)			\
-	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, SOFTEN_TEST_HV, vec, bitmask);\
+	MASKABLE_EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, bitmask ; \
 	EXCEPTION_PROLOG_2_REAL label, EXC_HV, 1
 
-#define __MASKABLE_RELON_EXCEPTION(vec, label, h, extra, bitmask)	\
+#define __MASKABLE_RELON_EXCEPTION(vec, label, hsrr, kvm, bitmask)	\
 	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0(PACA_EXGEN);					\
-	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, extra, vec, bitmask);	\
-	EXCEPTION_PROLOG_2_VIRT label, h
+	MASKABLE_EXCEPTION_PROLOG_1 hsrr, PACA_EXGEN, kvm, vec, bitmask ; \
+	EXCEPTION_PROLOG_2_VIRT label, hsrr
 
 #define MASKABLE_RELON_EXCEPTION(vec, label, bitmask)			\
-	__MASKABLE_RELON_EXCEPTION(vec, label, EXC_STD, SOFTEN_NOTEST_PR, bitmask)
+	__MASKABLE_RELON_EXCEPTION(vec, label, EXC_STD, 0, bitmask)
 
 #define MASKABLE_RELON_EXCEPTION_OOL(vec, label, bitmask)		\
-	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, SOFTEN_NOTEST_PR, vec, bitmask);\
+	MASKABLE_EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, vec, bitmask ; \
 	EXCEPTION_PROLOG_2_REAL label, EXC_STD, 1
 
 #define MASKABLE_RELON_EXCEPTION_HV(vec, label, bitmask)		\
-	__MASKABLE_RELON_EXCEPTION(vec, label, EXC_HV, SOFTEN_TEST_HV, bitmask)
+	__MASKABLE_RELON_EXCEPTION(vec, label, EXC_HV, 1, bitmask)
 
 #define MASKABLE_RELON_EXCEPTION_HV_OOL(vec, label, bitmask)		\
-	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, SOFTEN_TEST_HV, vec, bitmask);\
+	MASKABLE_EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, bitmask ; \
 	EXCEPTION_PROLOG_2_VIRT label, EXC_HV
 
 /*
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 1a2ad5a022e8..f44169239e51 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -107,6 +107,17 @@ __start_interrupts:
 EXC_VIRT_NONE(0x4000, 0x100)
 
 
+EXC_REAL_BEGIN(system_reset, 0x100, 0x100)
+	SET_SCRATCH0(r13)
+	EXCEPTION_PROLOG_0(PACA_EXNMI)
+
+	/* This is EXCEPTION_PROLOG_1 with the idle feature section added */
+	OPT_SAVE_REG_TO_PACA(PACA_EXNMI+EX_PPR, r9, CPU_FTR_HAS_PPR)
+	OPT_SAVE_REG_TO_PACA(PACA_EXNMI+EX_CFAR, r10, CPU_FTR_CFAR)
+	INTERRUPT_TO_KERNEL
+	SAVE_CTR(r10, PACA_EXNMI)
+	mfcr	r9
+
 #ifdef CONFIG_PPC_P7_NAP
 	/*
 	 * If running native on arch 2.06 or later, check if we are waking up
@@ -116,30 +127,29 @@ EXC_VIRT_NONE(0x4000, 0x100)
 	 * but we branch to the 0xc000... address so we can turn on relocation
 	 * with mtmsr.
 	 */
-#define IDLETEST(n)							\
-	BEGIN_FTR_SECTION ;						\
-	mfspr	r10,SPRN_SRR1 ;						\
-	rlwinm.	r10,r10,47-31,30,31 ;					\
-	beq-	1f ;							\
-	cmpwi	cr1,r10,2 ;						\
-	mfspr	r3,SPRN_SRR1 ;						\
-	bltlr	cr1 ;	/* no state loss, return to idle caller */	\
-	BRANCH_TO_C000(r10, system_reset_idle_common) ;			\
-1:									\
-	END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206) ;	\
-	KVMTEST_PR(n)
-#else
-#define IDLETEST KVMTEST_PR
+	BEGIN_FTR_SECTION
+	mfspr	r10,SPRN_SRR1
+	rlwinm.	r10,r10,47-31,30,31
+	beq-	1f
+	cmpwi	cr1,r10,2
+	mfspr	r3,SPRN_SRR1
+	bltlr	cr1	/* no state loss, return to idle caller */
+	BRANCH_TO_C000(r10, system_reset_idle_common)
+1:
+	END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 #endif
 
-EXC_REAL_BEGIN(system_reset, 0x100, 0x100)
-	SET_SCRATCH0(r13)
+	KVMTEST EXC_STD 0x100
+	std	r11,PACA_EXNMI+EX_R11(r13)
+	std	r12,PACA_EXNMI+EX_R12(r13)
+	GET_SCRATCH0(r10)
+	std	r10,PACA_EXNMI+EX_R13(r13)
+
+	EXCEPTION_PROLOG_2_REAL system_reset_common, EXC_STD, 0
 	/*
 	 * MSR_RI is not enabled, because PACA_EXNMI and nmi stack is
 	 * being used, so a nested NMI exception would corrupt it.
 	 */
-	EXCEPTION_PROLOG_NORI(PACA_EXNMI, system_reset_common, EXC_STD,
-			      IDLETEST, 0x100)
 
 EXC_REAL_END(system_reset, 0x100, 0x100)
 EXC_VIRT_NONE(0x4100, 0x100)
@@ -246,7 +256,7 @@ TRAMP_REAL_BEGIN(system_reset_fwnmi)
 	SET_SCRATCH0(r13)		/* save r13 */
 	/* See comment at system_reset exception */
 	EXCEPTION_PROLOG_NORI(PACA_EXNMI, system_reset_common, EXC_STD,
-			      NOTEST, 0x100)
+			      0, 0x100)
 #endif /* CONFIG_PPC_PSERIES */
 
 
@@ -265,7 +275,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 EXC_REAL_END(machine_check, 0x200, 0x100)
 EXC_VIRT_NONE(0x4200, 0x100)
 TRAMP_REAL_BEGIN(machine_check_common_early)
-	EXCEPTION_PROLOG_1(PACA_EXMC, NOTEST, 0x200)
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 0, 0x200
 	/*
 	 * Register contents:
 	 * R13		= PACA
@@ -350,7 +360,7 @@ BEGIN_FTR_SECTION
 	b	machine_check_common_early
 END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
 machine_check_pSeries_0:
-	EXCEPTION_PROLOG_1(PACA_EXMC, KVMTEST_PR, 0x200)
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200
 	/*
 	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
 	 * nested machine check corrupts it. machine_check_common enables
@@ -588,7 +598,7 @@ EXCEPTION_PROLOG_0(PACA_EXGEN)
 EXC_REAL_END(data_access, 0x300, 0x80)
 
 TRAMP_REAL_BEGIN(tramp_real_data_access)
-EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_PR, 0x300)
+EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x300
 	/*
 	 * DAR/DSISR must be read before setting MSR[RI], because
 	 * a d-side MCE will clobber those registers so is not
@@ -603,7 +613,7 @@ EXCEPTION_PROLOG_2_REAL data_access_common, EXC_STD, 1
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 SET_SCRATCH0(r13)		/* save r13 */
 EXCEPTION_PROLOG_0(PACA_EXGEN)
-EXCEPTION_PROLOG_1(PACA_EXGEN, NOTEST, 0x300)
+EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x300
 	mfspr	r10,SPRN_DAR
 	mfspr	r11,SPRN_DSISR
 	std	r10,PACA_EXGEN+EX_DAR(r13)
@@ -642,7 +652,7 @@ EXCEPTION_PROLOG_0(PACA_EXSLB)
 EXC_REAL_END(data_access_slb, 0x380, 0x80)
 
 TRAMP_REAL_BEGIN(tramp_real_data_access_slb)
-EXCEPTION_PROLOG_1(PACA_EXSLB, KVMTEST_PR, 0x380)
+EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 1, 0x380
 	mfspr	r10,SPRN_DAR
 	std	r10,PACA_EXSLB+EX_DAR(r13)
 EXCEPTION_PROLOG_2_REAL data_access_slb_common, EXC_STD, 1
@@ -650,7 +660,7 @@ EXCEPTION_PROLOG_2_REAL data_access_slb_common, EXC_STD, 1
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 SET_SCRATCH0(r13)		/* save r13 */
 EXCEPTION_PROLOG_0(PACA_EXSLB)
-EXCEPTION_PROLOG_1(PACA_EXSLB, NOTEST, 0x380)
+EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 0, 0x380
 	mfspr	r10,SPRN_DAR
 	std	r10,PACA_EXSLB+EX_DAR(r13)
 EXCEPTION_PROLOG_2_VIRT data_access_slb_common, EXC_STD
@@ -705,11 +715,11 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
 EXC_REAL_BEGIN(instruction_access_slb, 0x480, 0x80)
-EXCEPTION_PROLOG(PACA_EXSLB, instruction_access_slb_common, EXC_STD, KVMTEST_PR, 0x480);
+EXCEPTION_PROLOG(PACA_EXSLB, instruction_access_slb_common, EXC_STD, 1, 0x480);
 EXC_REAL_END(instruction_access_slb, 0x480, 0x80)
 
 EXC_VIRT_BEGIN(instruction_access_slb, 0x4480, 0x80)
-EXCEPTION_RELON_PROLOG(PACA_EXSLB, instruction_access_slb_common, EXC_STD, NOTEST, 0x480);
+EXCEPTION_RELON_PROLOG(PACA_EXSLB, instruction_access_slb_common, EXC_STD, 0, 0x480);
 EXC_VIRT_END(instruction_access_slb, 0x4480, 0x80)
 
 TRAMP_KVM(PACA_EXSLB, 0x480)
@@ -757,7 +767,7 @@ hardware_interrupt_relon_hv:
 					    IRQS_DISABLED)
 	FTR_SECTION_ELSE
 		__MASKABLE_RELON_EXCEPTION(0x500, hardware_interrupt_common,
-					   EXC_STD, SOFTEN_TEST_PR, IRQS_DISABLED)
+					   EXC_STD, 1, IRQS_DISABLED)
 	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 
@@ -769,7 +779,7 @@ EXC_COMMON_ASYNC(hardware_interrupt_common, 0x500, do_IRQ)
 EXC_REAL_BEGIN(alignment, 0x600, 0x100)
 SET_SCRATCH0(r13)		/* save r13 */
 EXCEPTION_PROLOG_0(PACA_EXGEN)
-EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_PR, 0x600)
+EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x600
 	mfspr	r10,SPRN_DAR
 	mfspr	r11,SPRN_DSISR
 	std	r10,PACA_EXGEN+EX_DAR(r13)
@@ -780,7 +790,7 @@ EXC_REAL_END(alignment, 0x600, 0x100)
 EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
 SET_SCRATCH0(r13)		/* save r13 */
 EXCEPTION_PROLOG_0(PACA_EXGEN)
-EXCEPTION_PROLOG_1(PACA_EXGEN, NOTEST, 0x600)
+EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x600
 	mfspr	r10,SPRN_DAR
 	mfspr	r11,SPRN_DSISR
 	std	r10,PACA_EXGEN+EX_DAR(r13)
@@ -946,7 +956,7 @@ EXC_COMMON(trap_0b_common, 0xb00, unknown_exception)
 	GET_PACA(r13);							\
 	std	r10,PACA_EXGEN+EX_R10(r13);				\
 	INTERRUPT_TO_KERNEL;						\
-	KVMTEST_PR(0xc00); /* uses r10, branch to do_kvm_0xc00_system_call */ \
+	KVMTEST EXC_STD 0xc00 ; /* uses r10, branch to do_kvm_0xc00_system_call */ \
 	HMT_MEDIUM;							\
 	mfctr	r9;
 
@@ -1109,7 +1119,7 @@ __TRAMP_REAL_OOL_MASKABLE_HV(hmi_exception, 0xe60, IRQS_DISABLED)
 EXC_VIRT_NONE(0x4e60, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xe60)
 TRAMP_REAL_BEGIN(hmi_exception_early)
-	EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_HV, 0xe60)
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0xe60
 	mr	r10,r1			/* Save r1 */
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack for realmode */
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
@@ -1311,7 +1321,7 @@ EXC_VIRT_NONE(0x5400, 0x100)
 EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
 	mtspr	SPRN_SPRG_HSCRATCH0,r13
 	EXCEPTION_PROLOG_0(PACA_EXGEN)
-	EXCEPTION_PROLOG_1(PACA_EXGEN, NOTEST, 0x1500)
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 0, 0x1500
 
 #ifdef CONFIG_PPC_DENORMALISATION
 	mfspr	r10,SPRN_HSRR1
@@ -1319,7 +1329,7 @@ EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
 	bne+	denorm_assist
 #endif
 
-	KVMTEST_HV(0x1500)
+	KVMTEST EXC_HV 0x1500
 	EXCEPTION_PROLOG_2_REAL denorm_common, EXC_HV, 1
 EXC_REAL_END(denorm_exception_hv, 0x1500, 0x100)
 
-- 
2.20.1

