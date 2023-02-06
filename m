Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 571C568C663
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 20:04:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9bL10x5hz3fbt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 06:04:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SpSFkI+A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SpSFkI+A;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9b5z4vj8z3cMn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 05:54:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4AC1460FE1;
	Mon,  6 Feb 2023 18:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BAD5C433AC;
	Mon,  6 Feb 2023 18:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675709665;
	bh=IlLHZk5f5J2l4/P4Yaw17Kfwk4GTaWxSkG9RzGkL5Ew=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SpSFkI+AJn143F9NF7x/Gq4MTTv4x65N2zdAqvSpYlG3WDvADbdDD6qgsJO+Ra2yK
	 uwKyNINNpXKb4bhy2M+ejMalGDO5rlVqCsoryKQg9LCstv2xys0Ip9nxFyy33kBdiI
	 tyJydBCln0BDfI321xkTVH1w0wt0xjKItSCs+qoPqEvxmSL7aghp7phSUXwItpD3js
	 2+ZEDLC9Ccb4MkteaMVMnlE5VwW6Kh6GXNtMgfhXL0WR/dtmoey4AZzHi5vhp+95re
	 f8Ej+0pyjcA8maPTmD+8x1d464EytGlNokS7fo2XNtiLiMvp3MkuSjC7sbXTXz39UC
	 QfuafiqEtCk9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B580C636D3;
	Mon,  6 Feb 2023 18:54:25 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Feb 2023 12:54:26 -0600
Subject: [PATCH v2 10/19] powerpc/rtas: add tracepoints around RTAS entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v2-10-9aa6bd058063@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675709663; l=3071;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=5scexNa7Ih0QI44Wd77pHpg0KZ6geAmSW9N53TuzSCo=;
 b=bD6Liq6BeAwLuDHqmgYwXXGQ9Mq0N/VCpOhCWGPLrT5V1kjV03dxOEA/HjG9yF1b/LEbfH/rz
 nSMJMbagFa5D3Y8aNqcffMCwv93X2ki9slfD78Ug2iWnGoafm0nYwFB
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

Decompose the RTAS entry C code into tracing and non-tracing variants,
calling the just-added tracepoints in the tracing-enabled path. Skip
tracing in contexts known to be unsafe (real mode, CPU offline).

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 59 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 53 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 52c1ed7869b8..3290f25b9b34 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -38,6 +38,7 @@
 #include <asm/page.h>
 #include <asm/rtas.h>
 #include <asm/time.h>
+#include <asm/trace.h>
 #include <asm/udbg.h>
 
 struct rtas_filter {
@@ -523,24 +524,70 @@ static const struct rtas_function *rtas_token_to_function(s32 token)
 /* This is here deliberately so it's only used in this file */
 void enter_rtas(unsigned long);
 
+static void __do_enter_rtas(struct rtas_args *args)
+{
+	enter_rtas(__pa(args));
+	srr_regs_clobbered(); /* rtas uses SRRs, invalidate */
+}
+
+static void __do_enter_rtas_trace(struct rtas_args *args)
+{
+	const char *name = NULL;
+	/*
+	 * If the tracepoints that consume the function name aren't
+	 * active, avoid the lookup.
+	 */
+	if ((trace_rtas_input_enabled() || trace_rtas_output_enabled())) {
+		const s32 token = be32_to_cpu(args->token);
+		const struct rtas_function *func = rtas_token_to_function(token);
+
+		name = func->name;
+	}
+
+	trace_rtas_input(args, name);
+	trace_rtas_ll_entry(args);
+
+	__do_enter_rtas(args);
+
+	trace_rtas_ll_exit(args);
+	trace_rtas_output(args, name);
+}
+
 static void do_enter_rtas(struct rtas_args *args)
 {
-	unsigned long msr;
-
+	const unsigned long msr = mfmsr();
+	/*
+	 * Situations where we want to skip any active tracepoints for
+	 * safety reasons:
+	 *
+	 * 1. The last code executed on an offline CPU as it stops,
+	 *    i.e. we're about to call stop-self. The tracepoints'
+	 *    function name lookup uses xarray, which uses RCU, which
+	 *    isn't valid to call on an offline CPU.  Any events
+	 *    emitted on an offline CPU will be discarded anyway.
+	 *
+	 * 2. In real mode, as when invoking ibm,nmi-interlock from
+	 *    the pseries MCE handler. We cannot count on trace
+	 *    buffers or the entries in rtas_token_to_function_xarray
+	 *    to be contained in the RMO.
+	 */
+	const unsigned long mask = MSR_IR | MSR_DR;
+	const bool can_trace = likely(cpu_online(raw_smp_processor_id()) &&
+				      (msr & mask) == mask);
 	/*
 	 * Make sure MSR[RI] is currently enabled as it will be forced later
 	 * in enter_rtas.
 	 */
-	msr = mfmsr();
 	BUG_ON(!(msr & MSR_RI));
 
 	BUG_ON(!irqs_disabled());
 
 	hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
 
-	enter_rtas(__pa(args));
-
-	srr_regs_clobbered(); /* rtas uses SRRs, invalidate */
+	if (can_trace)
+		__do_enter_rtas_trace(args);
+	else
+		__do_enter_rtas(args);
 }
 
 struct rtas_t rtas;

-- 
2.39.1

