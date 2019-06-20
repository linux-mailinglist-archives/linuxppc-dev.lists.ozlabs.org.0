Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE64C6EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 07:54:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Trc25v9JzDr2h
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 15:54:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OgAG9NtS"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqlf4S2gzDqwY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:15:42 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id 145so927674pgh.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I+csFcigayW2FkGZWopBq0vdno7cK6EOGeIo+OExkgw=;
 b=OgAG9NtShkYPbg2dq7vqHClmrwnHYxeSDOxQA/ctthFq6q25KQaz1TGihgPYlrWicK
 R7fwKfmHbjnw5pm3WBF6gFAM3T8eDuBduz/OuqsoB11E8akmcUTnURUBr/5NHaE+FUrX
 OFENc1+rE7/k6fn8Q/TypM/t+8Du8kcqKbPbkrY+10W5jRHk1fZbd//KAbJqxKq7VrPt
 /VfcYx6x7/5DWuEt4m5GJMREZ3j3VuneKHd82P/Q7ocFJufzlkEnDzU1J2oPkQuei4jC
 RBvDk5LT1qNZRLMsg52nXqxzQoIrRXcNKFGCP6v79aOCdBu76kSrc4m6jlVg18rywnz+
 lvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I+csFcigayW2FkGZWopBq0vdno7cK6EOGeIo+OExkgw=;
 b=RtFDDbOscr/LA6NoM63dtosZzvQGH2Ny13Y6quLefBDJYhRgsdPF4cRO3iD4SU6lRC
 kY2HJMbv3IOm6benHC80xapjcUqm5A08AJVRNWlB+8z9csNy+dy7dhOGH0+JMRc6/AV7
 awEzafn/etBibzRzb/UGL8a0y4/bis7r7gdDgj1i7iuGJzfGHZxVZJETPNO+NkdJztvV
 hKNh4eSkEwEpBs3fMAFkFwzF/EjNc3Inm+WFJ+Ml8vFAeyhHLziYJp6Iw2oo++cTEcYl
 4fj64P28hupHfvhfk17FsV6h2r0ivbH56hD1cF/kyXU1AIoe6jGA23UgBRHvAH68yXNc
 cwNA==
X-Gm-Message-State: APjAAAWL0BmAL0rbJXg3HQRzz5WcFeczDGruSSdO0QxsbBiwApa6vZm9
 FUOMVZwOxj2Yb64RqzumMJsSLyD5
X-Google-Smtp-Source: APXvYqyyOCDYqJecTSlymFkCHA81o1ujqEXXXw0mjBQrO95mbs6JNSsWQOi06cZ8o9cNiBoluDyDRQ==
X-Received: by 2002:a17:90a:9b8a:: with SMTP id
 g10mr1105759pjp.66.1561007740371; 
 Wed, 19 Jun 2019 22:15:40 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:15:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 19/52] powerpc/64s/exception: move head-64.h code to
 exception-64s.S where it is used
Date: Thu, 20 Jun 2019 15:14:26 +1000
Message-Id: <20190620051459.29573-20-npiggin@gmail.com>
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
index 5e26245efb02..0a5a2d9dde90 100644
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

