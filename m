Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6CA4C787
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:34:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TsV21wNTzDqsd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:34:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nLFh4PWR"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TqmP12Q9zDqvw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:21 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id t16so954546pfe.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TG9jnC3xWkkGNwLfR3R6Fon91HTJvySH0Z0Ogy6uC4g=;
 b=nLFh4PWRW4E9c/l1Zkk241nloLi4EyiSIo4K5ArhgGwlpYb+c5lqXIqVFxaNacb2bs
 qVlnIFqSAqznP/XP+Bf9auYDy+S8yppMiWoYX8qVEW5fIsjdzmQnst+nzR6nLr6cewxv
 0DN4GjAayub5b9bKFPHACsT032eiRbUHxsrDPuF8vdBseajxibac0mp42HHF9bqax2M9
 ykMqDk7t3VtUrYC+ok05HEOp54mbhuYo2yB+WVVGxyJLkFmiTdLPDmAJc9TXQxDQxOD5
 ulE0B+x3HZSq+NZSqtDQfPi72UbkqIO0ZiPhoaAoKvI6jBX++sPtdjhXJg6oBUCe2qMg
 ZLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TG9jnC3xWkkGNwLfR3R6Fon91HTJvySH0Z0Ogy6uC4g=;
 b=ifaot0rQcx/DPyCMLrsnm7VKcY2r4/JvAxCUIDcqXLkuKB2lCZDaEgcuLHMaIKqrgX
 7iP9R763U3+Lc5QOE0OBf3hxjDl1x6vZabncg4rsh2AFoGIONbtvAogTMiOpqOjCbjyc
 PZ8M96PXH/e8iHMmdFcFCi5M6K5/hd8InyOt9G9edZARKd1/E88LcXFQG84cJDgC/G52
 si0BJXTsKrp16E7SEAhJEPHNMmhYeZTMoiCSlyK5akTLrdaIi2rnWfuC+vdTL7vizPf3
 m4obondrI/9Vxh15vQkaUC9QuloGm268jcAJGmYM+8kxbXzRrYrP7U3sXV6+w/mNfUSi
 zrsA==
X-Gm-Message-State: APjAAAWkP9U2fmgH0m9Ql2Anc3efbW+xw4tMrjfL7C2NNVod3WVfefpl
 R5ydJvFaLm8oZUGur+f6RjNYj2Sh
X-Google-Smtp-Source: APXvYqytUH6WcZN0RiyivVbpiRH8PXF7N00UlLMeaxvB+pWguBvGfnBVrDdjhGkL09zv6hp0SqMEUw==
X-Received: by 2002:a63:88c7:: with SMTP id l190mr5455216pgd.240.1561007779110; 
 Wed, 19 Jun 2019 22:16:19 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 37/52] powerpc/64s/exception: add dar and dsisr options to
 exception macro
Date: Thu, 20 Jun 2019 15:14:44 +1000
Message-Id: <20190620051459.29573-38-npiggin@gmail.com>
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

Some exception entry requires DAR and/or DSISR to be saved into the
paca exception save area. Add options to the standard exception
macros for these.

Generated code changes slightly due to code structure.

-     554:      a6 02 72 7d     mfdsisr r11
-     558:      a8 00 4d f9     std     r10,168(r13)
-     55c:      b0 00 6d 91     stw     r11,176(r13)
+     554:      a8 00 4d f9     std     r10,168(r13)
+     558:      a6 02 52 7d     mfdsisr r10
+     55c:      b0 00 4d 91     stw     r10,176(r13)

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 103 ++++++++++++---------------
 1 file changed, 46 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 2412b5269e25..16d5ea1c86bb 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -136,7 +136,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	OPT_GET_SPR(r10, SPRN_CFAR, CPU_FTR_CFAR)
 .endm
 
