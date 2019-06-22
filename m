Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C774F5E0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 15:24:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WGVC5nntzDqbs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 23:24:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CCjaCQEH"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WGKB2HY2zDqZy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 23:16:13 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id r1so4965752pfq.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 06:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wHzgK8ctsEMZ72tBLSQomgHgEoD5UHcPPI5IQtP9PQY=;
 b=CCjaCQEHP6EjRjr2msEmk6KqEXfdzHah8RvzEcLLubbHS0rvPNs9+V6AApD0A4S8Xc
 5nlhh2NtILve+jBd05dRKh2zQKRKrxOsXf/JD/21ua9dlpA9TLEzpPRttwS3Ckv2v48M
 trDx9uOp6BlAJjK7RSgk6taqmuwK6HLKu4NbkOmlTeFI4quiNKwAXgqpU9padNzFBlK0
 Mlq+paAtuu8nVO6UzGsAMuwnNO1yfpUBFuqWdQvp9WZHdc1z7t9jyjfom4WvlndYYe0i
 sCQ8iViC0RvqGWpQQGWpw9Uluh9tno10HnQ6Mc4yJSw1nqBiALXdk/NCxropmbuDb/k8
 c5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wHzgK8ctsEMZ72tBLSQomgHgEoD5UHcPPI5IQtP9PQY=;
 b=VwNutTyJrNFElKTBCD4GpfFrp+VfbaCTKOv+pfnBHWtEjYHZMz5b9d4M0LBLvqRI01
 9W0eFbjpW59GrNcqvIlbdb5jurDq+RQGAOui9kI3qNSeA4wqwmOcdvQrvJr1pz9C38tq
 FjUjr0L/owa7HtfRYfsab+qGnTZ7Wc3vOW3X/Tvhbc0gGQR9kgDLZGnLBufG3xHXgBZn
 kxeXmHZ/P9ttIh56kEccxEiGBXIObFBeM+zGjSTUUMzy0qCmlFg/yWMZurzU2VoxfwWH
 v3io/lv9xDtpPR5FJ185cUpev302I5EgLCEjKXSoRv0djTnsBXbpTgQSM+ux3wlExj84
 8fww==
X-Gm-Message-State: APjAAAX8cZgXhw410SN71chd38x2LBvuC5EtZ6cWwtr9TpQJkcp+/BO7
 kmQslmoTMqZUvOkek+MPcZ28M7G0
X-Google-Smtp-Source: APXvYqy+U4rOOJkh/8cQJYRFo65ziQYszumzy9X3ud9sr04kaw600CacGCr0gY1ANomb3hTapsqzlA==
X-Received: by 2002:a17:90a:2768:: with SMTP id
 o95mr13014802pje.37.1561209371540; 
 Sat, 22 Jun 2019 06:16:11 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.144.136.2])
 by smtp.gmail.com with ESMTPSA id n1sm5192471pgv.15.2019.06.22.06.16.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 06:16:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 02/25] powerpc/64s/exception: consolidate
 EXCEPTION_PROLOG_2 with _NORI variant
Date: Sat, 22 Jun 2019 23:15:12 +1000
Message-Id: <20190622131535.20996-3-npiggin@gmail.com>
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

Switch to a gas macro that conditionally expands the RI clearing
instruction.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 43 ++++++------------------
 arch/powerpc/kernel/exceptions-64s.S     | 12 +++----
 2 files changed, 17 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 1496e4089cee..94c4992188a7 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -319,32 +319,11 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define EXCEPTION_PROLOG_1(area, extra, vec)				\
 	_EXCEPTION_PROLOG_1(area, extra, vec)
 
-.macro EXCEPTION_PROLOG_2 label, hsrr
-	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
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
-/* _NORI variant keeps MSR_RI clear */
-.macro EXCEPTION_PROLOG_2_NORI label, hsrr
+.macro EXCEPTION_PROLOG_2 label, hsrr, set_ri
 	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
+	.if ! \set_ri
 	xori	r10,r10,MSR_RI		/* Clear MSR_RI */
+	.endif
 	.if \hsrr
 	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
 	.else
@@ -369,7 +348,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0(area);					\
 	EXCEPTION_PROLOG_1(area, extra, vec);				\
-	EXCEPTION_PROLOG_2 label, h
+	EXCEPTION_PROLOG_2 label, h, 1
 
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 /*
@@ -438,7 +417,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define EXCEPTION_PROLOG_NORI(area, label, h, extra, vec)		\
 	EXCEPTION_PROLOG_0(area);					\
 	EXCEPTION_PROLOG_1(area, extra, vec);				\
-	EXCEPTION_PROLOG_2_NORI label, h
+	EXCEPTION_PROLOG_2 label, h, 0
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 .macro KVMTEST hsrr, n
@@ -595,14 +574,14 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 
 #define STD_EXCEPTION_OOL(vec, label)				\
 	EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_PR, vec);	\
-	EXCEPTION_PROLOG_2 label, EXC_STD
+	EXCEPTION_PROLOG_2 label, EXC_STD, 1
 
 #define STD_EXCEPTION_HV(loc, vec, label)			\
 	EXCEPTION_PROLOG(PACA_EXGEN, label, EXC_HV, KVMTEST_HV, vec)
 
 #define STD_EXCEPTION_HV_OOL(vec, label)			\
 	EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_HV, vec);	\
-	EXCEPTION_PROLOG_2 label, EXC_HV
+	EXCEPTION_PROLOG_2 label, EXC_HV, 1
 
 #define STD_RELON_EXCEPTION(loc, vec, label)		\
 	/* No guest interrupts come through here */	\
