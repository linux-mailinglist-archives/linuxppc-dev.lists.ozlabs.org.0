Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A63A779E98B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:44:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hkwGVTXT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm1rc47FFz3cJN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:44:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hkwGVTXT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1ql5D1Yz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:43:15 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8FF0FB82410;
	Wed, 13 Sep 2023 13:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFDABC433C8;
	Wed, 13 Sep 2023 13:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694612585;
	bh=RtQv4+guyL0lpLNo6ke71eml/EEtN6XCjID217TSEdE=;
	h=From:To:Cc:Subject:Date:From;
	b=hkwGVTXTfJPYbpVdNwQz6rpcU2V40XGVA8ahx6sLz6smX0Sbtv+N29dd7QypRiIIV
	 MxIlQW3HU4JFG8tOtmtvzMcB0NW28dlDZzuS79RiMEMVYrNhvUnExJ1qpd33x3LCN4
	 1Q2Ii5UAiNFDLBmiJ7RWvnHuFBfggwi10/qlRs1zHZgPWN+A3pbbXVBagsyAqtVRJJ
	 /bJTPKXU1K0l1Sa1ejSzry/uVRV2W76+3g8p8qVmph8YkZeBarOjug3uWQQ6A2wK6M
	 BcobZQ0RfO1KISYbLOI34Vc3doOalpX1bQo856SGhG2r58ipnx58A1LSPTBewgygXC
	 Vu0H7w0KzX0Uw==
From: Naveen N Rao <naveen@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc: Fix build issue with LD_DEAD_CODE_DATA_ELIMINATION and FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
Date: Wed, 13 Sep 2023 19:11:29 +0530
Message-ID: <20230913134129.2782088-1-naveen@kernel.org>
X-Mailer: git-send-email 2.41.0
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We recently added support for -fpatchable-function-entry and it is
enabled by default on ppc32 (ppc64 needs gcc v13.1.0). When building the
kernel for ppc32 and also enabling CONFIG_LD_DEAD_CODE_DATA_ELIMINATION,
we see the below build error with older gcc versions:
  powerpc-linux-gnu-ld: init/main.o(__patchable_function_entries): error: need linked-to section for --gc-sections

This error is thrown since __patchable_function_entries section would be
garbage collected with --gc-sections since it does not reference any
other kept sections. This has subsequently been fixed with:
  https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=b7d072167715829eed0622616f6ae0182900de3e

Disable LD_DEAD_CODE_DATA_ELIMINATION for gcc versions before v11.1.0 if
using -fpatchable-function-entry to avoid this bug.

Fixes: 0f71dcfb4aef ("powerpc/ftrace: Add support for -fpatchable-function-entry")
Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 54b9387c3691..3aaadfd2c8eb 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -255,7 +255,7 @@ config PPC
 	select HAVE_KPROBES
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_KRETPROBES
-	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if HAVE_OBJTOOL_MCOUNT
+	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if HAVE_OBJTOOL_MCOUNT && (!ARCH_USING_PATCHABLE_FUNCTION_ENTRY || (!CC_IS_GCC || GCC_VERSION >= 110100))
 	select HAVE_LIVEPATCH			if HAVE_DYNAMIC_FTRACE_WITH_REGS
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)

base-commit: 0ad6bbfc7dab179bb3de79190140acec2862934d
-- 
2.41.0

