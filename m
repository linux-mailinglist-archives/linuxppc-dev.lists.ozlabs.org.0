Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D51369412
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 15:52:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRbMN59Ykz30Dy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 23:52:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRbM41JDxz2xYd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 23:52:13 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FRbLx0RLgz9ttC6;
 Fri, 23 Apr 2021 15:52:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id nksP2VPKskja; Fri, 23 Apr 2021 15:52:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FRbLw6llJz9ttC5;
 Fri, 23 Apr 2021 15:52:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E9C678B865;
 Fri, 23 Apr 2021 15:52:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id iidl2mxlih71; Fri, 23 Apr 2021 15:52:10 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B435C8B765;
 Fri, 23 Apr 2021 15:52:10 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 763D96397D; Fri, 23 Apr 2021 13:52:10 +0000 (UTC)
Message-Id: <a29aadc54c93bcbf069a83615fa102ca0f59c3ae.1619185912.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/signal32: Fix erroneous SIGSEGV on RT signal return
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 23 Apr 2021 13:52:10 +0000 (UTC)
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

Return of user_read_access_begin() is tested the wrong way,
leading to a SIGSEGV when the user address is valid and likely
an Oops when the user address is bad.

Fix the test.

Fixes: 887f3ceb51cd ("powerpc/signal32: Convert do_setcontext[_tm]() to user access block")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index fc41c58f0cbb..8f05ed0da292 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -967,7 +967,7 @@ static int do_setcontext(struct ucontext __user *ucp, struct pt_regs *regs, int
 	sigset_t set;
 	struct mcontext __user *mcp;
 
-	if (user_read_access_begin(ucp, sizeof(*ucp)))
+	if (!user_read_access_begin(ucp, sizeof(*ucp)))
 		return -EFAULT;
 
 	unsafe_get_sigset_t(&set, &ucp->uc_sigmask, failed);
@@ -1005,7 +1005,7 @@ static int do_setcontext_tm(struct ucontext __user *ucp,
 	u32 cmcp;
 	u32 tm_cmcp;
 
-	if (user_read_access_begin(ucp, sizeof(*ucp)))
+	if (!user_read_access_begin(ucp, sizeof(*ucp)))
 		return -EFAULT;
 
 	unsafe_get_sigset_t(&set, &ucp->uc_sigmask, failed);
-- 
2.25.0

