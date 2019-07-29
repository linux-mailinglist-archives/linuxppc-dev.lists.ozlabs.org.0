Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E97D78E4B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 16:44:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y2XK10y3zDqNH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 00:44:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="elVguufo"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1rT6b0jzDq96
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:13:45 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id a93so27524008pla.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 07:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kocZ+uuosBLG4VC629T/wnqsmnJi8ziwtOd7GuMhRe0=;
 b=elVguufodMpeAdiWW91k+aZ9X1s3hMY5G1hMUEce0L04nPeDYsZrKZY66u0BYTY8qL
 bOg7fac12W42gS2waFPMfgL/bbow6R5gVoFbpqNvQ9ozDayYWDeKmJncayHRv8SmM3Dy
 +lQRi9M+5yJZP5KNnimInafk1CybmMkNPWoeJm2S7bOIEMocyBPW2CoGlxzCSwG2uhgi
 ljeDUrDnfBodjEdR+qtAZQVIDF9/nTJGQNQtotC4fHDYtLT6FnvpRw/XsIc8Yt3mdUM+
 H8XabRclR4appYMM9+DgWYWvlIKvcPKqti+8MFLvmSEphVSgtik6Izznt0ndfQ0k5j9Y
 nziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kocZ+uuosBLG4VC629T/wnqsmnJi8ziwtOd7GuMhRe0=;
 b=ksHI993qZ21biF/PjewPlldGiaiRFRuDIrMUt5izXQQ1mR+GO5GUtFmQ2Y7jY5PIN8
 J7ocTKHFwYb04B52itW6WQinxC67mu4AHJDYCvcX6mYbg0+exuOjUHJ5ZcRcYPCNu2O7
 aI0X6I0ROR5jCqEaE620l43gI2l+MkjgTFM9PB6r5wQvWRGNp/6hcqDxkLI0NIxoqmZq
 yuYghg+JYPvDU6zlbF5VoR0L++7d4lDhEP1ROqSlgR2qkqO62MdOqt4INA+xmsrZEYYM
 cVbR6TdnpJU2aTitWAVu+xpoV1IDSRMIJx+vteXl8l56HC8/R1PJZ9XlEbD4G9KWAddR
 QMQA==
X-Gm-Message-State: APjAAAU3VZ1guvOJPlgcrmPBy5VVgPiiOZ7S2xu7BuuT09gcuFkBcZ67
 h5KgXhUmLnucPNCKxM6R4VwEf/T8mjk=
X-Google-Smtp-Source: APXvYqx6d1O1yioHVBkb3CkJ9QZ0B02u2EA/DKFVC7WdOwfWC3nxLSQIilGoz90OqCHTEVqinVJ6tg==
X-Received: by 2002:a17:902:2aa9:: with SMTP id
 j38mr105274632plb.206.1564409622003; 
 Mon, 29 Jul 2019 07:13:42 -0700 (PDT)
Received: from bobo.local0.net (61-68-184-39.tpgi.com.au. [61.68.184.39])
 by smtp.gmail.com with ESMTPSA id u7sm53960083pfm.96.2019.07.29.07.13.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:13:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/18] powerpc/64s/exception: Replace PROLOG macros and EXC
 helpers with a gas macro
Date: Tue, 30 Jul 2019 00:12:35 +1000
Message-Id: <20190729141247.26762-7-npiggin@gmail.com>
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

This creates a single macro that generates the exception prolog code,
with variants specified by arguments, rather than assorted nested
macros for different variants.

The increasing length of macro argument list is not nice to read or
modify, but this is a temporary condition that will be improved in
later changes.

No generated code change except BUG line number constants and label
names.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 502 +++++++++++----------------
 1 file changed, 206 insertions(+), 296 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 9c407392774c..b07de1106d9e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -43,6 +43,17 @@
 .endif
 #endif
 
