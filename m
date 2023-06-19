Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 441B173516E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 12:04:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PvfJ86X/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql52s0cFjz3cV4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 20:04:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PvfJ86X/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql4ny0xLdz3bng
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 19:53:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7C261601CD;
	Mon, 19 Jun 2023 09:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFDBC433C8;
	Mon, 19 Jun 2023 09:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687168387;
	bh=70K4tpgIiBf65QJ6rsPxfnt11i5FQV+b9UaDgRIJCh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PvfJ86X/7TuPKabDQMgj324RV1vJWxIG7QjQ4Q2kuvu4/+vluLB4wqwD0S04RAyZz
	 Bco8/SsHElfnhoG5PH4wnwS1oPyJ6kMbmSKQQuq7fNSaB9QBc4X0xXxkIIIrglMMmI
	 dxNiqEtMRkzhUr6dOXHp0EaWHkofLb46GLdMmewipZaPJ/34A+s5ZoYC8fflxrOULx
	 qNUIZL3MPa7k21SO2ej7q+3Tjc+cSRbRyXyhsM1N5CKrdRIIfPQ/teTbC+iHQcZo0K
	 fVe6pf5m1NHKqMAUmZSJuYH1Sfvm52AP0wqde3BeLO3H8EMpJhVKVUWj9zazpn5kej
	 KN8WCc5Sg0CzQ==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 10/17] powerpc/ftrace: Add separate ftrace_init_nop() with additional validation
Date: Mon, 19 Jun 2023 15:17:28 +0530
Message-Id: <f373684081e8e98be09b7f44d2d93069768324dc.1687166935.git.naveen@kernel.org>
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
index 702aaf2efa966c..ef9f0b97670d1c 100644
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
index 278bf8e52b6e89..98bd099c428ee0 100644
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
+		ret = ftrace_read_inst(ip - 4, &old);
+		if (!ret && !ppc_inst_equal(old, ppc_inst(PPC_RAW_MFLR(_R0)))) {
+			ret = ftrace_validate_inst(ip - 8, ppc_inst(PPC_RAW_MFLR(_R0)));
+			ret |= ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_STD(_R0, _R1, 16)));
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

