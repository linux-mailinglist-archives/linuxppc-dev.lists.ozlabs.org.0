Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D1C341B25
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 12:08:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F21Nh598Cz3dHZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 22:08:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F21LZ3lZRz3bwW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 22:07:02 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F21LV1R6Dz9tx92;
 Fri, 19 Mar 2021 12:06:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6jWfJQRsBY2E; Fri, 19 Mar 2021 12:06:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F21LV0gp5z9tx91;
 Fri, 19 Mar 2021 12:06:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3F8748B975;
 Fri, 19 Mar 2021 12:06:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id bAj5KcmCNjIk; Fri, 19 Mar 2021 12:06:58 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 984DD8B974;
 Fri, 19 Mar 2021 12:06:56 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DBFD0675FB; Fri, 19 Mar 2021 11:06:55 +0000 (UTC)
Message-Id: <c106eb2f37c3040f1fd38b40e50c670feb7cb835.1616151715.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616151715.git.christophe.leroy@csgroup.eu>
References: <cover.1616151715.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 06/10] powerpc/signal32: Perform access_ok() inside
 restore_user_regs()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 cmr@codefail.de
Date: Fri, 19 Mar 2021 11:06:55 +0000 (UTC)
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

In preparation of using user_access_begin/end in restore_user_regs(),
move the access_ok() inside the function.

It makes no difference as the behaviour on a failed access_ok() is
the same as on failed restore_user_regs().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 8dfe4fe77706..e2b1d2a0abad 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -492,6 +492,8 @@ static long restore_user_regs(struct pt_regs *regs,
 	int i;
 #endif
 
+	if (!access_ok(sr, sizeof(*sr)))
+		return 1;
 	/*
 	 * restore general registers but not including MSR or SOFTE. Also
 	 * take care of keeping r2 (TLS) intact if not a signal
@@ -963,13 +965,10 @@ static int do_setcontext(struct ucontext __user *ucp, struct pt_regs *regs, int
 		if (__get_user(cmcp, &ucp->uc_regs))
 			return -EFAULT;
 		mcp = (struct mcontext __user *)(u64)cmcp;
-		/* no need to check access_ok(mcp), since mcp < 4GB */
 	}
 #else
 	if (__get_user(mcp, &ucp->uc_regs))
 		return -EFAULT;
-	if (!access_ok(mcp, sizeof(*mcp)))
-		return -EFAULT;
 #endif
 	set_current_blocked(&set);
 	if (restore_user_regs(regs, mcp, sig))
@@ -1362,8 +1361,7 @@ SYSCALL_DEFINE0(sigreturn)
 	} else {
 		sr = (struct mcontext __user *)from_user_ptr(sigctx.regs);
 		addr = sr;
-		if (!access_ok(sr, sizeof(*sr))
-		    || restore_user_regs(regs, sr, 1))
+		if (restore_user_regs(regs, sr, 1))
 			goto badframe;
 	}
 
-- 
2.25.0

