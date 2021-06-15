Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 219113A7744
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 08:42:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3zJZ5JW7z3bxY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 16:42:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3zHJ6x6Cz3btC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 16:41:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G3zH10g96zB9C7;
 Tue, 15 Jun 2021 08:41:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8xzz5YnCJCSc; Tue, 15 Jun 2021 08:41:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G3zH06pKfzB9BM;
 Tue, 15 Jun 2021 08:41:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E03DD8B7A4;
 Tue, 15 Jun 2021 08:41:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 90MrqGNBmaWg; Tue, 15 Jun 2021 08:41:00 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 881FA8B7A2;
 Tue, 15 Jun 2021 08:41:00 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 60BFD6627B; Tue, 15 Jun 2021 06:41:00 +0000 (UTC)
Message-Id: <6fc18af6d3caf1de0afc476cbebb9de5ad8b54d1.1623739212.git.christophe.leroy@csgroup.eu>
In-Reply-To: <b813c1f4d3dab2f51300eac44d99029aa8e57830.1623739212.git.christophe.leroy@csgroup.eu>
References: <b813c1f4d3dab2f51300eac44d99029aa8e57830.1623739212.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 4/7] powerpc/signal: Include the new stack frame inside the
 user access block
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 15 Jun 2021 06:41:00 +0000 (UTC)
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

Include the new stack frame inside the user access block and set it up
using unsafe_put_user().

On an mpc 8321 (book3s/32) the improvment is about 4% on a process
sending a signal to itself.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 29 +++++++++++++----------------
 arch/powerpc/kernel/signal_64.c | 14 +++++++-------
 2 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 8f05ed0da292..621de6e457b3 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -781,7 +781,7 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	struct rt_sigframe __user *frame;
 	struct mcontext __user *mctx;
 	struct mcontext __user *tm_mctx = NULL;
-	unsigned long newsp = 0;
+	unsigned long __user *newsp;
 	unsigned long tramp;
 	struct pt_regs *regs = tsk->thread.regs;
 	/* Save the thread's msr before get_tm_stackpointer() changes it */
@@ -789,6 +789,7 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 
 	/* Set up Signal Frame */
 	frame = get_sigframe(ksig, tsk, sizeof(*frame), 1);
+	newsp = (unsigned long __user *)((unsigned long)frame - (__SIGNAL_FRAMESIZE + 16));
 	mctx = &frame->uc.uc_mcontext;
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	tm_mctx = &frame->uc_transact.uc_mcontext;
@@ -798,7 +799,7 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	else
 		prepare_save_user_regs(1);
 
-	if (!user_access_begin(frame, sizeof(*frame)))
+	if (!user_access_begin(newsp, __SIGNAL_FRAMESIZE + 16 + sizeof(*frame)))
 		goto badframe;
 
 	/* Put the siginfo & fill in most of the ucontext */
@@ -836,6 +837,9 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	}
 	unsafe_put_sigset_t(&frame->uc.uc_sigmask, oldset, failed);
 
+	/* create a stack frame for the caller of the handler */
+	unsafe_put_user(regs->gpr[1], newsp, failed);
+
 	user_access_end();
 
 	if (copy_siginfo_to_user(&frame->info, &ksig->info))
@@ -847,13 +851,8 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	tsk->thread.fp_state.fpscr = 0;	/* turn off all fp exceptions */
 #endif
 
-	/* create a stack frame for the caller of the handler */
-	newsp = ((unsigned long)frame) - (__SIGNAL_FRAMESIZE + 16);
-	if (put_user(regs->gpr[1], (u32 __user *)newsp))
-		goto badframe;
-
 	/* Fill registers for signal handler */
-	regs->gpr[1] = newsp;
+	regs->gpr[1] = (unsigned long)newsp;
 	regs->gpr[3] = ksig->sig;
 	regs->gpr[4] = (unsigned long)&frame->info;
 	regs->gpr[5] = (unsigned long)&frame->uc;
@@ -883,7 +882,7 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 	struct sigframe __user *frame;
 	struct mcontext __user *mctx;
 	struct mcontext __user *tm_mctx = NULL;
-	unsigned long newsp = 0;
+	unsigned long __user *newsp;
 	unsigned long tramp;
 	struct pt_regs *regs = tsk->thread.regs;
 	/* Save the thread's msr before get_tm_stackpointer() changes it */
