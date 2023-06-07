Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF727266B4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 19:06:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbtzs2s8yz3f0M
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 03:06:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eV0rC/Lt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eV0rC/Lt;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbtrX6BTdz3dtF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 03:00:28 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3BC6660A49;
	Wed,  7 Jun 2023 17:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26687C433EF;
	Wed,  7 Jun 2023 17:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686157226;
	bh=fiYOSGx/yX+rBoVWfDjzvuQpt+N/h7M6dfetR+JOhWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eV0rC/LtetQix5E41W2bB4ApGRWYeHzTUGdmxJZQyb5+zfpp+mfv6wdWbRqzGWtYb
	 r2nIEXuUioRwQ52+3AcFYsm8+zBw4hYBcrJkaO3RsOYdyPmzjtpKqexC7yQ0gv74VN
	 RBPTXbvvh0/AQfq2uCK8C8GLtPhspW8PZOJZiZksxnVMsOIEeloHjoVDD6qVj8+aD2
	 gfLOFG9bZnFfhhU9QKcN85NMtC7lZXTu3coXDQDRGCd5VkIoTzqeunzPeFbxTEKo6J
	 Ewta4dtZOI0UmVGUqUW5YvvDbbP75usi/sUS2vhhB8vBbB2JI2Ol6OjVu93NNlvmfg
	 5qmTf4wF6um3A==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 03/15] powerpc/ftrace: Simplify function_graph support in ftrace.c
Date: Wed,  7 Jun 2023 22:25:18 +0530
Message-Id: <27c83dad7d0f83f6b309602da45b30cf2e8db2ce.1686151854.git.naveen@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686151854.git.naveen@kernel.org>
References: <cover.1686151854.git.naveen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since we now support DYNAMIC_FTRACE_WITH_ARGS across ppc32 and ppc64
ELFv2, we can simplify function_graph tracer support code in ftrace.c

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/ftrace.c | 64 ++++--------------------------
 1 file changed, 7 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 81a121b56c4d7f..f117124c30325f 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -790,44 +790,10 @@ int __init ftrace_dyn_arch_init(void)
 #endif
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
-
-extern void ftrace_graph_call(void);
-extern void ftrace_graph_stub(void);
-
-static int ftrace_modify_ftrace_graph_caller(bool enable)
+void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
+		       struct ftrace_ops *op, struct ftrace_regs *fregs)
 {
-	unsigned long ip = (unsigned long)(&ftrace_graph_call);
-	unsigned long addr = (unsigned long)(&ftrace_graph_caller);
-	unsigned long stub = (unsigned long)(&ftrace_graph_stub);
-	ppc_inst_t old, new;
-
-	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_ARGS))
-		return 0;
-
-	old = ftrace_call_replace(ip, enable ? stub : addr, 0);
-	new = ftrace_call_replace(ip, enable ? addr : stub, 0);
-
-	return ftrace_modify_code(ip, old, new);
-}
-
-int ftrace_enable_ftrace_graph_caller(void)
-{
-	return ftrace_modify_ftrace_graph_caller(true);
-}
-
-int ftrace_disable_ftrace_graph_caller(void)
-{
-	return ftrace_modify_ftrace_graph_caller(false);
-}
-
-/*
- * Hook the return address and push it in the stack of return addrs
- * in current thread info. Return the address we want to divert to.
- */
-static unsigned long
-__prepare_ftrace_return(unsigned long parent, unsigned long ip, unsigned long sp)
-{
-	unsigned long return_hooker;
+	unsigned long sp = fregs->regs.gpr[1];
 	int bit;
 
 	if (unlikely(ftrace_graph_is_dead()))
@@ -836,31 +802,15 @@ __prepare_ftrace_return(unsigned long parent, unsigned long ip, unsigned long sp
 	if (unlikely(atomic_read(&current->tracing_graph_pause)))
 		goto out;
 
-	bit = ftrace_test_recursion_trylock(ip, parent);
+	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		goto out;
 
-	return_hooker = ppc_function_entry(return_to_handler);
-
-	if (!function_graph_enter(parent, ip, 0, (unsigned long *)sp))
-		parent = return_hooker;
+	if (!function_graph_enter(parent_ip, ip, 0, (unsigned long *)sp))
+		parent_ip = ppc_function_entry(return_to_handler);
 
 	ftrace_test_recursion_unlock(bit);
 out:
-	return parent;
+	fregs->regs.link = parent_ip;
 }
-
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
-void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
-		       struct ftrace_ops *op, struct ftrace_regs *fregs)
-{
-	fregs->regs.link = __prepare_ftrace_return(parent_ip, ip, fregs->regs.gpr[1]);
-}
-#else
-unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
-				    unsigned long sp)
-{
-	return __prepare_ftrace_return(parent, ip, sp);
-}
-#endif
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
-- 
2.40.1

