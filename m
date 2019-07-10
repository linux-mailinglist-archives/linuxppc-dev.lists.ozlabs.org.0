Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BC864A7A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 18:08:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kPH6071qzDqrW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 02:08:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="i18s4Q66"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kNHc6lxyzDqLY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:23:24 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id c73so1248820pfb.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 08:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f5CDkJVHhGOH438kLGYlAq4B7MBYR/8fF3+pSKCnpUI=;
 b=i18s4Q66owJAIDbeft9X1RlknK6VRYvbHAx1V3f2MhDjM9ZCRC/enqd/dyEQ6ou68p
 TU7eL6xs8D+VErgCda4/X+4bybYRo4sp2FERxqXKkfs2D/9AQrrO4HyDIO/UR6FZK1oc
 Bg5UFC2rGZsY4NQNmVyfU0UxgydInPUQV1UgXCJDZjd7x25UQEqYNBv+tkVqNxH7OR8N
 4Iq2c+YHj36pZvMj8o2n5MJfIogopLJ2e/Ums5zod/6qdhWsBBPAhj8+vwbiZK0nxCYM
 xz0iuYKhQHP5c3egFtQuxtBl8w4Zfu58OxxvZ25TfpYfoWZyz+m0tUbtqwPNxk6HL9rR
 gwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f5CDkJVHhGOH438kLGYlAq4B7MBYR/8fF3+pSKCnpUI=;
 b=ZsO5ma6f08TRxzoMHaEh4vKqYQPUWNnwi1ZjFgkd7WPYQ0rKFizU6huiC/D6Uvg57i
 2/phXtyIG+9jW58TWTvLRdTZVJmQ8fhdLRtthlW9SKW60AgHjjObuxJIvgJifnWmQKiS
 NtgeQxk49VvydE5kXOdvjhj5dbgV7Wxv5qE/kq20t/XFTt56NjKWkvoNBG36H5hXOFOH
 FKQ3WJ2rZEEMTUBWlqy5Kc/q6wN1quZ9saWsDQnGzMwxDs909NsKFVQHsmiELpe4jJZu
 gVhnqEsrVeiu7MXeblf5Q0VtgbMCabYrZDtlTVh2Ko7FvD8S2BEO19w2MVTQRAs01Md5
 q1+w==
X-Gm-Message-State: APjAAAVaiw+B/O2A2p/5aPPWfGp1xd2uy5opw53x6nMYHtZoZb5f/xrC
 wMiO++kwpF9EKJsR/XMlFq+ePR5yHm8=
X-Google-Smtp-Source: APXvYqxMzuadD5PogzArT2670C2guWr0G6+0llWJQU/4GIFb4l4B/smj5s/eSDuI07HREkJwyyXF/w==
X-Received: by 2002:a63:1657:: with SMTP id 23mr35450624pgw.98.1562772202891; 
 Wed, 10 Jul 2019 08:23:22 -0700 (PDT)
Received: from bobo.local0.net (14-203-207-157.tpgi.com.au. [14.203.207.157])
 by smtp.gmail.com with ESMTPSA id
 s22sm2699212pfh.107.2019.07.10.08.23.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:23:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 15/16] powerpc/64s/exception: untangle early machine check
 handler branch
Date: Thu, 11 Jul 2019 01:19:49 +1000
Message-Id: <20190710151950.31906-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710151950.31906-1-npiggin@gmail.com>
References: <20190710151950.31906-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

machine_check_early_common now branches to machine_check_handle_early
which is its only caller.

Move interleaving code out of the way, and remove the branch.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 129 +++++++++++++--------------
 1 file changed, 62 insertions(+), 67 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 95dd7ff3ef04..d196558d4243 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -956,6 +956,16 @@ TRAMP_REAL_BEGIN(machine_check_fwnmi)
 
 TRAMP_KVM_SKIP(PACA_EXMC, 0x200)
 
+#define MACHINE_CHECK_HANDLER_WINDUP			\
+	/* Clear MSR_RI before setting SRR0 and SRR1. */\
+	li	r9,0;					\
+	mtmsrd	r9,1;		/* Clear MSR_RI */	\
+	/* Decrement paca->in_mce now RI is clear. */	\
+	lhz	r12,PACA_IN_MCE(r13);			\
+	subi	r12,r12,1;				\
+	sth	r12,PACA_IN_MCE(r13);			\
+	EXCEPTION_RESTORE_REGS EXC_STD
+
 EXC_COMMON_BEGIN(machine_check_early_common)
 	mtctr	r10			/* Restore ctr */
 	mfspr	r11,SPRN_SRR0
@@ -1011,74 +1021,7 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	li	r10,MSR_RI
 	mtmsrd	r10,1
-	b	machine_check_handle_early
 
