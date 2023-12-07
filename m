Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 477E28096B8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 00:43:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e637d3eC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmW6y5CSkz3dJn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 10:43:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e637d3eC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmW1V3vHtz3cPf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 10:38:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C7E362233;
	Thu,  7 Dec 2023 23:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7619C433C8;
	Thu,  7 Dec 2023 23:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701992314;
	bh=nOwaVFmdC6wkLpxrAK2DTZC31maAICieOgia8iOQmTI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e637d3eCXiggLZCLwL/zpyKcNjXTCJpkdLEtIxIDurek8x2djLgUHPYM/yhhScTXY
	 cfVLKq9C30UnTFLzjLoqrfFBEPMbU6wdxhFc8H4cFnVyMk1O7AVJGE3HZ9CI/r/XJ+
	 maCG5zjJmhHf0xmXy7n0L0OPvlsxf4m6FBwaNzsfMOqD39/3Wf+fGK4MRS/EdGQ2hl
	 DA4rIOlpd4WhmcUgCpeV5ZcHGNhIhvYrThlNtb1jqU2nGZ+Dn/y2yNjChpNcf6pWj1
	 oO6pvORRdvK6qrBVKGONUaUOA3WsSJ3Hdo5GEaYbGV8HQbdNU4vXOJFYhUYaqv5rsh
	 ujDOADnW6oOng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE0DC10DCE;
	Thu,  7 Dec 2023 23:38:34 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 07 Dec 2023 17:35:40 -0600
Subject: [PATCH v5 01/13] powerpc/rtas: Avoid warning on invalid token
 argument to sys_rtas()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231207-papr-sys_rtas-vs-lockdown-v5-1-2ce965636a58@linux.ibm.com>
References:  <20231207-papr-sys_rtas-vs-lockdown-v5-0-2ce965636a58@linux.ibm.com>
In-Reply-To:  <20231207-papr-sys_rtas-vs-lockdown-v5-0-2ce965636a58@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701992313; l=3232;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=xeEDYmcM08Jdm+cCjHTDeI5+EGF9mkp/57/09NU+nko=;
 b=x1jr589dxoLwH/h3af6DMHW4I1NGr6J6QDI/D8Xe8QlQKVZIctKTGl413xAv39ysoDjvqlLxt
 lEOH23jEi+fDqK02ENHiPMIItMC1gw8BUPiuajjyvzN3GqzUEkn30kb
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, "Aneesh Kumar K.V \(IBM\)" <aneesh.kumar@kernel.org>, =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

rtas_token_to_function() WARNs when passed an invalid token; it's
meant to catch bugs in kernel-based users of RTAS functions. However,
user space controls the token value passed to rtas_token_to_function()
by block_rtas_call(), so user space with sufficient privilege to use
sys_rtas() can trigger the warnings at will:

  unexpected failed lookup for token 2048
  WARNING: CPU: 20 PID: 2247 at arch/powerpc/kernel/rtas.c:556
    rtas_token_to_function+0xfc/0x110
  ...
  NIP rtas_token_to_function+0xfc/0x110
  LR  rtas_token_to_function+0xf8/0x110
  Call Trace:
    rtas_token_to_function+0xf8/0x110 (unreliable)
    sys_rtas+0x188/0x880
    system_call_exception+0x268/0x530
    system_call_common+0x160/0x2c4

It's desirable to continue warning on bogus tokens in
rtas_token_to_function(). Currently it is used to look up RTAS
function descriptors when tracing, where we know there has to have
been a successful descriptor lookup by different means already, and it
would be a serious inconsistency for the reverse lookup to fail.

So instead of weakening rtas_token_to_function()'s contract by
removing the warnings, introduce rtas_token_to_function_untrusted(),
which has no opinion on failed lookups. Convert block_rtas_call() and
rtas_token_to_function() to use it.

Fixes: 8252b88294d2 ("powerpc/rtas: improve function information lookups")
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index c49f078382a9..ce37dc9860ef 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -544,6 +544,21 @@ static int __init rtas_token_to_function_xarray_init(void)
 }
 arch_initcall(rtas_token_to_function_xarray_init);
 
+/*
+ * For use by sys_rtas(), where the token value is provided by user
+ * space and we don't want to warn on failed lookups.
+ */
+static const struct rtas_function *rtas_token_to_function_untrusted(s32 token)
+{
+	return xa_load(&rtas_token_to_function_xarray, token);
+}
+
+/*
+ * Reverse lookup for deriving the function descriptor from a
+ * known-good token value in contexts where the former is not already
+ * available. @token must be valid, e.g. derived from the result of a
+ * prior lookup against the function table.
+ */
 static const struct rtas_function *rtas_token_to_function(s32 token)
 {
 	const struct rtas_function *func;
@@ -551,7 +566,7 @@ static const struct rtas_function *rtas_token_to_function(s32 token)
 	if (WARN_ONCE(token < 0, "invalid token %d", token))
 		return NULL;
 
-	func = xa_load(&rtas_token_to_function_xarray, token);
+	func = rtas_token_to_function_untrusted(token);
 
 	if (WARN_ONCE(!func, "unexpected failed lookup for token %d", token))
 		return NULL;
@@ -1721,7 +1736,7 @@ static bool block_rtas_call(int token, int nargs,
 	 * If this token doesn't correspond to a function the kernel
 	 * understands, you're not allowed to call it.
 	 */
-	func = rtas_token_to_function(token);
+	func = rtas_token_to_function_untrusted(token);
 	if (!func)
 		goto err;
 	/*

-- 
2.41.0

