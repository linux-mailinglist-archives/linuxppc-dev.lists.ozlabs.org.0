Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CC87266BA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 19:07:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbv0n37sMz3g4N
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 03:07:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fwxl0tVK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fwxl0tVK;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbtrd2CB4z3f0b
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 03:00:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A49446176E;
	Wed,  7 Jun 2023 17:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE8BC433D2;
	Wed,  7 Jun 2023 17:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686157231;
	bh=ogEUXT2uop1wwWimAziuOSqdGoByA/s+m4cCyc0kb0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fwxl0tVKIXFPIvVpl5XOfAF8o/h69/nw/TgjKMgcACbUoyIMhxZHsYKcSgwK09vyr
	 TO9ZF1NuDCnvg4/3eYfP5SPx8qjo+eyoboLap/UQH8wc2I51CM485Tb+NHU7pGYb23
	 omoVidWCvrAu5G4TwjbH0cm7rnAtj9itbTdtumUPTdMNL02y2eirdllv8Oy2rpxWG3
	 fAxNdELlXWKJ9cdLd2dRj7809hiTp0540095f2T4rcndenSNGFeAHO/cOu0SXA6Jou
	 sa4IJzlQvvDsPBeXJV0RMOP+B6G+9azigrMw5VxEiBRMgBIoPkRpNZitEdsqvHRajH
	 dQHrjig2iDGyg==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 04/15] powerpc/ftrace: Use FTRACE_REGS_ADDR to identify the correct ftrace trampoline
Date: Wed,  7 Jun 2023 22:25:19 +0530
Message-Id: <efae280008b545f6c53140adf3f8d4c4a327f7c2.1686151854.git.naveen@kernel.org>
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

