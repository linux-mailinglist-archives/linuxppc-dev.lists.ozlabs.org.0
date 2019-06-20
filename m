Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A09494C6C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 07:25:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tqyd1CMKzDqjy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 15:25:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HvpK5row"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tql10XQczDqwD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:15:08 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id v9so902093pgr.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DuEXSteNodC0juf6/ABHV6NqMeGgMzzfkxs3b8Bf/c8=;
 b=HvpK5rowPmJ4Ij1lLpcI6tnW8PuMctOEhwA1C17La/wDGlDJMf6HYvIZQvN5c7gc0o
 Mo/b1LCt56YnmxZYcJOtnNjUUUTPCIcD/NmLyQNPxjGz0Qjrfc/U78M4nxWN7kKADPrv
 t9bEoe3SDddwwBinzMQKkA7QST/truMMYIaE9rtpZmYqONqJV1qcKxjwWZE5hh9XqqXl
 aarH7X1dK9ZiQ5b2wvnr+tcjHdXgiBnnwHOah8R/wPP/CfQjFR+DJIwlbjk2GwjFwMsR
 2Q2cm7968p8brauD5Dqol1Yxx4jqpaYeW1zNEQT8XtnOTKE3mJVbMyoS29dlFXOXxUJj
 5vtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DuEXSteNodC0juf6/ABHV6NqMeGgMzzfkxs3b8Bf/c8=;
 b=Xo8ZP+r2S8hDDErvNOdXY8/ieq7bo5lIAVbV1aQsh7xnsE28mVe15uQo5IgkL11oz4
 DYRnpoQ1+iIKdKN6ovBd/f6YErlYF7c+tSVOD/iK/Cri8MZ48SmyitsPLRDZSxH7Snav
 fTh2jSbaWP0V/0YVLSqYJYR5RhZpDojeBvdzzzxMXQM1fUj8FfTzPfBfJkgEwJAs5fVp
 ubuZyDWC9nvd51pwhcxDlajqBHaVF+JFv/gLdtHN/EFBBepijnjASU1/Yd487Hmrhqgu
 bCihE7redy31QYDxwNs1rWSro6GJ2iBk9GiWZR8NEBnTDCcwWZrSTnQpyNohRUFLQVqG
 pAdw==
X-Gm-Message-State: APjAAAUGgGKgDPa2zgudRLjRbT9y74T2aNSsATZ+/pIKq82JirPeG94g
 +W2iOvErYMxVVm1Zz57Eq/UCSPV4
X-Google-Smtp-Source: APXvYqy8amhtBV0tj9YvGMcqfPwp4jDWfvn61FDwYyRgi95S1NDx0dsHA6nbneYpofQkSDhxN+ndkQ==
X-Received: by 2002:a62:e20a:: with SMTP id a10mr43324512pfi.64.1561007706406; 
 Wed, 19 Jun 2019 22:15:06 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:15:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 04/52] powerpc/64s/exception: move and tidy
 EXCEPTION_PROLOG_2 variants
Date: Thu, 20 Jun 2019 15:14:11 +1000
Message-Id: <20190620051459.29573-5-npiggin@gmail.com>
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

- Re-name the macros to _REAL and _VIRT suffixes rather than no and
  _RELON suffix.

- Move the macro definitions together in the file.

- Move RELOCATABLE ifdef inside the _VIRT macro.

Further consolidation between variants does not buy much here.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 87 ++++++++++++------------
 arch/powerpc/kernel/exceptions-64s.S     | 18 ++---
 2 files changed, 51 insertions(+), 54 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 94c4992188a7..4aef70defcdd 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -170,8 +170,33 @@
 	ori	reg,reg,(ABS_ADDR(label))@l;				\
 	addis	reg,reg,(ABS_ADDR(label))@h
 
+.macro EXCEPTION_PROLOG_2_REAL label, hsrr, set_ri
+	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
+	.if ! \set_ri
+	xori	r10,r10,MSR_RI		/* Clear MSR_RI */
+	.endif
+	.if \hsrr
+	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
+	.else
+	mfspr	r11,SPRN_SRR0		/* save SRR0 */
+	.endif
+	LOAD_HANDLER(r12, \label\())
+	.if \hsrr
+	mtspr	SPRN_HSRR0,r12
+	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
+	mtspr	SPRN_HSRR1,r10
+	HRFI_TO_KERNEL
+	.else
+	mtspr	SPRN_SRR0,r12
+	mfspr	r12,SPRN_SRR1		/* and SRR1 */
+	mtspr	SPRN_SRR1,r10
+	RFI_TO_KERNEL
+	.endif
+	b	.	/* prevent speculative execution */
+.endm
+
+.macro EXCEPTION_PROLOG_2_VIRT label, hsrr
 #ifdef CONFIG_RELOCATABLE
