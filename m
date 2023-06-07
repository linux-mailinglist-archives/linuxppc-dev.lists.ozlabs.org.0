Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 282907266D6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 19:11:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbv5d6Wq2z3gPw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 03:11:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tHobEMxg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tHobEMxg;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbts42sSLz3f7F
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 03:00:56 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B60CB60B34;
	Wed,  7 Jun 2023 17:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00E6C433EF;
	Wed,  7 Jun 2023 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686157254;
	bh=ENTL9jz4xseQBAYNa1hOUdTwA84v+/79JmfAzV56XLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tHobEMxg5qYowCY+M6cFBe36fnLNywgmzb/mqbAQgj/Bok366t8bmC/mqJ+OYA1pb
	 aTg1QQVGfRpEXslWK1+Pf/bFZ1zvdG5GOZ71YQClzW1vWIl8M+zZ4e/YFO4nhsEOef
	 xlEt40BLxDWXaThpdcFrfGozr28MdfQsIvP7p9wi/WZK6tUXR5pV8XioyjFQ21VAMq
	 214JoFekM0O0jZMKx+izsQMcp1270qikxLBjhQYoACEmpiIxOfCFZOQcMrxJ5+cxVp
	 XnUs0ZFivV/+DOOtlo17d6mJFeXEoW1SS0FE9EjcE6BGBlHACPnenyvfYM7KYMv2ze
	 IqytCpvPjhC6w==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 09/15] powerpc/ftrace: Add separate ftrace_init_nop() with additional validation
Date: Wed,  7 Jun 2023 22:25:24 +0530
Message-Id: <d3ae804c4c6ed88187d199bacf5e853bd0a7f57d.1686151854.git.naveen@kernel.org>
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

Currently, we validate instructions around the ftrace location every
time we have to enable/disable ftrace. Introduce ftrace_init_nop() to
instead perform all the validation during ftrace initialization. This
allows us to simply patch the necessary instructions during
enabling/disabling ftrace.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/include/asm/ftrace.h  |  6 +++
 arch/powerpc/kernel/trace/ftrace.c | 71 ++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 1a5d365523e160..89fbae3caa1fc2 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -29,11 +29,17 @@ static inline unsigned long ftrace_call_adjust(unsigned long addr)
 unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
 				    unsigned long sp);
 
+struct module;
+struct dyn_ftrace;
 struct dyn_arch_ftrace {
 	struct module *mod;
 };
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
+#define ftrace_need_init_nop()	(true)
+int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
+#define ftrace_init_nop ftrace_init_nop
+
 struct ftrace_regs {
 	struct pt_regs regs;
 };
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 278bf8e52b6e89..c0d185742c23ca 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -31,6 +31,16 @@
 #define	NUM_FTRACE_TRAMPS	2
 static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
 
+static ppc_inst_t ftrace_create_branch_inst(unsigned long ip, unsigned long addr, int link)
+{
+	ppc_inst_t op;
+
+	WARN_ON(!is_offset_in_branch_range(addr - ip));
+	create_branch(&op, (u32 *)ip, addr, link ? BRANCH_SET_LINK : 0);
+
+	return op;
+}
+
 static ppc_inst_t
 ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
 {
@@ -597,6 +607,67 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 }
 #endif
 
+int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
+{
+	unsigned long addr, ip = rec->ip;
+	ppc_inst_t old, new;
+	int ret = 0;
+
+	/* Verify instructions surrounding the ftrace location */
+	if (IS_ENABLED(CONFIG_PPC32)) {
+		/* Expected sequence: 'mflr r0', 'stw r0,4(r1)', 'bl _mcount' */
+		ret = ftrace_validate_inst(ip - 8, ppc_inst(PPC_RAW_MFLR(_R0)));
+		if (!ret)
+			ret = ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_STW(_R0, _R1, 4)));
+	} else if (IS_ENABLED(CONFIG_MPROFILE_KERNEL)) {
+		/* Expected sequence: 'mflr r0', ['std r0,16(r1)'], 'bl _mcount' */
+		ret = ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_MFLR(_R0)));
+		if (ret) {
+			ret = ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_STD(_R0, _R1, 16)));
+			ret |= ftrace_validate_inst(ip - 8, ppc_inst(PPC_RAW_MFLR(_R0)));
+		}
+	} else {
+		return -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	if (!core_kernel_text(ip)) {
+		if (!mod) {
+			pr_err("0x%lx: No module provided for non-kernel address\n", ip);
+			return -EFAULT;
+		}
+		rec->arch.mod = mod;
+	}
+
+	/* Nop-out the ftrace location */
+	new = ppc_inst(PPC_RAW_NOP());
+	addr = MCOUNT_ADDR;
+	if (is_offset_in_branch_range(addr - ip)) {
+		/* Within range */
+		old = ftrace_create_branch_inst(ip, addr, 1);
+		ret = ftrace_modify_code(ip, old, new);
+	} else if (core_kernel_text(ip) || (IS_ENABLED(CONFIG_MODULES) && mod)) {
+		/*
+		 * We would be branching to a linker-generated stub, or to the module _mcount
+		 * stub. Let's just confirm we have a 'bl' here.
+		 */
+		ret = ftrace_read_inst(ip, &old);
+		if (ret)
+			return ret;
+		if (!is_bl_op(old)) {
+			pr_err("0x%lx: expected (bl) != found (%08lx)\n", ip, ppc_inst_as_ulong(old));
+			return -EINVAL;
+		}
+		ret = patch_instruction((u32 *)ip, new);
+	} else {
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
 int ftrace_update_ftrace_func(ftrace_func_t func)
 {
 	unsigned long ip = (unsigned long)(&ftrace_call);
-- 
2.40.1

