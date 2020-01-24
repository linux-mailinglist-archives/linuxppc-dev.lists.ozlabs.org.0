Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFC51478DC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 08:13:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483r2l3lyGzDqdW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 18:13:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=nY/E0H35; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483qwZ0GsjzDqP3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 18:07:57 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 483qwT5mPvz9tyWd;
 Fri, 24 Jan 2020 08:07:53 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=nY/E0H35; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id eb61aV3emSk8; Fri, 24 Jan 2020 08:07:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 483qwT4Ztzz9tyWM;
 Fri, 24 Jan 2020 08:07:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579849673; bh=7sNJkXXrrR2l09m78IGdGM/V65gmCVpuHAJKsu4TK5w=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=nY/E0H35e3j5q9kSynJCW29VBxKp+r5I9zaCY22ZI888zStCb3Q8KEG/YAZEdRZNN
 wdX+EXlvUaL0hsWJGo68tFZ/txIHYTc9SaGqgmm7tUcRRkFV8HRrhc0Q/wb8RAvwDX
 cWeZMmWYP0D+YXz5Bgw2xBfR5IQjxErEwdKTzn2s=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8572A8B83D;
 Fri, 24 Jan 2020 08:07:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qUFsSM37Df73; Fri, 24 Jan 2020 08:07:54 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.111])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 64F658B768;
 Fri, 24 Jan 2020 08:07:54 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6358E6379C; Fri, 24 Jan 2020 07:07:54 +0000 (UTC)
Message-Id: <a37e699e7ab897742c07b6838a08af33bc9217e3.1579849665.git.christophe.leroy@c-s.fr>
In-Reply-To: <435e0030e942507766cbef5bc95f906262d2ccf2.1579849665.git.christophe.leroy@c-s.fr>
References: <435e0030e942507766cbef5bc95f906262d2ccf2.1579849665.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 3/3] powerpc/irq: don't use current_stack_pointer() in
 do_IRQ()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 24 Jan 2020 07:07:54 +0000 (UTC)
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

Until commit 7306e83ccf5c ("powerpc: Don't use CURRENT_THREAD_INFO to
find the stack"), the current stack base address was obtained by
calling current_thread_info(). That inline function was simply masking
out the value of r1.

In that commit, it was changed to using current_stack_pointer(), which
is an heavier function as it is an outline assembly function which
cannot be inlined and which reads the content of the stack at 0(r1)

Revert to just using get_sp() for geting r1 and masking out its value
to obtain the base address of the stack pointer as before.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Fixes: 7306e83ccf5c ("powerpc: Don't use CURRENT_THREAD_INFO to find the stack")
---
v2: New in this series. Using get_sp()
---
 arch/powerpc/kernel/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 9333e115418f..193c2b64ce37 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -647,7 +647,7 @@ void do_IRQ(struct pt_regs *regs)
 	void *cursp, *irqsp, *sirqsp;
 
 	/* Switch to the irq stack to handle this */
-	cursp = (void *)(current_stack_pointer() & ~(THREAD_SIZE - 1));
+	cursp = (void *)(get_sp() & ~(THREAD_SIZE - 1));
 	irqsp = hardirq_ctx[raw_smp_processor_id()];
 	sirqsp = softirq_ctx[raw_smp_processor_id()];
 
-- 
2.25.0

