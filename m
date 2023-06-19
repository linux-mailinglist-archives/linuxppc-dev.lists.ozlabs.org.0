Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABEE735182
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 12:07:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HCUqb8Gr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql56x2bszz3dJ0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 20:07:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HCUqb8Gr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql4pM0kjGz30f0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 19:53:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7143F602E0;
	Mon, 19 Jun 2023 09:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424ECC433C8;
	Mon, 19 Jun 2023 09:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687168408;
	bh=fiYOSGx/yX+rBoVWfDjzvuQpt+N/h7M6dfetR+JOhWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HCUqb8GrgIDA9dG2ZUhBvnsrKrltO+YCP5Nj7AFKGAZxolXAhJKoGjNjW16oohjob
	 00bVBx/H+hkc+mzK6+6L7VZrs67nOZMvB05s2mGdYT+Mz5hTkHTNL99aeLXe10MO9g
	 73FlAdsniSmO0mxs17MxYkkVlomgCImHlcdjNGMfaLAlHvIyLU2ODfH7p0kuRpyFG0
	 z+04JLXZuhiV9jWi3xnL50VxqwPEhBG3kSlbUmQ/Yyr+J02J/apcp5cAp2RTwtvM8I
	 q07Uf4A8UOw1H38bd/oFk3uJ9jMwCoHK2I0GAMGnWFh51533TFSgpgf/+m3c2mCK25
	 0ugLcHd/avGBA==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 04/17] powerpc/ftrace: Simplify function_graph support in ftrace.c
Date: Mon, 19 Jun 2023 15:17:22 +0530
Message-Id: <4dc92c4b1ed444dc62b748ae7327acdb9e096864.1687166935.git.naveen@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687166935.git.naveen@kernel.org>
References: <cover.1687166935.git.naveen@kernel.org>
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
Cc: Steven Rostedt <rostedt@goodmis.org>
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

