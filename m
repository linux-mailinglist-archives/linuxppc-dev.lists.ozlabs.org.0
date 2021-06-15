Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 591B63A7738
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 08:41:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3zHP6bsYz308w
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 16:41:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3zH43p3Sz302W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 16:41:01 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G3zGx6s9lzB9CB;
 Tue, 15 Jun 2021 08:40:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IH65QaxPJ6dr; Tue, 15 Jun 2021 08:40:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G3zGx5y0QzB9BM;
 Tue, 15 Jun 2021 08:40:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B98838B7A3;
 Tue, 15 Jun 2021 08:40:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9l20SPmXXWb7; Tue, 15 Jun 2021 08:40:57 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 814828B7A2;
 Tue, 15 Jun 2021 08:40:57 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 43DE56627B; Tue, 15 Jun 2021 06:40:57 +0000 (UTC)
Message-Id: <b813c1f4d3dab2f51300eac44d99029aa8e57830.1623739212.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/7] powerpc/signal64: Copy siginfo before changing regs->nip
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 15 Jun 2021 06:40:57 +0000 (UTC)
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

From: Michael Ellerman <mpe@ellerman.id.au>

In commit 96d7a4e06fab ("powerpc/signal64: Rewrite handle_rt_signal64()
to minimise uaccess switches") the 64-bit signal code was rearranged to
use user_write_access_begin/end().

As part of that change the call to copy_siginfo_to_user() was moved
later in the function, so that it could be done after the
user_write_access_end().

In particular it was moved after we modify regs->nip to point to the
signal trampoline. That means if copy_siginfo_to_user() fails we exit
handle_rt_signal64() with an error but with regs->nip modified, whereas
previously we would not modify regs->nip until the copy succeeded.

Returning an error from signal delivery but with regs->nip updated
leaves the process in a sort of half-delivered state. We do immediately
force a SEGV in signal_setup_done(), called from do_signal(), so the
process should never run in the half-delivered state.

However that SEGV is not delivered until we've gone around to
do_notify_resume() again, so it's possible some tracing could observe
the half-delivered state.

There are other cases where we fail signal delivery with regs partly
updated, eg. the write to newsp and SA_SIGINFO, but the latter at least
is very unlikely to fail as it reads back from the frame we just wrote
to.

Looking at other arches they seem to be more careful about leaving regs
unchanged until the copy operations have succeeded, and in general that
seems like good hygenie.

So although the current behaviour is not cleary buggy, it's also not
clearly correct. So move the call to copy_siginfo_to_user() up prior to
the modification of regs->nip, which is closer to the old behaviour, and
easier to reason about.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_64.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index dca66481d0c2..f9e1f5428b9e 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -902,6 +902,10 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	unsafe_copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set), badframe_block);
 	user_write_access_end();
 
+	/* Save the siginfo outside of the unsafe block. */
+	if (copy_siginfo_to_user(&frame->info, &ksig->info))
+		goto badframe;
+
 	/* Make sure signal handler doesn't get spurious FP exceptions */
 	tsk->thread.fp_state.fpscr = 0;
 
@@ -915,11 +919,6 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 		regs->nip = (unsigned long) &frame->tramp[0];
 	}
 
-
-	/* Save the siginfo outside of the unsafe block. */
-	if (copy_siginfo_to_user(&frame->info, &ksig->info))
-		goto badframe;
-
 	/* Allocate a dummy caller frame for the signal handler. */
 	newsp = ((unsigned long)frame) - __SIGNAL_FRAMESIZE;
 	err |= put_user(regs->gpr[1], (unsigned long __user *)newsp);
-- 
2.25.0

