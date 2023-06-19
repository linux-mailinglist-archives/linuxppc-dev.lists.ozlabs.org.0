Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C09735102
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 11:56:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fpsi3CYW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql4sg30tmz3byl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 19:56:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fpsi3CYW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql4n32spcz30f6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 19:52:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BAF1E602E0;
	Mon, 19 Jun 2023 09:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87343C433C8;
	Mon, 19 Jun 2023 09:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687168341;
	bh=fvNzA4Q938jsAQnFgUt78HMwwQ810FzVX7BIJSSbuFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fpsi3CYW+G70ajSQFtErV1h/yNfLRqjCbqErJA4Tk+z8P9FHKA7ugTKicQRN5x4E7
	 876nv4gi1Z8zZeghWcnjOG+nEc9zJRmaXmoqnG8TKO/5JfqpLwL4JMI8bMr1m7Np1o
	 KsPVVC3lLQuPWRx5aeMuI0t6dgYGVr2glTKdMX+vw8SQDN9lVhkrYlYuvWfnsipBti
	 RjOmM7uw/ivQuZ0SaEDv67lkYaHtCCJv++/jMOxHqEKUHiH+vUHvNRZFACjshiEtuY
	 g2Btz4dIkLplGsAg8fWCq4FjkUSYB2iw3mChdkidoFWIa7Of9Fhgw4ujAlh3BUQaiH
	 CUes9jsaRareQ==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 14/17] powerpc/ftrace: Replace use of ftrace_call_replace() with ftrace_create_branch_inst()
Date: Mon, 19 Jun 2023 15:17:32 +0530
Message-Id: <953513b88fa922ba7a66d772dc1310710efe9177.1687166935.git.naveen@kernel.org>
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

ftrace_create_branch_inst() is clearer about its intent than
ftrace_call_replace().

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/ftrace.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index c37e22c6c26521..422dd760fbe013 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -41,19 +41,6 @@ static ppc_inst_t ftrace_create_branch_inst(unsigned long ip, unsigned long addr
 	return op;
 }
 
-static ppc_inst_t
-ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
-{
-	ppc_inst_t op;
-
-	addr = ppc_function_entry((void *)addr);
-
-	/* if (link) set op to 'bl' else 'b' */
-	create_branch(&op, (u32 *)ip, addr, link ? BRANCH_SET_LINK : 0);
-
-	return op;
-}
-
 static inline int ftrace_read_inst(unsigned long ip, ppc_inst_t *op)
 {
 	if (copy_inst_from_kernel_nofault(op, (void *)ip)) {
@@ -275,14 +262,14 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	int ret;
 
 	old = ppc_inst_read((u32 *)&ftrace_call);
-	new = ftrace_call_replace(ip, (unsigned long)func, 1);
+	new = ftrace_create_branch_inst(ip, ppc_function_entry(func), 1);
 	ret = ftrace_modify_code(ip, old, new);
 
 	/* Also update the regs callback function */
 	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) && !ret) {
 		ip = (unsigned long)(&ftrace_regs_call);
 		old = ppc_inst_read((u32 *)&ftrace_regs_call);
-		new = ftrace_call_replace(ip, (unsigned long)func, 1);
+		new = ftrace_create_branch_inst(ip, ppc_function_entry(func), 1);
 		ret = ftrace_modify_code(ip, old, new);
 	}
 
-- 
2.40.1