-.macro EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, bitmask
+.macro EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, dar, dsisr, bitmask
 	OPT_SAVE_REG_TO_PACA(\area\()+EX_PPR, r9, CPU_FTR_HAS_PPR)
 	OPT_SAVE_REG_TO_PACA(\area\()+EX_CFAR, r10, CPU_FTR_CFAR)
 	INTERRUPT_TO_KERNEL
@@ -172,8 +172,22 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 
 	std	r11,\area\()+EX_R11(r13)
 	std	r12,\area\()+EX_R12(r13)
+
+	/*
+	 * DAR/DSISR, SCRATCH0 must be read before setting MSR[RI],
+	 * because a d-side MCE will clobber those registers so is
+	 * not recoverable if they are live.
+	 */
 	GET_SCRATCH0(r10)
 	std	r10,\area\()+EX_R13(r13)
+	.if \dar
+	mfspr	r10,SPRN_DAR
+	std	r10,\area\()+EX_DAR(r13)
+	.endif
+	.if \dsisr
+	mfspr	r10,SPRN_DSISR
+	stw	r10,\area\()+EX_DSISR(r13)
+	.endif
 .endm
 
 .macro EXCEPTION_PROLOG_2_REAL label, hsrr, set_ri
@@ -528,7 +542,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	EXC_REAL_BEGIN(name, start, size);				\
 	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0 area ;					\
-	EXCEPTION_PROLOG_1 EXC_STD, area, 1, start, 0 ;			\
+	EXCEPTION_PROLOG_1 EXC_STD, area, 1, start, 0, 0, 0 ;		\
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1 ;		\
 	EXC_REAL_END(name, start, size)
 
@@ -539,7 +553,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	EXC_VIRT_BEGIN(name, start, size);				\
 	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0 area ;					\
-	EXCEPTION_PROLOG_1 EXC_STD, area, 0, realvec, 0;		\
+	EXCEPTION_PROLOG_1 EXC_STD, area, 0, realvec, 0, 0, 0;		\
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD ;		\
 	EXC_VIRT_END(name, start, size)
 
@@ -550,7 +564,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	EXC_REAL_BEGIN(name, start, size);				\
 	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, start, bitmask ;	\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, start, 0, 0, bitmask ; \
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1 ;		\
 	EXC_REAL_END(name, start, size)
 
@@ -558,7 +572,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	EXC_VIRT_BEGIN(name, start, size);				\
 	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, bitmask ;	\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, 0, 0, bitmask ; \
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD ;		\
 	EXC_VIRT_END(name, start, size)
 
@@ -566,7 +580,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	EXC_REAL_BEGIN(name, start, size);				\
 	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0 PACA_EXGEN;					\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, start, 0 ;		\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, start, 0, 0, 0 ;	\
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1 ;		\
 	EXC_REAL_END(name, start, size)
 
@@ -574,7 +588,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	EXC_VIRT_BEGIN(name, start, size);				\
 	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0 PACA_EXGEN;					\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0 ;		\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0, 0, 0 ;	\
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV ;			\
 	EXC_VIRT_END(name, start, size)
 
@@ -587,7 +601,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __TRAMP_REAL_OOL(name, vec)					\
 	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, 0 ;	\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, 0, 0, 0 ;	\
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1
 
 #define EXC_REAL_OOL(name, start, size)					\
@@ -599,7 +613,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __TRAMP_REAL_OOL_MASKABLE(name, vec, bitmask)			\
 	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, bitmask ;	\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, 0, 0, bitmask ;	\
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1
 
 #define EXC_REAL_OOL_MASKABLE(name, start, size, bitmask)		\
@@ -618,7 +632,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __TRAMP_REAL_OOL_HV(name, vec)					\
 	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, 0 ;	\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, 0, 0, 0 ;	\
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1
 
 #define EXC_REAL_OOL_HV(name, start, size)				\
@@ -630,7 +644,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __TRAMP_REAL_OOL_MASKABLE_HV(name, vec, bitmask)		\
 	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, bitmask ;	\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, 0, 0, bitmask ;	\
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1
 
 #define EXC_REAL_OOL_MASKABLE_HV(name, start, size, bitmask)		\