+/*
+ * Following are fixed section helper macros.
+ *
+ * EXC_REAL_BEGIN/END  - real, unrelocated exception vectors
+ * EXC_VIRT_BEGIN/END  - virt (AIL), unrelocated exception vectors
+ * TRAMP_REAL_BEGIN    - real, unrelocated helpers (virt may call these)
+ * TRAMP_VIRT_BEGIN    - virt, unreloc helpers (in practice, real can use)
+ * TRAMP_KVM_BEGIN     - KVM handlers, these are put into real, unrelocated
+ * EXC_COMMON          - After switching to virtual, relocated mode.
+ */
+
 #define EXC_REAL_BEGIN(name, start, size)			\
 	FIXED_SECTION_ENTRY_BEGIN_LOCATION(real_vectors, exc_real_##start##_##name, start, size)
 
@@ -589,196 +600,54 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 #endif
 
 /*
- * Following are the BOOK3S exception handler helper macros.
- * Handlers come in a number of types, and each type has a number of varieties.
- *
- * EXC_REAL_*     - real, unrelocated exception vectors
- * EXC_VIRT_*     - virt (AIL), unrelocated exception vectors
- * TRAMP_REAL_*   - real, unrelocated helpers (virt can call these)
- * TRAMP_VIRT_*   - virt, unreloc helpers (in practice, real can use)
- * TRAMP_KVM      - KVM handlers that get put into real, unrelocated
- * EXC_COMMON     - virt, relocated common handlers
- *
- * The EXC handlers are given a name, and branch to name_common, or the
- * appropriate KVM or masking function. Vector handler verieties are as
- * follows:
- *
- * EXC_{REAL|VIRT}_BEGIN/END - used to open-code the exception
- *
- * EXC_{REAL|VIRT}  - standard exception
- *
- * EXC_{REAL|VIRT}_suffix
- *     where _suffix is:
- *   - _MASKABLE               - maskable exception
- *   - _OOL                    - out of line with trampoline to common handler
- *   - _HV                     - HV exception
- *
- * There can be combinations, e.g., EXC_VIRT_OOL_MASKABLE_HV
+ * This is the BOOK3S interrupt entry code macro.
  *
- * KVM handlers come in the following verieties:
- * TRAMP_KVM
- * TRAMP_KVM_SKIP
- * TRAMP_KVM_HV
- * TRAMP_KVM_HV_SKIP
- *
- * COMMON handlers come in the following verieties:
- * EXC_COMMON_BEGIN/END - used to open-code the handler
- * EXC_COMMON
- * EXC_COMMON_ASYNC
- *
- * TRAMP_REAL and TRAMP_VIRT can be used with BEGIN/END. KVM
- * and OOL handlers are implemented as types of TRAMP and TRAMP_VIRT handlers.
+ * This can result in one of several things happening:
+ * - Branch to the _common handler, relocated, in virtual mode.
+ *   These are normal interrupts (synchronous and asynchronous) handled by
+ *   the kernel.
+ * - Branch to KVM, relocated but real mode interrupts remain in real mode.
+ *   These occur when HSTATE_IN_GUEST is set. The interrupt may be caused by
+ *   / intended for host or guest kernel, but KVM must always be involved
+ *   because the machine state is set for guest execution.
+ * - Branch to the masked handler, unrelocated.
+ *   These occur when maskable asynchronous interrupts are taken with the
+ *   irq_soft_mask set.
+ * - Branch to an "early" handler in real mode but relocated.
+ *   This is done if early=1. MCE and HMI use these to handle errors in real
+ *   mode.
+ * - Fall through and continue executing in real, unrelocated mode.
+ *   This is done if early=2.
  */
+.macro INT_HANDLER name, vec, ool, early, virt, hsrr, area, ri, dar, dsisr, bitmask, kvm
+	EXCEPTION_PROLOG_0 \area
+	.if \ool
+	.if !\virt
+	b	tramp_real_\name
+	.pushsection .text
+	TRAMP_REAL_BEGIN(tramp_real_\name)
+	.else
+	b	tramp_virt_\name
+	.pushsection .text
+	TRAMP_VIRT_BEGIN(tramp_virt_\name)
+	.endif
+	.endif
+	EXCEPTION_PROLOG_1 \hsrr, \area, \kvm, \vec, \dar, \dsisr, \bitmask
+	.if \early == 2
+	/* nothing more */
+	.elseif \early
+	mfctr	r10			/* save ctr, even for !RELOCATABLE */
+	BRANCH_TO_C000(r11, \name\()_early_common)
+	.elseif !\virt
+	EXCEPTION_PROLOG_2_REAL \name\()_common, \hsrr, \ri
+	.else
+	EXCEPTION_PROLOG_2_VIRT \name\()_common, \hsrr
+	.endif
+	.if \ool
+	.popsection
+	.endif
+.endm
 
-#define __EXC_REAL(name, start, size, area)				\
-	EXC_REAL_BEGIN(name, start, size);				\
-	EXCEPTION_PROLOG_0 area ;					\
-	EXCEPTION_PROLOG_1 EXC_STD, area, 1, start, 0, 0, 0 ;		\
-	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1 ;		\
-	EXC_REAL_END(name, start, size)
-
-#define EXC_REAL(name, start, size)					\
-	__EXC_REAL(name, start, size, PACA_EXGEN)
-
-#define __EXC_VIRT(name, start, size, realvec, area)			\
-	EXC_VIRT_BEGIN(name, start, size);				\
-	EXCEPTION_PROLOG_0 area ;					\
-	EXCEPTION_PROLOG_1 EXC_STD, area, 0, realvec, 0, 0, 0;		\
-	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD ;		\
-	EXC_VIRT_END(name, start, size)
-
-#define EXC_VIRT(name, start, size, realvec)				\
-	__EXC_VIRT(name, start, size, realvec, PACA_EXGEN)
-
-#define EXC_REAL_MASKABLE(name, start, size, bitmask)			\
-	EXC_REAL_BEGIN(name, start, size);				\
-	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, start, 0, 0, bitmask ; \
-	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1 ;		\
-	EXC_REAL_END(name, start, size)
-
-#define EXC_VIRT_MASKABLE(name, start, size, realvec, bitmask)		\
-	EXC_VIRT_BEGIN(name, start, size);				\
-	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, 0, 0, bitmask ; \
-	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD ;		\
-	EXC_VIRT_END(name, start, size)
-
-#define EXC_REAL_HV(name, start, size)					\
-	EXC_REAL_BEGIN(name, start, size);				\
-	EXCEPTION_PROLOG_0 PACA_EXGEN;					\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, start, 0, 0, 0 ;	\
-	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1 ;		\
-	EXC_REAL_END(name, start, size)
-
-#define EXC_VIRT_HV(name, start, size, realvec)				\
-	EXC_VIRT_BEGIN(name, start, size);				\
-	EXCEPTION_PROLOG_0 PACA_EXGEN;					\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0, 0, 0 ;	\
-	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV ;			\
-	EXC_VIRT_END(name, start, size)
-
-#define __EXC_REAL_OOL(name, start, size)				\
-	EXC_REAL_BEGIN(name, start, size);				\
-	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
-	b	tramp_real_##name ;					\
-	EXC_REAL_END(name, start, size)
-
-#define __TRAMP_REAL_OOL(name, vec)					\
-	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, 0, 0, 0 ;	\
-	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1
-
-#define EXC_REAL_OOL(name, start, size)					\
-	__EXC_REAL_OOL(name, start, size);				\
-	__TRAMP_REAL_OOL(name, start)
-
-#define __EXC_REAL_OOL_MASKABLE(name, start, size)			\
-	__EXC_REAL_OOL(name, start, size)
-
-#define __TRAMP_REAL_OOL_MASKABLE(name, vec, bitmask)			\
-	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, 0, 0, bitmask ;	\
-	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1
-
-#define EXC_REAL_OOL_MASKABLE(name, start, size, bitmask)		\
-	__EXC_REAL_OOL_MASKABLE(name, start, size);			\
-	__TRAMP_REAL_OOL_MASKABLE(name, start, bitmask)
-
-#define __EXC_REAL_OOL_HV(name, start, size)				\
-	__EXC_REAL_OOL(name, start, size)
-
-#define __TRAMP_REAL_OOL_HV(name, vec)					\
-	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, 0, 0, 0 ;	\
-	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1
-
-#define EXC_REAL_OOL_HV(name, start, size)				\
-	__EXC_REAL_OOL_HV(name, start, size);				\
-	__TRAMP_REAL_OOL_HV(name, start)
-
-#define __EXC_REAL_OOL_MASKABLE_HV(name, start, size)			\
-	__EXC_REAL_OOL(name, start, size)
-
-#define __TRAMP_REAL_OOL_MASKABLE_HV(name, vec, bitmask)		\
-	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, 0, 0, bitmask ;	\
-	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1
-
-#define EXC_REAL_OOL_MASKABLE_HV(name, start, size, bitmask)		\
-	__EXC_REAL_OOL_MASKABLE_HV(name, start, size);			\
-	__TRAMP_REAL_OOL_MASKABLE_HV(name, start, bitmask)
-
-#define __EXC_VIRT_OOL(name, start, size)				\
-	EXC_VIRT_BEGIN(name, start, size);				\
-	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
-	b	tramp_virt_##name;					\
-	EXC_VIRT_END(name, start, size)
-
-#define __TRAMP_VIRT_OOL(name, realvec)					\
-	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, vec, 0, 0, 0 ;	\
-	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD
-
-#define EXC_VIRT_OOL(name, start, size, realvec)			\
-	__EXC_VIRT_OOL(name, start, size);				\
-	__TRAMP_VIRT_OOL(name, realvec)
-
-#define __EXC_VIRT_OOL_MASKABLE(name, start, size)			\
-	__EXC_VIRT_OOL(name, start, size)
-
-#define __TRAMP_VIRT_OOL_MASKABLE(name, realvec, bitmask)		\
-	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, 0, 0, bitmask ; \
-	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD
-
-#define EXC_VIRT_OOL_MASKABLE(name, start, size, realvec, bitmask)	\
-	__EXC_VIRT_OOL_MASKABLE(name, start, size);			\
-	__TRAMP_VIRT_OOL_MASKABLE(name, realvec, bitmask)
-
-#define __EXC_VIRT_OOL_HV(name, start, size)				\
-	__EXC_VIRT_OOL(name, start, size)
-
-#define __TRAMP_VIRT_OOL_HV(name, realvec)				\
-	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0, 0, 0 ;	\
-	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV
-
-#define EXC_VIRT_OOL_HV(name, start, size, realvec)			\
-	__EXC_VIRT_OOL_HV(name, start, size);				\
-	__TRAMP_VIRT_OOL_HV(name, realvec)
-
-#define __EXC_VIRT_OOL_MASKABLE_HV(name, start, size)			\
-	__EXC_VIRT_OOL(name, start, size)
-
-#define __TRAMP_VIRT_OOL_MASKABLE_HV(name, realvec, bitmask)		\
-	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0, 0, bitmask ; \
-	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV
-
-#define EXC_VIRT_OOL_MASKABLE_HV(name, start, size, realvec, bitmask)	\
-	__EXC_VIRT_OOL_MASKABLE_HV(name, start, size);			\
-	__TRAMP_VIRT_OOL_MASKABLE_HV(name, realvec, bitmask)
 
 #define TRAMP_KVM(area, n)						\
 	TRAMP_KVM_BEGIN(do_kvm_##n);					\
@@ -943,9 +812,7 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 #endif
 
-	EXCEPTION_PROLOG_0 PACA_EXNMI
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 1, 0x100, 0, 0, 0
-	EXCEPTION_PROLOG_2_REAL system_reset_common, EXC_STD, 0
+	INT_HANDLER system_reset, 0x100, 0, 0, 0, EXC_STD, PACA_EXNMI, 0, 0, 0, 0, 1
 	/*
 	 * MSR_RI is not enabled, because PACA_EXNMI and nmi stack is
 	 * being used, so a nested NMI exception would corrupt it.
@@ -975,9 +842,7 @@ TRAMP_REAL_BEGIN(system_reset_idle_wake)
  */
 TRAMP_REAL_BEGIN(system_reset_fwnmi)
 	/* See comment at system_reset exception, don't turn on RI */
-	EXCEPTION_PROLOG_0 PACA_EXNMI
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 0, 0x100, 0, 0, 0
-	EXCEPTION_PROLOG_2_REAL system_reset_common, EXC_STD, 0
+	INT_HANDLER system_reset, 0x100, 0, 0, 0, EXC_STD, PACA_EXNMI, 0, 0, 0, 0, 0
 
 #endif /* CONFIG_PPC_PSERIES */
 
@@ -1040,10 +905,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 
 
 EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
-	EXCEPTION_PROLOG_0 PACA_EXMC
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 0, 0x200, 1, 1, 0
-	mfctr	r10			/* save ctr, even for !RELOCATABLE */
-	BRANCH_TO_C000(r11, machine_check_early_common)
+	INT_HANDLER machine_check, 0x200, 0, 1, 0, EXC_STD, PACA_EXMC, 0, 1, 1, 0, 0
 	/*
 	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
 	 * nested machine check corrupts it. machine_check_common enables
@@ -1055,10 +917,7 @@ EXC_VIRT_NONE(0x4200, 0x100)
 #ifdef CONFIG_PPC_PSERIES
 TRAMP_REAL_BEGIN(machine_check_fwnmi)
 	/* See comment at machine_check exception, don't turn on RI */
-	EXCEPTION_PROLOG_0 PACA_EXMC
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 0, 0x200, 1, 1, 0
-	mfctr	r10		/* save ctr */
-	BRANCH_TO_C000(r11, machine_check_early_common)
+	INT_HANDLER machine_check, 0x200, 0, 1, 0, EXC_STD, PACA_EXMC, 0, 1, 1, 0, 0
 #endif
 
 TRAMP_KVM_SKIP(PACA_EXMC, 0x200)
@@ -1209,9 +1068,7 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	MACHINE_CHECK_HANDLER_WINDUP
 	/* See comment at machine_check exception, don't turn on RI */
-	EXCEPTION_PROLOG_0 PACA_EXMC
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
-	EXCEPTION_PROLOG_2_REAL machine_check_common, EXC_STD, 0
+	INT_HANDLER machine_check, 0x200, 0, 0, 0, EXC_STD, PACA_EXMC, 0, 1, 1, 0, 1
 
 EXC_COMMON_BEGIN(machine_check_common)
 	/*
@@ -1297,18 +1154,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
-	EXCEPTION_PROLOG_0 PACA_EXGEN
-	b	tramp_real_data_access
+	INT_HANDLER data_access, 0x300, 1, 0, 0, EXC_STD, PACA_EXGEN, 1, 1, 1, 0, 1
 EXC_REAL_END(data_access, 0x300, 0x80)
-
-TRAMP_REAL_BEGIN(tramp_real_data_access)
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x300, 1, 1, 0
-	EXCEPTION_PROLOG_2_REAL data_access_common, EXC_STD, 1
-
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
-	EXCEPTION_PROLOG_0 PACA_EXGEN
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x300, 1, 1, 0
-EXCEPTION_PROLOG_2_VIRT data_access_common, EXC_STD
+	INT_HANDLER data_access, 0x300, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 1, 1, 0, 0
 EXC_VIRT_END(data_access, 0x4300, 0x80)
 
 TRAMP_KVM_SKIP(PACA_EXGEN, 0x300)
@@ -1336,18 +1185,10 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
 EXC_REAL_BEGIN(data_access_slb, 0x380, 0x80)
-	EXCEPTION_PROLOG_0 PACA_EXSLB
-	b	tramp_real_data_access_slb
+	INT_HANDLER data_access_slb, 0x380, 1, 0, 0, 0, PACA_EXSLB, 1, 1, 0, 0, 1
 EXC_REAL_END(data_access_slb, 0x380, 0x80)
-
-TRAMP_REAL_BEGIN(tramp_real_data_access_slb)
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 1, 0x380, 1, 0, 0
-	EXCEPTION_PROLOG_2_REAL data_access_slb_common, EXC_STD, 1
-
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
-	EXCEPTION_PROLOG_0 PACA_EXSLB
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 0, 0x380, 1, 0, 0
-	EXCEPTION_PROLOG_2_VIRT data_access_slb_common, EXC_STD
+	INT_HANDLER data_access_slb, 0x380, 0, 0, 1, 0, PACA_EXSLB, 1, 1, 0, 0, 0
 EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
 
 TRAMP_KVM_SKIP(PACA_EXSLB, 0x380)
@@ -1378,8 +1219,13 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	b	ret_from_except
 
 
-EXC_REAL(instruction_access, 0x400, 0x80)
-EXC_VIRT(instruction_access, 0x4400, 0x80, 0x400)
+EXC_REAL_BEGIN(instruction_access, 0x400, 0x80)
+	INT_HANDLER instruction_access, 0x400, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_REAL_END(instruction_access, 0x400, 0x80)
+EXC_VIRT_BEGIN(instruction_access, 0x4400, 0x80)
+	INT_HANDLER instruction_access, 0x400, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+EXC_VIRT_END(instruction_access, 0x4400, 0x80)
+
 TRAMP_KVM(PACA_EXGEN, 0x400)
 
 EXC_COMMON_BEGIN(instruction_access_common)
@@ -1398,8 +1244,12 @@ MMU_FTR_SECTION_ELSE
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
-__EXC_REAL(instruction_access_slb, 0x480, 0x80, PACA_EXSLB)
-__EXC_VIRT(instruction_access_slb, 0x4480, 0x80, 0x480, PACA_EXSLB)
+EXC_REAL_BEGIN(instruction_access_slb, 0x480, 0x80)
+	INT_HANDLER instruction_access_slb, 0x480, 0, 0, 0, EXC_STD, PACA_EXSLB, 1, 0, 0, 0, 1
+EXC_REAL_END(instruction_access_slb, 0x480, 0x80)
+EXC_VIRT_BEGIN(instruction_access_slb, 0x4480, 0x80)
+	INT_HANDLER instruction_access_slb, 0x480, 0, 0, 1, EXC_STD, PACA_EXSLB, 1, 0, 0, 0, 0
+EXC_VIRT_END(instruction_access_slb, 0x4480, 0x80)
 TRAMP_KVM(PACA_EXSLB, 0x480)
 
 EXC_COMMON_BEGIN(instruction_access_slb_common)
@@ -1426,17 +1276,11 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	bl	do_bad_slb_fault
 	b	ret_from_except
 
-
 EXC_REAL_BEGIN(hardware_interrupt, 0x500, 0x100)
-	EXCEPTION_PROLOG_0 PACA_EXGEN
-	EXCEPTION_PROLOG_1 EXC_HV_OR_STD, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
-	EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_HV_OR_STD, 1
+	INT_HANDLER hardware_interrupt, 0x500, 0, 0, 0, EXC_HV_OR_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
 EXC_REAL_END(hardware_interrupt, 0x500, 0x100)
-
 EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
-	EXCEPTION_PROLOG_0 PACA_EXGEN
-	EXCEPTION_PROLOG_1 EXC_HV_OR_STD, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
-	EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_HV_OR_STD
+	INT_HANDLER hardware_interrupt, 0x500, 0, 0, 1, EXC_HV_OR_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 
 TRAMP_KVM(PACA_EXGEN, 0x500)
@@ -1445,15 +1289,10 @@ EXC_COMMON_ASYNC(hardware_interrupt_common, 0x500, do_IRQ)
 
 
 EXC_REAL_BEGIN(alignment, 0x600, 0x100)
-	EXCEPTION_PROLOG_0 PACA_EXGEN
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x600, 1, 1, 0
-	EXCEPTION_PROLOG_2_REAL alignment_common, EXC_STD, 1
+	INT_HANDLER alignment, 0x600, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 1, 1, 0, 1
 EXC_REAL_END(alignment, 0x600, 0x100)
-
 EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
-	EXCEPTION_PROLOG_0 PACA_EXGEN
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x600, 1, 1, 0
-	EXCEPTION_PROLOG_2_VIRT alignment_common, EXC_STD
+	INT_HANDLER alignment, 0x600, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 1, 1, 0, 0
 EXC_VIRT_END(alignment, 0x4600, 0x100)
 
 TRAMP_KVM(PACA_EXGEN, 0x600)
@@ -1470,8 +1309,12 @@ EXC_COMMON_BEGIN(alignment_common)
 	b	ret_from_except
 
 
-EXC_REAL(program_check, 0x700, 0x100)
-EXC_VIRT(program_check, 0x4700, 0x100, 0x700)
+EXC_REAL_BEGIN(program_check, 0x700, 0x100)
+	INT_HANDLER program_check, 0x700, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_REAL_END(program_check, 0x700, 0x100)
+EXC_VIRT_BEGIN(program_check, 0x4700, 0x100)
+	INT_HANDLER program_check, 0x700, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+EXC_VIRT_END(program_check, 0x4700, 0x100)
 TRAMP_KVM(PACA_EXGEN, 0x700)
 EXC_COMMON_BEGIN(program_check_common)
 	/*
@@ -1508,8 +1351,12 @@ EXC_COMMON_BEGIN(program_check_common)
 	b	ret_from_except
 
 
-EXC_REAL(fp_unavailable, 0x800, 0x100)
-EXC_VIRT(fp_unavailable, 0x4800, 0x100, 0x800)
+EXC_REAL_BEGIN(fp_unavailable, 0x800, 0x100)
+	INT_HANDLER fp_unavailable, 0x800, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_REAL_END(fp_unavailable, 0x800, 0x100)
+EXC_VIRT_BEGIN(fp_unavailable, 0x4800, 0x100)
+	INT_HANDLER fp_unavailable, 0x800, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+EXC_VIRT_END(fp_unavailable, 0x4800, 0x100)
 TRAMP_KVM(PACA_EXGEN, 0x800)
 EXC_COMMON_BEGIN(fp_unavailable_common)
 	EXCEPTION_COMMON(PACA_EXGEN, 0x800)
@@ -1541,20 +1388,32 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
 #endif
 
 
-EXC_REAL_OOL_MASKABLE(decrementer, 0x900, 0x80, IRQS_DISABLED)
-EXC_VIRT_MASKABLE(decrementer, 0x4900, 0x80, 0x900, IRQS_DISABLED)
+EXC_REAL_BEGIN(decrementer, 0x900, 0x80)
+	INT_HANDLER decrementer, 0x900, 1, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+EXC_REAL_END(decrementer, 0x900, 0x80)
+EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
+	INT_HANDLER decrementer, 0x900, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 0
+EXC_VIRT_END(decrementer, 0x4900, 0x80)
 TRAMP_KVM(PACA_EXGEN, 0x900)
 EXC_COMMON_ASYNC(decrementer_common, 0x900, timer_interrupt)
 
 
-EXC_REAL_HV(hdecrementer, 0x980, 0x80)
-EXC_VIRT_HV(hdecrementer, 0x4980, 0x80, 0x980)
+EXC_REAL_BEGIN(hdecrementer, 0x980, 0x80)
+	INT_HANDLER hdecrementer, 0x980, 0, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_REAL_END(hdecrementer, 0x980, 0x80)
+EXC_VIRT_BEGIN(hdecrementer, 0x4980, 0x80)
+	INT_HANDLER hdecrementer, 0x980, 0, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_VIRT_END(hdecrementer, 0x4980, 0x80)
 TRAMP_KVM_HV(PACA_EXGEN, 0x980)
 EXC_COMMON(hdecrementer_common, 0x980, hdec_interrupt)
 
 
-EXC_REAL_MASKABLE(doorbell_super, 0xa00, 0x100, IRQS_DISABLED)
-EXC_VIRT_MASKABLE(doorbell_super, 0x4a00, 0x100, 0xa00, IRQS_DISABLED)
+EXC_REAL_BEGIN(doorbell_super, 0xa00, 0x100)
+	INT_HANDLER doorbell_super, 0xa00, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+EXC_REAL_END(doorbell_super, 0xa00, 0x100)
+EXC_VIRT_BEGIN(doorbell_super, 0x4a00, 0x100)
+	INT_HANDLER doorbell_super, 0xa00, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 0
+EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
 TRAMP_KVM(PACA_EXGEN, 0xa00)
 #ifdef CONFIG_PPC_DOORBELL
 EXC_COMMON_ASYNC(doorbell_super_common, 0xa00, doorbell_exception)
@@ -1670,7 +1529,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
 EXC_REAL_BEGIN(system_call, 0xc00, 0x100)
 	SYSTEM_CALL 0
 EXC_REAL_END(system_call, 0xc00, 0x100)
-
 EXC_VIRT_BEGIN(system_call, 0x4c00, 0x100)
 	SYSTEM_CALL 1
 EXC_VIRT_END(system_call, 0x4c00, 0x100)
@@ -1700,13 +1558,22 @@ TRAMP_KVM_BEGIN(do_kvm_0xc00)
 #endif
 
 
-EXC_REAL(single_step, 0xd00, 0x100)
-EXC_VIRT(single_step, 0x4d00, 0x100, 0xd00)
+EXC_REAL_BEGIN(single_step, 0xd00, 0x100)
+	INT_HANDLER single_step, 0xd00, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_REAL_END(single_step, 0xd00, 0x100)
+EXC_VIRT_BEGIN(single_step, 0x4d00, 0x100)
+	INT_HANDLER single_step, 0xd00, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+EXC_VIRT_END(single_step, 0x4d00, 0x100)
 TRAMP_KVM(PACA_EXGEN, 0xd00)
 EXC_COMMON(single_step_common, 0xd00, single_step_exception)
 
-EXC_REAL_OOL_HV(h_data_storage, 0xe00, 0x20)
-EXC_VIRT_OOL_HV(h_data_storage, 0x4e00, 0x20, 0xe00)
+
+EXC_REAL_BEGIN(h_data_storage, 0xe00, 0x20)
+	INT_HANDLER h_data_storage, 0xe00, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_REAL_END(h_data_storage, 0xe00, 0x20)
+EXC_VIRT_BEGIN(h_data_storage, 0x4e00, 0x20)
+	INT_HANDLER h_data_storage, 0xe00, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_VIRT_END(h_data_storage, 0x4e00, 0x20)
 TRAMP_KVM_HV_SKIP(PACA_EXGEN, 0xe00)
 EXC_COMMON_BEGIN(h_data_storage_common)
 	mfspr   r10,SPRN_HDAR
@@ -1730,14 +1597,22 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
 	b       ret_from_except
 
 
-EXC_REAL_OOL_HV(h_instr_storage, 0xe20, 0x20)
-EXC_VIRT_OOL_HV(h_instr_storage, 0x4e20, 0x20, 0xe20)
+EXC_REAL_BEGIN(h_instr_storage, 0xe20, 0x20)
+	INT_HANDLER h_instr_storage, 0xe20, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_REAL_END(h_instr_storage, 0xe20, 0x20)
+EXC_VIRT_BEGIN(h_instr_storage, 0x4e20, 0x20)
+	INT_HANDLER h_instr_storage, 0xe20, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_VIRT_END(h_instr_storage, 0x4e20, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xe20)
 EXC_COMMON(h_instr_storage_common, 0xe20, unknown_exception)
 
 
-EXC_REAL_OOL_HV(emulation_assist, 0xe40, 0x20)
-EXC_VIRT_OOL_HV(emulation_assist, 0x4e40, 0x20, 0xe40)
+EXC_REAL_BEGIN(emulation_assist, 0xe40, 0x20)
+	INT_HANDLER emulation_assist, 0xe40, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_REAL_END(emulation_assist, 0xe40, 0x20)
+EXC_VIRT_BEGIN(emulation_assist, 0x4e40, 0x20)
+	INT_HANDLER emulation_assist, 0xe40, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_VIRT_END(emulation_assist, 0x4e40, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xe40)
 EXC_COMMON(emulation_assist_common, 0xe40, emulation_assist_interrupt)
 
@@ -1748,15 +1623,10 @@ EXC_COMMON(emulation_assist_common, 0xe40, emulation_assist_interrupt)
  * mode.
  */
 EXC_REAL_BEGIN(hmi_exception, 0xe60, 0x20)
-	EXCEPTION_PROLOG_0 PACA_EXGEN
-	b	hmi_exception_early
+	INT_HANDLER hmi_exception, 0xe60, 1, 1, 0, EXC_HV, PACA_EXGEN, 0, 0, 0, 0, 1
 EXC_REAL_END(hmi_exception, 0xe60, 0x20)
 EXC_VIRT_NONE(0x4e60, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xe60)
-TRAMP_REAL_BEGIN(hmi_exception_early)
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0xe60, 0, 0, 0
-	mfctr	r10			/* save ctr, even for !RELOCATABLE */
-	BRANCH_TO_C000(r11, hmi_exception_early_common)
 
 EXC_COMMON_BEGIN(hmi_exception_early_common)
 	mtctr	r10			/* Restore ctr */
@@ -1783,9 +1653,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	 * firmware.
 	 */
 	EXCEPTION_RESTORE_REGS EXC_HV
-	EXCEPTION_PROLOG_0 PACA_EXGEN
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0xe60, 0, 0, IRQS_DISABLED
-	EXCEPTION_PROLOG_2_REAL hmi_exception_common, EXC_HV, 1
+	INT_HANDLER hmi_exception, 0xe60, 0, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
 
 EXC_COMMON_BEGIN(hmi_exception_common)
 	EXCEPTION_COMMON(PACA_EXGEN, 0xe60)
@@ -1797,8 +1665,13 @@ EXC_COMMON_BEGIN(hmi_exception_common)
 	bl	handle_hmi_exception
 	b	ret_from_except
 
-EXC_REAL_OOL_MASKABLE_HV(h_doorbell, 0xe80, 0x20, IRQS_DISABLED)
-EXC_VIRT_OOL_MASKABLE_HV(h_doorbell, 0x4e80, 0x20, 0xe80, IRQS_DISABLED)
+
+EXC_REAL_BEGIN(h_doorbell, 0xe80, 0x20)
+	INT_HANDLER h_doorbell, 0xe80, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+EXC_REAL_END(h_doorbell, 0xe80, 0x20)
+EXC_VIRT_BEGIN(h_doorbell, 0x4e80, 0x20)
+	INT_HANDLER h_doorbell, 0xe80, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xe80)
 #ifdef CONFIG_PPC_DOORBELL
 EXC_COMMON_ASYNC(h_doorbell_common, 0xe80, doorbell_exception)
@@ -1807,8 +1680,12 @@ EXC_COMMON_ASYNC(h_doorbell_common, 0xe80, unknown_exception)
 #endif
 
 
-EXC_REAL_OOL_MASKABLE_HV(h_virt_irq, 0xea0, 0x20, IRQS_DISABLED)
-EXC_VIRT_OOL_MASKABLE_HV(h_virt_irq, 0x4ea0, 0x20, 0xea0, IRQS_DISABLED)
+EXC_REAL_BEGIN(h_virt_irq, 0xea0, 0x20)
+	INT_HANDLER h_virt_irq, 0xea0, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+EXC_REAL_END(h_virt_irq, 0xea0, 0x20)
+EXC_VIRT_BEGIN(h_virt_irq, 0x4ea0, 0x20)
+	INT_HANDLER h_virt_irq, 0xea0, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xea0)
 EXC_COMMON_ASYNC(h_virt_irq_common, 0xea0, do_IRQ)
 
