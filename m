Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 213726925DC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:57:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD2zK0BjFz3fj1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 05:57:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J//7Ym2e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J//7Ym2e;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD2f33SCyz3f53
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 05:42:19 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 55E9161E96;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 275A0C4339C;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676054528;
	bh=bV/qfYe0kY3jos3dy7WCOSTQMqlBr1WqULAOFf+akrg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J//7Ym2eF5xvsk2Rp7gTllkVKxPEkjFMPewVy+bFmP2EfOPNHpaFQM2S1tnIwVtJL
	 gk5/XkpHYbvrDkZxNULq7V9xxaKHzXiforKTnQDOG+vnic4V+Nmryt/Zdr7CFoxujK
	 d+1iAybZgnjXlPg07MY2lt+lplYR3Z/49EgsarpLmkBWEx7tWidU+EkxRa+Qc0Ul5P
	 PV5OE983mxn1Sez0r/Y+HhGAYOhSt1ZbBo1SWD2igBjm7+md9YzDhjumCt3i/ctr0M
	 07BN3P9hmgJwyQthH1ToHOUvTkWWtDPvn9RKZZ3PMz4+ws5JPGfe8XUqB/UCm3ikM0
	 BF3BFpsoxHdWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17518C636CD;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 10 Feb 2023 12:41:57 -0600
Subject: [PATCH v3 09/20] powerpc/rtas: strengthen do_enter_rtas() type
 safety, drop inline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v3-9-26929c8cce78@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676054526; l=2269;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=d4FGezxSoWRmh1ICl0HR7WdiQaBhV+CR2OanO0P5nbg=;
 b=qNLDmfDOJ9zKOETTzA9O76tSyJBAv1b6eIgJSd1UdzvbINVRq8xhPcDYwgojuMgdKgje8XDUw
 dOBy146vrTADNGd9uX91AzNnsT/EvmZmcnNJ39Fp/+1wxrXp+w4Cj+v
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
index 3c7151f4f2ba..d2622b997b68 100644
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
@@ -1757,7 +1757,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	raw_spin_lock_irqsave(&rtas_lock, flags);
 
 	rtas_args = args;
-	do_enter_rtas(__pa(&rtas_args));
+	do_enter_rtas(&rtas_args);
 	args = rtas_args;
 
 	/* A -1 return code indicates that the last command couldn't

-- 
2.39.1