@@ -646,7 +660,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __TRAMP_VIRT_OOL(name, realvec)					\
 	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, vec, 0 ;		\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, vec, 0, 0, 0 ;	\
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD
 
 #define EXC_VIRT_OOL(name, start, size, realvec)			\
@@ -658,7 +672,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __TRAMP_VIRT_OOL_MASKABLE(name, realvec, bitmask)		\
 	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, bitmask ;	\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, 0, 0, bitmask ; \
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1
 
 #define EXC_VIRT_OOL_MASKABLE(name, start, size, realvec, bitmask)	\
@@ -670,7 +684,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __TRAMP_VIRT_OOL_HV(name, realvec)				\
 	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0 ;		\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0, 0, 0 ;	\
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV
 
 #define EXC_VIRT_OOL_HV(name, start, size, realvec)			\
@@ -682,7 +696,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __TRAMP_VIRT_OOL_MASKABLE_HV(name, realvec, bitmask)		\
 	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, bitmask ;	\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0, 0, bitmask ; \
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV
 
 #define EXC_VIRT_OOL_MASKABLE_HV(name, start, size, realvec, bitmask)	\
@@ -852,7 +866,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 
 	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXNMI
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 1, 0x100, 0
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 1, 0x100, 0, 0, 0
 	EXCEPTION_PROLOG_2_REAL system_reset_common, EXC_STD, 0
 	/*
 	 * MSR_RI is not enabled, because PACA_EXNMI and nmi stack is
@@ -879,7 +893,7 @@ TRAMP_REAL_BEGIN(system_reset_fwnmi)
 	SET_SCRATCH0(r13)		/* save r13 */
 	/* See comment at system_reset exception, don't turn on RI */
 	EXCEPTION_PROLOG_0 PACA_EXNMI
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 0, 0x100, 0
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 0, 0x100, 0, 0, 0
 	EXCEPTION_PROLOG_2_REAL system_reset_common, EXC_STD, 0
 
 #endif /* CONFIG_PPC_PSERIES */
@@ -957,7 +971,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 EXC_REAL_END(machine_check, 0x200, 0x100)
 EXC_VIRT_NONE(0x4200, 0x100)
 TRAMP_REAL_BEGIN(machine_check_common_early)
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 0, 0x200, 0
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 0, 0x200, 0, 0, 0
 	/*
 	 * Register contents:
 	 * R13		= PACA
@@ -1042,7 +1056,7 @@ BEGIN_FTR_SECTION
 	b	machine_check_common_early
 END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
 machine_check_pSeries_0:
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 0
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 0, 0, 0
 	/*
 	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
 	 * nested machine check corrupts it. machine_check_common enables
@@ -1259,26 +1273,13 @@ EXC_REAL_BEGIN(data_access, 0x300, 0x80)
 EXC_REAL_END(data_access, 0x300, 0x80)
 
 TRAMP_REAL_BEGIN(tramp_real_data_access)
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x300, 0
-	/*
-	 * DAR/DSISR must be read before setting MSR[RI], because
-	 * a d-side MCE will clobber those registers so is not
-	 * recoverable if they are live.
-	 */
-	mfspr	r10,SPRN_DAR
-	mfspr	r11,SPRN_DSISR
-	std	r10,PACA_EXGEN+EX_DAR(r13)
-	stw	r11,PACA_EXGEN+EX_DSISR(r13)
-EXCEPTION_PROLOG_2_REAL data_access_common, EXC_STD, 1
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x300, 1, 1, 0
+	EXCEPTION_PROLOG_2_REAL data_access_common, EXC_STD, 1
 
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x300, 0
-	mfspr	r10,SPRN_DAR
-	mfspr	r11,SPRN_DSISR
-	std	r10,PACA_EXGEN+EX_DAR(r13)
-	stw	r11,PACA_EXGEN+EX_DSISR(r13)
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x300, 1, 1, 0
 EXCEPTION_PROLOG_2_VIRT data_access_common, EXC_STD
 EXC_VIRT_END(data_access, 0x4300, 0x80)
 