@@ -1819,14 +1696,22 @@ EXC_REAL_NONE(0xee0, 0x20)
 EXC_VIRT_NONE(0x4ee0, 0x20)
 
 
-EXC_REAL_OOL_MASKABLE(performance_monitor, 0xf00, 0x20, IRQS_PMI_DISABLED)
-EXC_VIRT_OOL_MASKABLE(performance_monitor, 0x4f00, 0x20, 0xf00, IRQS_PMI_DISABLED)
+EXC_REAL_BEGIN(performance_monitor, 0xf00, 0x20)
+	INT_HANDLER performance_monitor, 0xf00, 1, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_PMI_DISABLED, 1
+EXC_REAL_END(performance_monitor, 0xf00, 0x20)
+EXC_VIRT_BEGIN(performance_monitor, 0x4f00, 0x20)
+	INT_HANDLER performance_monitor, 0xf00, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_PMI_DISABLED, 0
+EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
 TRAMP_KVM(PACA_EXGEN, 0xf00)
 EXC_COMMON_ASYNC(performance_monitor_common, 0xf00, performance_monitor_exception)
 
 
-EXC_REAL_OOL(altivec_unavailable, 0xf20, 0x20)
-EXC_VIRT_OOL(altivec_unavailable, 0x4f20, 0x20, 0xf20)
+EXC_REAL_BEGIN(altivec_unavailable, 0xf20, 0x20)
+	INT_HANDLER altivec_unavailable, 0xf20, 1, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_REAL_END(altivec_unavailable, 0xf20, 0x20)
+EXC_VIRT_BEGIN(altivec_unavailable, 0x4f20, 0x20)
+	INT_HANDLER altivec_unavailable, 0xf20, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+EXC_VIRT_END(altivec_unavailable, 0x4f20, 0x20)
 TRAMP_KVM(PACA_EXGEN, 0xf20)
 EXC_COMMON_BEGIN(altivec_unavailable_common)
 	EXCEPTION_COMMON(PACA_EXGEN, 0xf20)
