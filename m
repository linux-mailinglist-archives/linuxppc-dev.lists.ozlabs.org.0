Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC9372F8D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 11:15:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M8YnzbcN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qh0Bm0YD4z3bNv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 19:15:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M8YnzbcN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 483 seconds by postgrey-1.37 at boromir; Wed, 14 Jun 2023 19:14:38 AEST
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh09p3HZtz303V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 19:14:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 86CC5637B5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 09:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7151EC433C9;
	Wed, 14 Jun 2023 09:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686733585;
	bh=xQ+7/3O4UXcIQOrV9If3oz7gZPMhlSF6f8wg1tnuXa0=;
	h=From:To:Cc:Subject:Date:From;
	b=M8YnzbcNR4KaRBiaKHrDcwdnv+B4r9KDVGdHZF9GEjnV+rIX8ggU34EGGzY/wwzWF
	 YXkA6OqiQA1GMdoNjS1cmp/r+DdpLD9QPJjjjlgDa+6arO5DOSpXUtKLd2964nYIw4
	 ZYIWiBfz1VPUrunigfAx6Eua4djw4VGvyBEoKg/4zXN69w9MvBoEoly9p/EOhi/vmS
	 6K2cH7Z7J8n2aaWJLFAJCBoWB3onSfS7GsZn1vH0a6kFCdPD3Asmb1xKjO2WzLCWCV
	 FGPyy1sxLcs5UYxki9fQMSVvZfUlw98uQNCWeLp2laE30M8Orl21/1g2jsFkg3uMjh
	 WwH7F6xjPuUsg==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/trace: Add support for HAVE_FUNCTION_ARG_ACCESS_API
Date: Wed, 14 Jun 2023 14:29:26 +0530
Message-Id: <20230614085926.2176641-1-naveen@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When creating a kprobe on function entry through tracefs, enable
arguments to be recorded to be specified using $argN syntax.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/Kconfig              |  1 +
 arch/powerpc/include/asm/ptrace.h | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index bff5820b7cda14..bd76ae95146b42 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -233,6 +233,7 @@ config PPC
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_FAST_GUP
 	select HAVE_FTRACE_MCOUNT_RECORD
+	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_DESCRIPTORS	if PPC64_ELF_ABI_V1
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_TRACER
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 0eb90a01334666..68ce2381b18ae1 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -397,6 +397,23 @@ static inline unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs,
 		return 0;
 }
 
+/**
+ * regs_get_kernel_argument() - get Nth function argument in kernel
+ * @regs:	pt_regs of that context
+ * @n:		function argument number (start from 0)
+ *
+ * We support up to 8 arguments and assume they are sent in through the GPRs.
+ * This will fail for fp/vector arguments, but those aren't usually found in
+ * kernel code. This is expected to be called from kprobes or ftrace with regs.
+ */
+static inline unsigned long regs_get_kernel_argument(struct pt_regs *regs, unsigned int n)
+{
+#define NR_REG_ARGUMENTS 8
+	if (n < NR_REG_ARGUMENTS)
+		return regs_get_register(regs, offsetof(struct pt_regs, gpr[3 + n]));
+	return 0;
+}
+
 #endif /* __ASSEMBLY__ */
 
 #ifndef __powerpc64__

base-commit: bd517a8442b6c6646a136421cd4c1b95bf4ce32b
-- 
2.40.1

