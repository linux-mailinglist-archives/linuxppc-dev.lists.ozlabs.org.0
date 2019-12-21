Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1465B12884D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 09:51:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fzqX2D1LzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 19:51:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Zy7fOLTm"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fzPw5ZBszDqrm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2019 19:32:36 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47fzPp1kdgz9txh8;
 Sat, 21 Dec 2019 09:32:30 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Zy7fOLTm; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ss6Tha5HnOid; Sat, 21 Dec 2019 09:32:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47fzPp0jnbz9vBmv;
 Sat, 21 Dec 2019 09:32:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1576917150; bh=w+xBToVhZ/hhpWFIpAvoRq9RuWR0Mj1UyY+7f+k+jhw=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=Zy7fOLTmrXxdKJvEZyMUeH5zMzM8ETFIXwB8Tq1mhKX7sZjT+bzxUg5i3sErxag5X
 bCRVN1Xq04EHomwO4imMFp4ULfD+U7s6lxz+4nYr3gnkM+srDaW8Vty8+qYde+xweM
 JyalDqg6SLgqUhA0aO/jPe5VHfse5cnSgzpFBVh8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 187058B77C;
 Sat, 21 Dec 2019 09:32:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id bHtHoTsDflDm; Sat, 21 Dec 2019 09:32:31 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D446B8B752;
 Sat, 21 Dec 2019 09:32:30 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 9C35C637B6; Sat, 21 Dec 2019 08:32:30 +0000 (UTC)
Message-Id: <d33ad1b36ddff4dcc19f96c592c12a61cf85d406.1576916812.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1576916812.git.christophe.leroy@c-s.fr>
References: <cover.1576916812.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 09/17] powerpc/32: Use vmapped stacks for interrupts
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 dja@axtens.net
Date: Sat, 21 Dec 2019 08:32:30 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to also catch overflows on IRQ stacks, use vmapped stacks.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/irq.c      | 22 ++++++++++++++++++++++
 arch/powerpc/kernel/setup_32.c |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index add67498c126..5c9b11878555 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -50,6 +50,7 @@
 #include <linux/debugfs.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
+#include <linux/vmalloc.h>
 
 #include <linux/uaccess.h>
 #include <asm/io.h>
@@ -664,8 +665,29 @@ void do_IRQ(struct pt_regs *regs)
 	set_irq_regs(old_regs);
 }
 
+static void *__init alloc_vm_stack(void)
+{
+	return __vmalloc_node_range(THREAD_SIZE, THREAD_ALIGN, VMALLOC_START,
+				    VMALLOC_END, THREADINFO_GFP, PAGE_KERNEL,
+				     0, NUMA_NO_NODE, (void*)_RET_IP_);
+}
+
+static void __init vmap_irqstack_init(void)
+{
+	int i;
+
+	for_each_possible_cpu(i) {
+		softirq_ctx[i] = alloc_vm_stack();
+		hardirq_ctx[i] = alloc_vm_stack();
+	}
+}
+
+
 void __init init_IRQ(void)
 {
+	if (IS_ENABLED(CONFIG_VMAP_STACK))
+		vmap_irqstack_init();
+
 	if (ppc_md.init_IRQ)
 		ppc_md.init_IRQ();
 }
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index a55b4d9ab824..5b49b26eb154 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -153,6 +153,9 @@ void __init irqstack_early_init(void)
 {
 	unsigned int i;
 
+	if (IS_ENABLED(CONFIG_VMAP_STACK))
+		return;
+
 	/* interrupt stacks must be in lowmem, we get that for free on ppc32
 	 * as the memblock is limited to lowmem by default */
 	for_each_possible_cpu(i) {
-- 
2.13.3