@@ -1862,8 +1747,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	b	ret_from_except
 
 
-EXC_REAL_OOL(vsx_unavailable, 0xf40, 0x20)
-EXC_VIRT_OOL(vsx_unavailable, 0x4f40, 0x20, 0xf40)
+EXC_REAL_BEGIN(vsx_unavailable, 0xf40, 0x20)
+	INT_HANDLER vsx_unavailable, 0xf40, 1, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_REAL_END(vsx_unavailable, 0xf40, 0x20)
+EXC_VIRT_BEGIN(vsx_unavailable, 0x4f40, 0x20)
+	INT_HANDLER vsx_unavailable, 0xf40, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+EXC_VIRT_END(vsx_unavailable, 0x4f40, 0x20)
 TRAMP_KVM(PACA_EXGEN, 0xf40)
 EXC_COMMON_BEGIN(vsx_unavailable_common)
 	EXCEPTION_COMMON(PACA_EXGEN, 0xf40)
@@ -1898,14 +1787,22 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 	b	ret_from_except
 
 
-EXC_REAL_OOL(facility_unavailable, 0xf60, 0x20)
-EXC_VIRT_OOL(facility_unavailable, 0x4f60, 0x20, 0xf60)
+EXC_REAL_BEGIN(facility_unavailable, 0xf60, 0x20)
+	INT_HANDLER facility_unavailable, 0xf60, 1, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_REAL_END(facility_unavailable, 0xf60, 0x20)
+EXC_VIRT_BEGIN(facility_unavailable, 0x4f60, 0x20)
+	INT_HANDLER facility_unavailable, 0xf60, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+EXC_VIRT_END(facility_unavailable, 0x4f60, 0x20)
 TRAMP_KVM(PACA_EXGEN, 0xf60)
 EXC_COMMON(facility_unavailable_common, 0xf60, facility_unavailable_exception)
 
 
