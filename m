Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F4B248DA9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 20:03:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWJgq2M42zDqjM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 04:03:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWHhn1p77zDqbf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 03:19:37 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWHhf34BCz9vCxx;
 Tue, 18 Aug 2020 19:19:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RF92PzeOvD8m; Tue, 18 Aug 2020 19:19:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWHhf2DZ1z9vCxg;
 Tue, 18 Aug 2020 19:19:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D7298B7EC;
 Tue, 18 Aug 2020 19:19:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0CYmYbAE1Ec5; Tue, 18 Aug 2020 19:19:32 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E4D318B7D7;
 Tue, 18 Aug 2020 19:19:31 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C2CD665CF4; Tue, 18 Aug 2020 17:19:31 +0000 (UTC)
Message-Id: <f3c36d687e4228f58d5c207a4036aa9ddcc7420a.1597770847.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597770847.git.christophe.leroy@csgroup.eu>
References: <cover.1597770847.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 19/25] powerpc/signal32: Remove ifdefery in middle of
 if/else
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 18 Aug 2020 17:19:31 +0000 (UTC)
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

MSR_TM_ACTIVE() is always defined and returns always 0 when
CONFIG_PPC_TRANSACTIONAL_MEM is not selected, so the awful
ifdefery in the middle of an if/else can be removed.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 93c2d6304831..310d3b8d9ad5 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -447,6 +447,12 @@ static int save_tm_user_regs(struct pt_regs *regs, struct mcontext __user *frame
 
 	return 0;
 }
+#else
+static int save_tm_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
+			     struct mcontext __user *tm_frame, unsigned long msr)
+{
+	return 0;
+}
 #endif
 
 /*
@@ -732,10 +738,8 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	unsigned long newsp = 0;
 	unsigned long tramp;
 	struct pt_regs *regs = tsk->thread.regs;
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	/* Save the thread's msr before get_tm_stackpointer() changes it */
 	unsigned long msr = regs->msr;
-#endif
 
 	/* Set up Signal Frame */
 	frame = get_sigframe(ksig, tsk, sizeof(*frame), 1);
@@ -786,14 +790,10 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	if (tramp == (unsigned long)mctx->mc_pad)
 		flush_icache_range(tramp, tramp + 2 * sizeof(unsigned long));
 
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (MSR_TM_ACTIVE(msr)) {
 		if (save_tm_user_regs(regs, mctx, tm_mctx, msr))
 			goto badframe;
-	}
-	else
-#endif
-	{
+	} else {
 		if (save_user_regs(regs, mctx, tm_mctx, 1))
 			goto badframe;
 	}
@@ -842,10 +842,8 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 	unsigned long newsp = 0;
 	unsigned long tramp;
 	struct pt_regs *regs = tsk->thread.regs;
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	/* Save the thread's msr before get_tm_stackpointer() changes it */
 	unsigned long msr = regs->msr;
-#endif
 
 	/* Set up Signal Frame */
 	frame = get_sigframe(ksig, tsk, sizeof(*frame), 1);
@@ -883,14 +881,10 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 	if (tramp == (unsigned long)mctx->mc_pad)
 		flush_icache_range(tramp, tramp + 2 * sizeof(unsigned long));
 
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (MSR_TM_ACTIVE(msr)) {
 		if (save_tm_user_regs(regs, mctx, tm_mctx, msr))
 			goto badframe;
-	}
-	else
-#endif
-	{
+	} else {
 		if (save_user_regs(regs, mctx, tm_mctx, 1))
 			goto badframe;
 	}
-- 
2.25.0

