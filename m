Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB2B3755ED
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 16:50:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbc223JH5z3bVK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 00:50:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbc1b6L7vz2yxY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 00:49:51 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fbc1Q1M4Hz9sYh;
 Thu,  6 May 2021 16:49:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L2QXxuYoNt71; Thu,  6 May 2021 16:49:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fbc1Q0Qq6z9sYZ;
 Thu,  6 May 2021 16:49:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DEB468B802;
 Thu,  6 May 2021 16:49:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rIf4-rmnMFKT; Thu,  6 May 2021 16:49:45 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A4F328B800;
 Thu,  6 May 2021 16:49:45 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7B1D8648FD; Thu,  6 May 2021 14:49:45 +0000 (UTC)
Message-Id: <b831e54a2579db24fbef836ed415588ce2b3e825.1620312573.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/interrupts: Fix kuep_unlock() call
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  6 May 2021 14:49:45 +0000 (UTC)
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

Same as kuap_user_restore(), kuep_unlock() has to be called when
really returning to user, that is in interrupt_exit_user_prepare(),
not in interrupt_exit_prepare().

Fixes: b5efec00b671 ("powerpc/32s: Move KUEP locking/unlocking in C")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/interrupt.h | 2 --
 arch/powerpc/kernel/interrupt.c      | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 44cde2e129b8..c77e8f57ff06 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -153,8 +153,6 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
  */
 static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
-	if (user_mode(regs))
-		kuep_unlock();
 }
 
 static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 30a596182baa..e0938ba298f2 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -424,6 +424,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 
 	/* Restore user access locks last */
 	kuap_user_restore(regs);
+	kuep_unlock();
 
 	return ret;
 }
-- 
2.25.0

