Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFA57266AB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 19:03:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbtvn69p4z3flB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 03:03:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JVZ8W6/p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JVZ8W6/p;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbtrB5HPlz3dwh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 03:00:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E79036176E;
	Wed,  7 Jun 2023 17:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D6BC433D2;
	Wed,  7 Jun 2023 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686157208;
	bh=OAmvO1ppsDvhykqzcuIKnvU8LaSIgpQXeRRc2imFhdo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JVZ8W6/pnAR5UPGnnFpePnu8VB0h2NR60Q3cyZxMs00A1zn7r7iDHQZUM2k2MfPqz
	 c+jY+1ADK1+PBAUu7TURhUZA80ye3ZgTGb+qC1GgStfkTwv4Z3GTTuIRwgNmDFPc7z
	 zZj3oyMpXdWd48euV1Lc0eKSG9ZfRnAr4nPV0kk8RZYetIyRLb6NM+JQfJjiu5LTsz
	 7uP5Gq4x4gEok9Owjq6ErzgUOW3219BXd0UHWjVEu9De6aNpqia2s1iC8cwLo6uil3
	 dCUCyKoTwbP3GBR6/8IbGuvK0PD+hQOwTNecbS1BV/8nThjzjWZ6dti4xH7M2+g6BO
	 O1i7ua5vmMvrA==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 13/15] powerpc/ftrace: Replace use of ftrace_call_replace() with ftrace_create_branch_inst()
Date: Wed,  7 Jun 2023 22:25:28 +0530
Message-Id: <8ac06ab617ef7ddfff0b2425e8c670a73b6cb49e.1686151854.git.naveen@kernel.org>
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

ftrace_create_branch_inst() is clearer about its intent than
ftrace_call_replace().

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/ftrace.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index c810343d1a6cd6..4375ef71609c0a 100644
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

