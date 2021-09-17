Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F48740F2D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 09:01:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9lHP3Fpzz3bhq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 17:01:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9lFc020yz304J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 17:00:03 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H9lFK1H92z9sVC;
 Fri, 17 Sep 2021 08:59:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r_Gu9d0_AtMw; Fri, 17 Sep 2021 08:59:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H9lFG2TJQz9sVF;
 Fri, 17 Sep 2021 08:59:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A33F8B799;
 Fri, 17 Sep 2021 08:59:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ktdw4oWpv8_c; Fri, 17 Sep 2021 08:59:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.36])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C8C998B79E;
 Fri, 17 Sep 2021 08:59:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 18H6xaLr464205
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 08:59:36 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 18H6xaR2464204;
 Fri, 17 Sep 2021 08:59:36 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, ebiederm@xmission.com,
 hch@infradead.org
Subject: [PATCH v5 5/5] powerpc/signal: Use unsafe_copy_siginfo_to_user()
Date: Fri, 17 Sep 2021 08:59:20 +0200
Message-Id: <e0b6740876dd1e08704cabe4946516af43742a4b.1631861883.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <1718f38859d5366f82d5bef531f255cedf537b5d.1631861883.git.christophe.leroy@csgroup.eu>
References: <1718f38859d5366f82d5bef531f255cedf537b5d.1631861883.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use unsafe_copy_siginfo_to_user() in order to do the copy
within the user access block.

On an mpc 8321 (book3s/32) the improvment is about 5% on a process
sending a signal to itself.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: Added missing __user flag when calling unsafe_copy_siginfo_to_user()

v4: Use another approach for compat: drop the unsafe_copy_siginfo_to_user32(), instead directly call copy_siginfo_to_external32() before user_access_begin()

v3: Don't leave compat aside, use the new unsafe_copy_siginfo_to_user32()
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 17 ++++++++---------
 arch/powerpc/kernel/signal_64.c |  5 +----
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index ff101e2b3bab..0baf3c10b6c0 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -710,12 +710,6 @@ static long restore_tm_user_regs(struct pt_regs *regs, struct mcontext __user *s
 }
 #endif
 
-#ifdef CONFIG_PPC64
-
-#define copy_siginfo_to_user	copy_siginfo_to_user32
-
-#endif /* CONFIG_PPC64 */
-
 /*
  * Set up a signal frame for a "real-time" signal handler
  * (one which gets siginfo).
@@ -731,6 +725,7 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	struct pt_regs *regs = tsk->thread.regs;
 	/* Save the thread's msr before get_tm_stackpointer() changes it */
 	unsigned long msr = regs->msr;
+	compat_siginfo_t uinfo;
 
 	/* Set up Signal Frame */
 	frame = get_sigframe(ksig, tsk, sizeof(*frame), 1);
@@ -744,6 +739,9 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	else
 		prepare_save_user_regs(1);
 
+	if (IS_ENABLED(CONFIG_COMPAT))
+		copy_siginfo_to_external32(&uinfo, &ksig->info);
+
 	if (!user_access_begin(newsp, __SIGNAL_FRAMESIZE + 16 + sizeof(*frame)))
 		goto badframe;
 
@@ -779,15 +777,16 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 		asm("dcbst %y0; sync; icbi %y0; sync" :: "Z" (mctx->mc_pad[0]));
 	}
 	unsafe_put_sigset_t(&frame->uc.uc_sigmask, oldset, failed);
+	if (IS_ENABLED(CONFIG_COMPAT))
+		unsafe_copy_to_user(&frame->info, &uinfo, sizeof(frame->info), failed);
+	else
+		unsafe_copy_siginfo_to_user((void __user *)&frame->info, &ksig->info, failed);
 
 	/* create a stack frame for the caller of the handler */
 	unsafe_put_user(regs->gpr[1], newsp, failed);
 
 	user_access_end();
 
-	if (copy_siginfo_to_user(&frame->info, &ksig->info))
-		goto badframe;
-
 	regs->link = tramp;
 
 #ifdef CONFIG_PPC_FPU_REGS
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index d80ff83cacb9..56c0c74aa28c 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -901,15 +901,12 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	}
 
 	unsafe_copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set), badframe_block);
+	unsafe_copy_siginfo_to_user(&frame->info, &ksig->info, badframe_block);
 	/* Allocate a dummy caller frame for the signal handler. */
 	unsafe_put_user(regs->gpr[1], newsp, badframe_block);
 
 	user_write_access_end();
 
-	/* Save the siginfo outside of the unsafe block. */
-	if (copy_siginfo_to_user(&frame->info, &ksig->info))
-		goto badframe;
-
 	/* Make sure signal handler doesn't get spurious FP exceptions */
 	tsk->thread.fp_state.fpscr = 0;
 
-- 
2.31.1

