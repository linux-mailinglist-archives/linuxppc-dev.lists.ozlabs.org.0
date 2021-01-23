Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E8D30138A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jan 2021 07:14:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DN5SV1sYVzDrnj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jan 2021 17:14:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m+R379Ny; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DN5Qf4jLBzDrcC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jan 2021 17:12:58 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id u67so5251682pfb.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 22:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jp19mRpQwZnvv85mrajBlhi6pTq2o+J1gDNce3NL3r8=;
 b=m+R379Nyo8jzj9996uWXXR5OfxcYudHgJCMKPgTchHsecBmKMG9R9HURc8CvZFNesi
 EryIGsNTK1kJqTYYMzrLCPrMzFgtWhsLvUKXcG0/1esAthwPTgpWGJWkYBh0N9wbjwIo
 N71fLvCOZNpYRO2nveCqHeIJEV+6/Ppx0k6TkHTl9LDfoxSfzW+f02js09HOOLEdqUwh
 AtVX61C784L/0UewTCN4P0gRp0vL9yPNMnc8Hsk1jNgBAecCdhFoWOYYjq2iIAqMqGVr
 tziXuPlD0q3tJkGrqOVuSY/X9t/u9YSmBahwdl4auyv+ggD9d1XZ1saxChEdw5au6B52
 EZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jp19mRpQwZnvv85mrajBlhi6pTq2o+J1gDNce3NL3r8=;
 b=JJgBmFgMOmPRqJMmNkujs/tK9ma3Xp7APJtqyy9EC77hHND6X/UXs5MuXtS2P19c1y
 iyZ0CTblV+ZHtFEs+Tr5DzyJ5+E1krLjbPqTiUBFy9hz+gyYKeX94ysDtEHp9vHmUoKn
 erW+MPp+JPj5PqYz3Yw6zBnl4e5GEivlTCND81AQxedax+yqQQO8EmKQx6+7+8ArfnaQ
 vM+lHKbkAKO+6NxcYvPXxsJS/MaiXEULCdW+OR1VQ5fi66uM48HnD8h2j81CUjCEqakA
 3SqL8JS/gFOA2j4hiUw0c3GfML5KuNeGVJBiumW79FvSDwK1PdqkN3HtSHa3AtQkSsqi
 ABxg==
X-Gm-Message-State: AOAM532jy5v2nZkcMRoFSIe2dIpJEf3wIG+TYZO5NGmWkksakhLqvXYh
 rFLrFpgkQRIwjQRO355Ui9T92oJTOw8=
X-Google-Smtp-Source: ABdhPJz+3+9FoWxe4TRehAxaFrVocblqVpcX4QsNbqHE7x6b9HZtFZXQd7vP8tSqMd8hU1B+zVUTmg==
X-Received: by 2002:a63:5304:: with SMTP id h4mr8192034pgb.199.1611382374073; 
 Fri, 22 Jan 2021 22:12:54 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id y12sm10648194pfp.166.2021.01.22.22.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 22:12:53 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: prevent recursive replay_soft_interrupts causing
 superfluous interrupt
Date: Sat, 23 Jan 2021 16:12:44 +1000
Message-Id: <20210123061244.2076145-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When an asynchronous interrupt calls irq_exit, it checks for softirqs
that may have been created, and runs them. Running softirqs enables
local irqs, which can replay pending interrupts causing recursion in
replay_soft_interrupts. This abridged trace shows how this can occur:

! NIP replay_soft_interrupts
  LR  interrupt_exit_kernel_prepare
  Call Trace:
    interrupt_exit_kernel_prepare (unreliable)
    interrupt_return
  --- interrupt: ea0 at __rb_reserve_next
  NIP __rb_reserve_next
  LR __rb_reserve_next
  Call Trace:
    ring_buffer_lock_reserve
    trace_function
    function_trace_call
    ftrace_call
    __do_softirq
    irq_exit
    timer_interrupt
!   replay_soft_interrupts
    interrupt_exit_kernel_prepare
    interrupt_return
  --- interrupt: ea0 at arch_local_irq_restore

This can not be prevented easily, because softirqs must not block hard
irqs, so it has to be dealt with.

The recursion is bounded by design in the softirq code because softirq
replay disables softirqs and loops around again to check for new
softirqs created while it ran, so that's not a problem.

However it does mess up interrupt replay state, causing superfluous
interrupts when the second replay_soft_interrupts clears a pending
interrupt, leaving it still set in the first call in the 'happened'
local variable.