-.macro EXCEPTION_PROLOG_2_RELON label, hsrr
 	.if \hsrr
 	mfspr	r11,SPRN_HSRR0	/* save HSRR0 */
 	.else
@@ -187,10 +212,7 @@
 	li	r10,MSR_RI
 	mtmsrd 	r10,1		/* Set RI (EE=0) */
 	bctr
-.endm
 #else
-/* If not relocatable, we can jump directly -- and save messing with LR */
-.macro EXCEPTION_PROLOG_2_RELON label, hsrr
 	.if \hsrr
 	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
 	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
@@ -201,19 +223,19 @@
 	li	r10,MSR_RI
 	mtmsrd 	r10,1			/* Set RI (EE=0) */
 	b	\label
-.endm
 #endif
+.endm
 
 /*
  * As EXCEPTION_PROLOG(), except we've already got relocation on so no need to
- * rfid. Save LR in case we're CONFIG_RELOCATABLE, in which case
- * EXCEPTION_PROLOG_2_RELON will be using LR.
+ * rfid. Save CTR in case we're CONFIG_RELOCATABLE, in which case
+ * EXCEPTION_PROLOG_2_VIRT will be using CTR.
  */
 #define EXCEPTION_RELON_PROLOG(area, label, hsrr, extra, vec)		\
 	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0(area);					\
 	EXCEPTION_PROLOG_1(area, extra, vec);				\
-	EXCEPTION_PROLOG_2_RELON label, hsrr
+	EXCEPTION_PROLOG_2_VIRT label, hsrr
 
 /* Exception register prefixes */
 #define EXC_HV		1
@@ -319,36 +341,11 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define EXCEPTION_PROLOG_1(area, extra, vec)				\
 	_EXCEPTION_PROLOG_1(area, extra, vec)
 
-.macro EXCEPTION_PROLOG_2 label, hsrr, set_ri
-	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
-	.if ! \set_ri
-	xori	r10,r10,MSR_RI		/* Clear MSR_RI */
-	.endif
-	.if \hsrr
-	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
-	.else
-	mfspr	r11,SPRN_SRR0		/* save SRR0 */
-	.endif
-	LOAD_HANDLER(r12,\label\())
-	.if \hsrr
-	mtspr	SPRN_HSRR0,r12
-	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
-	mtspr	SPRN_HSRR1,r10
-	HRFI_TO_KERNEL
-	.else
-	mtspr	SPRN_SRR0,r12
-	mfspr	r12,SPRN_SRR1		/* and SRR1 */
-	mtspr	SPRN_SRR1,r10
-	RFI_TO_KERNEL
-	.endif
-	b	.	/* prevent speculative execution */
-.endm
-
 #define EXCEPTION_PROLOG(area, label, h, extra, vec)			\
 	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0(area);					\
 	EXCEPTION_PROLOG_1(area, extra, vec);				\
-	EXCEPTION_PROLOG_2 label, h, 1
+	EXCEPTION_PROLOG_2_REAL label, h, 1
 
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 /*
@@ -417,7 +414,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define EXCEPTION_PROLOG_NORI(area, label, h, extra, vec)		\
 	EXCEPTION_PROLOG_0(area);					\
 	EXCEPTION_PROLOG_1(area, extra, vec);				\
-	EXCEPTION_PROLOG_2 label, h, 0
+	EXCEPTION_PROLOG_2_REAL label, h, 0
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 .macro KVMTEST hsrr, n
@@ -574,14 +571,14 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 
 #define STD_EXCEPTION_OOL(vec, label)				\
 	EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_PR, vec);	\
-	EXCEPTION_PROLOG_2 label, EXC_STD, 1
+	EXCEPTION_PROLOG_2_REAL label, EXC_STD, 1
 
 #define STD_EXCEPTION_HV(loc, vec, label)			\
 	EXCEPTION_PROLOG(PACA_EXGEN, label, EXC_HV, KVMTEST_HV, vec)
 
 #define STD_EXCEPTION_HV_OOL(vec, label)			\
 	EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_HV, vec);	\
-	EXCEPTION_PROLOG_2 label, EXC_HV, 1
+	EXCEPTION_PROLOG_2_REAL label, EXC_HV, 1
 
 #define STD_RELON_EXCEPTION(loc, vec, label)		\
 	/* No guest interrupts come through here */	\
