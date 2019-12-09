Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2971166BA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 07:09:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WXnr4fmgzDqHk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 17:09:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="pFka7N+q"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WXly5hc9zDqN2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 17:07:26 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47WXln5tmqz9v4lH;
 Mon,  9 Dec 2019 07:07:17 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=pFka7N+q; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lkDlMX49Rxkp; Mon,  9 Dec 2019 07:07:17 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47WXln4mklz9v4lG;
 Mon,  9 Dec 2019 07:07:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575871637; bh=4PTvkpJvM4Rk0FYU1bLjpYOjPs0OZx8HFfawFNgQDuU=;
 h=From:Subject:To:Cc:Date:From;
 b=pFka7N+qv1EiKkmwCjENDSH/EIWMMJAJqtIF9+t/Pk9Xh5M4dt8+ENtvONS0MZxYe
 yu8wVP3iTFvoG/XQLMcVwsN0+gtWVdWj8G8TZORrd9c9Ed2cDbP92MhKy5iphtqnTP
 p+8R6Xjf1Xdzo4W27NFMQnhnew8uj9CSVf06eEK8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 047D98B7AF;
 Mon,  9 Dec 2019 07:07:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QpF-CxIMyPSk; Mon,  9 Dec 2019 07:07:21 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DD0268B755;
 Mon,  9 Dec 2019 07:07:21 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BEE5963679; Mon,  9 Dec 2019 06:07:21 +0000 (UTC)
Message-Id: <bae3e75a0c7f9037e4012ee547842c04cd527931.1575871613.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 1/2] powerpc/irq: don't use current_stack_pointer() in
 check_stack_overflow()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon,  9 Dec 2019 06:07:21 +0000 (UTC)
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

current_stack_pointer() doesn't return the stack pointer, but the
caller's stack frame. See commit bfe9a2cfe91a ("powerpc: Reimplement
__get_SP() as a function not a define") and commit acf620ecf56c
("powerpc: Rename __get_SP() to current_stack_pointer()") for details.

The purpose of check_stack_overflow() is to verify that the stack has
not overflowed.

To really know whether the stack pointer is still within boundaries,
the check must be done directly on the value of r1.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/irq.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index bb34005ff9d2..4d468d835558 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -599,9 +599,8 @@ u64 arch_irq_stat_cpu(unsigned int cpu)
 static inline void check_stack_overflow(void)
 {
 #ifdef CONFIG_DEBUG_STACKOVERFLOW
-	long sp;
-
-	sp = current_stack_pointer() & (THREAD_SIZE-1);
+	register unsigned long r1 asm("r1");
+	long sp = r1 & (THREAD_SIZE - 1);
 
 	/* check for stack overflow: is there less than 2KB free? */
 	if (unlikely(sp < 2048)) {
-- 
2.13.3

