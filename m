Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C43B41F7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 12:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBDLT3Ffnz3c7S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 20:50:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBDKn0M2Yz2yWs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 20:50:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GBDKY6XwFzB9gp;
 Fri, 25 Jun 2021 12:49:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s9wbEA50Ja3r; Fri, 25 Jun 2021 12:49:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GBDKY5ZpPzB9TV;
 Fri, 25 Jun 2021 12:49:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8CD888B7FF;
 Fri, 25 Jun 2021 12:49:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MUom42jIG7eP; Fri, 25 Jun 2021 12:49:53 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 392AE8B803;
 Fri, 25 Jun 2021 12:49:53 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1306F66359; Fri, 25 Jun 2021 10:49:53 +0000 (UTC)
Message-Id: <bed7e338d487e04bfcc34d796c0d7cb827579641.1624618157.git.christophe.leroy@csgroup.eu>
In-Reply-To: <afe50d1db63a10fde9547ea08fe1fa68b0638aba.1624618157.git.christophe.leroy@csgroup.eu>
References: <afe50d1db63a10fde9547ea08fe1fa68b0638aba.1624618157.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH RFC 2/2] powerpc/signal: Retire signal trampoline on stack
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 25 Jun 2021 10:49:53 +0000 (UTC)
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

The signal trampoline is either:
- As specified by the caller via SA_RESTORER
- In VDSO if VDSO is properly mapped
- Fallback on user stack

However, nowadays user stack is mapped non executable by default
so the fallback will generate an exec fault.

All other architectures having VDSO except x86 and sh don't install
any fallback trampoline on stack.

Simplify the code by doing the same, remove signal trampoline
on stack. If VDSO is not mapped, a NULL like address will be set
and the user app will gently fault.

If a user application explicitly want's to unmap VDSO, it can
still provide an SA_RESTORER.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c  | 26 +++++++++-------------
 arch/powerpc/kernel/signal_64.c  | 38 ++++----------------------------
 arch/powerpc/perf/callchain_32.c |  5 -----
 arch/powerpc/perf/callchain_64.c |  2 --
 4 files changed, 14 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index cf3da1386595..366d07cb42da 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -769,16 +769,13 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	}
 
 	/* Save user registers on the stack */
-	if (ksig->ka.sa.sa_flags & SA_RESTORER) {
+	if (ksig->ka.sa.sa_flags & SA_RESTORER)
 		tramp = (unsigned long)ksig->ka.sa.sa_restorer;
-	} else if (tsk->mm->context.vdso) {
+	else if (tsk->mm->context.vdso)
 		tramp = VDSO32_SYMBOL(tsk->mm->context.vdso, sigtramp_rt32);
-	} else {
-		tramp = (unsigned long)mctx->mc_pad;
-		unsafe_put_user(PPC_RAW_LI(_R0, __NR_rt_sigreturn), &mctx->mc_pad[0], failed);
-		unsafe_put_user(PPC_RAW_SC(), &mctx->mc_pad[1], failed);
-		asm("dcbst %y0; sync; icbi %y0; sync" :: "Z" (mctx->mc_pad[0]));
-	}
+	else
+		tramp = 0;
+
 	unsafe_put_sigset_t(&frame->uc.uc_sigmask, oldset, failed);
 
 	user_access_end();
@@ -867,16 +864,13 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 	else
 		unsafe_save_user_regs(regs, mctx, tm_mctx, 1, failed);
 
-	if (ksig->ka.sa.sa_flags & SA_RESTORER) {
+	if (ksig->ka.sa.sa_flags & SA_RESTORER)
 		tramp = (unsigned long)ksig->ka.sa.sa_restorer;
-	} else if (tsk->mm->context.vdso) {
+	else if (tsk->mm->context.vdso)
 		tramp = VDSO32_SYMBOL(tsk->mm->context.vdso, sigtramp32);
-	} else {
-		tramp = (unsigned long)mctx->mc_pad;
-		unsafe_put_user(PPC_RAW_LI(_R0, __NR_sigreturn), &mctx->mc_pad[0], failed);
-		unsafe_put_user(PPC_RAW_SC(), &mctx->mc_pad[1], failed);
-		asm("dcbst %y0; sync; icbi %y0; sync" :: "Z" (mctx->mc_pad[0]));
-	}
+	else
+		tramp = 0;
+
 	user_access_end();
 
 	regs->link = tramp;
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index fb31a334aca6..39522ebd1137 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -610,32 +610,6 @@ static long restore_tm_sigcontexts(struct task_struct *tsk, struct sigcontext __
 }
 #endif
 
