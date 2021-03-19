Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E01D341B2B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 12:10:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F21Q92HLpz3c9t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 22:10:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F21Lc62Cpz3c0G
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 22:07:03 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F21LX1c91z9tx8s;
 Fri, 19 Mar 2021 12:07:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5BZWUwXysFnB; Fri, 19 Mar 2021 12:07:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F21LW6k02z9tx94;
 Fri, 19 Mar 2021 12:06:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 16F4B8B972;
 Fri, 19 Mar 2021 12:07:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Lg4zbuWVj8vk; Fri, 19 Mar 2021 12:07:01 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 449998B975;
 Fri, 19 Mar 2021 12:07:00 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 06A95675FB; Fri, 19 Mar 2021 11:07:00 +0000 (UTC)
Message-Id: <638fa99530beb29f82f94370057d110e91272acc.1616151715.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616151715.git.christophe.leroy@csgroup.eu>
References: <cover.1616151715.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 10/10] powerpc/signal32: Simplify logging in sigreturn()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 cmr@codefail.de
Date: Fri, 19 Mar 2021 11:07:00 +0000 (UTC)
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

Same spirit as commit debf122c777f ("powerpc/signal32: Simplify logging
in handle_rt_signal32()"), remove this intermediate 'addr' local var.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 592b889e3836..5be267b3a13e 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -1352,7 +1352,6 @@ SYSCALL_DEFINE0(sigreturn)
 	struct sigcontext __user *sc;
 	struct sigcontext sigctx;
 	struct mcontext __user *sr;
-	void __user *addr;
 	sigset_t set;
 	struct mcontext __user *mcp;
 	struct mcontext __user *tm_mcp = NULL;
@@ -1363,7 +1362,6 @@ SYSCALL_DEFINE0(sigreturn)
 
 	sf = (struct sigframe __user *)(regs->gpr[1] + __SIGNAL_FRAMESIZE);
 	sc = &sf->sctx;
-	addr = sc;
 	if (copy_from_user(&sigctx, sc, sizeof(sigctx)))
 		goto badframe;
 
@@ -1392,16 +1390,19 @@ SYSCALL_DEFINE0(sigreturn)
 			goto badframe;
 	} else {
 		sr = (struct mcontext __user *)from_user_ptr(sigctx.regs);
-		addr = sr;
-		if (restore_user_regs(regs, sr, 1))
-			goto badframe;
+		if (restore_user_regs(regs, sr, 1)) {
+			signal_fault(current, regs, "sys_sigreturn", sr);
+
+			force_sig(SIGSEGV);
+			return 0;
+		}
 	}
 
 	set_thread_flag(TIF_RESTOREALL);
 	return 0;
 
 badframe:
-	signal_fault(current, regs, "sys_sigreturn", addr);
+	signal_fault(current, regs, "sys_sigreturn", sc);
 
 	force_sig(SIGSEGV);
 	return 0;
-- 
2.25.0

