Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BAA64A976
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 22:23:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWF3Z6xFcz3c5x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 08:23:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=BsZFNue+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=2607:5300:203:b2ee::31e5; helo=smtpout.efficios.com; envelope-from=mjeanson@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=BsZFNue+;
	dkim-atps=neutral
Received: from smtpout.efficios.com (unknown [IPv6:2607:5300:203:b2ee::31e5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWF2c6vBmz2xJR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 08:22:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1670880139;
	bh=MfeYHQzyOlT34kYKFTJxccdrS9elMsOedO/9gqQJCOE=;
	h=From:To:Cc:Subject:Date:From;
	b=BsZFNue+6sXIVadDiRdp7SSxWXnmSYjxDsIr4T4wl0EDNL7AkgqKFqKcYDIrs3yZK
	 poluTM9F+d9FXQlr9GXEXwDd3/EOKWcgFXu3G/ReTDLrKYe0qJzTwfjgY5TCx2X9KQ
	 6uI69FCBRdgFhJI94cEy4pOGd2DTmu9mn1VxRrlTk9Yg5gdGH6W2WRlf7bTobYID/G
	 8YIrv5NQKJHRf+UPEocp5aFpFBr1xicl6VX0mgeF6EwHAocnr2E5ABrG35Pfz6Bd9K
	 /TJRpE17LREOVvdzu1tLJXeNDlgvj6gXxbcA5DIDeEEl3HTVEg6N0fhHtVcDmY3S7t
	 yXH24ThUNZo4Q==
Received: from laptop-mjeanson.internal.efficios.com (192-222-180-24.qc.cable.ebox.net [192.222.180.24])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4NWF2M6FSfzbXN;
	Mon, 12 Dec 2022 16:22:19 -0500 (EST)
From: Michael Jeanson <mjeanson@efficios.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] Syscall tracing on PPC64_ELF_ABI_V1 without KALLSYMS_ALL
Date: Mon, 12 Dec 2022 16:21:59 -0500
Message-Id: <20221212212159.3435046-1-mjeanson@efficios.com>
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
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Michael Jeanson <mjeanson@efficios.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In ad050d2390fccb22aa3e6f65e11757ce7a5a7ca5 we fixed ftrace syscall
tracing on PPC64_ELF_ABI_V1 by looking for the non-dot prefixed symbol
of a syscall.

Ftrace uses kallsyms to locate syscall symbols and those non-dot
prefixed symbols reside in a separate '.opd' section which is not
included by kallsyms.

So we either need to have FTRACE_SYSCALLS select KALLSYMS_ALL on
PPC64_ELF_ABI_V1 or add the '.opd' section symbols to kallsyms.

This patch does the minimum to achieve the latter, it's tested on a
corenet64_smp_defconfig with KALLSYMS_ALL turned off.

I'm unsure which of the alternatives would be better.

---
In 'kernel/module/kallsyms.c' the 'is_core_symbol' function might also
require some tweaking to make all opd symbols available to kallsyms but
that doesn't impact ftrace syscall tracing.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
---
 include/asm-generic/sections.h | 14 ++++++++++++++
 include/linux/kallsyms.h       |  3 +++
 kernel/kallsyms.c              |  2 ++
 scripts/kallsyms.c             |  1 +
 4 files changed, 20 insertions(+)

diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
index db13bb620f52..1410566957e5 100644
--- a/include/asm-generic/sections.h
+++ b/include/asm-generic/sections.h
@@ -180,6 +180,20 @@ static inline bool is_kernel_rodata(unsigned long addr)
 	       addr < (unsigned long)__end_rodata;
 }
 
+/**
+ * is_kernel_opd - checks if the pointer address is located in the
+ *                 .opd section
+ *
+ * @addr: address to check
+ *
+ * Returns: true if the address is located in .opd, false otherwise.
+ */
+static inline bool is_kernel_opd(unsigned long addr)
+{
+	return addr >= (unsigned long)__start_opd &&
+	       addr < (unsigned long)__end_opd;
+}
+
 /**
  * is_kernel_inittext - checks if the pointer address is located in the
  *                      .init.text section
diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index 649faac31ddb..9bfb4d8d41a5 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -43,6 +43,9 @@ static inline int is_ksym_addr(unsigned long addr)
 	if (IS_ENABLED(CONFIG_KALLSYMS_ALL))
 		return is_kernel(addr);
 
+	if (IS_ENABLED(CONFIG_HAVE_FUNCTION_DESCRIPTORS))
+		return is_kernel_text(addr) || is_kernel_inittext(addr) || is_kernel_opd(addr);
+
 	return is_kernel_text(addr) || is_kernel_inittext(addr);
 }
 
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 60c20f301a6b..009b1ca21618 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -281,6 +281,8 @@ static unsigned long get_symbol_pos(unsigned long addr,
 			symbol_end = (unsigned long)_einittext;
 		else if (IS_ENABLED(CONFIG_KALLSYMS_ALL))
 			symbol_end = (unsigned long)_end;
+		else if (IS_ENABLED(CONFIG_HAVE_FUNCTION_DESCRIPTORS) && is_kernel_opd(addr))
+			symbol_end = (unsigned long)__end_opd;
 		else
 			symbol_end = (unsigned long)_etext;
 	}
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 03fa07ad45d9..decf31c497f5 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -64,6 +64,7 @@ static unsigned long long relative_base;
 static struct addr_range text_ranges[] = {
 	{ "_stext",     "_etext"     },
 	{ "_sinittext", "_einittext" },
+	{ "__start_opd", "__end_opd" },
 };
 #define text_range_text     (&text_ranges[0])
 #define text_range_inittext (&text_ranges[1])
-- 
2.34.1

