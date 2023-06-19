Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEC77350EB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 11:53:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C8Epmbxm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql4pX5jL0z3bXk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 19:53:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C8Epmbxm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql4mm57CPz30Q0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 19:52:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E832260909;
	Mon, 19 Jun 2023 09:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C151AC433C8;
	Mon, 19 Jun 2023 09:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687168325;
	bh=Iw1Dv20up6Z064YBBB74k6x5kv8HOFxX1mSlj8e9zYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C8Epmbxm+rd5I555DhdkzK6hemXQyspSs8tgeBOmmm9VhYPiJYBVmCNd//Nlh2A14
	 aPRqYzsy5x6N7E6a2WfMKeGBtpyJ64LUpymU+v7wQEjb3xKNfmtLwYKPg20AW2tRmE
	 jyBx2ZVu4DRvmYL7POuvvDCecCuXZ0wzlGyhJuVAESvPHwawZpUQYw1rx0eyveq7ZA
	 bEQuM4wHMaUGYhge19MH0AfSTBcUeZ+vK63W3rbsjCtINTSqPo4v7v0o+/EXmQeWLn
	 7UUoVEeyol8diog1wIsmR9TLGaxxzEwskNDOqugF/xfGDsGONpt7DUZnaH6neL/Gb3
	 tyxqK7THFO0+A==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 02/17] powerpc/module: Remove unused .ftrace.tramp section
Date: Mon, 19 Jun 2023 15:17:20 +0530
Message-Id: <9cf6d7f37ba82f7cb6dafecf660f44925c526d8d.1687166935.git.naveen@kernel.org>
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