@@ -891,6 +890,7 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 
 	/* Set up Signal Frame */
 	frame = get_sigframe(ksig, tsk, sizeof(*frame), 1);
+	newsp = (unsigned long __user *)((unsigned long)frame - __SIGNAL_FRAMESIZE);
 	mctx = &frame->mctx;
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	tm_mctx = &frame->mctx_transact;
@@ -900,7 +900,7 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 	else
 		prepare_save_user_regs(1);
 
-	if (!user_access_begin(frame, sizeof(*frame)))
+	if (!user_access_begin(newsp, __SIGNAL_FRAMESIZE + sizeof(*frame)))
 		goto badframe;
 	sc = (struct sigcontext __user *) &frame->sctx;
 
@@ -931,6 +931,8 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 		unsafe_put_user(PPC_INST_SC, &mctx->mc_pad[1], failed);
 		asm("dcbst %y0; sync; icbi %y0; sync" :: "Z" (mctx->mc_pad[0]));
 	}
+	/* create a stack frame for the caller of the handler */
+	unsafe_put_user(regs->gpr[1], newsp, failed);
 	user_access_end();
 
 	regs->link = tramp;
@@ -939,12 +941,7 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 	tsk->thread.fp_state.fpscr = 0;	/* turn off all fp exceptions */
 #endif
 
-	/* create a stack frame for the caller of the handler */
-	newsp = ((unsigned long)frame) - __SIGNAL_FRAMESIZE;
-	if (put_user(regs->gpr[1], (u32 __user *)newsp))
-		goto badframe;
-
-	regs->gpr[1] = newsp;
+	regs->gpr[1] = (unsigned long)newsp;
 	regs->gpr[3] = ksig->sig;
 	regs->gpr[4] = (unsigned long) sc;
 	regs->nip = (unsigned long)ksig->ka.sa.sa_handler;
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 9ca97b4366df..35c301457fbf 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -847,13 +847,14 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 		struct task_struct *tsk)
 {
 	struct rt_sigframe __user *frame;
-	unsigned long newsp = 0;
+	unsigned long __user *newsp;
 	long err = 0;
 	struct pt_regs *regs = tsk->thread.regs;
 	/* Save the thread's msr before get_tm_stackpointer() changes it */
 	unsigned long msr = regs->msr;
 
 	frame = get_sigframe(ksig, tsk, sizeof(*frame), 0);
+	newsp = (unsigned long __user *)((unsigned long)frame - __SIGNAL_FRAMESIZE);
 
 	/*
 	 * This only applies when calling unsafe_setup_sigcontext() and must be
@@ -862,7 +863,7 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	if (!MSR_TM_ACTIVE(msr))
 		prepare_setup_sigcontext(tsk);
 
-	if (!user_write_access_begin(frame, sizeof(*frame)))
+	if (!user_write_access_begin(newsp, __SIGNAL_FRAMESIZE + sizeof(*frame)))
 		goto badframe;
 
 	unsafe_put_user(&frame->info, &frame->pinfo, badframe_block);
@@ -900,6 +901,9 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	}
 
 	unsafe_copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set), badframe_block);
+	/* Allocate a dummy caller frame for the signal handler. */
+	unsafe_put_user(regs->gpr[1], newsp, badframe_block);
+
 	user_write_access_end();
 
 	/* Save the siginfo outside of the unsafe block. */
@@ -919,10 +923,6 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 		regs->nip = (unsigned long) &frame->tramp[0];
 	}
 
-	/* Allocate a dummy caller frame for the signal handler. */
-	newsp = ((unsigned long)frame) - __SIGNAL_FRAMESIZE;
-	err |= put_user(regs->gpr[1], (unsigned long __user *)newsp);
-
 	/* Set up "regs" so we "return" to the signal handler. */
 	if (is_elf2_task()) {
 		regs->ctr = (unsigned long) ksig->ka.sa.sa_handler;
@@ -953,7 +953,7 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	/* enter the signal handler in native-endian mode */
 	regs->msr &= ~MSR_LE;
 	regs->msr |= (MSR_KERNEL & MSR_LE);
-	regs->gpr[1] = newsp;
+	regs->gpr[1] = (unsigned long)newsp;
 	regs->gpr[3] = ksig->sig;
 	regs->result = 0;
 	if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
-- 
2.25.0

