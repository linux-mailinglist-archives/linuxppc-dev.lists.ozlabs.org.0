Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0403D0D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:32:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NYsH6G5GzDqhD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:32:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="P8RjFDzq"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZZ0QTQzDqT7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:30 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id bi6so4811379plb.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ilAXTddtZ1tTnteJG7++IhNpWdBlgi4DannSZ5F6Z7E=;
 b=P8RjFDzqL2mU4aAJvwL2LK74Wvlv2YixGtgDYCnBNT5Zj867d6IaBLzPz/dJzSJEBe
 TU3irhMNTQXQwIytVbRlurrzpu6tqPNWIYWKD9/XjazBO0s1uDMzhymGmlaySZpGo6fb
 HUw9Ql8u+b/75NSK/YKrlOJO55WWvMRh5j4DBUzkpx1HfmsuARE8bZ5rToWciXkRbI5n
 /1Eo2mv9y/PTb7oHV7Jw8f+prcU8TjkGpQj0fmDay6U41vyNkeTITUH5kN86lRFN1YDD
 n88/sokfE/Vx89pMMa4m2BpWUBy1he5uJm49htEXix6eeZ1OVBgbFQNWabgzCmlQvMpi
 iotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ilAXTddtZ1tTnteJG7++IhNpWdBlgi4DannSZ5F6Z7E=;
 b=ov5/Bdh7rEGbRJkVNGZp5e390UFJLdr+aYIvPpl6CMT9RNIzdGj1vCUEdXT+Kha/Pn
 ks2il+moZ92O+Ec954O13rUf5HMhrOPNpjAxqY0UCQM54FthOZt6O23Rv3TPvO+uRcFb
 LaTImFD7tjCRNsQ3zeKwVOTm5R4XiEsyfDg0FfRkxEOv991ZnxOKO97v4bgZYF1cnfJ4
 ZY4B6eoFaZUV7IWcnLVFUcr5PO6PVZLwm6oIYMQ8BurXuXNxXtg0qTz4V+iOyeIWnMMx
 hZScbo5z+8Q3eg2P9ko955qXAcF2088jLuyaaGmgLFa1ptDkcUvD0Mc51KxUB5UH60yi
 7Ohw==
X-Gm-Message-State: APjAAAXTrfK0bGcKnP3fv5KBV1/48l+GDqEOrIWdP7lyA825GdhmBXF3
 gmezcl+MD/LUnzkFSoNDlMjew8FE
X-Google-Smtp-Source: APXvYqxlRpxnuf2TawE6HAL3huROCAr3DqLUrZa2H62LRWUmKai8a/dbxz/PwXvc8rU5b6814lgVQA==
X-Received: by 2002:a17:902:b905:: with SMTP id
 bf5mr76773486plb.155.1560263666873; 
 Tue, 11 Jun 2019 07:34:26 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.34.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:34:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 19/28] powerpc/64s/exception: move head-64.h code to
 exception-64s.S where it is used
Date: Wed, 12 Jun 2019 00:30:31 +1000
Message-Id: <20190611143040.7834-20-npiggin@gmail.com>
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

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h |   1 -
 arch/powerpc/include/asm/head-64.h       | 252 -----------------------
 arch/powerpc/kernel/exceptions-64s.S     | 251 ++++++++++++++++++++++
 3 files changed, 251 insertions(+), 253 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 9e6712099f7a..dc6a5ccac965 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -30,7 +30,6 @@
  * exception handlers (including pSeries LPAR) and iSeries LPAR
  * implementations as possible.
  */
-#include <asm/head-64.h>
 #include <asm/feature-fixups.h>
 
 /* PACA save area offsets (exgen, exmc, etc) */
diff --git a/arch/powerpc/include/asm/head-64.h b/arch/powerpc/include/asm/head-64.h
index dc1940c94a86..a466765709a9 100644
--- a/arch/powerpc/include/asm/head-64.h
+++ b/arch/powerpc/include/asm/head-64.h
@@ -169,53 +169,6 @@ end_##sname:
 
 #define ABS_ADDR(label) (label - fs_label + fs_start)
 
