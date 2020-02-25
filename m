Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D2516EE79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:57:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rp8C5K4wzDqM4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:57:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fsAI/r+o; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmSS6b4VzDqNF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:41:12 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id u3so70967plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vWepFUgEQ4UaKQeouKc6txpn4qd+XJreu0m8EI2BA2s=;
 b=fsAI/r+odhEAIN19QcL4+t+NDlP9Cx5FXb2Kxu6tMva84fq0s8Unj8fVMspAddbyua
 u1weozOZ/P+kWWMIa1Yfpn7s/8KAD9geFvBV95qBOoL0nXWrSP+OE+1hhnK4CTeh8hfy
 8ikRRypMS5Gh2l4PAzCEJLSJUZyKNBZ/h/9NpS8whA+suA0Q9mX3MrwwGOzhAYZk4/+l
 n5+lBUWeWDYYDbm+SyJpQzqp5yG65kfGPNmkesfguCpIGkW2rmiTuIa1NDuVDV84SVNq
 ZPL4aeAMMQvYMDX4MsfOWXNJxmvJVKl1Vw0bWkNVIuS40IZfyjlp3NMO2t1mnqFE6PV9
 QZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vWepFUgEQ4UaKQeouKc6txpn4qd+XJreu0m8EI2BA2s=;
 b=ssLYS7LHw1yi4hBxaIuiEkLjbG8OdpLKuWzpOrLH644cfIrv+6py4prCTOgZXzCsUC
 DTbujZTg4N22HsVipIwnER3EaSVFDxSv+1BWF7yaOIJ4jxGM8FC45iKF3N64ckX7jYKZ
 67ngh70BgHLWv8PelYmUuKme5JuWEFA2wJhswimBZm+qu5jMaaDsKnU+Yg9MVzWLKqXA
 XPMitZqtIoBzqeCDj4fh4y3+aA2Jg7f0IdpcsB9RBtbnD7rrbGryQj4+KwMzPztxOE8G
 9/i3a857j1MO0tERXqXy/mTnAn4YiCSi0y8A3/s9N99nUgR0fHj86SG4tKMLe2Mb0WB9
 a1ag==
X-Gm-Message-State: APjAAAWviQgIF4htM5TSzQlRY0MZp/Yy8ujqo193ITvPv0Br4yiwySuy
 MnxtwJYbcs0bCHYAdP9fPNCRG2Ua
X-Google-Smtp-Source: APXvYqwT/ikUdl17yVpig9B58Q1Xx61qY4UH36h2OM8ET/sfv4ZPe+T4kDiFMWoM0P1+rVaHwhhnwA==
X-Received: by 2002:a17:902:bc86:: with SMTP id
 bb6mr550453plb.140.1582652470307; 
 Tue, 25 Feb 2020 09:41:10 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:41:09 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 30/32] powerpc/64: system call reconcile interrupts
Date: Wed, 26 Feb 2020 03:35:39 +1000
Message-Id: <20200225173541.1549955-31-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225173541.1549955-1-npiggin@gmail.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reconciles interrupts in the system call case like all other
interrupts. This allows system_call_common to be shared with the
scv system call implementation in a subsequent patch.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_64.S   | 11 +++++++++++
 arch/powerpc/kernel/syscall_64.c | 28 +++++++++++++---------------
 2 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 6d5464f83c05..8406812c9734 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -113,6 +113,17 @@ END_BTB_FLUSH_SECTION
 	ld	r11,exception_marker@toc(r2)
 	std	r11,-16(r10)		/* "regshere" marker */
 
+	/*
+	 * RECONCILE_IRQ_STATE without calling trace_hardirqs_off(), which
+	 * would clobber syscall parameters. Also we always enter with IRQs
+	 * enabled and nothing pending. system_call_exception() will call
+	 * trace_hardirqs_off().
+	 */
+	li	r11,IRQS_ALL_DISABLED
+	li	r12,PACA_IRQ_HARD_DIS
+	stb	r11,PACAIRQSOFTMASK(r13)
+	stb	r12,PACAIRQHAPPENED(r13)
+
 	/* Calling convention has r9 = orig r0, r10 = regs */
 	mr	r9,r0
 	bl	system_call_exception
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 08e0bebbd3b6..32601a572ff0 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -19,13 +19,19 @@ extern void __noreturn tabort_syscall(unsigned long nip, unsigned long msr);
 
 typedef long (*syscall_fn)(long, long, long, long, long, long);
 
-/* Has to run notrace because it is entered "unreconciled" */
-notrace long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
-			   unsigned long r0, struct pt_regs *regs)
+/* Has to run notrace because it is entered not completely "reconciled" */
+notrace long system_call_exception(long r3, long r4, long r5,
+				   long r6, long r7, long r8,
+				   unsigned long r0, struct pt_regs *regs)
 {
 	unsigned long ti_flags;
 	syscall_fn f;
 
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
+
+	trace_hardirqs_off(); /* finish reconciling */
+
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S))
 		BUG_ON(!(regs->msr & MSR_RI));
 	BUG_ON(!(regs->msr & MSR_PR));
@@ -33,8 +39,10 @@ notrace long system_call_exception(long r3, long r4, long r5, long r6, long r7,
 	BUG_ON(regs->softe != IRQS_ENABLED);
 
 	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
-	    unlikely(regs->msr & MSR_TS_T))
+	    unlikely(regs->msr & MSR_TS_T)) {
+		local_irq_enable();
 		tabort_syscall(regs->nip, regs->msr);
+	}
 
 	account_cpu_user_entry();
 
@@ -50,16 +58,6 @@ notrace long system_call_exception(long r3, long r4, long r5, long r6, long r7,
 
 	kuap_check_amr();
 
-	/*
-	 * A syscall should always be called with interrupts enabled
-	 * so we just unconditionally hard-enable here. When some kind
-	 * of irq tracing is used, we additionally check that condition
-	 * is correct
-	 */
-	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
-		WARN_ON(irq_soft_mask_return() != IRQS_ENABLED);
-		WARN_ON(local_paca->irq_happened);
-	}
 	/*
 	 * This is not required for the syscall exit path, but makes the
 	 * stack frame look nicer. If this was initialised in the first stack
@@ -68,7 +66,7 @@ notrace long system_call_exception(long r3, long r4, long r5, long r6, long r7,
 	 */
 	regs->softe = IRQS_ENABLED;
 
-	__hard_irq_enable();
+	local_irq_enable();
 
 	ti_flags = current_thread_info()->flags;
 	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
-- 
2.23.0