-EXC_REAL_OOL_HV(h_facility_unavailable, 0xf80, 0x20)
-EXC_VIRT_OOL_HV(h_facility_unavailable, 0x4f80, 0x20, 0xf80)
+EXC_REAL_BEGIN(h_facility_unavailable, 0xf80, 0x20)
+	INT_HANDLER h_facility_unavailable, 0xf80, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_REAL_END(h_facility_unavailable, 0xf80, 0x20)
+EXC_VIRT_BEGIN(h_facility_unavailable, 0x4f80, 0x20)
+	INT_HANDLER h_facility_unavailable, 0xf80, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_VIRT_END(h_facility_unavailable, 0x4f80, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xf80)
 EXC_COMMON(h_facility_unavailable_common, 0xf80, facility_unavailable_exception)
 
@@ -1923,7 +1820,9 @@ EXC_REAL_NONE(0x1100, 0x100)
 EXC_VIRT_NONE(0x5100, 0x100)
 
 #ifdef CONFIG_CBE_RAS
-EXC_REAL_HV(cbe_system_error, 0x1200, 0x100)
+EXC_REAL_BEGIN(cbe_system_error, 0x1200, 0x20)
+	INT_HANDLER cbe_system_error, 0x1200, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_REAL_END(cbe_system_error, 0x1200, 0x20)
 EXC_VIRT_NONE(0x5200, 0x100)
 TRAMP_KVM_HV_SKIP(PACA_EXGEN, 0x1200)
 EXC_COMMON(cbe_system_error_common, 0x1200, cbe_system_error_exception)
