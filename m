Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7087F612
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:35:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460Q7T3NLzzDqg3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:35:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="idOqlBwG"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PMQ20MKzDqXq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:18 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id u17so35900778pgi.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Ho9zk5zeC930rUKtntGlR1NE6PEevLCnzeiqTlsaik=;
 b=idOqlBwGdJoHFKdBQJK9bOvjVAMmhjALDHVORKZHoWnot0jJCsga9rVxXh/CbGdXve
 RtUyT93cdtHBZ+eE1nRzQ05JE8i9ZcmN+AdQ2H91XdOuyM3A9IecO5hfB0cdS1D3IaAL
 ozSUxnIbBh0+f72g/tFNPIMXrw1n2yFJvyHk4w/ZtCmhdm7K9vMzE+SwWB4kKJteyMhg
 pxAI7K2iUGmwfwRyp08jp85gAXX5jhsZsMHJO03Uh/tqo+Xqs8aUATfN6JwD0Xsn8X0L
 mulo80SAFxids4iFCBKioz8cDyoxcgjHDESfCBlRajanOpowM+wLYRE5Vb366uesX7so
 RtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Ho9zk5zeC930rUKtntGlR1NE6PEevLCnzeiqTlsaik=;
 b=t1z2lXyDZcE7uyXhqhGe4ugz/R9q7uBvjbfaiPBpk44B254Tk6lsiMk+2knpZsNXYb
 r7b4X4fsbJJKe/WKqnp5mcwoOHIkmrU8dCU1Wl31RhRbvFixUKO57TwpausDcX9yjMRL
 EyFjGhB1MTk5YET7nv6mlAnU2zEU9acW3vBaqYX2N9lfGKBB0crfneDd9UsEezmbne0z
 IKpmaF0Pocbx8U+JZif0CHi0a2XcZIlC08m/INigdl51AKbbb83LIwTvAU5rujCqqIKS
 FfLXSNGYX8Q0lt0bR6av0U4+aDyg4fqgM/yl7Atq6x+bc3i8XM+nLtGda5V0O6Okegb8
 PK5g==
X-Gm-Message-State: APjAAAVd8zAYZ82ZxblGzx9xw2VLtK2niQN2knO7eVutBx6rs52pCYnD
 OxB/57bQcxhbpubIUFPN5I1mUE39Kkw=
X-Google-Smtp-Source: APXvYqwl94ITWkMPkH7Aphcy50SwFDQ+hzw6od86RCn4sggjzCEzBYHeFFt59sijtmsGerTmujO6SQ==
X-Received: by 2002:a65:5043:: with SMTP id k3mr67192679pgo.406.1564743615850; 
 Fri, 02 Aug 2019 04:00:15 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 15/44] powerpc/64s/exception: untangle early machine check
 handler branch
Date: Fri,  2 Aug 2019 20:56:40 +1000
Message-Id: <20190802105709.27696-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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

machine_check_early_common now branches to machine_check_handle_early
which is its only caller.

Move interleaving code out of the way, and remove the branch.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 129 +++++++++++++--------------
 1 file changed, 62 insertions(+), 67 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e01e762dc6cc..706c522e1d1b 100644
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
2.22.0

