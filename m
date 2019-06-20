Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B48504C7C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 09:01:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tt5h3G6lzDqpp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 17:01:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jEUlkTMq"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqmz4WfgzDqwD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:51 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id x15so986294pfq.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qt930RJMd1GUR1GmAdpCg2jzq+tjYOjMlgo6A7he+Ys=;
 b=jEUlkTMqCLXF4r0RNu8s84A1+9AF3k98JkrfAmZAwvwYgPai8TExl2VJuuoxgDIwxu
 lBPZT06s0h4779IkEL1xXoZxJVlidAIlZh56wk85gzaboauR423NXDIzkN+qIL18WyW6
 WM5xZs1Ab48a2MladNxAOpwW960K1F2peFkubYEm6Kc7gbT5583PXpstPTf6dvMbMG02
 Ch5dQ5vFVPF+L474GDyvL0ahNBG/zr+Mjj94tWGOfXDDGTbO/fXNTtSv6rUqkOgODSd6
 Jary21U8JP9O7GBFG4QmNrLEC095S2goEjQ7RpwAe8fdhsp/Sp9FbwV1Ukmgv1L+V5Do
 5JZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qt930RJMd1GUR1GmAdpCg2jzq+tjYOjMlgo6A7he+Ys=;
 b=kh9fazfWdcCMh3vnc91N6Mp4tMjH2bFfDaYLIwWBN0OOq0dUUXyOUgEgdVACg9LzrE
 oVC9Lb7aqU0qUAiOMxd7WvA6avHPLSdjQidI/rPolvj3l40Vv67+hxUdqJI+Yy7mpE0w
 wx7SMoiX3Hjc0f1OtAN41ptmkJigvQCQrcYxezaswVDvCWDGxubRNC+0miXz5qCKDtMt
 Er3EOz9ZE4PyWWU6BxhR91OYbX47H6czkjbx/6uYDViQmqUQc1xjPzXfjzZH1L8bh49f
 65YZfVBVG8PFjLX1l8qsCzo1dG7rEP5kodhHNwcFyrlzt5zrzp79EGtNI2FtH8JvOdd6
 7Tvg==
X-Gm-Message-State: APjAAAVRvKl0pPjOuE2j1vJsgw6hASlAGNCUmGKJqvk5j8ai5cBRvNdb
 e+F7ebzjskhsXxHVlK4J/P5Serzk
X-Google-Smtp-Source: APXvYqyjK3BBHgbFtumNekGLhF8bJCXfPOVkqF2AuAvbEwwWs1B38xG+OjrPL2snllP5j4t0xX4Kmw==
X-Received: by 2002:a17:90a:4803:: with SMTP id
 a3mr1156390pjh.58.1561007809569; 
 Wed, 19 Jun 2019 22:16:49 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 50/52] powerpc/64s/exception: untangle early machine check
 handler
Date: Thu, 20 Jun 2019 15:14:57 +1000
Message-Id: <20190620051459.29573-51-npiggin@gmail.com>
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

machine_check_early_common now branches to machine_check_handle_early
which is its only caller, and they're separated by a bunch of other
code which makes no sense.

This patch moves that other code out of the way, and removes the
branch instruction.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 129 +++++++++++++--------------
 1 file changed, 62 insertions(+), 67 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e8f644d6f310..793d611fa937 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -980,6 +980,16 @@ machine_check_pseries:
 
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
@@ -1033,74 +1043,7 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 	li	r10,MSR_RI
 	mtmsrd	r10,1
 	bl	enable_machine_check
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
@@ -1180,6 +1123,58 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
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

