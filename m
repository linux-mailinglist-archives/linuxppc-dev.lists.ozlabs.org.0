Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C002248D76
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 19:48:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWJKf6JBrzDqcn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 03:48:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWHhb6YmwzDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 03:19:27 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWHhW1MmJz9vCxp;
 Tue, 18 Aug 2020 19:19:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lB6oREtWwNEA; Tue, 18 Aug 2020 19:19:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWHhW0c0Jz9vCxg;
 Tue, 18 Aug 2020 19:19:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E37548B7EC;
 Tue, 18 Aug 2020 19:19:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id p-F82a-CvrwP; Tue, 18 Aug 2020 19:19:24 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B237C8B7D7;
 Tue, 18 Aug 2020 19:19:24 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 912D865CF4; Tue, 18 Aug 2020 17:19:24 +0000 (UTC)
Message-Id: <691895bd31fee89a2d8370befd66ad4eff5b63f2.1597770847.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597770847.git.christophe.leroy@csgroup.eu>
References: <cover.1597770847.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 12/25] powerpc/signal32: Simplify logging in
 handle_rt_signal32()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 18 Aug 2020 17:19:24 +0000 (UTC)
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

If something is bad in the frame, there is no point in
knowing which part of the frame exactly is wrong as it
got allocated as a single block.

Always print the root address of the frame in case of
failed user access, just like handle_signal32().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index deb729c8b79d..44a46911ff98 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -754,7 +754,6 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	struct rt_sigframe __user *rt_sf;
 	struct mcontext __user *frame;
 	struct mcontext __user *tm_frame = NULL;
-	void __user *addr;
 	unsigned long newsp = 0;
 	int sigret;
 	unsigned long tramp;
@@ -767,7 +766,6 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	/* Set up Signal Frame */
 	/* Put a Real Time Context onto stack */
 	rt_sf = get_sigframe(ksig, tsk, sizeof(*rt_sf), 1);
-	addr = rt_sf;
 	if (!access_ok(rt_sf, sizeof(*rt_sf)))
 		goto badframe;
 
@@ -782,7 +780,6 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 
 	/* Save user registers on the stack */
 	frame = &rt_sf->uc.uc_mcontext;
-	addr = frame;
 	if (vdso32_rt_sigtramp && tsk->mm->context.vdso_base) {
 		sigret = 0;
 		tramp = tsk->mm->context.vdso_base + vdso32_rt_sigtramp;
@@ -818,7 +815,6 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 
 	/* create a stack frame for the caller of the handler */
 	newsp = ((unsigned long)rt_sf) - (__SIGNAL_FRAMESIZE + 16);
-	addr = (void __user *)regs->gpr[1];
 	if (put_user(regs->gpr[1], (u32 __user *)newsp))
 		goto badframe;
 
@@ -835,7 +831,7 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	return 0;
 
 badframe:
-	signal_fault(tsk, regs, "handle_rt_signal32", addr);
+	signal_fault(tsk, regs, "handle_rt_signal32", rt_sf);
 
 	return 1;
 }
-- 
2.25.0