-EXC_COMMON_BEGIN(machine_check_common)
-	/*
-	 * Machine check is different because we use a different
-	 * save area: PACA_EXMC instead of PACA_EXGEN.
-	 */
-	EXCEPTION_COMMON(PACA_EXMC, 0x200)
-	FINISH_NAP
-	RECONCILE_IRQ_STATE(r10, r11)
-	ld	r3,PACA_EXMC+EX_DAR(r13)
-	lwz	r4,PACA_EXMC+EX_DSISR(r13)
-	/* Enable MSR_RI when finished with PACA_EXMC */
-	li	r10,MSR_RI
-	mtmsrd 	r10,1
-	std	r3,_DAR(r1)
-	std	r4,_DSISR(r1)
-	bl	save_nvgprs
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	machine_check_exception
-	b	ret_from_except
-
-#define MACHINE_CHECK_HANDLER_WINDUP			\
-	/* Clear MSR_RI before setting SRR0 and SRR1. */\
-	li	r9,0;					\
-	mtmsrd	r9,1;		/* Clear MSR_RI */	\
-	/* Decrement paca->in_mce now RI is clear. */	\
-	lhz	r12,PACA_IN_MCE(r13);			\
-	subi	r12,r12,1;				\
-	sth	r12,PACA_IN_MCE(r13);			\
-	EXCEPTION_RESTORE_REGS EXC_STD
-
-#ifdef CONFIG_PPC_P7_NAP
-/*
- * This is an idle wakeup. Low level machine check has already been
- * done. Queue the event then call the idle code to do the wake up.
- */
-EXC_COMMON_BEGIN(machine_check_idle_common)
-	bl	machine_check_queue_event
-
-	/*
-	 * We have not used any non-volatile GPRs here, and as a rule
-	 * most exception code including machine check does not.
-	 * Therefore PACA_NAPSTATELOST does not need to be set. Idle
-	 * wakeup will restore volatile registers.
-	 *
-	 * Load the original SRR1 into r3 for pnv_powersave_wakeup_mce.
-	 *
-	 * Then decrement MCE nesting after finishing with the stack.
-	 */
-	ld	r3,_MSR(r1)
-	ld	r4,_LINK(r1)
-
-	lhz	r11,PACA_IN_MCE(r13)
-	subi	r11,r11,1
-	sth	r11,PACA_IN_MCE(r13)
-
-	mtlr	r4
-	rlwinm	r10,r3,47-31,30,31
-	cmpwi	cr1,r10,2
-	bltlr	cr1	/* no state loss, return to idle caller */
-	b	idle_return_gpr_loss
-#endif
-	/*
-	 * Handle machine check early in real mode. We come here with
-	 * ME=1, MMU (IR=0 and DR=0) off and using MC emergency stack.
-	 */
-EXC_COMMON_BEGIN(machine_check_handle_early)
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_early
@@ -1157,6 +1100,58 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
 	EXCEPTION_PROLOG_2_REAL machine_check_common, EXC_STD, 0
 
+EXC_COMMON_BEGIN(machine_check_common)
+	/*
+	 * Machine check is different because we use a different
+	 * save area: PACA_EXMC instead of PACA_EXGEN.
+	 */
+	EXCEPTION_COMMON(PACA_EXMC, 0x200)
+	FINISH_NAP
+	RECONCILE_IRQ_STATE(r10, r11)
+	ld	r3,PACA_EXMC+EX_DAR(r13)
+	lwz	r4,PACA_EXMC+EX_DSISR(r13)
+	/* Enable MSR_RI when finished with PACA_EXMC */
+	li	r10,MSR_RI
+	mtmsrd 	r10,1
+	std	r3,_DAR(r1)
+	std	r4,_DSISR(r1)
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	machine_check_exception
+	b	ret_from_except
+
+#ifdef CONFIG_PPC_P7_NAP
+/*
+ * This is an idle wakeup. Low level machine check has already been
+ * done. Queue the event then call the idle code to do the wake up.
+ */
+EXC_COMMON_BEGIN(machine_check_idle_common)
+	bl	machine_check_queue_event
+
+	/*
+	 * We have not used any non-volatile GPRs here, and as a rule
+	 * most exception code including machine check does not.
+	 * Therefore PACA_NAPSTATELOST does not need to be set. Idle
+	 * wakeup will restore volatile registers.
+	 *
+	 * Load the original SRR1 into r3 for pnv_powersave_wakeup_mce.
+	 *
+	 * Then decrement MCE nesting after finishing with the stack.
+	 */
+	ld	r3,_MSR(r1)
+	ld	r4,_LINK(r1)
+
+	lhz	r11,PACA_IN_MCE(r13)
+	subi	r11,r11,1
+	sth	r11,PACA_IN_MCE(r13)
+
+	mtlr	r4
+	rlwinm	r10,r3,47-31,30,31
+	cmpwi	cr1,r10,2
+	bltlr	cr1	/* no state loss, return to idle caller */
+	b	idle_return_gpr_loss
+#endif
+
 EXC_COMMON_BEGIN(unrecoverable_mce)
 	/*
 	 * We are going down. But there are chances that we might get hit by
-- 
2.20.1

