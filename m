Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 283F68096AE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 00:41:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DH6IRHk9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmW4D4HRtz3dLS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 10:41:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DH6IRHk9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmW1V3pwHz3cDy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 10:38:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFBA962243;
	Thu,  7 Dec 2023 23:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 153A0C433AB;
	Thu,  7 Dec 2023 23:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701992315;
	bh=6lAz05ak4ecW+F2/qU7xixMjkVZa2GJt0pcFRiiaFrY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DH6IRHk97xsYC/SOf95VhVaJiylkYfypdAmL5Qbu6MZ/u+UZ+3Be0jrIqoezFrg3q
	 +S1jSSpZ+JOHdI5/isRAOgJbgpMHi9xMqaLy4sHn5wGd/s6Td8Q4YPxoZ7NIaJtRa7
	 W7Ta1zeXXsa+142BNVWN2FZGBeNkuHcywnmzUGnqXCejoXDaOxd3QIOX2QDT2PkTT7
	 /tpW6DzOedYCQKigFPTOHFC+Imh6gPymsmTWP20KHJG4J8a5lA/lx4SlX1tKGePO+B
	 pSHn2I0+8HsPgXp0vSLi8GFfsXIWnoP2Qc5NLVCEy70Ic23TwmqZdu4RlYyLwhl2pa
	 OZLSiS3//0c1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F1FC46CA3;
	Thu,  7 Dec 2023 23:38:35 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 07 Dec 2023 17:35:47 -0600
Subject: [PATCH v5 08/13] powerpc/rtas: Warn if per-function lock isn't
 held
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231207-papr-sys_rtas-vs-lockdown-v5-8-2ce965636a58@linux.ibm.com>
References:  <20231207-papr-sys_rtas-vs-lockdown-v5-0-2ce965636a58@linux.ibm.com>
In-Reply-To:  <20231207-papr-sys_rtas-vs-lockdown-v5-0-2ce965636a58@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701992313; l=1931;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=WeXFrQimFfnHGgmR7i5yQRK5CXtu2ckkZ+eRYu/mNRs=;
 b=XT53HGdVRT4F1cRAiaWlZ38jWNSACafNy+8GhDfhvXtwo0AQ/XMG/eZA88mvLSLn26W12qeJl
 rvI25FJgIpbCLvR1EGFFyu9LD/T4zJyekzbBDguUmXjqGRET5oD3vZx
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

