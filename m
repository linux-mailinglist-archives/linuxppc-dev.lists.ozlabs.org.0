Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74001341B26
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 12:09:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F21P335BZz3cBT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 22:09:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F21LZ3p6Gz3bwX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 22:07:02 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F21LS3Gsvz9tx90;
 Fri, 19 Mar 2021 12:06:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Sktnd3Ls0YAy; Fri, 19 Mar 2021 12:06:56 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F21LS2FDZz9tx8s;
 Fri, 19 Mar 2021 12:06:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E4BD8B972;
 Fri, 19 Mar 2021 12:06:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1Ee4UbpWPsNw; Fri, 19 Mar 2021 12:06:55 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 374518B976;
 Fri, 19 Mar 2021 12:06:55 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D4718675FB; Fri, 19 Mar 2021 11:06:54 +0000 (UTC)
Message-Id: <a4b48b2f0be1ef13fc8e57452b7f8350da28d521.1616151715.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616151715.git.christophe.leroy@csgroup.eu>
References: <cover.1616151715.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 05/10] powerpc/signal32: Remove ifdefery in middle of if/else
 in sigreturn()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 cmr@codefail.de
Date: Fri, 19 Mar 2021 11:06:54 +0000 (UTC)
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

In the same spirit as commit f1cf4f93de2f ("powerpc/signal32: Remove
ifdefery in middle of if/else")

MSR_TM_ACTIVE() is always defined and returns always 0 when
CONFIG_PPC_TRANSACTIONAL_MEM is not selected, so the awful
ifdefery in the middle of an if/else can be removed.

Make 'msr_hi' a 'long long' to avoid build failure on PPC32
due to the 32 bits left shift.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 3b78748d6d85..8dfe4fe77706 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -740,6 +740,12 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 
 	return 0;
 }
+#else
+static long restore_tm_user_regs(struct pt_regs *regs, struct mcontext __user *sr,
+				 struct mcontext __user *tm_sr)
+{
+	return 0;
+}
 #endif
 
 #ifdef CONFIG_PPC64
@@ -1317,10 +1323,9 @@ SYSCALL_DEFINE0(sigreturn)
 	struct mcontext __user *sr;
 	void __user *addr;
 	sigset_t set;
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	struct mcontext __user *mcp, *tm_mcp;
-	unsigned long msr_hi;
-#endif
+	struct mcontext __user *mcp;
+	struct mcontext __user *tm_mcp = NULL;
+	unsigned long long msr_hi = 0;
 
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
@@ -1343,19 +1348,18 @@ SYSCALL_DEFINE0(sigreturn)
 #endif
 	set_current_blocked(&set);
 
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	mcp = (struct mcontext __user *)&sf->mctx;
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	tm_mcp = (struct mcontext __user *)&sf->mctx_transact;
 	if (__get_user(msr_hi, &tm_mcp->mc_gregs[PT_MSR]))
 		goto badframe;
+#endif
 	if (MSR_TM_ACTIVE(msr_hi<<32)) {
 		if (!cpu_has_feature(CPU_FTR_TM))
 			goto badframe;
 		if (restore_tm_user_regs(regs, mcp, tm_mcp))
 			goto badframe;
-	} else
-#endif
-	{
+	} else {
 		sr = (struct mcontext __user *)from_user_ptr(sigctx.regs);
 		addr = sr;
 		if (!access_ok(sr, sizeof(*sr))
-- 
2.25.0