-/*
- * Setup the trampoline code on the stack
- */
-static long setup_trampoline(unsigned int syscall, unsigned int __user *tramp)
-{
-	int i;
-	long err = 0;
-
-	/* Call the handler and pop the dummy stackframe*/
-	err |= __put_user(PPC_RAW_BCTRL(), &tramp[0]);
-	err |= __put_user(PPC_RAW_ADDI(_R1, _R1, __SIGNAL_FRAMESIZE), &tramp[1]);
-
-	err |= __put_user(PPC_RAW_LI(_R0, syscall), &tramp[2]);
-	err |= __put_user(PPC_RAW_SC(), &tramp[3]);
-
-	/* Minimal traceback info */
-	for (i=TRAMP_TRACEBACK; i < TRAMP_SIZE ;i++)
-		err |= __put_user(0, &tramp[i]);
-
-	if (!err)
-		flush_icache_range((unsigned long) &tramp[0],
-			   (unsigned long) &tramp[TRAMP_SIZE]);
-
-	return err;
-}
-
 /*
  * Userspace code may pass a ucontext which doesn't include VSX added
  * at the end.  We need to check for this case.
@@ -910,16 +884,12 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	tsk->thread.fp_state.fpscr = 0;
 
 	/* Set up to return from userspace. */
-	if (ksig->ka.sa.sa_flags & SA_RESTORER) {
+	if (ksig->ka.sa.sa_flags & SA_RESTORER)
 		regs_set_return_ip(regs, (unsigned long)ksig->ka.sa.sa_restorer);
-	} else if (tsk->mm->context.vdso) {
+	else if (tsk->mm->context.vdso)
 		regs_set_return_ip(regs, VDSO64_SYMBOL(tsk->mm->context.vdso, sigtramp_rt64));
-	} else {
-		err |= setup_trampoline(__NR_rt_sigreturn, &frame->tramp[0]);
-		if (err)
-			goto badframe;
-		regs_set_return_ip(regs, (unsigned long) &frame->tramp[0]);
-	}
+	else
+		regs->nip = 0;
 
 	/* Allocate a dummy caller frame for the signal handler. */
 	newsp = ((unsigned long)frame) - __SIGNAL_FRAMESIZE;
diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
index b83c47b7947f..8ab4663cef50 100644
--- a/arch/powerpc/perf/callchain_32.c
+++ b/arch/powerpc/perf/callchain_32.c
@@ -57,8 +57,6 @@ struct rt_signal_frame_32 {
 
 static int is_sigreturn_32_address(unsigned int nip, unsigned int fp)
 {
-	if (nip == fp + offsetof(struct signal_frame_32, mctx.mc_pad))
-		return 1;
 	if (current->mm->context.vdso &&
 	    nip == VDSO32_SYMBOL(current->mm->context.vdso, sigtramp32))
 		return 1;
@@ -67,9 +65,6 @@ static int is_sigreturn_32_address(unsigned int nip, unsigned int fp)
 
 static int is_rt_sigreturn_32_address(unsigned int nip, unsigned int fp)
 {
-	if (nip == fp + offsetof(struct rt_signal_frame_32,
-				 uc.uc_mcontext.mc_pad))
-		return 1;
 	if (current->mm->context.vdso &&
 	    nip == VDSO32_SYMBOL(current->mm->context.vdso, sigtramp_rt32))
 		return 1;
diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
index 8d0df4226328..8c7078ff67c2 100644
--- a/arch/powerpc/perf/callchain_64.c
+++ b/arch/powerpc/perf/callchain_64.c
@@ -66,8 +66,6 @@ struct signal_frame_64 {
 
 static int is_sigreturn_64_address(unsigned long nip, unsigned long fp)
 {
-	if (nip == fp + offsetof(struct signal_frame_64, tramp))
-		return 1;
 	if (current->mm->context.vdso &&
 	    nip == VDSO64_SYMBOL(current->mm->context.vdso, sigtramp_rt64))
 		return 1;
-- 
2.25.0

