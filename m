Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B442EFD8C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jan 2021 04:42:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DCQlC242QzDqwF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jan 2021 14:42:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=131.153.2.42;
 helo=h1.fbrelay.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from h1.fbrelay.privateemail.com (h1.fbrelay.privateemail.com
 [131.153.2.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DCQbm6SlzzDqyJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jan 2021 14:35:47 +1100 (AEDT)
Received: from MTA-07-4.privateemail.com (mta-07.privateemail.com
 [198.54.127.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 85BDA804B3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jan 2021 22:26:16 -0500 (EST)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id E6451600CE
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jan 2021 22:26:05 -0500 (EST)
Received: from oc8246131445.ibm.com (unknown [10.20.151.217])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id B7A02600D0
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jan 2021 03:26:05 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/8] powerpc/signal64: Remove TM ifdefery in middle of
 if/else block
Date: Fri,  8 Jan 2021 21:25:53 -0600
Message-Id: <20210109032557.13831-5-cmr@codefail.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210109032557.13831-1-cmr@codefail.de>
References: <20210109032557.13831-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rework the messy ifdef breaking up the if-else for TM similar to
commit f1cf4f93de2f ("powerpc/signal32: Remove ifdefery in middle of if/else").

Unlike that commit for ppc32, the ifdef can't be removed entirely since
uc_transact in sigframe depends on CONFIG_PPC_TRANSACTIONAL_MEM.

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/signal_64.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index b211a8ea4f6e..dd3787f67a78 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -710,9 +710,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	struct pt_regs *regs = current_pt_regs();
 	struct ucontext __user *uc = (struct ucontext __user *)regs->gpr[1];
 	sigset_t set;
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	unsigned long msr;
-#endif
 
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
@@ -762,10 +760,12 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	 * restore_tm_sigcontexts.
 	 */
 	regs->msr &= ~MSR_TS_MASK;
+#endif
 
 	if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
 		goto badframe;
 	if (MSR_TM_ACTIVE(msr)) {
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 		/* We recheckpoint on return. */
 		struct ucontext __user *uc_transact;
 
@@ -778,9 +778,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		if (restore_tm_sigcontexts(current, &uc->uc_mcontext,
 					   &uc_transact->uc_mcontext))
 			goto badframe;
-	} else
 #endif
-	{
+	} else {
 		/*
 		 * Fall through, for non-TM restore
 		 *
@@ -818,10 +817,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	unsigned long newsp = 0;
 	long err = 0;
 	struct pt_regs *regs = tsk->thread.regs;
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	/* Save the thread's msr before get_tm_stackpointer() changes it */
-	unsigned long msr = regs->msr;
-#endif
+	unsigned long msr __maybe_unused = regs->msr;
 
 	frame = get_sigframe(ksig, tsk, sizeof(*frame), 0);
 	if (!access_ok(frame, sizeof(*frame)))
@@ -836,8 +833,9 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	/* Create the ucontext.  */
 	err |= __put_user(0, &frame->uc.uc_flags);
 	err |= __save_altstack(&frame->uc.uc_stack, regs->gpr[1]);
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+
 	if (MSR_TM_ACTIVE(msr)) {
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 		/* The ucontext_t passed to userland points to the second
 		 * ucontext_t (for transactional state) with its uc_link ptr.
 		 */
@@ -847,9 +845,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 					    tsk, ksig->sig, NULL,
 					    (unsigned long)ksig->ka.sa.sa_handler,
 					    msr);
-	} else
 #endif
-	{
+	} else {
 		err |= __put_user(0, &frame->uc.uc_link);
 		prepare_setup_sigcontext(tsk, 1);
 		err |= setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
-- 
2.26.1