@@ -589,14 +586,14 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 
 #define STD_RELON_EXCEPTION_OOL(vec, label)			\
 	EXCEPTION_PROLOG_1(PACA_EXGEN, NOTEST, vec);		\
-	EXCEPTION_PROLOG_2_RELON label, EXC_STD
+	EXCEPTION_PROLOG_2_VIRT label, EXC_STD
 
 #define STD_RELON_EXCEPTION_HV(loc, vec, label)		\
 	EXCEPTION_RELON_PROLOG(PACA_EXGEN, label, EXC_HV, KVMTEST_HV, vec)
 
 #define STD_RELON_EXCEPTION_HV_OOL(vec, label)			\
 	EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_HV, vec);	\
-	EXCEPTION_PROLOG_2_RELON label, EXC_HV
+	EXCEPTION_PROLOG_2_VIRT label, EXC_HV
 
 .macro SOFTEN_TEST hsrr, vec, bitmask
 	lbz	r10, PACAIRQSOFTMASK(r13)
@@ -645,41 +642,41 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0(PACA_EXGEN);					\
 	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, extra, vec, bitmask);	\
-	EXCEPTION_PROLOG_2 label, h, 1
+	EXCEPTION_PROLOG_2_REAL label, h, 1
 
 #define MASKABLE_EXCEPTION(vec, label, bitmask)				\
 	__MASKABLE_EXCEPTION(vec, label, EXC_STD, SOFTEN_TEST_PR, bitmask)
 
 #define MASKABLE_EXCEPTION_OOL(vec, label, bitmask)			\
 	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, SOFTEN_TEST_PR, vec, bitmask);\
-	EXCEPTION_PROLOG_2 label, EXC_STD, 1
+	EXCEPTION_PROLOG_2_REAL label, EXC_STD, 1
 
 #define MASKABLE_EXCEPTION_HV(vec, label, bitmask)			\
 	__MASKABLE_EXCEPTION(vec, label, EXC_HV, SOFTEN_TEST_HV, bitmask)
 
 #define MASKABLE_EXCEPTION_HV_OOL(vec, label, bitmask)			\
 	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, SOFTEN_TEST_HV, vec, bitmask);\
-	EXCEPTION_PROLOG_2 label, EXC_HV, 1
+	EXCEPTION_PROLOG_2_REAL label, EXC_HV, 1
 
 #define __MASKABLE_RELON_EXCEPTION(vec, label, h, extra, bitmask)	\
 	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0(PACA_EXGEN);					\
 	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, extra, vec, bitmask);	\
-	EXCEPTION_PROLOG_2_RELON label, h
+	EXCEPTION_PROLOG_2_VIRT label, h
 
 #define MASKABLE_RELON_EXCEPTION(vec, label, bitmask)			\
 	__MASKABLE_RELON_EXCEPTION(vec, label, EXC_STD, SOFTEN_NOTEST_PR, bitmask)
 
 #define MASKABLE_RELON_EXCEPTION_OOL(vec, label, bitmask)		\
 	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, SOFTEN_NOTEST_PR, vec, bitmask);\
-	EXCEPTION_PROLOG_2 label, EXC_STD, 1
+	EXCEPTION_PROLOG_2_REAL label, EXC_STD, 1
 
 #define MASKABLE_RELON_EXCEPTION_HV(vec, label, bitmask)		\
 	__MASKABLE_RELON_EXCEPTION(vec, label, EXC_HV, SOFTEN_TEST_HV, bitmask)
 
 #define MASKABLE_RELON_EXCEPTION_HV_OOL(vec, label, bitmask)		\
 	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, SOFTEN_TEST_HV, vec, bitmask);\
-	EXCEPTION_PROLOG_2_RELON label, EXC_HV
+	EXCEPTION_PROLOG_2_VIRT label, EXC_HV
 
 /*
  * Our exception common code can be passed various "additions"
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 75becb248d61..bb286f7e1aee 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -356,7 +356,7 @@ machine_check_pSeries_0:
 	 * nested machine check corrupts it. machine_check_common enables
 	 * MSR_RI.
 	 */
-	EXCEPTION_PROLOG_2 machine_check_common, EXC_STD, 0
+	EXCEPTION_PROLOG_2_REAL machine_check_common, EXC_STD, 0
 
 TRAMP_KVM_SKIP(PACA_EXMC, 0x200)
 
