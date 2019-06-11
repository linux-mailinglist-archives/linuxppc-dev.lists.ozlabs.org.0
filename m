Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 607093D03A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:07:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NYJz3P15zDqM1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:07:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WNWIxxHA"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZD0NsBzDqT7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:12 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id d126so7570107pfd.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/FqMdfaGrjyHhbTN2ESo3SABdg+hGRwoC4kpZWTfOjw=;
 b=WNWIxxHAx8pkscFOxDhXPMCRoyyfqalunuu4DpDhN6GO4q8Zgghg661YLNb6vyrfG9
 pQkzNtbcuqIqMIk71mrrw6cDQVBZOfG39pW2Sd02MOJeR1dxpQkCDYU5cgO7lr5Ncjeh
 sjDicd3uVy8MoGk+Hb5m6EqtMHh6xucLrSOmm4mnR1VroDWoMSWwGv/r5LOiiL+RlHjo
 4EynaKeflRsqG6HqrrNdR+1nk3oiVQs70EF6gszi1nb1Sy3xiaQLjLzAu8kLpZuaS4LI
 TbfaS/PDL+HpoBuCTWvKrtG/5Ooux617wUQl01Xj0ygG69h4mclZbc7w4/6J5OoRmZrP
 tV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/FqMdfaGrjyHhbTN2ESo3SABdg+hGRwoC4kpZWTfOjw=;
 b=TvP28hGS2NQApSaE8lwwkUgpyWaMmuYKwEdXQXC67FEehObnlgpIwikaWWa8eUYwBT
 Z++tzJkIMD62r/hFdT02nUlyDHgwHcjPQupU6VacGE8YE44rBtUPj7NPA5l1Qd+DPWjY
 fjyyxeh3Ve4oVfDHaabnfhNMdunuT3jvQvLzB/gLwu/2MoBWR6dkNHV5qmd6oBBRaowP
 ubAgF2PtjmqZwVOAgpVv+DFKyVLEMWMyAwDVpBqBR5vAHyEd3C5oqpUJpYuh6qXNiY/R
 eI2WgDIO1n0zDO6HfK/LQ/yjxtYhcnyAVgoC2Ie62NPl8misHsgUYgTgv+acZA01UneH
 hkmw==
X-Gm-Message-State: APjAAAWUknELVQcNTOjLSzsuMzQXGeKNca4xIVTrZpTWxnJ2RDqU7fql
 BdFMBG7kTWJTtnjllSeGqDqDM46T
X-Google-Smtp-Source: APXvYqzoLWO9SP94T1ENADE1oWAG0auxLmmy5pFpAlM/rN/HZkNqaXMMEPZckw8AUyRJyhJZ0cAZkQ==
X-Received: by 2002:a17:90a:376f:: with SMTP id
 u102mr8211011pjb.5.1560263649309; 
 Tue, 11 Jun 2019 07:34:09 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.34.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:34:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 12/28] powerpc/64s/exception: Move EXCEPTION_COMMON additions
 into callers
Date: Wed, 12 Jun 2019 00:30:24 +1000
Message-Id: <20190611143040.7834-13-npiggin@gmail.com>
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

More cases of code insertion via macros that does not add a great
deal. All the additions have to be specified in the macro arguments,
so they can just as well go after the macro.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 42 +++++++---------------
 arch/powerpc/include/asm/head-64.h       |  4 +--
 arch/powerpc/kernel/exceptions-64s.S     | 45 +++++++++++++-----------
 3 files changed, 39 insertions(+), 52 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index cc65e87cff2f..24fc0104c9d3 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -635,21 +635,6 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, bitmask ;	\
 	EXCEPTION_PROLOG_2_VIRT label, EXC_HV
 
-/*
- * Our exception common code can be passed various "additions"
- * to specify the behaviour of interrupts, whether to kick the
- * runlatch, etc...
- */
-
-/*
- * This addition reconciles our actual IRQ state with the various software
- * flags that track it. This may call C code.
- */
-#define ADD_RECONCILE	RECONCILE_IRQ_STATE(r10,r11)
-
-#define ADD_NVGPRS				\
-	bl	save_nvgprs
-
 #define RUNLATCH_ON				\
 BEGIN_FTR_SECTION				\
 	ld	r3, PACA_THREAD_INFO(r13);	\
@@ -658,25 +643,22 @@ BEGIN_FTR_SECTION				\
 	beql	ppc64_runlatch_on_trampoline;	\
 END_FTR_SECTION_IFSET(CPU_FTR_CTRL)
 
-#define EXCEPTION_COMMON(area, trap, label, additions)		\
+#define EXCEPTION_COMMON(area, trap)				\
 	EXCEPTION_PROLOG_COMMON(trap, area);			\
-	/* Volatile regs are potentially clobbered here */	\
-	additions
 
 /*
- * Exception where stack is already set in r1, r1 is saved in r10, and it
- * continues rather than returns.
+ * Exception where stack is already set in r1, r1 is saved in r10
  */
-#define EXCEPTION_COMMON_NORET_STACK(area, trap, label, additions) \
+#define EXCEPTION_COMMON_STACK(area, trap)			\
 	EXCEPTION_PROLOG_COMMON_1();				\
 	kuap_save_amr_and_lock r9, r10, cr1;			\
 	EXCEPTION_PROLOG_COMMON_2(area);			\
-	EXCEPTION_PROLOG_COMMON_3(trap);			\
-	/* Volatile regs are potentially clobbered here */	\
-	additions
+	EXCEPTION_PROLOG_COMMON_3(trap)
 
