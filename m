Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2021E1478D2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 08:09:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483qyK1r4TzDqSD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 18:09:29 +1100 (AEDT)
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
 header.s=mail header.b=uG8LkU4w; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483qwW6xGfzDqP3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 18:07:55 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 483qwR70nhz9tyWR;
 Fri, 24 Jan 2020 08:07:51 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=uG8LkU4w; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id LKF188HDJ8Kb; Fri, 24 Jan 2020 08:07:51 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 483qwR5qSTz9tyWM;
 Fri, 24 Jan 2020 08:07:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579849671; bh=PerBBHHcPcD64QxBFQtP7ChNSh/ByrU17mdch6v1v7k=;
 h=From:Subject:To:Cc:Date:From;
 b=uG8LkU4wYSWErWCVn6oQedMwCcneAv6ilzQ0+1X9I5sxmLx1dRABee1BngJ4kpdTQ
 5KV/54GrQbUmxwiPxJNIKRNvuYl9bRmLBoTjm2eUJYcRpK5226yzhNPfOoYf7T6iJK
 l8+ytotvoMcFkEdGGnATjOyyq/sUTG5IoWUm3AEQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9E1F98B83D;
 Fri, 24 Jan 2020 08:07:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JzumcI8_-fUR; Fri, 24 Jan 2020 08:07:52 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.111])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7AC798B768;
 Fri, 24 Jan 2020 08:07:52 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4F56D6379C; Fri, 24 Jan 2020 07:07:52 +0000 (UTC)
Message-Id: <435e0030e942507766cbef5bc95f906262d2ccf2.1579849665.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 1/3] powerpc/irq: don't use current_stack_pointer() in
 check_stack_overflow()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 24 Jan 2020 07:07:52 +0000 (UTC)
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

Define a get_sp() macro to get the value of r1 directly. (Adapted from
arch/powerpc/boot/reg.h)

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v2: Define a get_sp() macro instead of using asm("r1") locally.
---
 arch/powerpc/include/asm/reg.h | 3 +++
 arch/powerpc/kernel/irq.c      | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 1aa46dff0957..d585f2566338 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1450,6 +1450,9 @@ static inline void mtsrin(u32 val, u32 idx)
 
 extern unsigned long current_stack_pointer(void);
 
+register unsigned long __stack_pointer asm("r1");
+#define get_sp()	(__stack_pointer)
+
 extern unsigned long scom970_read(unsigned int address);
 extern void scom970_write(unsigned int address, unsigned long value);
 
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index add67498c126..cd29c2eb2d8e 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -601,7 +601,7 @@ static inline void check_stack_overflow(void)
 #ifdef CONFIG_DEBUG_STACKOVERFLOW
 	long sp;
 
-	sp = current_stack_pointer() & (THREAD_SIZE-1);
+	sp = get_sp() & (THREAD_SIZE - 1);
 
 	/* check for stack overflow: is there less than 2KB free? */
 	if (unlikely(sp < 2048)) {
-- 
2.25.0

