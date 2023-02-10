Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8636925D2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:53:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD2v46ZVbz3fF8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 05:53:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V9Trf6NO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V9Trf6NO;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD2dy0d3zz3f3g
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 05:42:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6C2C461E97;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D91FC4339B;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676054528;
	bh=8IXEGpEjPQ1vXHEvlx0DgyUnV+GQRPOe7QWWaTmzBTA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V9Trf6NOB4Elib20WcMaaekLGrKqmyOkCTJlkg0oVh7s2HLTuumBD7kw7AvT9J9XH
	 TI1Lq/jW8DuBZ7IvPZu8U/eGhuKqzHRsSR2lofqWbbTemKnD8nZ0lYS6lZC7MnVUiB
	 i8f17LqP4T8SRkpYFEZ5+ZDih8EpMudKZfR2Xpl60vdn/H+BBgOLJAGwloB9rgE37C
	 tJhhCvtbXH8r2W7o8+nltuZOYa6LXWcLjft6liT047vVMrdcyUM2gSd90Q7IveEf2X
	 rPcIKCzaEbKzrT99BhP46LBJhusJYGJg6KcFYEZ6GaYoakC5knejwJEsUgWn8GTBtw
	 sj7Zud0HtyaKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB3AC64EC7;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 10 Feb 2023 12:41:59 -0600
Subject: [PATCH v3 11/20] powerpc/rtas: add tracepoints around RTAS entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v3-11-26929c8cce78@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676054526; l=3071;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=BvMe3Qw7hO+GLrn7CGHTzncGQuQa4AcnO/gpTip/CoQ=;
 b=tzzwroZRivAF6ggUxB1raue6PVkvjP42EVDVnuhuHr2cF44PyKCtH4Gp3bUL4b3cZr4VIDSex
 e78NMwmiwWyBjJqSGeSBKPgUhVkeZQ00aqZ23+brr+WC578TsB0dgSi
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
index d2622b997b68..a6d0c46b4512 100644
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

