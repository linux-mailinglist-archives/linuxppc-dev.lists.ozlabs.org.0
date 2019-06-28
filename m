Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B419A59445
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 08:37:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZnBh28y1zDqmd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 16:37:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EriV0701"; 
 dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zn5b0VHfzDqjc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 16:33:22 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id q4so650487pgj.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 23:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4RFMpbkVykICvQsGedqi/O1KXZ3jKNuaQV90ZZ9WvnE=;
 b=EriV07016hR7Y2gR8Rh6VZHcw8fxmYIwwe8yJcBBOd0seOo5Ls5FBmmIIlhuWlotAo
 gu6/gmNP6HJB0ntLOxvWlH3vPkcPQHsBxuachrbuZ5KFoZE8pJjGKaHvNYkY6DZvqgB6
 6oBDXMNBU1JFMa29xL+Uda/+dkSsGAur+r2cYcRRX2ZJ9s+lbHKmguklOhcpLN6Um0CP
 HjUCWBWMqoqZeEv7yTlavJfGLXNCcvoD75nkPsCu5aMvy60h6X1DZ1lX2Gpog1p/adVA
 htbjcjmnOxVoIddLFkB/NMgLMsOkmKRpFjjiFtyEJxKgnvc1SauwvMZ7VMG/NI2+Ejx0
 duyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4RFMpbkVykICvQsGedqi/O1KXZ3jKNuaQV90ZZ9WvnE=;
 b=l8Y0fcOYbEoKso1hXCybl4NRH2jWOP4gF+r8uBGrTrUL7ZV0UvbCDv2ix7NEZrhGTV
 N2AiQ90GNAFFcJ1ri7KiUyHfbO14yKxuBLbldLrm6rX0clQyZMKF6oLfL0X6ys628NWV
 CPFp7orgqt1BEuf/B/yP+w2gNCzOiw8PeQDxHS3SjpoWDYqS9jB0qM13l4Z+qbV6Ta1V
 PzRXW9P/5DbKk5pNTNK4yrO94qDja0RSb0FKJ1NsSKVyed+Na5jeV5ebr5o717ROAVfp
 xxBm2N8kCp9G/dmajeKOHQjbCScnGI6OR0e1ZzlIx44x8OYNHhLqTkm6YBqfM/cLoqo0
 9M9A==
X-Gm-Message-State: APjAAAWhuVYVkrB4sUd/e++6zjBujcto0Z+idvBbe8Y+PcVjTByBGh0F
 NG7ztSDREMkv4MNVw1IhBfD37otz
X-Google-Smtp-Source: APXvYqwd+L0K4YVIwTKrMI4C2HaUrAxCwcC6xP1bSTtxW/uqpuQbM/AbbRxaJSPHYSmOuCGskjlFwQ==
X-Received: by 2002:a17:90a:b78b:: with SMTP id
 m11mr11338700pjr.106.1561703599625; 
 Thu, 27 Jun 2019 23:33:19 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id h14sm1071500pfq.22.2019.06.27.23.33.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 23:33:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/5] powerpc/64s/exception: optimise system_reset for idle,
 clean up non-idle case
Date: Fri, 28 Jun 2019 16:33:19 +1000
Message-Id: <20190628063322.11628-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628063322.11628-1-npiggin@gmail.com>
References: <20190628063322.11628-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S | 69 +++++++++++++++-------------
 1 file changed, 38 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 9aafe86193db..4b33aadd142c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -256,7 +256,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
  * load KBASE for a slight optimisation.
  */
 #define BRANCH_TO_C000(reg, label)					\
-	__LOAD_HANDLER(reg, label);					\
+	__LOAD_FAR_HANDLER(reg, label);					\
 	mtctr	reg;							\
 	bctr
 
@@ -822,15 +822,6 @@ EXC_VIRT_NONE(0x4000, 0x100)
 
 
 EXC_REAL_BEGIN(system_reset, 0x100, 0x100)
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
@@ -838,43 +829,59 @@ EXC_REAL_BEGIN(system_reset, 0x100, 0x100)
 	 * bits 46:47. A non-0 value indicates that we are coming from a power
 	 * saving state. The idle wakeup handler initially runs in real mode,
 	 * but we branch to the 0xc000... address so we can turn on relocation
-	 * with mtmsr.
+	 * with mtmsrd later, after SPRs are restored.
+	 *
+	 * Careful to minimise cost for the fast path (idle wakeup) while
+	 * also avoiding clobbering CFAR for the debug path (non-idle).
+	 *
+	 * For the idle wake case volatile registers can be clobbered, which
+	 * is why we use those initially. If it turns out to not be an idle
+	 * wake, carefully put everything back the way it was, so we can use
+	 * common exception macros to handle it.
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
+	ld	r3,PACA_EXNMI+0*8(r13)
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
+	EXCEPTION_PROLOG_0 PACA_EXNMI
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 1, 0x100, 0, 0, 0
 	EXCEPTION_PROLOG_2_REAL system_reset_common, EXC_STD, 0
 	/*
 	 * MSR_RI is not enabled, because PACA_EXNMI and nmi stack is
 	 * being used, so a nested NMI exception would corrupt it.
+	 *
+	 * In theory, we should not enable relocation here if it was disabled
+	 * in SRR1, because the MMU may not be configured to support it (e.g.,
+	 * SLB may have been cleared). In practice, there should only be a few
+	 * small windows where that's the case, and sreset is considered to
+	 * be dangerous anyway.
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
 
 EXC_COMMON_BEGIN(system_reset_common)
-- 
2.20.1