@@ -1313,17 +1314,13 @@ EXC_REAL_BEGIN(data_access_slb, 0x380, 0x80)
 EXC_REAL_END(data_access_slb, 0x380, 0x80)
 
 TRAMP_REAL_BEGIN(tramp_real_data_access_slb)
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 1, 0x380, 0
-	mfspr	r10,SPRN_DAR
-	std	r10,PACA_EXSLB+EX_DAR(r13)
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 1, 0x380, 1, 0, 0
 	EXCEPTION_PROLOG_2_REAL data_access_slb_common, EXC_STD, 1
 
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXSLB
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 0, 0x380, 0
-	mfspr	r10,SPRN_DAR
-	std	r10,PACA_EXSLB+EX_DAR(r13)
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 0, 0x380, 1, 0, 0
 	EXCEPTION_PROLOG_2_VIRT data_access_slb_common, EXC_STD
 EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
 
@@ -1408,10 +1405,10 @@ EXC_REAL_BEGIN(hardware_interrupt, 0x500, 0x100)
 	SET_SCRATCH0(r13)	/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 BEGIN_FTR_SECTION
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
 	EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_HV, 1
 FTR_SECTION_ELSE
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
 	EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_STD, 1
 ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 EXC_REAL_END(hardware_interrupt, 0x500, 0x100)
@@ -1420,10 +1417,10 @@ EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
 	SET_SCRATCH0(r13)	/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 BEGIN_FTR_SECTION
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
 	EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_HV
 FTR_SECTION_ELSE
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
 	EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_STD
 ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
@@ -1436,22 +1433,14 @@ EXC_COMMON_ASYNC(hardware_interrupt_common, 0x500, do_IRQ)
 EXC_REAL_BEGIN(alignment, 0x600, 0x100)
 	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x600, 0
-	mfspr	r10,SPRN_DAR
-	mfspr	r11,SPRN_DSISR
-	std	r10,PACA_EXGEN+EX_DAR(r13)
-	stw	r11,PACA_EXGEN+EX_DSISR(r13)
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x600, 1, 1, 0
 	EXCEPTION_PROLOG_2_REAL alignment_common, EXC_STD, 1
 EXC_REAL_END(alignment, 0x600, 0x100)
 
 EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
 	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x600, 0
-	mfspr	r10,SPRN_DAR
-	mfspr	r11,SPRN_DSISR
-	std	r10,PACA_EXGEN+EX_DAR(r13)
-	stw	r11,PACA_EXGEN+EX_DSISR(r13)
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x600, 1, 1, 0
 	EXCEPTION_PROLOG_2_VIRT alignment_common, EXC_STD
 EXC_VIRT_END(alignment, 0x4600, 0x100)
 
@@ -1752,7 +1741,7 @@ __TRAMP_REAL_OOL_MASKABLE_HV(hmi_exception, 0xe60, IRQS_DISABLED)
 EXC_VIRT_NONE(0x4e60, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xe60)
 TRAMP_REAL_BEGIN(hmi_exception_early)
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0xe60, 0
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0xe60, 0, 0, 0
 	mr	r10,r1			/* Save r1 */
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack for realmode */
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
@@ -1937,7 +1926,7 @@ EXC_VIRT_NONE(0x5400, 0x100)
 EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
 	mtspr	SPRN_SPRG_HSCRATCH0,r13
 	EXCEPTION_PROLOG_0 PACA_EXGEN
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 0, 0x1500, 0
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 0, 0x1500, 0, 0, 0
 
 #ifdef CONFIG_PPC_DENORMALISATION
 	mfspr	r10,SPRN_HSRR1
-- 
2.20.1

