Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BB712985B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2019 16:40:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hNq23BGLzDqGZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 02:40:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="SVJZ6Mlz"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hNVM1fcGzDqL9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 02:26:19 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47hNVC08mlz9vJyn;
 Mon, 23 Dec 2019 16:26:11 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=SVJZ6Mlz; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NMduw6uLKHzc; Mon, 23 Dec 2019 16:26:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47hNVB65gtz9vJyx;
 Mon, 23 Dec 2019 16:26:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1577114770; bh=D3+VKZJ3hPYAS69Fkh6Xu5UkefnPwZgOHwwzmESq47E=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=SVJZ6MlzwisGMPUrmb7zjVPn5E8ioInBlKV63cjaMHP359fiVDCGeCtBL5c7Aj4ga
 AF6Jo0GLl1l0ZXQGUUjJidH0sEXKC9h1uHvPP2AbupP4aEkLAv03ie8lEC2Q8n6j+j
 aIV0/BOVpK5WBNpgm9FZ5rrlbf92caXOOrUkX52s=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0ADF38B7AB;
 Mon, 23 Dec 2019 16:26:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nedWeDvJrad3; Mon, 23 Dec 2019 16:26:15 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E0D5B8B7A1;
 Mon, 23 Dec 2019 16:26:15 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E4733637D8; Mon, 23 Dec 2019 15:26:15 +0000 (UTC)
Message-Id: <ca37c53561e4023315499ee3a35816bad01e4964.1577114567.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1577114567.git.christophe.leroy@c-s.fr>
References: <cover.1577114567.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH 5/8] powerpc/irq: move stack overflow verification
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 23 Dec 2019 15:26:15 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As we are going to switch to IRQ stack immediately in the exception
handler, it won't be possible anymore to check stack overflow by
reading stack pointer.

Do the verification on regs->gpr[1] which contains the stack pointer
at the time the IRQ happended, and move it to __do_irq() so that the
verification is also done when calling __do_irq() directly once the
exception entry does the stack switch.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/irq.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 28414c6665cc..4df49f6e9987 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -596,15 +596,16 @@ u64 arch_irq_stat_cpu(unsigned int cpu)
 	return sum;
 }
 
-static inline void check_stack_overflow(void)
+static inline void check_stack_overflow(struct pt_regs *regs)
 {
 #ifdef CONFIG_DEBUG_STACKOVERFLOW
+	bool is_user = user_mode(regs);
 	long sp;
 
-	sp = current_stack_pointer() & (THREAD_SIZE-1);
+	sp = regs->gpr[1] & (THREAD_SIZE - 1);
 
 	/* check for stack overflow: is there less than 2KB free? */
-	if (unlikely(sp < 2048)) {
+	if (unlikely(!is_user && sp < 2048)) {
 		pr_err("do_IRQ: stack overflow: %ld\n", sp);
 		dump_stack();
 	}
@@ -654,6 +655,8 @@ void __do_irq(struct pt_regs *regs)
 
 	trace_irq_entry(regs);
 
+	check_stack_overflow(regs);
+
 	/*
 	 * Query the platform PIC for the interrupt & ack it.
 	 *
@@ -685,8 +688,6 @@ void do_IRQ(struct pt_regs *regs)
 	irqsp = hardirq_ctx[raw_smp_processor_id()];
 	sirqsp = softirq_ctx[raw_smp_processor_id()];
 
-	check_stack_overflow();
-
 	/* Already there ? Otherwise switch stack and call */
 	if (unlikely(cursp == irqsp || cursp == sirqsp))
 		__do_irq(regs);
-- 
2.13.3