-#define STD_EXCEPTION_COMMON(trap, label, hdlr)			\
-	EXCEPTION_COMMON(PACA_EXGEN, trap, label, ADD_NVGPRS;ADD_RECONCILE); \
+#define STD_EXCEPTION_COMMON(trap, hdlr)			\
+	EXCEPTION_COMMON(PACA_EXGEN, trap);			\
+	bl	save_nvgprs;					\
+	RECONCILE_IRQ_STATE(r10, r11);				\
 	addi	r3,r1,STACK_FRAME_OVERHEAD;			\
 	bl	hdlr;						\
 	b	ret_from_except
@@ -686,9 +668,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_CTRL)
  * in the idle task and therefore need the special idle handling
  * (finish nap and runlatch)
  */
-#define STD_EXCEPTION_COMMON_ASYNC(trap, label, hdlr)		\
-	EXCEPTION_COMMON(PACA_EXGEN, trap, label,		\
-		FINISH_NAP;ADD_RECONCILE;RUNLATCH_ON);		\
+#define STD_EXCEPTION_COMMON_ASYNC(trap, hdlr)			\
+	EXCEPTION_COMMON(PACA_EXGEN, trap);			\
+	FINISH_NAP;						\
+	RECONCILE_IRQ_STATE(r10, r11);				\
+	RUNLATCH_ON;						\
 	addi	r3,r1,STACK_FRAME_OVERHEAD;			\
 	bl	hdlr;						\
 	b	ret_from_except_lite
diff --git a/arch/powerpc/include/asm/head-64.h b/arch/powerpc/include/asm/head-64.h
index bdd67a26e959..acd94fcf9f40 100644
--- a/arch/powerpc/include/asm/head-64.h
+++ b/arch/powerpc/include/asm/head-64.h
@@ -403,11 +403,11 @@ end_##sname:
 
 #define EXC_COMMON(name, realvec, hdlr)					\
 	EXC_COMMON_BEGIN(name);						\
-	STD_EXCEPTION_COMMON(realvec, name, hdlr)
+	STD_EXCEPTION_COMMON(realvec, hdlr)
 
 #define EXC_COMMON_ASYNC(name, realvec, hdlr)				\
 	EXC_COMMON_BEGIN(name);						\
-	STD_EXCEPTION_COMMON_ASYNC(realvec, name, hdlr)
+	STD_EXCEPTION_COMMON_ASYNC(realvec, hdlr)
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 63b161c23e9e..935019529f16 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -164,21 +164,6 @@ EXC_COMMON_BEGIN(system_reset_idle_common)
 	b	idle_return_gpr_loss
 #endif
 
-/*
- * Set IRQS_ALL_DISABLED unconditionally so arch_irqs_disabled does
- * the right thing. We do not want to reconcile because that goes
- * through irq tracing which we don't want in NMI.
- *
- * Save PACAIRQHAPPENED because some code will do a hard disable
- * (e.g., xmon). So we want to restore this back to where it was
- * when we return. DAR is unused in the stack, so save it there.
- */
-#define ADD_RECONCILE_NMI						\
-	li	r10,IRQS_ALL_DISABLED;					\
-	stb	r10,PACAIRQSOFTMASK(r13);				\
-	lbz	r10,PACAIRQHAPPENED(r13);				\
-	std	r10,_DAR(r1)
-
 EXC_COMMON_BEGIN(system_reset_common)
 	/*
 	 * Increment paca->in_nmi then enable MSR_RI. SLB or MCE will be able
@@ -195,8 +180,22 @@ EXC_COMMON_BEGIN(system_reset_common)
 	mr	r10,r1
 	ld	r1,PACA_NMI_EMERG_SP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
-	EXCEPTION_COMMON_NORET_STACK(PACA_EXNMI, 0x100, system_reset,
-					ADD_NVGPRS;ADD_RECONCILE_NMI)
+	EXCEPTION_COMMON_STACK(PACA_EXNMI, 0x100)
+	bl	save_nvgprs
+	/*
+	 * Set IRQS_ALL_DISABLED unconditionally so arch_irqs_disabled does
+	 * the right thing. We do not want to reconcile because that goes
+	 * through irq tracing which we don't want in NMI.
+	 *
+	 * Save PACAIRQHAPPENED because some code will do a hard disable
+	 * (e.g., xmon). So we want to restore this back to where it was
+	 * when we return. DAR is unused in the stack, so save it there.
+	 */
+	li	r10,IRQS_ALL_DISABLED
+	stb	r10,PACAIRQSOFTMASK(r13)
+	lbz	r10,PACAIRQHAPPENED(r13)
+	std	r10,_DAR(r1)
+
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	system_reset_exception
 
@@ -1172,8 +1171,11 @@ hmi_exception_after_realmode:
 	b	tramp_real_hmi_exception
 
 EXC_COMMON_BEGIN(hmi_exception_common)
-EXCEPTION_COMMON(PACA_EXGEN, 0xe60, hmi_exception_common,
-			FINISH_NAP;ADD_NVGPRS;ADD_RECONCILE;RUNLATCH_ON)
+	EXCEPTION_COMMON(PACA_EXGEN, 0xe60)
+	FINISH_NAP
+	bl	save_nvgprs
+	RECONCILE_IRQ_STATE(r10, r11)
+	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	handle_hmi_exception
 	b	ret_from_except
@@ -1471,8 +1473,9 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	mr	r10,r1
 	ld	r1,PACAEMERGSP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
-	EXCEPTION_COMMON_NORET_STACK(PACA_EXGEN, 0x900, system_reset,
-					ADD_NVGPRS;ADD_RECONCILE)
+	EXCEPTION_COMMON_STACK(PACA_EXGEN, 0x900)
+	bl	save_nvgprs
+	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	soft_nmi_interrupt
 	b	ret_from_except
-- 
2.20.1

