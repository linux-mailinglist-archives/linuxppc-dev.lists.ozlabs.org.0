Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B56D901D38
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 10:43:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jbneWx6C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyQLK3HzCz3cWc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 18:43:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jbneWx6C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VyQGq3bGpz3cSK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2024 18:40:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BD2E0CE0F87;
	Mon, 10 Jun 2024 08:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743A4C2BBFC;
	Mon, 10 Jun 2024 08:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718008802;
	bh=Yw7BK5ZSzIqUwdH+xzRKsshvO4agK2xzXRxs7K0POPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jbneWx6CpsDDyuVRreLpShu1GgvfoxE+a3oSZg3Ms2OAxkWqzn2j6kbW8tD6Kc1cD
	 123RMn++SsNyC5q3qs8z5z/+dxdWGwPhFjweWZfDbABvmabonorMwk+zUMELSXqVbT
	 Uv75QZNBuLcJPJTXKNx6oo2dj9I3FpyUxavcDHgBcvIfv47Hq6SET24hDExHzoDVLA
	 eR5+R2IqP/Rz/Z6wulF1XyFXrqPTgWHtkMl9RUgh+XchpZaYE6LC/ewFLQSOY1ZY16
	 QW/Zn5n3sZdICeq0RD5z1ymdaDk9B4/q41CIjo8oyEGNz8NiJAum+uabVfel2G1+Bi
	 eseNgsJH8Ctjg==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH v2 1/5] powerpc/kprobes: Use ftrace to determine if a probe is at function entry
Date: Mon, 10 Jun 2024 14:08:14 +0530
Message-ID: <d6ef60e04f4314bc2a21dedd85a46b4d5d8b2ab4.1718008093.git.naveen@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1718008093.git.naveen@kernel.org>
References: <cover.1718008093.git.naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <masahiroy@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than hard-coding the offset into a function to be used to
determine if a kprobe is at function entry, use ftrace_location() to
determine the ftrace location within the function and categorize all
instructions till that offset to be function entry.

For functions that cannot be traced, we fall back to using a fixed
offset of 8 (two instructions) to categorize a probe as being at
function entry for 64-bit elfv2, unless we are using pcrel.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/kprobes.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 14c5ddec3056..ca204f4f21c1 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -105,24 +105,22 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 	return addr;
 }
 
-static bool arch_kprobe_on_func_entry(unsigned long offset)
+static bool arch_kprobe_on_func_entry(unsigned long addr, unsigned long offset)
 {
-#ifdef CONFIG_PPC64_ELF_ABI_V2
-#ifdef CONFIG_KPROBES_ON_FTRACE
-	return offset <= 16;
-#else
-	return offset <= 8;
-#endif
-#else
+	unsigned long ip = ftrace_location(addr);
+
+	if (ip)
+		return offset <= (ip - addr);
+	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && !IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
+		return offset <= 8;
 	return !offset;
-#endif
 }
 
 /* XXX try and fold the magic of kprobe_lookup_name() in this */
 kprobe_opcode_t *arch_adjust_kprobe_addr(unsigned long addr, unsigned long offset,
 					 bool *on_func_entry)
 {
-	*on_func_entry = arch_kprobe_on_func_entry(offset);
+	*on_func_entry = arch_kprobe_on_func_entry(addr, offset);
 	return (kprobe_opcode_t *)(addr + offset);
 }
 
-- 
2.45.2