@@ -1933,24 +1832,26 @@ EXC_VIRT_NONE(0x5200, 0x100)
 #endif
 
 
-EXC_REAL(instruction_breakpoint, 0x1300, 0x100)
-EXC_VIRT(instruction_breakpoint, 0x5300, 0x100, 0x1300)
+EXC_REAL_BEGIN(instruction_breakpoint, 0x1300, 0x100)
+	INT_HANDLER instruction_breakpoint, 0x1300, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_REAL_END(instruction_breakpoint, 0x1300, 0x100)
+EXC_VIRT_BEGIN(instruction_breakpoint, 0x5300, 0x100)
+	INT_HANDLER instruction_breakpoint, 0x1300, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+EXC_VIRT_END(instruction_breakpoint, 0x5300, 0x100)
 TRAMP_KVM_SKIP(PACA_EXGEN, 0x1300)
 EXC_COMMON(instruction_breakpoint_common, 0x1300, instruction_breakpoint_exception)
 
+
 EXC_REAL_NONE(0x1400, 0x100)
 EXC_VIRT_NONE(0x5400, 0x100)
 
 EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
-	EXCEPTION_PROLOG_0 PACA_EXGEN
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 0, 0x1500, 0, 0, 0
-
+	INT_HANDLER denorm_exception_hv, 0x1500, 0, 2, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 0
 #ifdef CONFIG_PPC_DENORMALISATION
 	mfspr	r10,SPRN_HSRR1
 	andis.	r10,r10,(HSRR1_DENORM)@h /* denorm? */
 	bne+	denorm_assist
 #endif
