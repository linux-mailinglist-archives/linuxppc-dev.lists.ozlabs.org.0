Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD8B248D87
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 19:55:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWJTz49X2zDqWL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 03:55:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWHhh2frtzDqbf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 03:19:32 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWHhb4Kf0z9vCxm;
 Tue, 18 Aug 2020 19:19:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id k-BKWFA6CKzo; Tue, 18 Aug 2020 19:19:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWHhb3Tflz9vCxg;
 Tue, 18 Aug 2020 19:19:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3DD918B7EC;
 Tue, 18 Aug 2020 19:19:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZnABpRJThFKK; Tue, 18 Aug 2020 19:19:29 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CD1728B7D7;
 Tue, 18 Aug 2020 19:19:28 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id ACF9F65CF4; Tue, 18 Aug 2020 17:19:28 +0000 (UTC)
Message-Id: <e439cc0fa35aa45da6776520777a61848b92fd4b.1597770847.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597770847.git.christophe.leroy@csgroup.eu>
References: <cover.1597770847.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 16/25] powerpc/signal32: Move signal trampoline setup to
 handle_[rt_]signal32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 18 Aug 2020 17:19:28 +0000 (UTC)
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

Move signal trampoline setup into handle_signal32()
and handle_rt_signal32().

At the same time, remove the define which hides the mc_pad field
used for trampoline.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 61 ++++++++++++---------------------
 1 file changed, 22 insertions(+), 39 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index ab8c8cb98b15..d8c3843102df 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -199,9 +199,6 @@ struct sigframe {
 	int			abigap[56];
 };
 
-/* We use the mc_pad field for the signal return trampoline. */
-#define tramp	mc_pad
-
 /*
  *  When we have rt signals to deliver, we set up on the
  *  user stack, going down from the original stack pointer:
@@ -236,8 +233,7 @@ struct rt_sigframe {
  * altivec/spe instructions at some point.
  */
 static int save_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
-			  struct mcontext __user *tm_frame, int sigret,
-			  int ctx_has_vsx_region)
+			  struct mcontext __user *tm_frame, int ctx_has_vsx_region)
 {
 	unsigned long msr = regs->msr;
 
@@ -320,15 +316,6 @@ static int save_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
 	if (tm_frame && __put_user(0, &tm_frame->mc_gregs[PT_MSR]))
 		return 1;
 
-	if (sigret) {
-		/* Set up the sigreturn trampoline: li 0,sigret; sc */
-		if (__put_user(PPC_INST_ADDI + sigret, &frame->tramp[0])
-		    || __put_user(PPC_INST_SC, &frame->tramp[1]))
-			return 1;
-		flush_icache_range((unsigned long) &frame->tramp[0],
-				   (unsigned long) &frame->tramp[2]);
-	}
-
 	return 0;
 }
 
@@ -342,10 +329,8 @@ static int save_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
  *
  * See save_user_regs() and signal_64.c:setup_tm_sigcontexts().
  */