@@ -598,7 +598,7 @@ EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_PR, 0x300)
 	mfspr	r11,SPRN_DSISR
 	std	r10,PACA_EXGEN+EX_DAR(r13)
 	stw	r11,PACA_EXGEN+EX_DSISR(r13)
-EXCEPTION_PROLOG_2 data_access_common, EXC_STD, 1
+EXCEPTION_PROLOG_2_REAL data_access_common, EXC_STD, 1
 
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 SET_SCRATCH0(r13)		/* save r13 */
@@ -608,7 +608,7 @@ EXCEPTION_PROLOG_1(PACA_EXGEN, NOTEST, 0x300)
 	mfspr	r11,SPRN_DSISR
 	std	r10,PACA_EXGEN+EX_DAR(r13)
 	stw	r11,PACA_EXGEN+EX_DSISR(r13)
-EXCEPTION_PROLOG_2_RELON data_access_common, EXC_STD
+EXCEPTION_PROLOG_2_VIRT data_access_common, EXC_STD
 EXC_VIRT_END(data_access, 0x4300, 0x80)
 
 TRAMP_KVM_SKIP(PACA_EXGEN, 0x300)
@@ -645,7 +645,7 @@ TRAMP_REAL_BEGIN(tramp_real_data_access_slb)
 EXCEPTION_PROLOG_1(PACA_EXSLB, KVMTEST_PR, 0x380)
 	mfspr	r10,SPRN_DAR
 	std	r10,PACA_EXSLB+EX_DAR(r13)
-EXCEPTION_PROLOG_2 data_access_slb_common, EXC_STD, 1
+EXCEPTION_PROLOG_2_REAL data_access_slb_common, EXC_STD, 1
 
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 SET_SCRATCH0(r13)		/* save r13 */
@@ -653,7 +653,7 @@ EXCEPTION_PROLOG_0(PACA_EXSLB)
 EXCEPTION_PROLOG_1(PACA_EXSLB, NOTEST, 0x380)
 	mfspr	r10,SPRN_DAR
 	std	r10,PACA_EXSLB+EX_DAR(r13)
-EXCEPTION_PROLOG_2_RELON data_access_slb_common, EXC_STD
+EXCEPTION_PROLOG_2_VIRT data_access_slb_common, EXC_STD
 EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
 
 TRAMP_KVM_SKIP(PACA_EXSLB, 0x380)
@@ -774,7 +774,7 @@ EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_PR, 0x600)
 	mfspr	r11,SPRN_DSISR
 	std	r10,PACA_EXGEN+EX_DAR(r13)
 	stw	r11,PACA_EXGEN+EX_DSISR(r13)
-EXCEPTION_PROLOG_2 alignment_common, EXC_STD, 1
+EXCEPTION_PROLOG_2_REAL alignment_common, EXC_STD, 1
 EXC_REAL_END(alignment, 0x600, 0x100)
 
 EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
@@ -785,7 +785,7 @@ EXCEPTION_PROLOG_1(PACA_EXGEN, NOTEST, 0x600)
 	mfspr	r11,SPRN_DSISR
 	std	r10,PACA_EXGEN+EX_DAR(r13)
 	stw	r11,PACA_EXGEN+EX_DSISR(r13)
-EXCEPTION_PROLOG_2_RELON alignment_common, EXC_STD
+EXCEPTION_PROLOG_2_VIRT alignment_common, EXC_STD
 EXC_VIRT_END(alignment, 0x4600, 0x100)
 
 TRAMP_KVM(PACA_EXGEN, 0x600)
@@ -1320,7 +1320,7 @@ EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
 #endif
 
 	KVMTEST_HV(0x1500)
-	EXCEPTION_PROLOG_2 denorm_common, EXC_HV, 1
+	EXCEPTION_PROLOG_2_REAL denorm_common, EXC_HV, 1
 EXC_REAL_END(denorm_exception_hv, 0x1500, 0x100)
 
 #ifdef CONFIG_PPC_DENORMALISATION
@@ -1442,7 +1442,7 @@ EXC_VIRT_NONE(0x5800, 0x100)
 	std	r12,PACA_EXGEN+EX_R12(r13);		\
 	GET_SCRATCH0(r10);				\
 	std	r10,PACA_EXGEN+EX_R13(r13);		\
-	EXCEPTION_PROLOG_2 soft_nmi_common, _H, 1
+	EXCEPTION_PROLOG_2_REAL soft_nmi_common, _H, 1
 
 /*
  * Branch to soft_nmi_interrupt using the emergency stack. The emergency
-- 
2.20.1

