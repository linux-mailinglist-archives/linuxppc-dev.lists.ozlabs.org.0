Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD04224293F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 14:24:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRTQf62ZZzDqc6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 22:24:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRT1l349wzDqZS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 22:06:03 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BRT1d6nT2zB09ZQ;
 Wed, 12 Aug 2020 14:05:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Mb4FY47BJ_UM; Wed, 12 Aug 2020 14:05:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BRT1d62CPzB09Zb;
 Wed, 12 Aug 2020 14:05:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A6098B7FC;
 Wed, 12 Aug 2020 14:05:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NTMMr_RJzyJo; Wed, 12 Aug 2020 14:05:59 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CAB3F8B826;
 Wed, 12 Aug 2020 14:05:58 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id AACDB65C34; Wed, 12 Aug 2020 12:05:58 +0000 (UTC)
Message-Id: <c9e470b3623902193f0549e7f6aa437194e45e86.1597233555.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597233555.git.christophe.leroy@csgroup.eu>
References: <cover.1597233555.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 07/19] powerpc/signal: Move access_ok() out of
 get_sigframe()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ldv@altlinux.org, viro@zeniv.linux.org.uk
Date: Wed, 12 Aug 2020 12:05:58 +0000 (UTC)
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

This access_ok() will soon be performed by user_access_begin().
So move it out of get_sigframe()

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal.c    | 4 ----
 arch/powerpc/kernel/signal_32.c | 4 ++--
 arch/powerpc/kernel/signal_64.c | 2 +-
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index 3b56db02b762..1be5fd01f866 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -154,10 +154,6 @@ void __user *get_sigframe(struct ksignal *ksig, unsigned long sp,
 	oldsp = sigsp(oldsp, ksig);
 	newsp = (oldsp - frame_size) & ~0xFUL;
 
-	/* Check access */
-	if (!access_ok((void __user *)newsp, oldsp - newsp))
-		return NULL;
-
         return (void __user *)newsp;
 }
 
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 7b291707eb31..5a838188a181 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -770,7 +770,7 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	/* Put a Real Time Context onto stack */
 	rt_sf = get_sigframe(ksig, get_tm_stackpointer(tsk), sizeof(*rt_sf), 1);
 	addr = rt_sf;
-	if (unlikely(rt_sf == NULL))
+	if (!access_ok(rt_sf, sizeof(*rt_sf)))
 		goto badframe;
 
 	/* Put the siginfo & fill in most of the ucontext */
@@ -1231,7 +1231,7 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 
 	/* Set up Signal Frame */
 	frame = get_sigframe(ksig, get_tm_stackpointer(tsk), sizeof(*frame), 1);
-	if (unlikely(frame == NULL))
+	if (!access_ok(frame, sizeof(*frame)))
 		goto badframe;
 	sc = (struct sigcontext __user *) &frame->sctx;
 
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index bfc939360bad..ec259a0efe24 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -825,7 +825,7 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	BUG_ON(tsk != current);
 
 	frame = get_sigframe(ksig, get_tm_stackpointer(tsk), sizeof(*frame), 0);
-	if (unlikely(frame == NULL))
+	if (!access_ok(frame, sizeof(*frame)))
 		goto badframe;
 
 	err |= __put_user(&frame->info, &frame->pinfo);
-- 
2.25.0

