Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BA968C64D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 19:58:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9bBw4k6jz3f5H
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 05:58:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r90dwivM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r90dwivM;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9b5x6jFlz3cMH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 05:54:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 32D6660FBE;
	Mon,  6 Feb 2023 18:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7380BC433A7;
	Mon,  6 Feb 2023 18:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675709665;
	bh=yFCLSff5g9N73PTfFhfjF2I4SmvWiHPutCEghVmqaBo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r90dwivMgVFqoYHNFVREIv9Jkb1GQVKaSe2bO1AeJxXv/d5Gp/fF6NL0DjU+2CZCa
	 yZCbrsLjOOGdBZtpnYrbAGytYrPo1ho+oPo648kUTdKe7qC3Hr1bB6b3paNE8XxQZf
	 3NYx1PAhjLQzlL28Uc90T0bDQw+cxZtGHgBAg/IqqQUMMAnM5TavexFJBI7AcwiwMq
	 DeEuB3sscr/QfzVaPaCrO0Mu8Ux2ZpR6orZWhDAIhSOZai8fhj/5KLPXdHrnPnFhE4
	 HK7T5xsW/Rmbwqra243mkKq27Ebp0hxn3GP8QMpCTlacvAUNrBS/G53mU7qezpyTOu
	 tu5YdLxntbF+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64366C63797;
	Mon,  6 Feb 2023 18:54:25 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Feb 2023 12:54:24 -0600
Subject: [PATCH v2 08/19] powerpc/rtas: strengthen do_enter_rtas() type
 safety, drop inline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v2-8-9aa6bd058063@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675709663; l=2269;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=9Yr7i29cxHzbcLM+tqcLfVMpwD3tr631VIrfNoGrBVc=;
 b=gAkncFUQ10QFX/TaZq6iO+uPxafXhJnsIZwTuQzbKiFVzQmVBN5XEuvdksXYj8RTANXMXfNfK
 vcSXNWvZ5HhB6fCc6IRcgJCKbTUsfbjkSI+pq8WnEnrr8VOX07liAUL
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=6daubz/ymoaMF+8voz7UHwnhluEsmDZuqygIIMWpQQY=
X-Endpoint-Received:  by B4 Submission Endpoint for nathanl@linux.ibm.com/20230206 with auth_id=27
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Make do_enter_rtas() take a pointer to struct rtas_args and do the
__pa() conversion in one place instead of leaving it to callers. This
also makes it possible to introduce enter/exit tracepoints that access
the rtas_args struct fields.

There's no apparent reason to force inlining of do_enter_rtas()
either, and it seems to bloat the code a bit. Let the compiler decide.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/rtas.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 2804382c74b1..52c1ed7869b8 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -523,7 +523,7 @@ static const struct rtas_function *rtas_token_to_function(s32 token)
 /* This is here deliberately so it's only used in this file */
 void enter_rtas(unsigned long);
 
-static inline void do_enter_rtas(unsigned long args)
+static void do_enter_rtas(struct rtas_args *args)
 {
 	unsigned long msr;
 
@@ -538,7 +538,7 @@ static inline void do_enter_rtas(unsigned long args)
 
 	hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
 
-	enter_rtas(args);
+	enter_rtas(__pa(args));
 
 	srr_regs_clobbered(); /* rtas uses SRRs, invalidate */
 }
@@ -892,7 +892,7 @@ static char *__fetch_rtas_last_error(char *altbuf)
 	save_args = rtas_args;
 	rtas_args = err_args;
 
-	do_enter_rtas(__pa(&rtas_args));
+	do_enter_rtas(&rtas_args);
 
 	err_args = rtas_args;
 	rtas_args = save_args;
@@ -939,7 +939,7 @@ va_rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
 	for (i = 0; i < nret; ++i)
 		args->rets[i] = 0;
 
-	do_enter_rtas(__pa(args));
+	do_enter_rtas(args);
 }
 
 void rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret, ...)
@@ -1756,7 +1756,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	raw_spin_lock_irqsave(&rtas_lock, flags);
 
 	rtas_args = args;
-	do_enter_rtas(__pa(&rtas_args));
+	do_enter_rtas(&rtas_args);
 	args = rtas_args;
 
 	/* A -1 return code indicates that the last command couldn't

-- 
2.39.1

