Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C347D7B48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 05:32:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p++aPkix;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGBFX17tSz3d9v
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 14:32:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p++aPkix;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGB4H16Hnz2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 14:24:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1DBC2B8340E;
	Thu, 26 Oct 2023 03:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D1FCC433CC;
	Thu, 26 Oct 2023 03:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698290682;
	bh=temAfdS7FR3ywdEnFj7nYhvhxVl9kKMEr9KwR8drS3k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p++aPkixqjAHlQwLxqqU4EKgT842cUXQGPLE1axDEGMTL35OcYMDSiLxAkFRnMXhm
	 g0EVCaTc2j4yq8jTvtzPu1FYOJRIJzVyxZaFT7+fjDsakPTYw8i/ELrsCpKuI4wh/y
	 JdhOOz2fWTdix3pBSJFTorKKrsiBJyny5BOR/vpIAO3GXiZMvR1Oa5UlR9k4RMp71V
	 QqzSZKs1ue7/+B7AzUs44S/pvUfjbSICsHKnW8o/l0PRxxjzw3VkPmje8xsw22ipMv
	 wRvvYqJ24Qoh3K7r9hT5tTS0DueToyTW8j/XjqfcLMJ0t3OX2z5TXScgTWfo6x1fyc
	 jbkssJnsQrBbw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454C8C25B6D;
	Thu, 26 Oct 2023 03:24:42 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Wed, 25 Oct 2023 22:24:18 -0500
Subject: [PATCH v3 04/10] powerpc/rtas: Warn if per-function lock isn't
 held
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231025-papr-sys_rtas-vs-lockdown-v3-4-5eb04559e7d8@linux.ibm.com>
References:  <20231025-papr-sys_rtas-vs-lockdown-v3-0-5eb04559e7d8@linux.ibm.com>
In-Reply-To:  <20231025-papr-sys_rtas-vs-lockdown-v3-0-5eb04559e7d8@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698290680; l=1868;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=MsLg2VOCa1maTk74nl6FHSf51sridi3guj7MF6Dq5zU=;
 b=Z+bk4iMGyADjbwFlmpN/5XT/yolqS353bPkd2sc42piV9VYGGHTmpVF8KrTdm5MtT99S32j0G
 XZHHxspenFMAKb47kW8vxjT8yCy7QZyuBZzF14GUtFvL2EjfwmEOTt2
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
index 864d140e7247..0a0ae81fac99 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -670,28 +670,25 @@ static void __do_enter_rtas(struct rtas_args *args)
 
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

