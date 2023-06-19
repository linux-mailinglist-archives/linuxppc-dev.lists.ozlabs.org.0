Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F09FB735166
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 12:02:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kQE3XR/0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql50v5Wrqz3cF1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 20:02:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kQE3XR/0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql4nl5mvCz3bTr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 19:52:59 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2CF6A601CD;
	Mon, 19 Jun 2023 09:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3378C433C8;
	Mon, 19 Jun 2023 09:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687168377;
	bh=8JeQh63fPatsalzj0Vl6bvA1m4bFoaGQC3L7k3yskE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kQE3XR/0y8+ni92uSmj1iv8i9vmd5MNVRf0IkIhh2zL40VaX1COKGwUb1ksdqTLk4
	 8XFSSbtJtvcQpREUep2KKm+t+uNFHcY/JZ0dkQksuQosibi76sAMZpaKVjqi+MO7Xb
	 G3SuhGYUhfYa6Q4d2qlSDtiSS0lO0gJ15uzKRuzc8e5/nwuC+ELcRpk+4RHlOGg4SE
	 sK4cwYzaYdvTfZrEZ+7IrORf6GCewsxU2QLtmzYGnmB/UMABvhe7NeRYJL+rnG4ZLi
	 8ShRWgva9IcGf7MvcVkqeGOQoL21c4CZ0cJBfz6hjn5x/M5AmJ1pqz5t4BxeDYNVG8
	 trZpLaWsIcW8Q==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 08/17] powerpc/ftrace: Refactor ftrace_modify_code()
Date: Mon, 19 Jun 2023 15:17:26 +0530
Message-Id: <a8daa49712b44ff539e6c22a2ea649a540386798.1687166935.git.naveen@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687166935.git.naveen@kernel.org>
References: <cover.1687166935.git.naveen@kernel.org>
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
Cc: Steven Rostedt <rostedt@goodmis.org>
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

