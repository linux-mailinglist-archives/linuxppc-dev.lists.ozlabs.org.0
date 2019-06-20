Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6BE4C760
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:18:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ts8H4kQqzDr3k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:18:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U1Npj7yX"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqm618rBzDqvr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:06 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id q10so957470pff.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yRzWU1CmnSMUj3NzssLfe00Q+9dBOF3jEfWyrH/e9yE=;
 b=U1Npj7yXeP90pWsdHUvYCk2WMrNJECKIWp/hGxASLbaJNZaY/3jvuNsV18UIQQVw0E
 uCxwOlSadXjIHP9ZKtkxPlT/89BPPtYRggc0/omxf5a04iG8lGmr6lBzAEbVygyz9M/g
 FGhR5Grk/1sHeZ87QvVXzZrpdPwxHOpiTinyXD+TGNKboKzn/Q5tTDGrOrCim8nqD8Hg
 g3NeLYacTSOOSgS/kTkhwOZf5cr5dpxm0L6wtLkM42RvQWReTKZ3NMFgaaYD/r74hJb6
 ucB0M/BW7niJOJ4zax0vWG3EMyzYYeBSPH1qOVn9nHKHanMc3JF+rw3T1nP/Z4YDCNO3
 9OKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yRzWU1CmnSMUj3NzssLfe00Q+9dBOF3jEfWyrH/e9yE=;
 b=A3gE/xZubeOD53BMKc+vx0zKE24admI0jIE6j3EoUggo5IIkS2xEcEfNDOUpwC8Eml
 lU82Mhz0QlUwH6lTBR/14FB4zOAvhd23tPlKETP5d5WJHbj8oHZVQ5cS8GTTKToIaLMC
 j7QfUG0d9EVDH+jmUrc1rBH7Po9Bgu4cwrgHydZhUeMVsUohqofy99QASyghtH23mAxX
 Xa9d41UIsJmT07qQPH05Smha55uhEb6YDbXsYrbbiMpNZycpywQjMyl8wNpsfe1p7dO4
 VKmpwbHzQWzK9gTHnJK+bbZ9XtYxN2qalz837y4EUrevZZnAND3biHlNBtXuAWADyeXW
 LLIQ==
X-Gm-Message-State: APjAAAURsvasVutGeuweuMpLV1XqqOQZfimWesbnTjTne+9BGVGq6acY
 UDVnF5BEZUqRUk6C3EouKDKwGy6N
X-Google-Smtp-Source: APXvYqzdW1ENo+7YuzNYPu7PeHGmWLLWaRORSX0Hg+jnYvVMyvP54e3oAZTS90qwKxV+0k2T9FLeUA==
X-Received: by 2002:a17:90a:4803:: with SMTP id
 a3mr1153647pjh.58.1561007763843; 
 Wed, 19 Jun 2019 22:16:03 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 30/52] powerpc/64s/exception: optimise system_reset for
 idle, clean up non-idle case
Date: Thu, 20 Jun 2019 15:14:37 +1000
Message-Id: <20190620051459.29573-31-npiggin@gmail.com>
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

The idle wake up code in the system reset interrupt is not very
optimal. There are two requirements: perform idle wake up quickly;
and save everything including CFAR for non-idle interrupts, with
no performance requirement.

The problem with placing the idle test in the middle of the handler
and using the normal handler code to save CFAR, is that it's quite
costly (e.g., mfcfar is serialising, speculative workarounds get
applied, SRR1 has to be reloaded, etc). It also prevents the standard
interrupt handler boilerplate being used.

This pain can be avoided by using a dedicated idle interrupt handler
at the start of the interrupt handler, which restores all registers
back to the way they were in case it was not an idle wake up. CFAR
is preserved without saving it before the non-idle case by making that
the fall-through, and idle is a taken branch.

Performance seems to be in the noise, but possibly around 0.5% faster,
the executed instructions certainly look better. The bigger benefit is
being able to drop in standard interrupt handlers after the idle code,
which helps with subsequent cleanup and consolidation.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 89 ++++++++++++++--------------
 1 file changed, 44 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e0492912ea79..f582ae30f3f7 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -241,7 +241,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
  * load KBASE for a slight optimisation.
  */
 #define BRANCH_TO_C000(reg, label)					\
-	__LOAD_HANDLER(reg, label);					\
+	__LOAD_FAR_HANDLER(reg, label);					\
 	mtctr	reg;							\
 	bctr
 
@@ -784,16 +784,6 @@ EXC_VIRT_NONE(0x4000, 0x100)
 
 
 EXC_REAL_BEGIN(system_reset, 0x100, 0x100)