@@ -666,21 +645,21 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0(PACA_EXGEN);					\
 	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, extra, vec, bitmask);	\
-	EXCEPTION_PROLOG_2 label, h
+	EXCEPTION_PROLOG_2 label, h, 1
 
 #define MASKABLE_EXCEPTION(vec, label, bitmask)				\
 	__MASKABLE_EXCEPTION(vec, label, EXC_STD, SOFTEN_TEST_PR, bitmask)
 
 #define MASKABLE_EXCEPTION_OOL(vec, label, bitmask)			\
 	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, SOFTEN_TEST_PR, vec, bitmask);\
-	EXCEPTION_PROLOG_2 label, EXC_STD
+	EXCEPTION_PROLOG_2 label, EXC_STD, 1
 
 #define MASKABLE_EXCEPTION_HV(vec, label, bitmask)			\
 	__MASKABLE_EXCEPTION(vec, label, EXC_HV, SOFTEN_TEST_HV, bitmask)
 
 #define MASKABLE_EXCEPTION_HV_OOL(vec, label, bitmask)			\
 	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, SOFTEN_TEST_HV, vec, bitmask);\
-	EXCEPTION_PROLOG_2 label, EXC_HV
+	EXCEPTION_PROLOG_2 label, EXC_HV, 1
 
 #define __MASKABLE_RELON_EXCEPTION(vec, label, h, extra, bitmask)	\
 	SET_SCRATCH0(r13);    /* save r13 */				\
@@ -693,7 +672,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 
 #define MASKABLE_RELON_EXCEPTION_OOL(vec, label, bitmask)		\
 	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, SOFTEN_NOTEST_PR, vec, bitmask);\
-	EXCEPTION_PROLOG_2 label, EXC_STD
+	EXCEPTION_PROLOG_2 label, EXC_STD, 1
 
 #define MASKABLE_RELON_EXCEPTION_HV(vec, label, bitmask)		\
 	__MASKABLE_RELON_EXCEPTION(vec, label, EXC_HV, SOFTEN_TEST_HV, bitmask)
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 8996165fd357..32d1d1b89a2e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -356,7 +356,7 @@ machine_check_pSeries_0:
 	 * nested machine check corrupts it. machine_check_common enables
 	 * MSR_RI.
 	 */
-	EXCEPTION_PROLOG_2_NORI machine_check_common, EXC_STD
+	EXCEPTION_PROLOG_2 machine_check_common, EXC_STD, 0
 
 TRAMP_KVM_SKIP(PACA_EXMC, 0x200)
 
@@ -598,7 +598,7 @@ EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_PR, 0x300)
 	mfspr	r11,SPRN_DSISR
 	std	r10,PACA_EXGEN+EX_DAR(r13)
 	stw	r11,PACA_EXGEN+EX_DSISR(r13)
-EXCEPTION_PROLOG_2 data_access_common, EXC_STD
+EXCEPTION_PROLOG_2 data_access_common, EXC_STD, 1
 
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 SET_SCRATCH0(r13)		/* save r13 */
@@ -645,7 +645,7 @@ TRAMP_REAL_BEGIN(tramp_real_data_access_slb)
 EXCEPTION_PROLOG_1(PACA_EXSLB, KVMTEST_PR, 0x380)
 	mfspr	r10,SPRN_DAR
 	std	r10,PACA_EXSLB+EX_DAR(r13)
-EXCEPTION_PROLOG_2 data_access_slb_common, EXC_STD
+EXCEPTION_PROLOG_2 data_access_slb_common, EXC_STD, 1
 
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 SET_SCRATCH0(r13)		/* save r13 */
@@ -774,7 +774,7 @@ EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_PR, 0x600)
 	mfspr	r11,SPRN_DSISR
 	std	r10,PACA_EXGEN+EX_DAR(r13)
 	stw	r11,PACA_EXGEN+EX_DSISR(r13)
-EXCEPTION_PROLOG_2 alignment_common, EXC_STD
+EXCEPTION_PROLOG_2 alignment_common, EXC_STD, 1
 EXC_REAL_END(alignment, 0x600, 0x100)
 
 EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
@@ -1320,7 +1320,7 @@ EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
 #endif
 
 	KVMTEST_HV(0x1500)
-	EXCEPTION_PROLOG_2 denorm_common, EXC_HV
+	EXCEPTION_PROLOG_2 denorm_common, EXC_HV, 1
 EXC_REAL_END(denorm_exception_hv, 0x1500, 0x100)
 
 #ifdef CONFIG_PPC_DENORMALISATION
@@ -1442,7 +1442,7 @@ EXC_VIRT_NONE(0x5800, 0x100)
 	std	r12,PACA_EXGEN+EX_R12(r13);		\
 	GET_SCRATCH0(r10);				\
 	std	r10,PACA_EXGEN+EX_R13(r13);		\
-	EXCEPTION_PROLOG_2 soft_nmi_common, _H
+	EXCEPTION_PROLOG_2 soft_nmi_common, _H, 1
 
 /*
  * Branch to soft_nmi_interrupt using the emergency stack. The emergency
-- 
2.20.1