-
 	KVMTEST EXC_HV 0x1500
 	EXCEPTION_PROLOG_2_REAL denorm_common, EXC_HV, 1
 EXC_REAL_END(denorm_exception_hv, 0x1500, 0x100)
@@ -2038,7 +1939,9 @@ EXC_COMMON(denorm_common, 0x1500, unknown_exception)
 
 
 #ifdef CONFIG_CBE_RAS
-EXC_REAL_HV(cbe_maintenance, 0x1600, 0x100)
+EXC_REAL_BEGIN(cbe_maintenance, 0x1600, 0x20)
+	INT_HANDLER cbe_maintenance, 0x1600, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_REAL_END(cbe_maintenance, 0x1600, 0x20)
 EXC_VIRT_NONE(0x5600, 0x100)
 TRAMP_KVM_HV_SKIP(PACA_EXGEN, 0x1600)
 EXC_COMMON(cbe_maintenance_common, 0x1600, cbe_maintenance_exception)
@@ -2048,8 +1951,12 @@ EXC_VIRT_NONE(0x5600, 0x100)
 #endif
 
 
-EXC_REAL(altivec_assist, 0x1700, 0x100)
-EXC_VIRT(altivec_assist, 0x5700, 0x100, 0x1700)
+EXC_REAL_BEGIN(altivec_assist, 0x1700, 0x100)
+	INT_HANDLER altivec_assist, 0x1700, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_REAL_END(altivec_assist, 0x1700, 0x100)
+EXC_VIRT_BEGIN(altivec_assist, 0x5700, 0x100)
+	INT_HANDLER altivec_assist, 0x1700, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+EXC_VIRT_END(altivec_assist, 0x5700, 0x100)
 TRAMP_KVM(PACA_EXGEN, 0x1700)
 #ifdef CONFIG_ALTIVEC
 EXC_COMMON(altivec_assist_common, 0x1700, altivec_assist_exception)
@@ -2059,7 +1966,9 @@ EXC_COMMON(altivec_assist_common, 0x1700, unknown_exception)
 
 
 #ifdef CONFIG_CBE_RAS
-EXC_REAL_HV(cbe_thermal, 0x1800, 0x100)
+EXC_REAL_BEGIN(cbe_thermal, 0x1800, 0x20)
+	INT_HANDLER cbe_thermal, 0x1800, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+EXC_REAL_END(cbe_thermal, 0x1800, 0x20)
 EXC_VIRT_NONE(0x5800, 0x100)
 TRAMP_KVM_HV_SKIP(PACA_EXGEN, 0x1800)
 EXC_COMMON(cbe_thermal_common, 0x1800, cbe_thermal_exception)
@@ -2068,6 +1977,7 @@ EXC_REAL_NONE(0x1800, 0x100)
 EXC_VIRT_NONE(0x5800, 0x100)
 #endif
 
+
 #ifdef CONFIG_PPC_WATCHDOG
 
 #define MASKED_DEC_HANDLER_LABEL 3f
-- 
2.22.0