-/*
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
- *
- * The one unusual case is __EXC_REAL_OOL_HV_DIRECT, which is
- * an OOL vector that branches to a specified handler rather than the usual
- * trampoline that goes to common. It, and other underscore macros, should
- * be used with care.
- *
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
- */
-
 #define EXC_REAL_BEGIN(name, start, size)			\
 	FIXED_SECTION_ENTRY_BEGIN_LOCATION(real_vectors, exc_real_##start##_##name, start, size)
 
@@ -257,211 +210,6 @@ end_##sname:
 	FIXED_SECTION_ENTRY_BEGIN_LOCATION(virt_vectors, exc_virt_##start##_##unused, start, size); \
 	FIXED_SECTION_ENTRY_END_LOCATION(virt_vectors, exc_virt_##start##_##unused, start, size)
 
-
-#define __EXC_REAL(name, start, size, area)				\
-	EXC_REAL_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);		/* save r13 */			\
-	EXCEPTION_PROLOG_0 area ;					\
-	EXCEPTION_PROLOG_1 EXC_STD, area, 1, start, 0 ;			\
-	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1 ;		\
-	EXC_REAL_END(name, start, size)
-
-#define EXC_REAL(name, start, size)					\
-	__EXC_REAL(name, start, size, PACA_EXGEN)
-
-#define __EXC_VIRT(name, start, size, realvec, area)			\
-	EXC_VIRT_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);    /* save r13 */				\
-	EXCEPTION_PROLOG_0 area ;					\
-	EXCEPTION_PROLOG_1 EXC_STD, area, 0, realvec, 0;		\
-	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD ;		\
-	EXC_VIRT_END(name, start, size)
-
-#define EXC_VIRT(name, start, size, realvec)				\
-	__EXC_VIRT(name, start, size, realvec, PACA_EXGEN)
-
-#define EXC_REAL_MASKABLE(name, start, size, bitmask)			\
-	EXC_REAL_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);    /* save r13 */				\
-	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, start, bitmask ;	\
-	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1 ;		\
-	EXC_REAL_END(name, start, size)
-
-#define EXC_VIRT_MASKABLE(name, start, size, realvec, bitmask)		\
-	EXC_VIRT_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);    /* save r13 */				\
-	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, bitmask ;	\
-	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD ;		\
-	EXC_VIRT_END(name, start, size)
-
-#define EXC_REAL_HV(name, start, size)					\
-	EXC_REAL_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);		/* save r13 */			\
-	EXCEPTION_PROLOG_0 PACA_EXGEN;					\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, start, 0 ;		\
-	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1 ;		\
-	EXC_REAL_END(name, start, size)
-
-#define EXC_VIRT_HV(name, start, size, realvec)				\
-	EXC_VIRT_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);		/* save r13 */			\
-	EXCEPTION_PROLOG_0 PACA_EXGEN;					\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0 ;		\
-	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV ;			\
-	EXC_VIRT_END(name, start, size)
-
-#define __EXC_REAL_OOL(name, start, size)				\
-	EXC_REAL_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);						\
-	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
-	b	tramp_real_##name ;					\
-	EXC_REAL_END(name, start, size)
-
-#define __TRAMP_REAL_OOL(name, vec)					\
-	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, 0 ;	\
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
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, bitmask ;	\
-	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1
-
-#define EXC_REAL_OOL_MASKABLE(name, start, size, bitmask)		\
-	__EXC_REAL_OOL_MASKABLE(name, start, size);			\
-	__TRAMP_REAL_OOL_MASKABLE(name, start, bitmask)
-
-#define __EXC_REAL_OOL_HV_DIRECT(name, start, size, handler)		\
-	EXC_REAL_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);						\
-	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
-	b	handler;						\
-	EXC_REAL_END(name, start, size)
-
-#define __EXC_REAL_OOL_HV(name, start, size)				\
-	__EXC_REAL_OOL(name, start, size)
-
-#define __TRAMP_REAL_OOL_HV(name, vec)					\
-	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, 0 ;	\
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
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, bitmask ;	\
-	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1
-
-#define EXC_REAL_OOL_MASKABLE_HV(name, start, size, bitmask)		\
-	__EXC_REAL_OOL_MASKABLE_HV(name, start, size);			\
-	__TRAMP_REAL_OOL_MASKABLE_HV(name, start, bitmask)
-
-#define __EXC_VIRT_OOL(name, start, size)				\
-	EXC_VIRT_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);						\
-	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
-	b	tramp_virt_##name;					\
-	EXC_VIRT_END(name, start, size)
-
-#define __TRAMP_VIRT_OOL(name, realvec)					\
-	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, vec, 0 ;		\
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
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, bitmask ;	\
-	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1
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
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0 ;		\
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
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, bitmask ;	\
-	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV
-
-#define EXC_VIRT_OOL_MASKABLE_HV(name, start, size, realvec, bitmask)	\
-	__EXC_VIRT_OOL_MASKABLE_HV(name, start, size);			\
-	__TRAMP_VIRT_OOL_MASKABLE_HV(name, realvec, bitmask)
-
-#define TRAMP_KVM(area, n)						\
-	TRAMP_KVM_BEGIN(do_kvm_##n);					\
-	KVM_HANDLER area, EXC_STD, n, 0
-
-#define TRAMP_KVM_SKIP(area, n)						\
-	TRAMP_KVM_BEGIN(do_kvm_##n);					\
-	KVM_HANDLER area, EXC_STD, n, 1
-
-#define TRAMP_KVM_HV(area, n)						\
-	TRAMP_KVM_BEGIN(do_kvm_H##n);					\
-	KVM_HANDLER area, EXC_HV, n, 0
-
-#define TRAMP_KVM_HV_SKIP(area, n)					\
-	TRAMP_KVM_BEGIN(do_kvm_H##n);					\
-	KVM_HANDLER area, EXC_HV, n, 1
-
-#define EXC_COMMON(name, realvec, hdlr)					\
-	EXC_COMMON_BEGIN(name);						\
-	EXCEPTION_COMMON(PACA_EXGEN, realvec);				\
-	bl	save_nvgprs;						\
-	RECONCILE_IRQ_STATE(r10, r11);					\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
-	bl	hdlr;							\
-	b	ret_from_except
-
-/*
- * Like EXC_COMMON, but for exceptions that can occur in the idle task and
- * therefore need the special idle handling (finish nap and runlatch)
- */
-#define EXC_COMMON_ASYNC(name, realvec, hdlr)				\
-	EXC_COMMON_BEGIN(name);						\
-	EXCEPTION_COMMON(PACA_EXGEN, realvec);				\
-	FINISH_NAP;							\
-	RECONCILE_IRQ_STATE(r10, r11);					\
-	RUNLATCH_ON;							\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
-	bl	hdlr;							\
-	b	ret_from_except_lite
-
 #endif /* __ASSEMBLY__ */
 
 #endif	/* _ASM_POWERPC_HEAD_64_H */
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 23a5a65f48f8..013abf3ea6f6 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -451,6 +451,257 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 #define FINISH_NAP
 #endif
 
+/*
+ * Following are the BOOK3S exception handler helper macros.
+ * Handlers come in a number of types, and each type has a number of varieties.
+ *
+ * EXC_REAL_*     - real, unrelocated exception vectors
+ * EXC_VIRT_*     - virt (AIL), unrelocated exception vectors
+ * TRAMP_REAL_*   - real, unrelocated helpers (virt can call these)
+ * TRAMP_VIRT_*   - virt, unreloc helpers (in practice, real can use)
+ * TRAMP_KVM      - KVM handlers that get put into real, unrelocated
+ * EXC_COMMON     - virt, relocated common handlers
+ *
+ * The EXC handlers are given a name, and branch to name_common, or the
+ * appropriate KVM or masking function. Vector handler verieties are as
+ * follows:
+ *
+ * EXC_{REAL|VIRT}_BEGIN/END - used to open-code the exception
+ *
+ * EXC_{REAL|VIRT}  - standard exception
+ *
+ * EXC_{REAL|VIRT}_suffix
+ *     where _suffix is:
+ *   - _MASKABLE               - maskable exception
+ *   - _OOL                    - out of line with trampoline to common handler
+ *   - _HV                     - HV exception
+ *
+ * There can be combinations, e.g., EXC_VIRT_OOL_MASKABLE_HV
+ *
+ * The one unusual case is __EXC_REAL_OOL_HV_DIRECT, which is
+ * an OOL vector that branches to a specified handler rather than the usual
+ * trampoline that goes to common. It, and other underscore macros, should
+ * be used with care.
+ *
+ * KVM handlers come in the following verieties:
+ * TRAMP_KVM
+ * TRAMP_KVM_SKIP
+ * TRAMP_KVM_HV
+ * TRAMP_KVM_HV_SKIP
+ *
+ * COMMON handlers come in the following verieties:
+ * EXC_COMMON_BEGIN/END - used to open-code the handler
+ * EXC_COMMON
+ * EXC_COMMON_ASYNC
+ *
+ * TRAMP_REAL and TRAMP_VIRT can be used with BEGIN/END. KVM
+ * and OOL handlers are implemented as types of TRAMP and TRAMP_VIRT handlers.
+ */
+
+#define __EXC_REAL(name, start, size, area)				\
+	EXC_REAL_BEGIN(name, start, size);				\
+	SET_SCRATCH0(r13);		/* save r13 */			\
+	EXCEPTION_PROLOG_0 area ;					\
+	EXCEPTION_PROLOG_1 EXC_STD, area, 1, start, 0 ;			\
+	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1 ;		\
+	EXC_REAL_END(name, start, size)
+
+#define EXC_REAL(name, start, size)					\
+	__EXC_REAL(name, start, size, PACA_EXGEN)
+
+#define __EXC_VIRT(name, start, size, realvec, area)			\
+	EXC_VIRT_BEGIN(name, start, size);				\
+	SET_SCRATCH0(r13);    /* save r13 */				\
+	EXCEPTION_PROLOG_0 area ;					\
+	EXCEPTION_PROLOG_1 EXC_STD, area, 0, realvec, 0;		\
+	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD ;		\
+	EXC_VIRT_END(name, start, size)
+
+#define EXC_VIRT(name, start, size, realvec)				\
+	__EXC_VIRT(name, start, size, realvec, PACA_EXGEN)
+
+#define EXC_REAL_MASKABLE(name, start, size, bitmask)			\
+	EXC_REAL_BEGIN(name, start, size);				\
+	SET_SCRATCH0(r13);    /* save r13 */				\
+	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, start, bitmask ;	\
+	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1 ;		\
+	EXC_REAL_END(name, start, size)
+
+#define EXC_VIRT_MASKABLE(name, start, size, realvec, bitmask)		\
+	EXC_VIRT_BEGIN(name, start, size);				\
+	SET_SCRATCH0(r13);    /* save r13 */				\
+	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, bitmask ;	\
+	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD ;		\
+	EXC_VIRT_END(name, start, size)
+
+#define EXC_REAL_HV(name, start, size)					\
+	EXC_REAL_BEGIN(name, start, size);				\
+	SET_SCRATCH0(r13);		/* save r13 */			\
+	EXCEPTION_PROLOG_0 PACA_EXGEN;					\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, start, 0 ;		\
+	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1 ;		\
+	EXC_REAL_END(name, start, size)
+
+#define EXC_VIRT_HV(name, start, size, realvec)				\
+	EXC_VIRT_BEGIN(name, start, size);				\
+	SET_SCRATCH0(r13);		/* save r13 */			\
+	EXCEPTION_PROLOG_0 PACA_EXGEN;					\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0 ;		\
+	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV ;			\
+	EXC_VIRT_END(name, start, size)
+
+#define __EXC_REAL_OOL(name, start, size)				\
+	EXC_REAL_BEGIN(name, start, size);				\
+	SET_SCRATCH0(r13);						\
+	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
+	b	tramp_real_##name ;					\
+	EXC_REAL_END(name, start, size)
+
+#define __TRAMP_REAL_OOL(name, vec)					\
+	TRAMP_REAL_BEGIN(tramp_real_##name);				\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, 0 ;	\
+	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1
+
+#define EXC_REAL_OOL(name, start, size)					\
+	__EXC_REAL_OOL(name, start, size);				\
+	__TRAMP_REAL_OOL(name, start)
+
+#define __EXC_REAL_OOL_MASKABLE(name, start, size)			\
+	__EXC_REAL_OOL(name, start, size)
+
+#define __TRAMP_REAL_OOL_MASKABLE(name, vec, bitmask)			\
+	TRAMP_REAL_BEGIN(tramp_real_##name);				\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, bitmask ;	\
+	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1
+
+#define EXC_REAL_OOL_MASKABLE(name, start, size, bitmask)		\
+	__EXC_REAL_OOL_MASKABLE(name, start, size);			\
+	__TRAMP_REAL_OOL_MASKABLE(name, start, bitmask)
+
+#define __EXC_REAL_OOL_HV_DIRECT(name, start, size, handler)		\
+	EXC_REAL_BEGIN(name, start, size);				\
+	SET_SCRATCH0(r13);						\
+	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
+	b	handler;						\
+	EXC_REAL_END(name, start, size)
+
+#define __EXC_REAL_OOL_HV(name, start, size)				\
+	__EXC_REAL_OOL(name, start, size)
+
+#define __TRAMP_REAL_OOL_HV(name, vec)					\
+	TRAMP_REAL_BEGIN(tramp_real_##name);				\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, 0 ;	\
+	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1
+
+#define EXC_REAL_OOL_HV(name, start, size)				\
+	__EXC_REAL_OOL_HV(name, start, size);				\
+	__TRAMP_REAL_OOL_HV(name, start)
+
+#define __EXC_REAL_OOL_MASKABLE_HV(name, start, size)			\
+	__EXC_REAL_OOL(name, start, size)
+
+#define __TRAMP_REAL_OOL_MASKABLE_HV(name, vec, bitmask)		\
+	TRAMP_REAL_BEGIN(tramp_real_##name);				\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, bitmask ;	\
+	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1
+
+#define EXC_REAL_OOL_MASKABLE_HV(name, start, size, bitmask)		\
+	__EXC_REAL_OOL_MASKABLE_HV(name, start, size);			\
+	__TRAMP_REAL_OOL_MASKABLE_HV(name, start, bitmask)
+
+#define __EXC_VIRT_OOL(name, start, size)				\
+	EXC_VIRT_BEGIN(name, start, size);				\
+	SET_SCRATCH0(r13);						\
+	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
+	b	tramp_virt_##name;					\
+	EXC_VIRT_END(name, start, size)
+
+#define __TRAMP_VIRT_OOL(name, realvec)					\
+	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, vec, 0 ;		\
+	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD
+
+#define EXC_VIRT_OOL(name, start, size, realvec)			\
+	__EXC_VIRT_OOL(name, start, size);				\
+	__TRAMP_VIRT_OOL(name, realvec)
+
+#define __EXC_VIRT_OOL_MASKABLE(name, start, size)			\
+	__EXC_VIRT_OOL(name, start, size)
+
+#define __TRAMP_VIRT_OOL_MASKABLE(name, realvec, bitmask)		\
+	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, bitmask ;	\
+	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1
+
+#define EXC_VIRT_OOL_MASKABLE(name, start, size, realvec, bitmask)	\
+	__EXC_VIRT_OOL_MASKABLE(name, start, size);			\
+	__TRAMP_VIRT_OOL_MASKABLE(name, realvec, bitmask)
+
+#define __EXC_VIRT_OOL_HV(name, start, size)				\
+	__EXC_VIRT_OOL(name, start, size)
+
+#define __TRAMP_VIRT_OOL_HV(name, realvec)				\
+	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0 ;		\
+	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV
+
+#define EXC_VIRT_OOL_HV(name, start, size, realvec)			\
+	__EXC_VIRT_OOL_HV(name, start, size);				\
+	__TRAMP_VIRT_OOL_HV(name, realvec)
+
+#define __EXC_VIRT_OOL_MASKABLE_HV(name, start, size)			\
+	__EXC_VIRT_OOL(name, start, size)
+
+#define __TRAMP_VIRT_OOL_MASKABLE_HV(name, realvec, bitmask)		\
+	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, bitmask ;	\
+	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV
+
+#define EXC_VIRT_OOL_MASKABLE_HV(name, start, size, realvec, bitmask)	\
+	__EXC_VIRT_OOL_MASKABLE_HV(name, start, size);			\
+	__TRAMP_VIRT_OOL_MASKABLE_HV(name, realvec, bitmask)
+
+#define TRAMP_KVM(area, n)						\
+	TRAMP_KVM_BEGIN(do_kvm_##n);					\
+	KVM_HANDLER area, EXC_STD, n, 0
+
+#define TRAMP_KVM_SKIP(area, n)						\
+	TRAMP_KVM_BEGIN(do_kvm_##n);					\
+	KVM_HANDLER area, EXC_STD, n, 1
+
+#define TRAMP_KVM_HV(area, n)						\
+	TRAMP_KVM_BEGIN(do_kvm_H##n);					\
+	KVM_HANDLER area, EXC_HV, n, 0
+
+#define TRAMP_KVM_HV_SKIP(area, n)					\
+	TRAMP_KVM_BEGIN(do_kvm_H##n);					\
+	KVM_HANDLER area, EXC_HV, n, 1
+
+#define EXC_COMMON(name, realvec, hdlr)					\
+	EXC_COMMON_BEGIN(name);						\
+	EXCEPTION_COMMON(PACA_EXGEN, realvec);				\
+	bl	save_nvgprs;						\
+	RECONCILE_IRQ_STATE(r10, r11);					\
+	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
+	bl	hdlr;							\
+	b	ret_from_except
+
+/*
+ * Like EXC_COMMON, but for exceptions that can occur in the idle task and
+ * therefore need the special idle handling (finish nap and runlatch)
+ */
+#define EXC_COMMON_ASYNC(name, realvec, hdlr)				\
+	EXC_COMMON_BEGIN(name);						\
+	EXCEPTION_COMMON(PACA_EXGEN, realvec);				\
+	FINISH_NAP;							\
+	RECONCILE_IRQ_STATE(r10, r11);					\
+	RUNLATCH_ON;							\
+	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
+	bl	hdlr;							\
+	b	ret_from_except_lite
+
 
 /*
  * There are a few constraints to be concerned with.
-- 
2.20.1

