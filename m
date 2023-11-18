Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF087EFDD8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 06:19:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MCmfSQUo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXMWv3FJbz3vlN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 16:19:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MCmfSQUo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXMQS38xQz3cbC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 16:14:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5CBE060A1D;
	Sat, 18 Nov 2023 05:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03948C433C9;
	Sat, 18 Nov 2023 05:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700284470;
	bh=UZO4U9AD1hAWIMCu3Aqb8z519fDiUiCXkQTpPyUqNVs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MCmfSQUo3dmI2sS/HTpVEr5sGQRJRPtq5xx0f9QbpPBc8nNstvi/X8w9bhhULTZjB
	 PjBljEe6gTwrUqJdJAAg7XaXpmvgUQbhQNHCjHsX9yQPHxsAKAZlCbIyAeQTSwoVNm
	 OjknHYlHND+isfQOba8ApW2orZ/GoaKVy4EVatsKt9FK+MFNGUlJVc9sBpxnfm+dcn
	 ai9VaatQmA354trcPNFgdMNLr6U7nJxJSxuXNbrknCZYHifeHxnXFGI0oFa71fRDYS
	 q6J6QjObeDhg53M3nuYmjjXNAPwnP0VCIbWuytcCeKeHjYDZeJiCdFk60OvXOGbjH9
	 LS7AAJpEfm/zw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC7CC54E76;
	Sat, 18 Nov 2023 05:14:29 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 17 Nov 2023 23:14:19 -0600
Subject: [PATCH v4 01/13] powerpc/rtas: Add for_each_rtas_function()
 iterator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231117-papr-sys_rtas-vs-lockdown-v4-1-b794d8cb8502@linux.ibm.com>
References:  <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
In-Reply-To:  <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700284468; l=1465;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=vDpQrA8xCWX1jbIRmPhGECAZK2WkrK9EZbB974PpYX8=;
 b=YMUA971VkArQoXJ1Im0gbruAC5Pe8cUg+KhAZRnU3tfyfoOru0g+8L2srB/D+zMjjkX+d7bCV
 n/QqJTogZBLDIdr4BcYqs3vpnEf45o90A6s4zFjq3hg2cbVNSObCunS
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Add a convenience macro for iterating over every element of the
internal function table and convert the one site that can use it. An
additional user of the macro is anticipated in changes to follow.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index eddc031c4b95..1ad1869e2e96 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -454,6 +454,11 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 	},
 };
 
+#define for_each_rtas_function(funcp)                                       \
+	for (funcp = &rtas_function_table[0];                               \
+	     funcp < &rtas_function_table[ARRAY_SIZE(rtas_function_table)]; \
+	     ++funcp)
+
 /*
  * Nearly all RTAS calls need to be serialized. All uses of the
  * default rtas_args block must hold rtas_lock.
@@ -525,10 +530,10 @@ static DEFINE_XARRAY(rtas_token_to_function_xarray);
 
 static int __init rtas_token_to_function_xarray_init(void)
 {
+	const struct rtas_function *func;
 	int err = 0;
 
-	for (size_t i = 0; i < ARRAY_SIZE(rtas_function_table); ++i) {
-		const struct rtas_function *func = &rtas_function_table[i];
+	for_each_rtas_function(func) {
 		const s32 token = func->token;
 
 		if (token == RTAS_UNKNOWN_SERVICE)

-- 
2.41.0

