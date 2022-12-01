Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF6963F525
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 17:21:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNLt45vxcz3bg6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 03:21:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=NSK/XALU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=2607:5300:203:b2ee::31e5; helo=smtpout.efficios.com; envelope-from=mjeanson@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=NSK/XALU;
	dkim-atps=neutral
X-Greylist: delayed 323 seconds by postgrey-1.36 at boromir; Fri, 02 Dec 2022 03:20:25 AEDT
Received: from smtpout.efficios.com (unknown [IPv6:2607:5300:203:b2ee::31e5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNLs55RFMz3bW6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 03:20:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1669911291;
	bh=xWuRyqyu5ThwW4USd8HSm16KKk649E+OungraJjQRjg=;
	h=From:To:Cc:Subject:Date:From;
	b=NSK/XALUzDZV9HF4QJ7KjH/+zkac7+IsX61Dd/IMmcIt68w7C52sJmjViHc9kB2mO
	 tw0WXunPfMI3AKNulaz+ux4tHJ7G4/Av1ZOQHg5smOOflCiHZRXAeHZwlh8D7U3jTM
	 DJ4TQQzwSc5Q8u8KKWHiGMFA4fueDOK0TAu2EG9ru3t8oq92mhZVE7MuyhGfcVHh6M
	 hQ68jBZ06sYaASgG7zRzRXtMetuyFIgiIYEHUt53PckVvCtjpG6tfKnT4Et2p9rlpi
	 LYG7aQJfV3RRkDGVX05m27oEBSw4aBybgzeH98wu3bHrnvDkG2h4J5VoUgZM6+Dl//
	 D2MBAq8Rt3NTg==
Received: from laptop-mjeanson.internal.efficios.com (192-222-180-24.qc.cable.ebox.net [192.222.180.24])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4NNLkg0Lk0zYy0;
	Thu,  1 Dec 2022 11:14:51 -0500 (EST)
From: Michael Jeanson <mjeanson@efficios.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH] powerpc/ftrace: fix syscall tracing on PPC64_ELF_ABI_V1
Date: Thu,  1 Dec 2022 11:14:42 -0500
Message-Id: <20221201161442.2127231-1-mjeanson@efficios.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Suchanek <msuchanek@suse.de>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Michael Jeanson <mjeanson@efficios.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Masami Hiramatsu <mhiramat@kernel.org>, stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In v5.7 the powerpc syscall entry/exit logic was rewritten in C, on
PPC64_ELF_ABI_V1 this resulted in the symbols in the syscall table
changing from their dot prefixed variant to the non-prefixed ones.

Since ftrace prefixes a dot to the syscall names when matching them to
build its syscall event list, this resulted in no syscall events being
available.

Remove the PPC64_ELF_ABI_V1 specific version of
arch_syscall_match_sym_name to have the same behavior across all powerpc
variants.

Fixes: 68b34588e202 ("powerpc/64/sycall: Implement syscall entry/exit logic in C")
Cc: stable@vger.kernel.org # v5.7+
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michal Suchanek <msuchanek@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 arch/powerpc/include/asm/ftrace.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 3cee7115441b..e3d1f377bc5b 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -64,17 +64,6 @@ void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
  * those.
  */
 #define ARCH_HAS_SYSCALL_MATCH_SYM_NAME
-#ifdef CONFIG_PPC64_ELF_ABI_V1
-static inline bool arch_syscall_match_sym_name(const char *sym, const char *name)
-{
-	/* We need to skip past the initial dot, and the __se_sys alias */
-	return !strcmp(sym + 1, name) ||
-		(!strncmp(sym, ".__se_sys", 9) && !strcmp(sym + 6, name)) ||
-		(!strncmp(sym, ".ppc_", 5) && !strcmp(sym + 5, name + 4)) ||
-		(!strncmp(sym, ".ppc32_", 7) && !strcmp(sym + 7, name + 4)) ||
-		(!strncmp(sym, ".ppc64_", 7) && !strcmp(sym + 7, name + 4));
-}
-#else
 static inline bool arch_syscall_match_sym_name(const char *sym, const char *name)
 {
 	return !strcmp(sym, name) ||
@@ -83,7 +72,6 @@ static inline bool arch_syscall_match_sym_name(const char *sym, const char *name
 		(!strncmp(sym, "ppc32_", 6) && !strcmp(sym + 6, name + 4)) ||
 		(!strncmp(sym, "ppc64_", 6) && !strcmp(sym + 6, name + 4));
 }
-#endif /* CONFIG_PPC64_ELF_ABI_V1 */
 #endif /* CONFIG_FTRACE_SYSCALLS */
 
 #if defined(CONFIG_PPC64) && defined(CONFIG_FUNCTION_TRACER)
-- 
2.34.1

