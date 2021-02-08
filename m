Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EAB313885
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 16:51:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ9WF59cBzDvVM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 02:51:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZ8bj3KvYzDr2l
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 02:10:41 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZ8bY0Hj4zB09ZL;
 Mon,  8 Feb 2021 16:10:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id g83hBu0FIAVl; Mon,  8 Feb 2021 16:10:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZ8bX6WcfzB09ZC;
 Mon,  8 Feb 2021 16:10:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 599328B7BA;
 Mon,  8 Feb 2021 16:10:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QHW7PVHnN0gZ; Mon,  8 Feb 2021 16:10:38 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0F90F8B7B2;
 Mon,  8 Feb 2021 16:10:38 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 04BD76733E; Mon,  8 Feb 2021 15:10:37 +0000 (UTC)
Message-Id: <6bef4d9ba0cba50160d13e344ee4627ebdf801dc.1612796617.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612796617.git.christophe.leroy@csgroup.eu>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v5 18/22] powerpc/syscall: Remove FULL_REGS verification in
 system_call_exception
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Mon,  8 Feb 2021 15:10:37 +0000 (UTC)
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

For book3s/64, FULL_REGS() is 'true' at all time, so the test voids.
For others, non volatile registers are saved inconditionally.

So the verification is pointless.

Should one fail to do it, it would anyway be caught by the
CHECK_FULL_REGS() in copy_thread() as we have removed the
special versions ppc_fork() and friends.

null_syscall benchmark reduction 4 cycles (332 => 328 cycles)

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/interrupt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 8fafca727b8b..55e1aa18cdb9 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -42,7 +42,6 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
 		BUG_ON(!(regs->msr & MSR_RI));
 	BUG_ON(!(regs->msr & MSR_PR));
-	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(arch_irq_disabled_regs(regs));
 
 #ifdef CONFIG_PPC_PKEY
-- 
2.25.0

