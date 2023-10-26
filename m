Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FDA7D7B3C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 05:29:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SzCmhZeY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGB9p5xZVz3vc2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 14:29:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SzCmhZeY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGB4G3DMRz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 14:24:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E9C462077;
	Thu, 26 Oct 2023 03:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DDD9C433C8;
	Thu, 26 Oct 2023 03:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698290682;
	bh=stkWVzSO4ejQwtil9IrkmumSfI8LIcXoEKhje//6hA8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SzCmhZeYvqiO4SlVKtAeSzJnQREuLxdk7MHZv3l5xHBngYYUgIATprZhHXAMdje+X
	 jKxDtXTeUX6SAUKXwjiVJXjt+xMfDk8HEHCqcXiPMfCvxzB8bdccYPphLK1d0iPjzC
	 CglRhcrv2CyoU+DtPs+qC6F8ejZ7jSV2fmRNWywQR5a8f0g8KdTXTLrvuZQ3qLf9uq
	 kpUCGpGN0aBumRCv+FTWVunNb/DI9b73ujd8dZpJyGKDitjNUMsI/39ZwNOHq9adUD
	 6wPra4V9TCFmt1wRDQpuEVIk6SUm+pH1O+wzmruwA0/u1nbsXUIdYq1Pwhf62knGo0
	 z0e46yR4LAm8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B79FC25B6B;
	Thu, 26 Oct 2023 03:24:42 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Wed, 25 Oct 2023 22:24:15 -0500
Subject: [PATCH v3 01/10] powerpc/rtas: Factor out function descriptor
 lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231025-papr-sys_rtas-vs-lockdown-v3-1-5eb04559e7d8@linux.ibm.com>
References:  <20231025-papr-sys_rtas-vs-lockdown-v3-0-5eb04559e7d8@linux.ibm.com>
In-Reply-To:  <20231025-papr-sys_rtas-vs-lockdown-v3-0-5eb04559e7d8@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698290680; l=2119;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=p66qjLdfJM2MQbl13Z0eFkMH8pzRz2+h8+ptsjlrXn8=;
 b=+Eczryz26fEGuyDUhisohnymr3n54Tg+EPa3lCtRA9Y91v6B2B5xnX6MfoZ4n6WiCKkRKqZXz
 fy/9b24pzzOALzjfTg46Zlh1hO4/IKd6sxC5Wt7D2ZxWhPYuykmwkKJ
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
index eddc031c4b95..e2fac171bf69 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -464,29 +464,36 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
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

