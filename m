Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BBD7266D1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 19:11:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbv4j2LjQz3gMM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 03:11:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ot2ME/2A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ot2ME/2A;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbts01l0Gz3f60
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 03:00:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 23EFF60B60;
	Wed,  7 Jun 2023 17:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1342EC433D2;
	Wed,  7 Jun 2023 17:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686157249;
	bh=jk9z1qfTbnJ4M50k9sUONn0cX2iepmGzBY8gg5oa7Ew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ot2ME/2AMYWLrdy9cJM4a76yEX5gC4d8TN7jo5VxfG7mEeWsMhb3BwyGJFlryg4dP
	 PvyFk9rfAuT86H4zNPvJMNlO6K6TUi51VK2Glul8dmGzOZubQEXtYUmLBNC3IxSwcm
	 vsHYewFrchMP0eUn/ekR3ZAyJJkCS6agXogJNuOa1ujxfGDEJ8T4T+NpwH30dOXVOT
	 Tj1lUmdkPiIdTjXuisDm3gXXF94XSoVyWYpv/okLtdwLBwUhh0K0w2OiCwO58eZBlY
	 VXfNwsuD9Qfp05PiklmCKrSuySYjtAuX4FbpVfCxyYCmWLPHkr3BA/zFKx5NGiYZz0
	 FGJgeG68nNh9g==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 08/15] powerpc/ftrace: Stop re-purposing linker generated long branches for ftrace
Date: Wed,  7 Jun 2023 22:25:23 +0530
Message-Id: <be2ee1086b7da11cfae84b6a04e1145a67942a19.1686151854.git.naveen@kernel.org>
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

Commit 67361cf8071286 ("powerpc/ftrace: Handle large kernel configs")
added ftrace support for ppc64 kernel images with a text section larger
than 32MB. The patch did two things:
1. Add stubs at the end of .text to branch into ftrace_[regs_]caller for
   functions that were out of branch range.
2. Re-purpose linker-generated long branches to _mcount to instead branch
   to ftrace_[regs_]caller.

Before that, we only supported kernel .text up to ~32MB. With the above,
we now support up to ~96MB:
- The first 32MB of kernel text can branch directly into
  ftrace_[regs_]caller since that symbol is usually at the beginning.
- The modified long_branch from (2) above is used by the next 32MB of
  kernel text.
- The next 32MB of kernel text can use the stub at the end of text to
  branch back to ftrace_[regs_]caller.

While re-purposing the long branch works in practice, it still restricts
ftrace to kernel text up to ~96MB. The stub at the end of kernel text
from (1) already enables us to extend ftrace support for kernel text
up to 64MB, which fulfils the original requirement. Further, once we
switch to -fpatchable-function-entry, there will not be a long branch
that we can use.

Stop re-purposing the linker-generated long branches for ftrace to
simplify the code. If there are good reasons to support ftrace on
kernels beyond 64MB, we can consider adding support by using
-fpatchable-function-entry.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/ftrace.c | 110 +++++------------------------
 1 file changed, 17 insertions(+), 93 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index ef4e49c2c37781..278bf8e52b6e89 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -28,13 +28,7 @@
 #include <asm/syscall.h>
 #include <asm/inst.h>
 
-/*
- * We generally only have a single long_branch tramp and at most 2 or 3 plt
- * tramps generated. But, we don't use the plt tramps currently. We also allot
- * 2 tramps after .text and .init.text. So, we only end up with around 3 usable
- * tramps in total. Set aside 8 just to be sure.
- */
-#define	NUM_FTRACE_TRAMPS	8
+#define	NUM_FTRACE_TRAMPS	2
 static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
 
 static ppc_inst_t
@@ -100,11 +94,6 @@ static int is_bl_op(ppc_inst_t op)
 	return (ppc_inst_val(op) & ~PPC_LI_MASK) == PPC_RAW_BL(0);
 }
 
