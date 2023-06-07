Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 959AF7266E1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 19:13:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbv7W2ktLz3fkV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 03:13:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YM/mBSnv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YM/mBSnv;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbtsF1Q44z3dyf
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 03:01:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 70FBD60B60;
	Wed,  7 Jun 2023 17:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D98CC433EF;
	Wed,  7 Jun 2023 17:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686157262;
	bh=Iw1Dv20up6Z064YBBB74k6x5kv8HOFxX1mSlj8e9zYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YM/mBSnvpLpf/0/46bGpbt0duq2gHpJXKWNZwXwPvNflxLgFY5JNQpIqnqamXZZ9h
	 ZAa+Etk2IagOstLe33UXqryYx7OzBORe6eZvSKVYk1Nrkpib4GcdakTEr9QwgkUYb7
	 NbnCMPZw2Sv5Q3oTaa3D+JGKAaAKVmVDHCev65jP00no4MlVg1U6iDb1DXzErK9HD/
	 BsBh9AVbfz7FNg2FlncSqVm4yF4xvgpGpzeuj4bQgZb97AlJSmtQATNutHCNXOkiDQ
	 oV0eJjVcDdtUCTUoOFntDtOwIUsANovg0JoMSCu47ys+I6l6TfLBAYmu/fG1K2L770
	 kpe0/yhXhbqaA==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 01/15] powerpc/module: Remove unused .ftrace.tramp section
Date: Wed,  7 Jun 2023 22:25:16 +0530
Message-Id: <8b73187ee4236162cfb6a3165a9f4c38876cef64.1686151854.git.naveen@kernel.org>
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

.ftrace.tramp section is not used for any purpose. This code was added
all the way back in the original commit introducing support for dynamic
ftrace on ppc64 modules. Remove it.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/include/asm/module.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm/module.h
index ac53606c259430..a8e2e8339fb7f4 100644
--- a/arch/powerpc/include/asm/module.h
+++ b/arch/powerpc/include/asm/module.h
@@ -75,10 +75,6 @@ struct mod_arch_specific {
 #endif
 
 #ifdef CONFIG_DYNAMIC_FTRACE
-#    ifdef MODULE
-	asm(".section .ftrace.tramp,\"ax\",@nobits; .align 3; .previous");
-#    endif	/* MODULE */
-
 int module_trampoline_target(struct module *mod, unsigned long trampoline,
 			     unsigned long *target);
 int module_finalize_ftrace(struct module *mod, const Elf_Shdr *sechdrs);
-- 
2.40.1

