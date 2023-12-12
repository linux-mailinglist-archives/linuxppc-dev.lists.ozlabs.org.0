Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA01280F407
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 18:07:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iP1cQxby;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqQ5w25V1z3c05
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 04:07:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iP1cQxby;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqPzc34Tlz3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 04:02:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9FDEF618D6;
	Tue, 12 Dec 2023 17:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49674C433C7;
	Tue, 12 Dec 2023 17:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702400520;
	bh=Zoxzxiw8GD+0wIrOLoWKqVMwe3HmRaqK0uwSwCSq7oE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iP1cQxby5vf2h9ndHIJgOXqxhI2WZ4mGt1xVn9hAMDoi53AHcV24nwBMitkp9fcsG
	 c/EUoylHLODUUACD9oGrNz8Q/2wT48mwUvNFsPz++a92B/GBu9q40RSccR+kun+FmC
	 bIRplqsoDcJ1u9mgYpBdAzDKyMmuP1huHmBeFRb4LNyrKJp4cZ7UH0WmDK3zBtc+1v
	 LlOePN4DIAZ86jcbkM53UfAVhQRKk2jbw8J86eWbR6h6lnxKFR7uOeN8ZZQt+wAvqd
	 YreEOSARtBe5PRfUEZ6uWim3bjDAsr/dGDJf9jpR1lFAQmw+vH6BHEONSuuqyUqgXO
	 jK+/kcExZ7ZQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDF8C4167D;
	Tue, 12 Dec 2023 17:02:00 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Tue, 12 Dec 2023 11:01:49 -0600
Subject: [PATCH v6 02/13] powerpc/rtas: Add for_each_rtas_function()
 iterator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231212-papr-sys_rtas-vs-lockdown-v6-2-e9eafd0c8c6c@linux.ibm.com>
References:  <20231212-papr-sys_rtas-vs-lockdown-v6-0-e9eafd0c8c6c@linux.ibm.com>
In-Reply-To:  <20231212-papr-sys_rtas-vs-lockdown-v6-0-e9eafd0c8c6c@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702400518; l=1528;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=NWsKJAvOyJ6+fcTpCAe3hP9I68yS9JzeFyNNJdqL2GM=;
 b=8V/qhZfXSaD5jFSH/GeiyyNRWs4HZsxH8ThYG3EnhhWKCbsq02A2lqKMonXWeQu2wrTxcC/M8
 JKWa6PDidVyCHpJ5U+QxXuQKe+mwdI4nwWIq9fh9iQzxP8zsTmUFkEx
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

Add a convenience macro for iterating over every element of the
internal function table and convert the one site that can use it. An
additional user of the macro is anticipated in changes to follow.

Reviewed-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index ce37dc9860ef..ae9b10c954a1 100644
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

