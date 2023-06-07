Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9470A7266C8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 19:10:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbv3c3fXZz3fpJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 03:10:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pv+UP5EK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pv+UP5EK;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbtrv2ctSz3f4W
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 03:00:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A3DDF60B60;
	Wed,  7 Jun 2023 17:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E43C433EF;
	Wed,  7 Jun 2023 17:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686157245;
	bh=8JeQh63fPatsalzj0Vl6bvA1m4bFoaGQC3L7k3yskE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pv+UP5EKII20qR7tpGpXG2N8tDCpVnw/YmhKF8rtvNhq3Lbg/A2r2Lr4wfHs4pW12
	 7WVCCi3woau2AzQnmBTDa5JUkn5g0JEckVpPtxdZloc5B/DjjBzSd7mpsUf48NBfOi
	 mDqoyHXyjNmCxdMsg1lAP+VOQga9bmd+KH/57YsRgjmaBLcmh8IOWzUxXnNILNW9Yu
	 +ZOdAP0ES2t8zbvDhgXSMrfGCe/sgSDTDkYHzdW6MSX8nwtRImEjR6fe8BJ8eG4aZx
	 CXo7bU5uRLcjuUVQPElE66rhB83keGmb/kcurLVx7b1TFleNsAAOgW3y4MCk2xkOLl
	 UkldivOepDv6Q==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 07/15] powerpc/ftrace: Refactor ftrace_modify_code()
Date: Wed,  7 Jun 2023 22:25:22 +0530
Message-Id: <f3268298e2ad7998e4a5dfda5484b14a469b5275.1686151854.git.naveen@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686151854.git.naveen@kernel.org>
References: <cover.1686151854.git.naveen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Split up ftrace_modify_code() into a few helpers for future use. Also
update error messages accordingly.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/ftrace.c | 51 +++++++++++++++++-------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 913c7aa63d3fa3..ef4e49c2c37781 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -50,32 +50,39 @@ ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
 	return op;
 }
 
-static inline int
-ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc_inst_t new)
+static inline int ftrace_read_inst(unsigned long ip, ppc_inst_t *op)
 {
-	ppc_inst_t replaced;
-
-	/*
-	 * Note:
-	 * We are paranoid about modifying text, as if a bug was to happen, it
-	 * could cause us to read or write to someplace that could cause harm.
-	 * Carefully read and modify the code with probe_kernel_*(), and make
-	 * sure what we read is what we expected it to be before modifying it.
-	 */
-
-	/* read the text we want to modify */
-	if (copy_inst_from_kernel_nofault(&replaced, (void *)ip))
+	if (copy_inst_from_kernel_nofault(op, (void *)ip)) {
+		pr_err("0x%lx: fetching instruction failed\n", ip);
 		return -EFAULT;
-
-	/* Make sure it is what we expect it to be */
-	if (!ppc_inst_equal(replaced, old)) {
-		pr_err("%p: replaced (%08lx) != old (%08lx)", (void *)ip,
-		       ppc_inst_as_ulong(replaced), ppc_inst_as_ulong(old));
-		return -EINVAL;
 	}
 
-	/* replace the text with the new text */
-	return patch_instruction((u32 *)ip, new);
+	return 0;
+}
+
+static inline int ftrace_validate_inst(unsigned long ip, ppc_inst_t inst)
+{
+	ppc_inst_t op;
+	int ret;
+
+	ret = ftrace_read_inst(ip, &op);
+	if (!ret && !ppc_inst_equal(op, inst)) {
+		pr_err("0x%lx: expected (%08lx) != found (%08lx)\n",
+		       ip, ppc_inst_as_ulong(inst), ppc_inst_as_ulong(op));
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static inline int ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc_inst_t new)
+{
+	int ret = ftrace_validate_inst(ip, old);
+
+	if (!ret)
+		ret = patch_instruction((u32 *)ip, new);
+
+	return ret;
 }
 
 /*
-- 
2.40.1

