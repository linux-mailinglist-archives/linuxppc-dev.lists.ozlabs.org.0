Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B11E125F998
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 13:36:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlR7s2pwQzDqBr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 21:36:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlR5Y1dqPzDq8F
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Sep 2020 21:34:36 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BlR5D1g5Lz9tyWL;
 Mon,  7 Sep 2020 13:34:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ctq1O-PMeJrk; Mon,  7 Sep 2020 13:34:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BlR5D02Mtz9tyVw;
 Mon,  7 Sep 2020 13:34:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 54F978B78A;
 Mon,  7 Sep 2020 13:34:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KKRC9ZEAhtlF; Mon,  7 Sep 2020 13:34:29 +0200 (CEST)
Received: from [10.0.2.15] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 129A48B77F;
 Mon,  7 Sep 2020 13:34:29 +0200 (CEST)
Subject: Re: [RFC PATCH 02/12] powerpc: remove arguments from interrupt
 handler functions
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <e34fead9-a356-3ae6-aa33-544380230bd5@csgroup.eu>
References: <20200905174335.3161229-1-npiggin@gmail.com>
 <20200905174335.3161229-3-npiggin@gmail.com>
 <e34fead9-a356-3ae6-aa33-544380230bd5@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Organization: CS Group France
Date: Mon, 07 Sep 2020 11:34:17 +0000
Message-ID: <1599478457.27656.1.camel@po17688vm.idsi0.si.c-s.fr>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 (2.32.3-37.el6) 
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-09-07 at 11:20 +0200, Christophe Leroy wrote:
> 
> Le 05/09/2020 à 19:43, Nicholas Piggin a écrit :
> > Make interrupt handlers all just take the pt_regs * argument and load
> > DAR/DSISR etc from that. Make those that return a value return long.
> 
> I like this, it will likely simplify a bit the VMAP_STACK mess.
> 
> Not sure it is that easy. My board is stuck after the start of init.
> 
> 
> On the 8xx, on Instruction TLB Error exception, we do
> 
> 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
> 
> On book3s/32, on ISI exception we do:
> 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
> 
> On 40x and bookE, on ISI exception we do:
> 	li	r5,0			/* Pass zero as arg3 */
> 
> 
> And regs->dsisr will just contain nothing
> 
> So it means we should at least write back r5 into regs->dsisr from there 
> ? The performance impact should be minimal as we already write _DAR so 
> the cache line should already be in the cache.
> 
> A hacky 'stw r5, _DSISR(r1)' in handle_page_fault() does the trick, 
> allthough we don't want to do it for both ISI and DSI at the end, so 
> you'll have to do it in every head_xxx.S

To get you series build and work, I did the following hacks:

diff --git a/arch/powerpc/include/asm/interrupt.h
b/arch/powerpc/include/asm/interrupt.h
index acfcc7d5779b..c11045d3113a 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -93,7 +93,9 @@ static inline void interrupt_nmi_exit_prepare(struct
pt_regs *regs, struct inter
 {
 	nmi_exit();
 
+#ifdef CONFIG_PPC64
 	this_cpu_set_ftrace_enabled(state->ftrace_enabled);
+#endif
 
 #ifdef CONFIG_PPC_BOOK3S_64
 	/* Check we didn't change the pending interrupt mask. */
diff --git a/arch/powerpc/kernel/entry_32.S
b/arch/powerpc/kernel/entry_32.S
index f4d0af8e1136..66f7adbe1076 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -663,6 +663,7 @@ ppc_swapcontext:
  */
 	.globl	handle_page_fault
 handle_page_fault:
+	stw	r5,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_BOOK3S_32
 	andis.  r0,r5,DSISR_DABRMATCH@h
---

Christophe

