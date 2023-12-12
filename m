Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4F980F3EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 18:02:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L6sUsZS6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqQ0R0P0Xz3cBP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 04:02:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L6sUsZS6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqPzb0rtRz2xdh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 04:02:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2DC7D618D3;
	Tue, 12 Dec 2023 17:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67EEDC43395;
	Tue, 12 Dec 2023 17:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702400520;
	bh=AgRVOP9bkgLv2ecMgKo7TALw16OzVdU92rSk3o1+s3w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L6sUsZS6yJ4Swf+Nu2FyaQa4h3d3Vg9QRvuStmj/PvIxCeelsrCpBgC/sqSAB4T3a
	 PSSRXrSYgX/8SCuaoxuJmf3UINUwYAlx8M/cryn1Ou9KqVUVqBP0TLENh4FvYx3jYO
	 WJ1OVLLe95eIxWxdZ+vTdSXMvzeYmfg+KcaAaIaE0I1ckekjSk1nild6hGap/PDxJj
	 LqDotO8T1heoYb6Lv8Ip2ws+kRA308U3ukPirnd715RQvYX3hDibl5WFA268wch1M5
	 FFZybKBoQJssCE0SmD2neNQQ4HUlEqpkCLfkEnOU6k2X8/KeYPUEky4dTb8GYj4nX/
	 BC3m5DKtqerHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5583EC3DA6E;
	Tue, 12 Dec 2023 17:02:00 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Tue, 12 Dec 2023 11:01:52 -0600
Subject: [PATCH v6 05/13] powerpc/rtas: Move token validation from
 block_rtas_call() to sys_rtas()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231212-papr-sys_rtas-vs-lockdown-v6-5-e9eafd0c8c6c@linux.ibm.com>
References:  <20231212-papr-sys_rtas-vs-lockdown-v6-0-e9eafd0c8c6c@linux.ibm.com>
In-Reply-To:  <20231212-papr-sys_rtas-vs-lockdown-v6-0-e9eafd0c8c6c@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702400518; l=4049;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=YJ8XAU16ii/pvuHPIAGYv4KpDMx7gyMB9kIrkfNOG9o=;
 b=rkueBlBX73nzJzKixsFHOqweiceEDzTdvgQCJ5IB5s7sV2WtzOc+eW7fbY6aVZjUqs2DnOmgp
 xosPKuPEWrjCDfPsIlg5rqmnpvpWpUcijS4duPBL0YGCW+hdiQ5W3JR
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

The rtas system call handler sys_rtas() delegates certain input
validation steps to a helper function: block_rtas_call(). One of these
steps ensures that the user-supplied token value maps to a known RTAS
function. This is done by performing a "reverse" token-to-function
lookup via rtas_token_to_function_untrusted() to obtain an
rtas_function object.

In changes to come, sys_rtas() itself will need the function
descriptor for the token. To prepare:

* Move the lookup and validation up into sys_rtas() and pass the
  resulting rtas_function pointer to block_rtas_call(), which is
  otherwise unconcerned with the token value.

* Change block_rtas_call() to report the RTAS function name instead of
  the token value on validation failures, since it can now rely on
  having a valid function descriptor.

One behavior change is that sys_rtas() now silently errors out when
passed a bad token, before calling block_rtas_call(). So we will no
longer log "RTAS call blocked - exploit attempt?" on invalid
tokens. This is consistent with how sys_rtas() currently handles other
"metadata" (nargs and nret), while block_rtas_call() is primarily
concerned with validating the arguments to be passed to specific RTAS
functions.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index f60a8e7bd5ed..ca5bb0b994ac 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1738,24 +1738,18 @@ static bool in_rmo_buf(u32 base, u32 end)
 		end < (rtas_rmo_buf + RTAS_USER_REGION_SIZE);
 }
 
-static bool block_rtas_call(int token, int nargs,
+static bool block_rtas_call(const struct rtas_function *func, int nargs,
 			    struct rtas_args *args)
 {
-	const struct rtas_function *func;
 	const struct rtas_filter *f;
-	const bool is_platform_dump = token == rtas_function_token(RTAS_FN_IBM_PLATFORM_DUMP);
-	const bool is_config_conn = token == rtas_function_token(RTAS_FN_IBM_CONFIGURE_CONNECTOR);
+	const bool is_platform_dump =
+		func == &rtas_function_table[RTAS_FNIDX__IBM_PLATFORM_DUMP];
+	const bool is_config_conn =
+		func == &rtas_function_table[RTAS_FNIDX__IBM_CONFIGURE_CONNECTOR];
 	u32 base, size, end;
 
 	/*
-	 * If this token doesn't correspond to a function the kernel
-	 * understands, you're not allowed to call it.
-	 */
-	func = rtas_token_to_function_untrusted(token);
-	if (!func)
-		goto err;
-	/*
-	 * And only functions with filters attached are allowed.
+	 * Only functions with filters attached are allowed.
 	 */
 	f = func->filter;
 	if (!f)
@@ -1812,14 +1806,15 @@ static bool block_rtas_call(int token, int nargs,
 	return false;
 err:
 	pr_err_ratelimited("sys_rtas: RTAS call blocked - exploit attempt?\n");
-	pr_err_ratelimited("sys_rtas: token=0x%x, nargs=%d (called by %s)\n",
-			   token, nargs, current->comm);
+	pr_err_ratelimited("sys_rtas: %s nargs=%d (called by %s)\n",
+			   func->name, nargs, current->comm);
 	return true;
 }
 
 /* We assume to be passed big endian arguments */
 SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 {
+	const struct rtas_function *func;
 	struct pin_cookie cookie;
 	struct rtas_args args;
 	unsigned long flags;
@@ -1849,13 +1844,18 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 			   nargs * sizeof(rtas_arg_t)) != 0)
 		return -EFAULT;
 
-	if (token == RTAS_UNKNOWN_SERVICE)
+	/*
+	 * If this token doesn't correspond to a function the kernel
+	 * understands, you're not allowed to call it.
+	 */
+	func = rtas_token_to_function_untrusted(token);
+	if (!func)
 		return -EINVAL;
 
 	args.rets = &args.args[nargs];
 	memset(args.rets, 0, nret * sizeof(rtas_arg_t));
 
-	if (block_rtas_call(token, nargs, &args))
+	if (block_rtas_call(func, nargs, &args))
 		return -EINVAL;
 
 	if (token_is_restricted_errinjct(token)) {

-- 
2.41.0

