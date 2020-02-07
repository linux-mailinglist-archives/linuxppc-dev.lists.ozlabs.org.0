Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66571155CBD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 18:22:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Dhtt24L8zDqkB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2020 04:22:14 +1100 (AEDT)
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
 header.s=mail header.b=VoaClWUr; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DhsV56LszDqfZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2020 04:21:02 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48DhsP26gbzB09Zr;
 Fri,  7 Feb 2020 18:20:57 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=VoaClWUr; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id e1C3b03JzNBL; Fri,  7 Feb 2020 18:20:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48DhsP160HzB09Zp;
 Fri,  7 Feb 2020 18:20:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581096057; bh=QmgAwYNt3Y3elDYjH3yl1rB9CCdQ07RGLgxMITM3Uwk=;
 h=From:Subject:To:Cc:Date:From;
 b=VoaClWUr9iEnxwlTALSGavZ19/VKbqxRqNmemnN+MqFhj4X9peSsCs5l6R52BydRq
 c4Oq9vOmzA64RK6ekwrju3kJ3W8V07Xx8xHyGOKyhu8thXfIC0fUu76AZHgjJJCoQt
 TW+TXNhhw/QNZUhUIFS8tWK0fj/UOWgCynQLS2+M=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EB85F8B8DB;
 Fri,  7 Feb 2020 18:20:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JdGYIXlNYGc2; Fri,  7 Feb 2020 18:20:58 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B0DDD8B8BA;
 Fri,  7 Feb 2020 18:20:58 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 29631652C9; Fri,  7 Feb 2020 17:20:57 +0000 (UTC)
Message-Id: <daeacdc0dec0416d1c587cc9f9e7191ad3068dc0.1581095957.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc: Fix CONFIG_TRACE_IRQFLAGS with CONFIG_VMAP_STACK
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Guenter Roeck <linux@roeck-us.net>
Date: Fri,  7 Feb 2020 17:20:57 +0000 (UTC)
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

When CONFIG_PROVE_LOCKING is selected together with (now default)
CONFIG_VMAP_STACK, kernel enter deadlock during boot.

At the point of checking whether interrupts are enabled or not, the
value of MSR saved on stack is read using the physical address of the
stack. But at this point, when using VMAP stack the DATA MMU
translation has already been re-enabled, leading to deadlock.

Don't use the physical address of the stack when
CONFIG_VMAP_STACK is set.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Reported-by: Guenter Roeck <linux@roeck-us.net>
Fixes: 028474876f47 ("powerpc/32: prepare for CONFIG_VMAP_STACK")
---
 arch/powerpc/kernel/entry_32.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 77abbc34bbe0..0713daa651d9 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -214,7 +214,7 @@ transfer_to_handler_cont:
 	 * To speed up the syscall path where interrupts stay on, let's check
 	 * first if we are changing the MSR value at all.
 	 */
-	tophys(r12, r1)
+	tophys_novmstack r12, r1
 	lwz	r12,_MSR(r12)
 	andi.	r12,r12,MSR_EE
 	bne	1f
-- 
2.25.0

