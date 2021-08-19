Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 225653F138F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 08:31:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gqvzm71Ycz3clY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 16:31:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqvzN6mKXz301N
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 16:30:53 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GqvzC5tqdz9sWQ;
 Thu, 19 Aug 2021 08:30:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDJ4GyudLJ2E; Thu, 19 Aug 2021 08:30:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GqvzC4yNGz9sWP;
 Thu, 19 Aug 2021 08:30:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8EFF28B822;
 Thu, 19 Aug 2021 08:30:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Y4cGa_HGvYv2; Thu, 19 Aug 2021 08:30:47 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 71AFC8B764;
 Thu, 19 Aug 2021 08:30:47 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 59E7D66973; Thu, 19 Aug 2021 06:30:47 +0000 (UTC)
Message-Id: <385ead49ccb66a259b25fee3eebf0bd4094068f3.1629354625.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/3] powerpc: Remove MSR_PR check in
 interrupt_exit_{user/kernel}_prepare()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Thu, 19 Aug 2021 06:30:47 +0000 (UTC)
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

In those hot functions that are called at every interrupt, any saved
cycle is worth it.

interrupt_exit_user_prepare() and interrupt_exit_kernel_prepare() are
called from three places:
- From entry_32.S
- From interrupt_64.S
- From interrupt_exit_user_restart() and interrupt_exit_kernel_restart()

In entry_32.S, there are inambiguously called based on MSR_PR:

	interrupt_return:
		lwz	r4,_MSR(r1)
		addi	r3,r1,STACK_FRAME_OVERHEAD
		andi.	r0,r4,MSR_PR
		beq	.Lkernel_interrupt_return
		bl	interrupt_exit_user_prepare
	...
	.Lkernel_interrupt_return:
		bl	interrupt_exit_kernel_prepare

In interrupt_64.S, that's similar:

	interrupt_return_\srr\():
		ld	r4,_MSR(r1)
		andi.	r0,r4,MSR_PR
		beq	interrupt_return_\srr\()_kernel
	interrupt_return_\srr\()_user: /* make backtraces match the _kernel variant */
		addi	r3,r1,STACK_FRAME_OVERHEAD
		bl	interrupt_exit_user_prepare
	...
	interrupt_return_\srr\()_kernel:
		addi	r3,r1,STACK_FRAME_OVERHEAD
		bl	interrupt_exit_kernel_prepare

In interrupt_exit_user_restart() and interrupt_exit_kernel_restart(),
MSR_PR is verified respectively by BUG_ON(!user_mode(regs)) and
BUG_ON(user_mode(regs)) prior to calling interrupt_exit_user_prepare()
and interrupt_exit_kernel_prepare().

The verification in interrupt_exit_user_prepare() and
interrupt_exit_kernel_prepare() are therefore useless and can be removed.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 21bbd615ca41..f26caf911ab5 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -465,7 +465,6 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 
 	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
 		BUG_ON(!(regs->msr & MSR_RI));
-	BUG_ON(!(regs->msr & MSR_PR));
 	BUG_ON(arch_irq_disabled_regs(regs));
 	CT_WARN_ON(ct_state() == CONTEXT_USER);
 
@@ -499,7 +498,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x) &&
 	    unlikely(!(regs->msr & MSR_RI)))
 		unrecoverable_exception(regs);
-	BUG_ON(regs->msr & MSR_PR);
 	/*
 	 * CT_WARN_ON comes here via program_check_exception,
 	 * so avoid recursion.
-- 
2.25.0

