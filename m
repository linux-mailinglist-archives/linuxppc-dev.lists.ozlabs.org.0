Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C53D80F40C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 18:08:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lcslu2m/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqQ6q0nJ2z3vfR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 04:08:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lcslu2m/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqPzc33xLz3bnV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 04:02:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7DBA1618E5;
	Tue, 12 Dec 2023 17:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F1FFC433AD;
	Tue, 12 Dec 2023 17:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702400520;
	bh=6lAz05ak4ecW+F2/qU7xixMjkVZa2GJt0pcFRiiaFrY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lcslu2m/6AUDzqUoHZnkkP5flJULdrPBJzUVLq35l24+LYUXjqjUDn3/8X+IRy4yB
	 00Q1SFU006KgutarB8vEe9gk4nUM4kPqMXSMNbhwNsHFiPztttvWgap4nwdn51qG3r
	 /O8FRyOJiqHpxAqYMnFrs72borXUC3Uji4T6bAyfjlhE7a6YhZNLe2/3Uz9u0t1G6u
	 OaOOX+H8WSHpVNCnSoL3g4kSmmZizpfvWE9cUj9gg4XyT/mGCP54XyfhOIHBLrDUYx
	 h++Hhdmd87BzV20CB9BgLuMk/q/fX6IEN3ySI1c7rSoz2Qm1QRTiF+8Wlqd5UdU0g0
	 WcRi/a9KZdEkg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFE4C4167D;
	Tue, 12 Dec 2023 17:02:00 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Tue, 12 Dec 2023 11:01:55 -0600
Subject: [PATCH v6 08/13] powerpc/rtas: Warn if per-function lock isn't
 held
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231212-papr-sys_rtas-vs-lockdown-v6-8-e9eafd0c8c6c@linux.ibm.com>
References:  <20231212-papr-sys_rtas-vs-lockdown-v6-0-e9eafd0c8c6c@linux.ibm.com>
In-Reply-To:  <20231212-papr-sys_rtas-vs-lockdown-v6-0-e9eafd0c8c6c@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702400518; l=1931;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=WeXFrQimFfnHGgmR7i5yQRK5CXtu2ckkZ+eRYu/mNRs=;
 b=fnSWje3bRR/nwzEbvFCnvNSHK7eX+ADLsm1RPqx9YT1KlxMtWzf+CeQQRgMaVcrPHECaZeqya
 HxxgdFemKTaC2wQU+UNz3e4jv4Zckkz8vmJUYC3WXDQilHMt+N2N9wU
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

If the function descriptor has a populated lock member, then callers
are required to hold it across calls. Now that the firmware activation
sequence is appropriately guarded, we can warn when the requirement
isn't satisfied.

__do_enter_rtas_trace() gets reorganized a bit as a result of
performing the function descriptor lookup unconditionally now.

Reviewed-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 72f6b5a402dd..7e793b503e29 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -671,28 +671,25 @@ static void __do_enter_rtas(struct rtas_args *args)
 
 static void __do_enter_rtas_trace(struct rtas_args *args)
 {
-	const char *name = NULL;
+	const struct rtas_function *func = rtas_token_to_function(be32_to_cpu(args->token));
 
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
+		lockdep_assert_held(func->lock);
 
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

