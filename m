Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 367EA39BB54
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 16:58:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxQqb4MNCz3cPf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 00:58:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxQpY46tjz309M
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 00:57:09 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FxQpN1BL1zBCtv;
 Fri,  4 Jun 2021 16:57:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id awgpU7CbAjUu; Fri,  4 Jun 2021 16:57:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FxQpM1ZzqzBCw1;
 Fri,  4 Jun 2021 16:56:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1223F8B8AD;
 Fri,  4 Jun 2021 16:56:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id K4DlUscVmd3h; Fri,  4 Jun 2021 16:56:59 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B792C8B8AB;
 Fri,  4 Jun 2021 16:56:58 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7C16264BDB; Fri,  4 Jun 2021 14:56:58 +0000 (UTC)
Message-Id: <f46e330d3db9ac2567b5a12d170ba8375aa80c1b.1622818556.git.christophe.leroy@csgroup.eu>
In-Reply-To: <809d316bf5f1a81acdd69e220c13e716dac24f53.1622818556.git.christophe.leroy@csgroup.eu>
References: <809d316bf5f1a81acdd69e220c13e716dac24f53.1622818556.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 3/4] powerpc/interrupt: Rename and lightly change
 syscall_exit_prepare_main()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Fri,  4 Jun 2021 14:56:58 +0000 (UTC)
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

Rename syscall_exit_prepare_main() into interrupt_exit_prepare_main()

Make it static as it is not used anywhere else.

Pass it the 'ret' so that it can 'or' it directly instead of
oring twice, once inside the function and once outside.

And remove 'r3' parameter which is not used.

Also fix a typo where CONFIG_PPC_BOOK3S should be CONFIG_PPC_BOOK3S_64.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/interrupt.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index b6aa80930733..bc3c1892ed80 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -228,11 +228,10 @@ static notrace void booke_load_dbcr0(void)
 #endif
 }
 
-notrace unsigned long syscall_exit_prepare_main(unsigned long r3,
-						struct pt_regs *regs)
+static notrace unsigned long
+interrupt_exit_user_prepare_main(struct pt_regs *regs, unsigned long ret)
 {
 	unsigned long ti_flags;
-	unsigned long ret = 0;
 
 again:
 	ti_flags = READ_ONCE(current_thread_info()->flags);
@@ -254,7 +253,7 @@ notrace unsigned long syscall_exit_prepare_main(unsigned long r3,
 		ti_flags = READ_ONCE(current_thread_info()->flags);
 	}
 
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && IS_ENABLED(CONFIG_PPC_FPU)) {
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && IS_ENABLED(CONFIG_PPC_FPU)) {
 		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
 				unlikely((ti_flags & _TIF_RESTORE_TM))) {
 			restore_tm_state(regs);
@@ -350,7 +349,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	}
 
 	local_irq_disable();
-	ret |= syscall_exit_prepare_main(r3, regs);
+	ret = interrupt_exit_user_prepare_main(regs, ret);
 
 #ifdef CONFIG_PPC64
 	regs->exit_result = ret;
@@ -378,7 +377,7 @@ notrace unsigned long syscall_exit_restart(unsigned long r3, struct pt_regs *reg
 
 	BUG_ON(!user_mode(regs));
 
-	regs->exit_result |= syscall_exit_prepare_main(r3, regs);
+	regs->exit_result = interrupt_exit_user_prepare_main(regs, regs->exit_result);
 
 	return regs->exit_result;
 }
-- 
2.25.0