-static int save_tm_user_regs(struct pt_regs *regs,
-			     struct mcontext __user *frame,
-			     struct mcontext __user *tm_frame, int sigret,
-			     unsigned long msr)
+static int save_tm_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
+			     struct mcontext __user *tm_frame, unsigned long msr)
 {
 	WARN_ON(tm_suspend_disabled);
 
@@ -461,14 +446,6 @@ static int save_tm_user_regs(struct pt_regs *regs,
 
 	if (__put_user(msr, &frame->mc_gregs[PT_MSR]))
 		return 1;
-	if (sigret) {
-		/* Set up the sigreturn trampoline: li 0,sigret; sc */
-		if (__put_user(PPC_INST_ADDI + sigret, &frame->tramp[0])
-		    || __put_user(PPC_INST_SC, &frame->tramp[1]))
-			return 1;
-		flush_icache_range((unsigned long) &frame->tramp[0],
-				   (unsigned long) &frame->tramp[2]);
-	}
 
 	return 0;
 }
@@ -755,7 +732,6 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	struct mcontext __user *mctx;
 	struct mcontext __user *tm_mctx = NULL;
 	unsigned long newsp = 0;
-	int sigret;
 	unsigned long tramp;
 	struct pt_regs *regs = tsk->thread.regs;
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
@@ -782,11 +758,15 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 
 	/* Save user registers on the stack */
 	if (vdso32_rt_sigtramp && tsk->mm->context.vdso_base) {
-		sigret = 0;
 		tramp = tsk->mm->context.vdso_base + vdso32_rt_sigtramp;
 	} else {
-		sigret = __NR_rt_sigreturn;
-		tramp = (unsigned long)mctx->tramp;
+		tramp = (unsigned long)mctx->mc_pad;
+		/* Set up the sigreturn trampoline: li r0,sigret; sc */
+		if (__put_user(PPC_INST_ADDI + __NR_sigreturn, &mctx->mc_pad[0]))
+			goto badframe;
+		if (__put_user(PPC_INST_SC, &mctx->mc_pad[1]))
+			goto badframe;
+		flush_icache_range(tramp, tramp + 2 * sizeof(unsigned long));
 	}
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
@@ -796,7 +776,7 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 		    __put_user((unsigned long)tm_mctx,
 			       &frame->uc_transact.uc_regs))
 			goto badframe;
-		if (save_tm_user_regs(regs, mctx, tm_mctx, sigret, msr))
+		if (save_tm_user_regs(regs, mctx, tm_mctx, msr))
 			goto badframe;
 	}
 	else
@@ -804,7 +784,7 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	{
 		if (__put_user(0, &frame->uc.uc_link))
 			goto badframe;
-		if (save_user_regs(regs, mctx, tm_mctx, sigret, 1))
+		if (save_user_regs(regs, mctx, tm_mctx, 1))
 			goto badframe;
 	}
 	regs->link = tramp;
@@ -847,7 +827,6 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 	struct mcontext __user *mctx;
 	struct mcontext __user *tm_mctx = NULL;
 	unsigned long newsp = 0;
-	int sigret;
 	unsigned long tramp;
 	struct pt_regs *regs = tsk->thread.regs;
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
@@ -880,22 +859,26 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 		goto badframe;
 
 	if (vdso32_sigtramp && tsk->mm->context.vdso_base) {
-		sigret = 0;
 		tramp = tsk->mm->context.vdso_base + vdso32_sigtramp;
 	} else {
-		sigret = __NR_sigreturn;
-		tramp = (unsigned long)mctx->tramp;
+		tramp = (unsigned long)mctx->mc_pad;
+		/* Set up the sigreturn trampoline: li r0,sigret; sc */
+		if (__put_user(PPC_INST_ADDI + __NR_sigreturn, &mctx->mc_pad[0]))
+			goto badframe;
+		if (__put_user(PPC_INST_SC, &mctx->mc_pad[1]))
+			goto badframe;
+		flush_icache_range(tramp, tramp + 2 * sizeof(unsigned long));
 	}
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (MSR_TM_ACTIVE(msr)) {
-		if (save_tm_user_regs(regs, mctx, tm_mctx, sigret, msr))
+		if (save_tm_user_regs(regs, mctx, tm_mctx, msr))
 			goto badframe;
 	}
 	else
 #endif
 	{
-		if (save_user_regs(regs, mctx, tm_mctx, sigret, 1))
+		if (save_user_regs(regs, mctx, tm_mctx, 1))
 			goto badframe;
 	}
 
@@ -1047,7 +1030,7 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
 		mctx = (struct mcontext __user *)
 			((unsigned long) &old_ctx->uc_mcontext & ~0xfUL);
 		if (!access_ok(old_ctx, ctx_size)
-		    || save_user_regs(regs, mctx, NULL, 0, ctx_has_vsx_region)
+		    || save_user_regs(regs, mctx, NULL, ctx_has_vsx_region)
 		    || put_sigset_t(&old_ctx->uc_sigmask, &current->blocked)
 		    || __put_user(to_user_ptr(mctx), &old_ctx->uc_regs))
 			return -EFAULT;
-- 
2.25.0

