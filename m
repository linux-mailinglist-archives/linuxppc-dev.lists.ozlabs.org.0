Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C14377EFDD2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 06:15:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oX9aE3Zz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXMRC57HLz3dHR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 16:15:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oX9aE3Zz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXMQM1d0yz3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 16:14:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7A72CCE0201;
	Sat, 18 Nov 2023 05:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78A36C433D9;
	Sat, 18 Nov 2023 05:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700284470;
	bh=/yzOE2VkX9uwl00T3kN7qB1X14wOgssOQFp6SHR1eS8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oX9aE3Zz2vMnssOBILPh5WwbkBaZbqAJtV1+ktek0AEt/uVaLi1IwNO96IvGj06sH
	 rXmMWLFxQrG08odIcfpU+WPXXdRCLqvS2gOQJRpX0Xirvb60uN4JgJsXPSwfLT7fpr
	 ovl3eUGDvPucyNb2E8wYZkGllqOgHqkBQLe09fky/eFlPg/36JB7YoE4S8o5Yh2q5c
	 KA+KL5Gi6suSuk6/K7mXePCr+1tN5YcQJlk3xyDwcP9z8mi0aNgiVhDLgh3wasM4gC
	 0pyyXYcoxBVpiExYs59N8b6uPg8COGCGI8LoGY5G3mWr02aIiv2CEPwwqTgukrtYbI
	 Y7d834rtXHJ2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EC0C5AD4C;
	Sat, 18 Nov 2023 05:14:30 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 17 Nov 2023 23:14:25 -0600
Subject: [PATCH v4 07/13] powerpc/rtas: Warn if per-function lock isn't
 held
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231117-papr-sys_rtas-vs-lockdown-v4-7-b794d8cb8502@linux.ibm.com>
References:  <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
In-Reply-To:  <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700284468; l=1868;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=1NvPkcThP74+hpb/mqIyTlBIckWGXrqZhMZPxMBQGJ4=;
 b=42j3AAUduDUa+lq1rIUrfCsRGcfg25iIr3Ii6etXZYk+rPRU6QkUDQo9TL6UlHmq54WHIEcO3
 82vAtuZ+srnBQh2ssEWagtVAzJ/KtF0+6OE9TTh/PpMUyHY2mKTsfdF
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

If the function descriptor has a populated lock member, then callers
are required to hold it across calls. Now that the firmware activation
sequence is appropriately guarded, we can warn when the requirement
isn't satisfied.

__do_enter_rtas_trace() gets reorganized a bit as a result of
performing the function descriptor lookup unconditionally now.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index e38ba05ad613..deb6289fcf9c 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -685,28 +685,25 @@ static void __do_enter_rtas(struct rtas_args *args)
 
 static void __do_enter_rtas_trace(struct rtas_args *args)
 {
-	const char *name = NULL;
+	struct rtas_function *func = rtas_token_to_function(be32_to_cpu(args->token));
 
-	if (args == &rtas_args)
-		lockdep_assert_held(&rtas_lock);
 	/*
-	 * If the tracepoints that consume the function name aren't
-	 * active, avoid the lookup.
+	 * If there is a per-function lock, it must be held by the
+	 * caller.
 	 */
-	if ((trace_rtas_input_enabled() || trace_rtas_output_enabled())) {
-		const s32 token = be32_to_cpu(args->token);
-		const struct rtas_function *func = rtas_token_to_function(token);
+	if (func->lock)
+		WARN_ON(!mutex_is_locked(func->lock));
 
-		name = func->name;
-	}
+	if (args == &rtas_args)
+		lockdep_assert_held(&rtas_lock);
 
-	trace_rtas_input(args, name);
+	trace_rtas_input(args, func->name);
 	trace_rtas_ll_entry(args);
 
 	__do_enter_rtas(args);
 
 	trace_rtas_ll_exit(args);
-	trace_rtas_output(args, name);
+	trace_rtas_output(args, func->name);
 }
 
 static void do_enter_rtas(struct rtas_args *args)

-- 
2.41.0

