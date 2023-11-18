Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2DE7EFDE4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 06:25:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o3fN7LP2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXMgT4k4hz3w96
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 16:25:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o3fN7LP2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXMQT2J3Vz3cGJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 16:14:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 89768B82247;
	Sat, 18 Nov 2023 05:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3515DC433CC;
	Sat, 18 Nov 2023 05:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700284470;
	bh=NQt/79G32auBlNo/DL9TBUgl/9nP6QKeKwtcZtJgOa8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o3fN7LP2MzYS5XrzZLzykIJpk1ciQo7ttMwCzQWG1JWWx2tgSpnekzpi8mLTjueHz
	 qQRS9pLsneESJ/QLI7bNVCjj4oHLkQZz79TznBTy0bXK2nUFnSNvx++qSKbkyOuMIt
	 283UeLiEtWASR+eKi9VSQFJ8Sod1D0wSaXXOZXVc8E6fqkbZwI5MrzHXYwWKA1dCT4
	 7qjfJ89zCyIhHok3BFlxIbQNy1wDEuLsDOPVR5Bv/0DZ/eNqz6PV2ppU01ZPCf0y5P
	 JNvE3RJxKl1eiYxhFSCKwY5nxoVLMbbdoESqFfHNT+84TjurIpuewsUgTaBXIxIWW6
	 GxIgFXADcrqxg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24518C5AE4A;
	Sat, 18 Nov 2023 05:14:30 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 17 Nov 2023 23:14:22 -0600
Subject: [PATCH v4 04/13] powerpc/rtas: Factor out function descriptor
 lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231117-papr-sys_rtas-vs-lockdown-v4-4-b794d8cb8502@linux.ibm.com>
References:  <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
In-Reply-To:  <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700284468; l=2119;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=TOsUuive8ZDuMn3c0pP1+3FEVlK9o1TubebHmOMML3o=;
 b=zqlcoBdc9ZuM5GyIUAIWeB+L+P280dA3eNOArlopnW0cZ849RgyNyAfJQmgZuc5n1rA2yt8wr
 bqdRigAIEUQBUKp8b0WibrM57+lkVsM4eG9dai7PDoF0VISP6CQ87Wu
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

Move the function descriptor table lookup out of rtas_function_token()
into a separate routine for use in new code to follow. No functional
change.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index f0051881348a..1fc0b3fffdd1 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -469,29 +469,36 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 static DEFINE_RAW_SPINLOCK(rtas_lock);
 static struct rtas_args rtas_args;
 
-/**
- * rtas_function_token() - RTAS function token lookup.
- * @handle: Function handle, e.g. RTAS_FN_EVENT_SCAN.
- *
- * Context: Any context.
- * Return: the token value for the function if implemented by this platform,
- *         otherwise RTAS_UNKNOWN_SERVICE.
- */
-s32 rtas_function_token(const rtas_fn_handle_t handle)
+static struct rtas_function *rtas_function_lookup(const rtas_fn_handle_t handle)
 {
 	const size_t index = handle.index;
 	const bool out_of_bounds = index >= ARRAY_SIZE(rtas_function_table);
 
 	if (WARN_ONCE(out_of_bounds, "invalid function index %zu", index))
-		return RTAS_UNKNOWN_SERVICE;
+		return NULL;
 	/*
 	 * Various drivers attempt token lookups on non-RTAS
 	 * platforms.
 	 */
 	if (!rtas.dev)
-		return RTAS_UNKNOWN_SERVICE;
+		return NULL;
+
+	return &rtas_function_table[index];
+}
+
+/**
+ * rtas_function_token() - RTAS function token lookup.
+ * @handle: Function handle, e.g. RTAS_FN_EVENT_SCAN.
+ *
+ * Context: Any context.
+ * Return: the token value for the function if implemented by this platform,
+ *         otherwise RTAS_UNKNOWN_SERVICE.
+ */
+s32 rtas_function_token(const rtas_fn_handle_t handle)
+{
+	const struct rtas_function *func = rtas_function_lookup(handle);
 
-	return rtas_function_table[index].token;
+	return func ? func->token : RTAS_UNKNOWN_SERVICE;
 }
 EXPORT_SYMBOL_GPL(rtas_function_token);
 

-- 
2.41.0

