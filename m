Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 836114C6DA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 07:41:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TrJn3yQMzDqyc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 15:40:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KHL5pcRF"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TqlP0v3qzDqvv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:15:29 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id i189so954728pfg.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6orhHo99b9MzqbWqIYxoJv4ipBsJmLR0J7Xaf0H4zCc=;
 b=KHL5pcRFGsNVeDdHuK35hIL+UbnllEMkc7Uh1T7icGVr2uqLJKEZDzCQgt21TIa/Gp
 vhe13RgQVC07tUdoFbhHtSXsyNf7XX9wZAsFl8b7qK0/FREt3fkoRxyiEpMEbPhNYOHn
 8pPiowEGYAmfylCZxsUWRw6NfL1uCjmkS4lgOBWTt/HYwl14ypv+CXwm3XwA6l8jn/bX
 5p+c7WvP4xTIAGGcqn3CntWXzVbT2AbRBE3WyGb7eoYlDqcM95Y8mycb+BznA2pmQu8Y
 SzyaBQwhhNmTaRs78YfRTJ77ZVVU+Psck9M/T/nC/fOJsw3nNPUn33MvipR/GQtpCHpd
 Rxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6orhHo99b9MzqbWqIYxoJv4ipBsJmLR0J7Xaf0H4zCc=;
 b=U5UfBeo+ynonQ1lTKLJcCh/pvk5sVDQvwjUHJzZiYkc9PtemQHlygUgrRbBIP9NtJC
 bLB2hfUO2eFsMXHKChZOPRuGbtXeielJDjo9eylI8/7M9rFFE/shrB38dvBmY9Jn8jaP
 MhON+JzV5xBHIqFRS82pooCAYQMb8JvcdxlpgifonLsExzz35vB+hKCxN/Cyxbq29VGf
 UciYYbb/gAxJFzaEcmJgbpCAata39i+PkXtG9vS1RSqRYiNXapduy6/BVbLIJV8LeQSk
 NagHoTSndx465v/G4H+mAPwPNk8SSg47Lt+r7+5Cgp/5Ae7E8YTTPcvfOo7k95X2e5E8
 XELg==
X-Gm-Message-State: APjAAAWlDut57JaL9Sv3lS2bBMaSFh81aSKm5KIPogTVqPsysLhOVD39
 V9Gq0/A5+IL2Mz/7AUHOxygvePuR
X-Google-Smtp-Source: APXvYqyjhCPAvUEJZzEgIUK+BsMl5O/EEewfSyhqEsrranBP4dol7aKy9Uqq/qHTn0/nsziGNi/mvQ==
X-Received: by 2002:a62:2d3:: with SMTP id 202mr54889493pfc.131.1561007724166; 
 Wed, 19 Jun 2019 22:15:24 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:15:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 12/52] powerpc/64s/exception: Move EXCEPTION_COMMON
 additions into callers
Date: Thu, 20 Jun 2019 15:14:19 +1000
Message-Id: <20190620051459.29573-13-npiggin@gmail.com>
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
index 87c4ebeb950c..72c178feaa98 100644
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

