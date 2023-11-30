Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CA27FEF88
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 13:51:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ozZyutTp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sgx0V2xBQz3cTt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 23:51:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ozZyutTp;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (unknown [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgwzb2K1zz2ys9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 23:51:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701348657;
	bh=JtiT7GldzcHd/yrGjvqSwxwlcX3PPCeIOetwxTs44dM=;
	h=From:To:Cc:Subject:Date:From;
	b=ozZyutTpfvoepL8kCd8SmuzaSsdkgKqN5uOUKJ05T+T5yuA07akjWQHxDVFZGvjur
	 rMTPjVXfap1pbB1JHjbqWU56uLNx3NAgLLhJQxl7Gg51Pysxiwy9BJTlGwAiy94MBe
	 lJikR3vR9L4HIzT+S2FEbM26uYccnKUlWN+N5RYUhk+d8mMpakENYcB97EDYtSWh+7
	 rwMjUFiHkYPqfxkUs32yyXN6djXwahzSp5WVf6oX6eow3w8jD6OoSa1jQXpKl1hrRH
	 hrqzF8dIt7cfYOHp+vSWrUw9KL9wDdZhJhxMIB3G6f7sEmMYqA/YOa5bW1XChEBadz
	 XdJ6kgI3vUi4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SgwzP1642z4xSb;
	Thu, 30 Nov 2023 23:50:57 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/irq: Allow softirq to hardirq stack transition
Date: Thu, 30 Nov 2023 23:50:45 +1100
Message-ID: <20231130125045.3080961-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Allow a transition from the softirq stack to the hardirq stack when
handling a hardirq. Doing so means a hardirq received while deep in
softirq processing is less likely to cause a stack overflow of the
softirq stack.

Previously it wasn't safe to do so because irq_exit() (which initiates
softirq processing) was called on the hardirq stack.

That was changed in commit 1b1b6a6f4cc0 ("powerpc: handle irq_enter/
irq_exit in interrupt handler wrappers") and 1346d00e1bdf ("powerpc:
Don't select HAVE_IRQ_EXIT_ON_IRQ_STACK").

The allowed transitions are now:
 - process stack -> hardirq stack
 - process stack -> softirq stack
 - process stack -> softirq stack -> hardirq stack

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/irq.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 6f7d4edaa0bc..7504ceec5c58 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -284,15 +284,14 @@ static __always_inline void call_do_irq(struct pt_regs *regs, void *sp)
 void __do_IRQ(struct pt_regs *regs)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
-	void *cursp, *irqsp, *sirqsp;
+	void *cursp, *irqsp;
 
 	/* Switch to the irq stack to handle this */
 	cursp = (void *)(current_stack_pointer & ~(THREAD_SIZE - 1));
 	irqsp = hardirq_ctx[raw_smp_processor_id()];
-	sirqsp = softirq_ctx[raw_smp_processor_id()];
 
 	/* Already there ? If not switch stack and call */
-	if (unlikely(cursp == irqsp || cursp == sirqsp))
+	if (unlikely(cursp == irqsp))
 		__do_irq(regs, current_stack_pointer);
 	else
 		call_do_irq(regs, irqsp);
-- 
2.41.0

