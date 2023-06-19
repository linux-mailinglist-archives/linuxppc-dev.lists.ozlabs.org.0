Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A66873514E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 11:59:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ecowpg2i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql4xk62LSz3cRK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 19:59:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ecowpg2i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql4nS2QQyz30f2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 19:52:44 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ACF0460909;
	Mon, 19 Jun 2023 09:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846CEC433C0;
	Mon, 19 Jun 2023 09:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687168362;
	bh=ogEUXT2uop1wwWimAziuOSqdGoByA/s+m4cCyc0kb0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ecowpg2ianiRbd9CgHLvJ9v3DN6biRsXftFp72zI7gOyK0kkfHAdCxVIGSE/B6TIL
	 LT7ICI00ZHdhumS1zR+b32FzQP5/TDjRTjhUZ8WcQ4REKEubAEJE4dH9VV/wAL6BR3
	 5+q6OyWRIiqPOJD4rZLm++7QtuSbn4uQuj9f0xOzMMrn8YWg2s0cAiPIqWX86ddjqd
	 fhI8icSEtNN8L1tpM4/q3qid4fP/spxcZgDC9Wv+92ZmQ5zzE1Gsl2PIufvpiWAwZ2
	 BuFdFnbwHFWouF4dbpMjQ0k88u1O6a9pUSdRAZg19Mov1AsJDZRSXzlEO3OaxBQPpS
	 9lJORE8O6lh+Q==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 05/17] powerpc/ftrace: Use FTRACE_REGS_ADDR to identify the correct ftrace trampoline
Date: Mon, 19 Jun 2023 15:17:23 +0530
Message-Id: <6045a280a57a7ea937a5bb13ccac747026dbfb07.1687166935.git.naveen@kernel.org>
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

Instead of keying off DYNAMIC_FTRACE_WITH_REGS, use FTRACE_REGS_ADDR to
identify the proper ftrace trampoline address to use.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/ftrace.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index f117124c30325f..5aa36272617a03 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -745,14 +745,9 @@ int __init ftrace_dyn_arch_init(void)
 	};
 #endif
 
-	unsigned long addr;
+	unsigned long addr = FTRACE_REGS_ADDR;
 	long reladdr;
 
-	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
-		addr = ppc_global_function_entry((void *)ftrace_regs_caller);
-	else
-		addr = ppc_global_function_entry((void *)ftrace_caller);
-
 	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
 		for (i = 0; i < 2; i++) {
 			reladdr = addr - (unsigned long)tramp[i];
-- 
2.40.1

