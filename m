Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AF41478D4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 08:11:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483r0X0W2nzDqd3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 18:11:24 +1100 (AEDT)
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
 header.s=mail header.b=LVGZPs8j; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483qwX5C7lzDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 18:07:56 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 483qwS5RPgz9tyWV;
 Fri, 24 Jan 2020 08:07:52 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=LVGZPs8j; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id phykYOSKMkXm; Fri, 24 Jan 2020 08:07:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 483qwS4DKyz9tyWM;
 Fri, 24 Jan 2020 08:07:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579849672; bh=fhFiAnvvWyjTIiMqAPcGOlHB6PXfVt634Yxsn29/V2g=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=LVGZPs8joBTmAZSxtukaFS53pwlP+h4eFQLAeZ98CTdmZqaoaB1oUdFb0J95vOjhC
 sCXr+nVxrAy+3jx4ORi362UiixeHQ/tIOQ/TcWMQ4WLn3ZB/2ZezWwNy3XIOlgH+rD
 JvyZf7TzJK6+W4vVz2Xwsuq8GmmKJYZZZgYatqb4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7DD6F8B83D;
 Fri, 24 Jan 2020 08:07:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id aFWddb0YxbC0; Fri, 24 Jan 2020 08:07:53 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.111])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 604C98B768;
 Fri, 24 Jan 2020 08:07:53 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5F2716379C; Fri, 24 Jan 2020 07:07:53 +0000 (UTC)
Message-Id: <98855694e9e8993673af08cc2e97e16e0cf50f4a.1579849665.git.christophe.leroy@c-s.fr>
In-Reply-To: <435e0030e942507766cbef5bc95f906262d2ccf2.1579849665.git.christophe.leroy@c-s.fr>
References: <435e0030e942507766cbef5bc95f906262d2ccf2.1579849665.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 2/3] powerpc/irq: use IS_ENABLED() in check_stack_overflow()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 24 Jan 2020 07:07:53 +0000 (UTC)
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

Instead of #ifdef, use IS_ENABLED(CONFIG_DEBUG_STACKOVERFLOW).
This enable GCC to check for code validity even when the option
is not selected.
---
v2: rebased

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/irq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index cd29c2eb2d8e..9333e115418f 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -598,9 +598,11 @@ u64 arch_irq_stat_cpu(unsigned int cpu)
 
 static inline void check_stack_overflow(void)
 {
-#ifdef CONFIG_DEBUG_STACKOVERFLOW
 	long sp;
 
+	if (!IS_ENABLED(CONFIG_DEBUG_STACKOVERFLOW))
+		return;
+
 	sp = get_sp() & (THREAD_SIZE - 1);
 
 	/* check for stack overflow: is there less than 2KB free? */
@@ -608,7 +610,6 @@ static inline void check_stack_overflow(void)
 		pr_err("do_IRQ: stack overflow: %ld\n", sp);
 		dump_stack();
 	}
-#endif
 }
 
 void __do_irq(struct pt_regs *regs)
-- 
2.25.0

