Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E06C95DFAE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 10:23:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dvJ25LsQzDqP2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 18:23:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mG8twAdK"; 
 dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dthx62W9zDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 17:56:17 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id i18so776204pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 00:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VVVGiYS5Q6FkipZNNA8ELLJ87Qz7BjpommTr3hGQEy8=;
 b=mG8twAdKPruUulT9bmwkSif3ttwArwpO0mSHyOKFw533QDQoaZCx+wOIGBolyl7aRn
 xg/ccKtgHf6woMnbvCcXX0qBid5Ah/C1lgUAMXcLsWoCqrI5CdFdoZOoVea/T66E4xjU
 V/0T1Tv/IOWNexQIClXC3lU+wd44f2ytklkn0VdPYU/GG9Y7z9QzMkEdedva2XZxRpeX
 fqDafTp8BrYqYJAwDd2+o4vtAy8Bo55tW6V3l5NFRbrZlqG2dYlGeRq8+LzHky56+M5s
 J90n8aZeGN2MIoE2+c9iEdQvrnJveZoEwk4BDE4v/RrPBi5cYa4L24JFni9byQDZw21a
 aNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VVVGiYS5Q6FkipZNNA8ELLJ87Qz7BjpommTr3hGQEy8=;
 b=lIEICQiDLTInu5DjEpXEtLwpXzpbUpoSdAA6jCASOtACULF6SbwV//jWLAsGOnUZaN
 5LYQJA8wuE9Md7GXldGPEw6tRUBMMiyqE+o7347tQh8AOYayDlF6htTmQDum9lPqA9UU
 nyvPcEGejlOrihPddnK0f1f0DIej+WWIJJJv/kgp8yEhKshgIDtgrDntfe0lahDlvgg/
 e3KFLwzxmhvmLL9jwRYnaE+ajY4Q2A9Z7YHSOEPwvs6Ffn7L+pG0b6h2tUIxnD5zog4a
 V6lks5m/4eugxbBBY3y90K0pCDiz8H6TXrweoLamuX4NZn+1Gxw6bVXv3zLFOZR7IC0s
 6I+A==
X-Gm-Message-State: APjAAAXVA17u+E0VvE+n9BMSM1838i2wIJHUoMJ4DVAE2fkjtHoSr36z
 rY967Qax1tennT8Tf/lXBMM/vXx7
X-Google-Smtp-Source: APXvYqyk+ouzehoMzA6zMFpYPBpNnJxAz2JON9+nkH93poTNI9iFoOhPJA8JEIS5clpNaEL1gs6KfA==
X-Received: by 2002:a63:e156:: with SMTP id h22mr35176227pgk.370.1562140575141; 
 Wed, 03 Jul 2019 00:56:15 -0700 (PDT)
Received: from bobo.local0.net (193-116-88-34.tpgi.com.au. [193.116.88.34])
 by smtp.gmail.com with ESMTPSA id p68sm2955849pfb.80.2019.07.03.00.56.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 00:56:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 13/14] powerpc/64s/exception: untangle early machine check
 handler branch
Date: Wed,  3 Jul 2019 17:54:43 +1000
Message-Id: <20190703075444.19005-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703075444.19005-1-npiggin@gmail.com>
References: <20190703075444.19005-1-npiggin@gmail.com>
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
 Nicholas Piggin <npiggin@gmail.com>
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
index 88bcdd5b2dc7..8e16578cf932 100644
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
@@ -1011,74 +1021,7 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 BEGIN_FTR_SECTION
 	bl	enable_machine_check
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
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

