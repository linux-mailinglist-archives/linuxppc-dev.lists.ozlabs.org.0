Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8811812984E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2019 16:34:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hNh13xdfzDqPc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 02:34:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="jMZ3BDZQ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hNVK2cqKzDqKJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 02:26:17 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47hNV86wSzz9vJys;
 Mon, 23 Dec 2019 16:26:08 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jMZ3BDZQ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DzIVaFvOzGtT; Mon, 23 Dec 2019 16:26:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47hNV85lqhz9vJyn;
 Mon, 23 Dec 2019 16:26:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1577114768; bh=Vs9zjyHpxKTdwXBLQb1H8vLAKdY1DAGFCl+K3eW5KCc=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=jMZ3BDZQ2POyf/DzvY1rkIh0tDIyl+lODJ+vYuM9UFIxWlz9sXrvI7kkoar7Xsbso
 eKw4xhkcT/r/NC6008pgZPU8D7RvS2Y1ozuEBx62DC6AHOCl6ycSJigNuJg3BtiqY0
 aU1XSElvyLz+1rkqPgR0J44v1i3hrM0S2nTbDJ48=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F101C8B7AB;
 Mon, 23 Dec 2019 16:26:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wVCD1s8Om32N; Mon, 23 Dec 2019 16:26:13 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CE0318B7A1;
 Mon, 23 Dec 2019 16:26:13 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D7252637D8; Mon, 23 Dec 2019 15:26:13 +0000 (UTC)
Message-Id: <9bd99cf0e97fd62e63c4a14247dee060c8f743e1.1577114567.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1577114567.git.christophe.leroy@c-s.fr>
References: <cover.1577114567.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH 3/8] powerpc/irq: don't use current_stack_pointer() in
 do_IRQ()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 23 Dec 2019 15:26:13 +0000 (UTC)
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

Before commit 7306e83ccf5c ("powerpc: Don't use CURRENT_THREAD_INFO to
find the stack"), the current stack base address was obtained by
calling current_thread_info(). That inline function was simply masking
out the value of r1.

In that commit, it was changed to using current_stack_pointer(), which
is an heavier function as it is an outline assembly function which
cannot be inlined and which reads the content of the stack at 0(r1)

Create stack_pointer() function which returns the value of r1 and use
it instead.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Fixes: 7306e83ccf5c ("powerpc: Don't use CURRENT_THREAD_INFO to find the stack")
---
 arch/powerpc/include/asm/reg.h | 8 ++++++++
 arch/powerpc/kernel/irq.c      | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 1aa46dff0957..bc14fca9b13b 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1466,6 +1466,14 @@ static inline void update_power8_hid0(unsigned long hid0)
 	 */
 	asm volatile("sync; mtspr %0,%1; isync":: "i"(SPRN_HID0), "r"(hid0));
 }
+
+static __always_inline unsigned long stack_pointer(void)
+{
+	register unsigned long r1 asm("r1");
+
+	return r1;
+}
+
 #endif /* __ASSEMBLY__ */
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_REG_H */
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 4690e5270806..410accba865d 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -680,7 +680,7 @@ void do_IRQ(struct pt_regs *regs)
 	void *cursp, *irqsp, *sirqsp;
 
 	/* Switch to the irq stack to handle this */
-	cursp = (void *)(current_stack_pointer() & ~(THREAD_SIZE - 1));
+	cursp = (void *)(stack_pointer() & ~(THREAD_SIZE - 1));
 	irqsp = hardirq_ctx[raw_smp_processor_id()];
 	sirqsp = softirq_ctx[raw_smp_processor_id()];
 
-- 
2.13.3