-	SET_SCRATCH0(r13)
-	EXCEPTION_PROLOG_0 PACA_EXNMI
-
-	/* This is EXCEPTION_PROLOG_1 with the idle feature section added */
-	OPT_SAVE_REG_TO_PACA(PACA_EXNMI+EX_PPR, r9, CPU_FTR_HAS_PPR)
-	OPT_SAVE_REG_TO_PACA(PACA_EXNMI+EX_CFAR, r10, CPU_FTR_CFAR)
-	INTERRUPT_TO_KERNEL
-	SAVE_CTR(r10, PACA_EXNMI)
-	mfcr	r9
-
 #ifdef CONFIG_PPC_P7_NAP
 	/*
 	 * If running native on arch 2.06 or later, check if we are waking up
@@ -801,45 +791,67 @@ EXC_REAL_BEGIN(system_reset, 0x100, 0x100)
 	 * bits 46:47. A non-0 value indicates that we are coming from a power
 	 * saving state. The idle wakeup handler initially runs in real mode,
 	 * but we branch to the 0xc000... address so we can turn on relocation
-	 * with mtmsr.
+	 * with mtmsrd later, after SPRs are restored.
+	 *
+	 * Careful to minimise cost for the fast path (idle wakeup) while
+	 * also avoiding clobbering CFAR for the non-idle case. Once we know
+	 * it is an idle wake, volatiles don't matter, which is why we use
+	 * those here, and then re-do the entry in case of non-idle (without
+	 * branching for the non-idle case, to keep CFAR).
 	 */
 BEGIN_FTR_SECTION
-	mfspr	r10,SPRN_SRR1
-	rlwinm.	r10,r10,47-31,30,31
-	beq-	1f
-	cmpwi	cr1,r10,2
+	SET_SCRATCH0(r13)
+	GET_PACA(r13)
+	std	r3,PACA_EXNMI+0*8(r13)
+	std	r4,PACA_EXNMI+1*8(r13)
+	std	r5,PACA_EXNMI+2*8(r13)
 	mfspr	r3,SPRN_SRR1
-	bltlr	cr1	/* no state loss, return to idle caller */
-	BRANCH_TO_C000(r10, system_reset_idle_common)
-1:
+	mfocrf	r4,0x80
+	rlwinm.	r5,r3,47-31,30,31
+	bne+	system_reset_idle_wake
+	/* Not powersave wakeup. Restore regs for regular interrupt handler. */
+	mtocrf	0x80,r4
+	ld	r12,PACA_EXNMI+0*8(r13)
+	ld	r4,PACA_EXNMI+1*8(r13)
+	ld	r5,PACA_EXNMI+2*8(r13)
+	GET_SCRATCH0(r13)
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 #endif
 
-	KVMTEST EXC_STD 0x100
-	std	r11,PACA_EXNMI+EX_R11(r13)
-	std	r12,PACA_EXNMI+EX_R12(r13)
-	GET_SCRATCH0(r10)
-	std	r10,PACA_EXNMI+EX_R13(r13)
-
+	SET_SCRATCH0(r13)		/* save r13 */
+	EXCEPTION_PROLOG_0 PACA_EXNMI
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 1, 0x100, 0
 	EXCEPTION_PROLOG_2_REAL system_reset_common, EXC_STD, 0
 	/*
 	 * MSR_RI is not enabled, because PACA_EXNMI and nmi stack is
 	 * being used, so a nested NMI exception would corrupt it.
 	 */
-
 EXC_REAL_END(system_reset, 0x100, 0x100)
+
 EXC_VIRT_NONE(0x4100, 0x100)
 TRAMP_KVM(PACA_EXNMI, 0x100)
 
 #ifdef CONFIG_PPC_P7_NAP
-EXC_COMMON_BEGIN(system_reset_idle_common)
-	/*
-	 * This must be a direct branch (without linker branch stub) because
-	 * we can not use TOC at this point as r2 may not be restored yet.
-	 */
-	b	idle_return_gpr_loss
+TRAMP_REAL_BEGIN(system_reset_idle_wake)
+	/* We are waking up from idle, so may clobber any volatile register */
+	cmpwi	cr1,r5,2
+	bltlr	cr1	/* no state loss, return to idle caller with r3=SRR1 */
+	BRANCH_TO_C000(r12, idle_return_gpr_loss)
 #endif
 
+#ifdef CONFIG_PPC_PSERIES
+/*
+ * Vectors for the FWNMI option.  Share common code.
+ */
+TRAMP_REAL_BEGIN(system_reset_fwnmi)
+	SET_SCRATCH0(r13)		/* save r13 */
+	/* See comment at system_reset exception, don't turn on RI */
+	EXCEPTION_PROLOG_0 PACA_EXNMI
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 0, 0x100, 0
+	EXCEPTION_PROLOG_2_REAL system_reset_common, EXC_STD, 0
+
+#endif /* CONFIG_PPC_PSERIES */
+
 EXC_COMMON_BEGIN(system_reset_common)
 	/*
 	 * Increment paca->in_nmi then enable MSR_RI. SLB or MCE will be able
@@ -924,19 +936,6 @@ EXC_COMMON_BEGIN(system_reset_common)
 	ld	r1,GPR1(r1)
 	RFI_TO_USER_OR_KERNEL
 
-#ifdef CONFIG_PPC_PSERIES
-/*
- * Vectors for the FWNMI option.  Share common code.
- */
-TRAMP_REAL_BEGIN(system_reset_fwnmi)
-	SET_SCRATCH0(r13)		/* save r13 */
-	/* See comment at system_reset exception, don't turn on RI */
-	EXCEPTION_PROLOG_0 PACA_EXNMI
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 0, 0x100, 0
-	EXCEPTION_PROLOG_2_REAL system_reset_common, EXC_STD, 0
-
-#endif /* CONFIG_PPC_PSERIES */
-
 
 EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
 	/* This is moved out of line as it can be patched by FW, but
-- 
2.20.1