Fix this by not caching a copy of irqs_happened across interrupt
handler calls.

Fixes: 3282a3da25bd ("powerpc/64: Implement soft interrupt replay in C")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
It's actually very tricky / practically impossible to prevent softirqs
from being run like my previous attempt tried to do, when you really
get into details. Certainly not for a fix. I might try to attempt that
some time in future, but it would require kernel/softirq.c changes and
what we do now isn't conceptually different from architectures without
soft-masking, it's just another complexity to the complex soft-masking
code.

Anyway this hopefully fixes the PMU bug, but as I said I couldn't
reproduce it with your test case so it would be good if you could
give it a test.

Thanks,
Nick

 arch/powerpc/kernel/irq.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 6b1eca53e36c..cc7a6271b6b4 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -180,13 +180,18 @@ void notrace restore_interrupts(void)
 
 void replay_soft_interrupts(void)
 {
+	struct pt_regs regs;
+
 	/*
-	 * We use local_paca rather than get_paca() to avoid all
-	 * the debug_smp_processor_id() business in this low level
-	 * function
+	 * Be careful here, calling these interrupt handlers can cause
+	 * softirqs to be raised, which they may run when calling irq_exit,
+	 * which will cause local_irq_enable() to be run, which can then
+	 * recurse into this function. Don't keep any state across
+	 * interrupt handler calls which may change underneath us.
+	 *
+	 * We use local_paca rather than get_paca() to avoid all the
+	 * debug_smp_processor_id() business in this low level function.
 	 */
-	unsigned char happened = local_paca->irq_happened;
-	struct pt_regs regs;
 
 	ppc_save_regs(&regs);
 	regs.softe = IRQS_ENABLED;
@@ -209,7 +214,7 @@ void replay_soft_interrupts(void)
 	 * This is a higher priority interrupt than the others, so
 	 * replay it first.
 	 */
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (happened & PACA_IRQ_HMI)) {
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (local_paca->irq_happened & PACA_IRQ_HMI)) {
 		local_paca->irq_happened &= ~PACA_IRQ_HMI;
 		regs.trap = 0xe60;
 		handle_hmi_exception(&regs);
@@ -217,7 +222,7 @@ void replay_soft_interrupts(void)
 			hard_irq_disable();
 	}
 
-	if (happened & PACA_IRQ_DEC) {
+	if (local_paca->irq_happened & PACA_IRQ_DEC) {
 		local_paca->irq_happened &= ~PACA_IRQ_DEC;
 		regs.trap = 0x900;
 		timer_interrupt(&regs);
@@ -225,7 +230,7 @@ void replay_soft_interrupts(void)
 			hard_irq_disable();
 	}
 
-	if (happened & PACA_IRQ_EE) {
+	if (local_paca->irq_happened & PACA_IRQ_EE) {
 		local_paca->irq_happened &= ~PACA_IRQ_EE;
 		regs.trap = 0x500;
 		do_IRQ(&regs);
@@ -233,7 +238,7 @@ void replay_soft_interrupts(void)
 			hard_irq_disable();
 	}
 
-	if (IS_ENABLED(CONFIG_PPC_DOORBELL) && (happened & PACA_IRQ_DBELL)) {
+	if (IS_ENABLED(CONFIG_PPC_DOORBELL) && (local_paca->irq_happened & PACA_IRQ_DBELL)) {
 		local_paca->irq_happened &= ~PACA_IRQ_DBELL;
 		if (IS_ENABLED(CONFIG_PPC_BOOK3E))
 			regs.trap = 0x280;
@@ -245,7 +250,7 @@ void replay_soft_interrupts(void)
 	}
 
 	/* Book3E does not support soft-masking PMI interrupts */
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (happened & PACA_IRQ_PMI)) {
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (local_paca->irq_happened & PACA_IRQ_PMI)) {
 		local_paca->irq_happened &= ~PACA_IRQ_PMI;
 		regs.trap = 0xf00;
 		performance_monitor_exception(&regs);
@@ -253,8 +258,7 @@ void replay_soft_interrupts(void)
 			hard_irq_disable();
 	}
 
-	happened = local_paca->irq_happened;
-	if (happened & ~PACA_IRQ_HARD_DIS) {
+	if (local_paca->irq_happened & ~PACA_IRQ_HARD_DIS) {
 		/*
 		 * We are responding to the next interrupt, so interrupt-off
 		 * latencies should be reset here.
-- 
2.23.0

