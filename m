Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78636248D84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 19:53:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWJRr4cK1zDqqW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 03:53:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWHhg11LwzDqbf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 03:19:31 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWHhZ2D5hz9vCxs;
 Tue, 18 Aug 2020 19:19:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hsmR4IP4iZ9M; Tue, 18 Aug 2020 19:19:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWHhZ1Ngkz9vCxg;
 Tue, 18 Aug 2020 19:19:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 12F4E8B7EC;
 Tue, 18 Aug 2020 19:19:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sXJh-3FR1IrY; Tue, 18 Aug 2020 19:19:27 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C84038B7D7;
 Tue, 18 Aug 2020 19:19:27 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A521065CF4; Tue, 18 Aug 2020 17:19:27 +0000 (UTC)
Message-Id: <df0bc8c3b8fa96390c46f611df79b2a94ac21844.1597770847.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597770847.git.christophe.leroy@csgroup.eu>
References: <cover.1597770847.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 15/25] powerpc/signal32: Misc changes to make
 handle_[rt_]_signal32() more similar
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 18 Aug 2020 17:19:27 +0000 (UTC)
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

Miscellaneous changes to clean and make handle_signal32() and
handle_rt_signal32() even more similar.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index d0fcb3de66aa..ab8c8cb98b15 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -764,8 +764,11 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 #endif
 
 	/* Set up Signal Frame */
-	/* Put a Real Time Context onto stack */
 	frame = get_sigframe(ksig, tsk, sizeof(*frame), 1);
+	mctx = &frame->uc.uc_mcontext;
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	tm_mctx = &frame->uc_transact.uc_mcontext;
+#endif
 	if (!access_ok(frame, sizeof(*frame)))
 		goto badframe;
 
@@ -778,7 +781,6 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 		goto badframe;
 
 	/* Save user registers on the stack */
-	mctx = &frame->uc.uc_mcontext;
 	if (vdso32_rt_sigtramp && tsk->mm->context.vdso_base) {
 		sigret = 0;
 		tramp = tsk->mm->context.vdso_base + vdso32_rt_sigtramp;
@@ -788,7 +790,6 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	}
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	tm_mctx = &frame->uc_transact.uc_mcontext;
 	if (MSR_TM_ACTIVE(msr)) {
 		if (__put_user((unsigned long)&frame->uc_transact,
 			       &frame->uc.uc_link) ||
@@ -843,6 +844,7 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 {
 	struct sigcontext __user *sc;
 	struct sigframe __user *frame;
+	struct mcontext __user *mctx;
 	struct mcontext __user *tm_mctx = NULL;
 	unsigned long newsp = 0;
 	int sigret;
@@ -855,6 +857,10 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 
 	/* Set up Signal Frame */
 	frame = get_sigframe(ksig, tsk, sizeof(*frame), 1);
+	mctx = &frame->mctx;
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	tm_mctx = &frame->mctx_transact;
+#endif
 	if (!access_ok(frame, sizeof(*frame)))
 		goto badframe;
 	sc = (struct sigcontext __user *) &frame->sctx;
@@ -869,7 +875,7 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 #else
 	    || __put_user(oldset->sig[1], &sc->_unused[3])
 #endif
-	    || __put_user(to_user_ptr(&frame->mctx), &sc->regs)
+	    || __put_user(to_user_ptr(mctx), &sc->regs)
 	    || __put_user(ksig->sig, &sc->signal))
 		goto badframe;
 
@@ -878,20 +884,18 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 		tramp = tsk->mm->context.vdso_base + vdso32_sigtramp;
 	} else {
 		sigret = __NR_sigreturn;
-		tramp = (unsigned long) frame->mctx.tramp;
+		tramp = (unsigned long)mctx->tramp;
 	}
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	tm_mctx = &frame->mctx_transact;
 	if (MSR_TM_ACTIVE(msr)) {
-		if (save_tm_user_regs(regs, &frame->mctx, &frame->mctx_transact,
-				      sigret, msr))
+		if (save_tm_user_regs(regs, mctx, tm_mctx, sigret, msr))
 			goto badframe;
 	}
 	else
 #endif
 	{
-		if (save_user_regs(regs, &frame->mctx, tm_mctx, sigret, 1))
+		if (save_user_regs(regs, mctx, tm_mctx, sigret, 1))
 			goto badframe;
 	}
 
@@ -909,7 +913,7 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 	regs->gpr[1] = newsp;
 	regs->gpr[3] = ksig->sig;
 	regs->gpr[4] = (unsigned long) sc;
-	regs->nip = (unsigned long) (unsigned long)ksig->ka.sa.sa_handler;
+	regs->nip = (unsigned long)ksig->ka.sa.sa_handler;
 	/* enter the signal handler in big-endian mode */
 	regs->msr &= ~MSR_LE;
 	return 0;
-- 
2.25.0

