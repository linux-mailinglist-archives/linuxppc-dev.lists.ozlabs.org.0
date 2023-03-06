Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5EB6AD0BA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 22:42:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVsVn1Z4Hz3f8M
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 08:42:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KtvAdpWD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KtvAdpWD;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVsKp2nKsz3cCn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 08:34:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BF683B8112D;
	Mon,  6 Mar 2023 21:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11AB2C433A4;
	Mon,  6 Mar 2023 21:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678138473;
	bh=7XOvV2BHwXa+pZlvU66eqwbPxipc2XJxBAsvpm6XWvA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KtvAdpWDVluIBHmLU1EdKkIeMpt+nNinuaHNqeCs3yXoIe7Z3YssmGG4Tag6syvrE
	 JJPUpFbkKij8+f4zL7IC2Q+UfdWS7nVQRN7DqeiX1T0cmgEFuvyPRKSH19pCj1p8qv
	 aQT9b9Oa92VsF/NB5bHmRPyzy4GZ9Xasn4dju0TX9TfLQzqYDdrCL6Lt3Cei39N+J1
	 xJBqAZDjmvUZvJ3rmZlNvUzWPwuDj7gVvW1PEqjvBLQhCiFZp2d3HyDpH7DL/fPxZd
	 I5GQMIlYbGi77qd389mW0s8ubn9aaC/gx2o7JT3wPiUkXfB/PJWqK3IkUxs2qILHq3
	 c/0/QrGl93eTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0055EC6FD1A;
	Mon,  6 Mar 2023 21:34:32 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Mar 2023 15:33:45 -0600
Subject: [PATCH 6/8] powerpc/rtas: lockdep annotations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230220-rtas-queue-for-6-4-v1-6-010e4416f13f@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
In-Reply-To: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678138471; l=4264;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=TIYvEdY23gtBTIiUG7IOtdTO7sVemxII+naaI6fhqrI=;
 b=G81ih7ytuTYeJtOafeh8+PWdLr0CDAIDjMOYZ9Z7li2Vgm4lTR3Ny7UI2WB4UCM1XZf3WGCVQ
 tiK7vd4VW8jCEhGPM4seOBzaJBay6jbKAOjGEnTQhJiYCCgyi0DZyxf
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=6daubz/ymoaMF+8voz7UHwnhluEsmDZuqygIIMWpQQY=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230206 with auth_id=27
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Add lockdep annotations for the following properties that must hold:

* Any error log retrieval must be atomically coupled with the prior
  RTAS call, without a window for another RTAS call to occur before the
  error log can be retrieved.

* All users of the core rtas_args parameter block must hold rtas_lock.

Move the definitions of rtas_lock and rtas_args up in the file so that
__do_enter_rtas_trace() can refer to them.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 96a10a0abe3a..633c925164e7 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -16,6 +16,7 @@
 #include <linux/init.h>
 #include <linux/kconfig.h>
 #include <linux/kernel.h>
+#include <linux/lockdep.h>
 #include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
@@ -453,6 +454,16 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 	},
 };
 
+/*
+ * Nearly all RTAS calls need to be serialized. All uses of the
+ * default rtas_args block must hold rtas_lock.
+ *
+ * Exceptions to the RTAS serialization requirement (e.g. stop-self)
+ * must use a separate rtas_args structure.
+ */
+static DEFINE_RAW_SPINLOCK(rtas_lock);
+static struct rtas_args rtas_args;
+
 /**
  * rtas_function_token() - RTAS function token lookup.
  * @handle: Function handle, e.g. RTAS_FN_EVENT_SCAN.
@@ -560,6 +571,9 @@ static void __do_enter_rtas(struct rtas_args *args)
 static void __do_enter_rtas_trace(struct rtas_args *args)
 {
 	const char *name = NULL;
+
+	if (args == &rtas_args)
+		lockdep_assert_held(&rtas_lock);
 	/*
 	 * If the tracepoints that consume the function name aren't
 	 * active, avoid the lookup.
@@ -619,16 +633,6 @@ static void do_enter_rtas(struct rtas_args *args)
 
 struct rtas_t rtas;
 
-/*
- * Nearly all RTAS calls need to be serialized. All uses of the
- * default rtas_args block must hold rtas_lock.
- *
- * Exceptions to the RTAS serialization requirement (e.g. stop-self)
- * must use a separate rtas_args structure.
- */
-static DEFINE_RAW_SPINLOCK(rtas_lock);
-static struct rtas_args rtas_args;
-
 DEFINE_SPINLOCK(rtas_data_buf_lock);
 EXPORT_SYMBOL_GPL(rtas_data_buf_lock);
 
@@ -951,6 +955,8 @@ static char *__fetch_rtas_last_error(char *altbuf)
 	u32 bufsz;
 	char *buf = NULL;
 
+	lockdep_assert_held(&rtas_lock);
+
 	if (token == -1)
 		return NULL;
 
@@ -1107,6 +1113,7 @@ static bool token_is_restricted_errinjct(s32 token)
  */
 int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 {
+	struct pin_cookie cookie;
 	va_list list;
 	int i;
 	unsigned long flags;
@@ -1133,6 +1140,8 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 	}
 
 	raw_spin_lock_irqsave(&rtas_lock, flags);
+	cookie = lockdep_pin_lock(&rtas_lock);
+
 	/* We use the global rtas args buffer */
 	args = &rtas_args;
 
@@ -1150,6 +1159,7 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 			outputs[i] = be32_to_cpu(args->rets[i + 1]);
 	ret = (nret > 0) ? be32_to_cpu(args->rets[0]) : 0;
 
+	lockdep_unpin_lock(&rtas_lock, cookie);
 	raw_spin_unlock_irqrestore(&rtas_lock, flags);
 
 	if (buff_copy) {
@@ -1781,6 +1791,7 @@ static bool block_rtas_call(int token, int nargs,
 /* We assume to be passed big endian arguments */
 SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 {
+	struct pin_cookie cookie;
 	struct rtas_args args;
 	unsigned long flags;
 	char *buff_copy, *errbuf = NULL;
@@ -1849,6 +1860,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	buff_copy = get_errorlog_buffer();
 
 	raw_spin_lock_irqsave(&rtas_lock, flags);
+	cookie = lockdep_pin_lock(&rtas_lock);
 
 	rtas_args = args;
 	do_enter_rtas(&rtas_args);
@@ -1859,6 +1871,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	if (be32_to_cpu(args.rets[0]) == -1)
 		errbuf = __fetch_rtas_last_error(buff_copy);
 
+	lockdep_unpin_lock(&rtas_lock, cookie);
 	raw_spin_unlock_irqrestore(&rtas_lock, flags);
 
 	if (buff_copy) {

-- 
2.39.1