-static int is_b_op(ppc_inst_t op)
-{
-	return (ppc_inst_val(op) & ~PPC_LI_MASK) == PPC_RAW_BRANCH(0);
-}
-
 static unsigned long find_bl_target(unsigned long ip, ppc_inst_t op)
 {
 	int offset;
@@ -227,11 +216,7 @@ static unsigned long find_ftrace_tramp(unsigned long ip)
 {
 	int i;
 
-	/*
-	 * We have the compiler generated long_branch tramps at the end
-	 * and we prefer those
-	 */
-	for (i = NUM_FTRACE_TRAMPS - 1; i >= 0; i--)
+	for (i = 0; i < NUM_FTRACE_TRAMPS; i++)
 		if (!ftrace_tramps[i])
 			continue;
 		else if (is_offset_in_branch_range(ftrace_tramps[i] - ip))
@@ -240,75 +225,6 @@ static unsigned long find_ftrace_tramp(unsigned long ip)
 	return 0;
 }
 
-static int add_ftrace_tramp(unsigned long tramp)
-{
-	int i;
-
-	for (i = 0; i < NUM_FTRACE_TRAMPS; i++)
-		if (!ftrace_tramps[i]) {
-			ftrace_tramps[i] = tramp;
-			return 0;
-		}
-
-	return -1;
-}
-
-/*
- * If this is a compiler generated long_branch trampoline (essentially, a
- * trampoline that has a branch to _mcount()), we re-write the branch to
- * instead go to ftrace_[regs_]caller() and note down the location of this
- * trampoline.
- */
-static int setup_mcount_compiler_tramp(unsigned long tramp)
-{
-	int i;
-	ppc_inst_t op;
-	unsigned long ptr;
-
-	/* Is this a known long jump tramp? */
-	for (i = 0; i < NUM_FTRACE_TRAMPS; i++)
-		if (ftrace_tramps[i] == tramp)
-			return 0;
-
-	/* New trampoline -- read where this goes */
-	if (copy_inst_from_kernel_nofault(&op, (void *)tramp)) {
-		pr_debug("Fetching opcode failed.\n");
-		return -1;
-	}
-
-	/* Is this a 24 bit branch? */
-	if (!is_b_op(op)) {
-		pr_debug("Trampoline is not a long branch tramp.\n");
-		return -1;
-	}
-
-	/* lets find where the pointer goes */
-	ptr = find_bl_target(tramp, op);
-
-	if (ptr != ppc_global_function_entry((void *)_mcount)) {
-		pr_debug("Trampoline target %p is not _mcount\n", (void *)ptr);
-		return -1;
-	}
-
-	/* Let's re-write the tramp to go to ftrace_[regs_]caller */
-	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
-		ptr = ppc_global_function_entry((void *)ftrace_regs_caller);
-	else
-		ptr = ppc_global_function_entry((void *)ftrace_caller);
-
-	if (patch_branch((u32 *)tramp, ptr, 0)) {
-		pr_debug("REL24 out of range!\n");
-		return -1;
-	}
-
-	if (add_ftrace_tramp(tramp)) {
-		pr_debug("No tramp locations left\n");
-		return -1;
-	}
-
-	return 0;
-}
-
 static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 {
 	unsigned long tramp, ip = rec->ip;
@@ -331,13 +247,10 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 
 	pr_devel("ip:%lx jumps to %lx", ip, tramp);
 
-	if (setup_mcount_compiler_tramp(tramp)) {
-		/* Are other trampolines reachable? */
-		if (!find_ftrace_tramp(ip)) {
-			pr_err("No ftrace trampolines reachable from %ps\n",
-					(void *)ip);
-			return -EINVAL;
-		}
+	/* Are ftrace trampolines reachable? */
+	if (!find_ftrace_tramp(ip)) {
+		pr_err("No ftrace trampolines reachable from %ps\n", (void *)ip);
+		return -EINVAL;
 	}
 
 	if (patch_instruction((u32 *)ip, ppc_inst(PPC_RAW_NOP()))) {
@@ -725,6 +638,17 @@ void ftrace_free_init_tramp(void)
 		}
 }
 
+static void __init add_ftrace_tramp(unsigned long tramp)
+{
+	int i;
+
+	for (i = 0; i < NUM_FTRACE_TRAMPS; i++)
+		if (!ftrace_tramps[i]) {
+			ftrace_tramps[i] = tramp;
+			return;
+		}
+}
+
 int __init ftrace_dyn_arch_init(void)
 {
 	unsigned int *tramp[] = { ftrace_tramp_text, ftrace_tramp_init };
-- 
2.40.1

