Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4603248D7E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 19:51:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWJPq6w01zDqNS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 03:51:43 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWHhf09MZzDqbf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 03:19:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWHhY2KdJz9vCxl;
 Tue, 18 Aug 2020 19:19:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id FOjRfR1vXDDE; Tue, 18 Aug 2020 19:19:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWHhY1Zypz9vCxg;
 Tue, 18 Aug 2020 19:19:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 118288B7EC;
 Tue, 18 Aug 2020 19:19:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sFbP013vZTkb; Tue, 18 Aug 2020 19:19:26 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BF35A8B7D7;
 Tue, 18 Aug 2020 19:19:26 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9EC4165CF4; Tue, 18 Aug 2020 17:19:26 +0000 (UTC)
Message-Id: <be77477b0f05397876015b218e36548ee8f5e10b.1597770847.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597770847.git.christophe.leroy@csgroup.eu>
References: <cover.1597770847.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 14/25] powerpc/signal32: Rename local pointers in
 handle_rt_signal32()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 18 Aug 2020 17:19:26 +0000 (UTC)
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

Rename pointers in handle_rt_signal32() to make it more similar to
handle_signal32()

tm_frame becomes tm_mctx
frame becomes mctx
rt_sf becomes frame

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 51 ++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 2cc686b9f566..d0fcb3de66aa 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -751,9 +751,9 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 		       struct task_struct *tsk)
 {
-	struct rt_sigframe __user *rt_sf;
-	struct mcontext __user *frame;
-	struct mcontext __user *tm_frame = NULL;
+	struct rt_sigframe __user *frame;
+	struct mcontext __user *mctx;
+	struct mcontext __user *tm_mctx = NULL;
 	unsigned long newsp = 0;
 	int sigret;
 	unsigned long tramp;
@@ -765,46 +765,45 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 
 	/* Set up Signal Frame */
 	/* Put a Real Time Context onto stack */
-	rt_sf = get_sigframe(ksig, tsk, sizeof(*rt_sf), 1);
-	if (!access_ok(rt_sf, sizeof(*rt_sf)))
+	frame = get_sigframe(ksig, tsk, sizeof(*frame), 1);
+	if (!access_ok(frame, sizeof(*frame)))
 		goto badframe;
 
 	/* Put the siginfo & fill in most of the ucontext */
-	if (copy_siginfo_to_user(&rt_sf->info, &ksig->info)
-	    || __put_user(0, &rt_sf->uc.uc_flags)
-	    || __save_altstack(&rt_sf->uc.uc_stack, regs->gpr[1])
-	    || __put_user(to_user_ptr(&rt_sf->uc.uc_mcontext),
-		    &rt_sf->uc.uc_regs)
-	    || put_sigset_t(&rt_sf->uc.uc_sigmask, oldset))
+	if (copy_siginfo_to_user(&frame->info, &ksig->info) ||
+	    __put_user(0, &frame->uc.uc_flags) ||
+	    __save_altstack(&frame->uc.uc_stack, regs->gpr[1]) ||
+	    __put_user(to_user_ptr(&frame->uc.uc_mcontext), &frame->uc.uc_regs) ||
+	    put_sigset_t(&frame->uc.uc_sigmask, oldset))
 		goto badframe;
 
 	/* Save user registers on the stack */
-	frame = &rt_sf->uc.uc_mcontext;
+	mctx = &frame->uc.uc_mcontext;
 	if (vdso32_rt_sigtramp && tsk->mm->context.vdso_base) {
 		sigret = 0;
 		tramp = tsk->mm->context.vdso_base + vdso32_rt_sigtramp;
 	} else {
 		sigret = __NR_rt_sigreturn;
-		tramp = (unsigned long) frame->tramp;
+		tramp = (unsigned long)mctx->tramp;
 	}
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	tm_frame = &rt_sf->uc_transact.uc_mcontext;
+	tm_mctx = &frame->uc_transact.uc_mcontext;
 	if (MSR_TM_ACTIVE(msr)) {
-		if (__put_user((unsigned long)&rt_sf->uc_transact,
-			       &rt_sf->uc.uc_link) ||
-		    __put_user((unsigned long)tm_frame,
-			       &rt_sf->uc_transact.uc_regs))
+		if (__put_user((unsigned long)&frame->uc_transact,
+			       &frame->uc.uc_link) ||
+		    __put_user((unsigned long)tm_mctx,
+			       &frame->uc_transact.uc_regs))
 			goto badframe;
-		if (save_tm_user_regs(regs, frame, tm_frame, sigret, msr))
+		if (save_tm_user_regs(regs, mctx, tm_mctx, sigret, msr))
 			goto badframe;
 	}
 	else
 #endif
 	{
-		if (__put_user(0, &rt_sf->uc.uc_link))
+		if (__put_user(0, &frame->uc.uc_link))
 			goto badframe;
-		if (save_user_regs(regs, frame, tm_frame, sigret, 1))
+		if (save_user_regs(regs, mctx, tm_mctx, sigret, 1))
 			goto badframe;
 	}
 	regs->link = tramp;
@@ -814,16 +813,16 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 #endif
 
 	/* create a stack frame for the caller of the handler */
-	newsp = ((unsigned long)rt_sf) - (__SIGNAL_FRAMESIZE + 16);
+	newsp = ((unsigned long)frame) - (__SIGNAL_FRAMESIZE + 16);
 	if (put_user(regs->gpr[1], (u32 __user *)newsp))
 		goto badframe;
 
 	/* Fill registers for signal handler */
 	regs->gpr[1] = newsp;
 	regs->gpr[3] = ksig->sig;
-	regs->gpr[4] = (unsigned long) &rt_sf->info;
-	regs->gpr[5] = (unsigned long) &rt_sf->uc;
-	regs->gpr[6] = (unsigned long) rt_sf;
+	regs->gpr[4] = (unsigned long)&frame->info;
+	regs->gpr[5] = (unsigned long)&frame->uc;
+	regs->gpr[6] = (unsigned long)frame;
 	regs->nip = (unsigned long) ksig->ka.sa.sa_handler;
 	/* enter the signal handler in native-endian mode */
 	regs->msr &= ~MSR_LE;
@@ -831,7 +830,7 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	return 0;
 
 badframe:
-	signal_fault(tsk, regs, "handle_rt_signal32", rt_sf);
+	signal_fault(tsk, regs, "handle_rt_signal32", frame);
 
 	return 1;
 }
-- 
2.25.0

