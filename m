Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD6383580
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 17:42:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462zRD6znPzDr69
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 01:42:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::b43; helo=mail-yb1-xb43.google.com;
 envelope-from=leo.yan@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="NcmXSNcy"; 
 dkim-atps=neutral
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462qsc4SggzDr27
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 20:01:24 +1000 (AEST)
Received: by mail-yb1-xb43.google.com with SMTP id d9so24009048ybf.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2019 03:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SpJEkhv16jwVLO2sSfJ7SapVMbBMCm5PIZfy4pO40/c=;
 b=NcmXSNcyQXDjk3UYlgYN76nvMxC7M92+xGOU6qJ+B27Ib4OnaFsQUE4R4i6AgQ5Z27
 CrVPGUgZwTFsH/qOmNAZIQ9t8+tJQYLJRYwOgyGPNBTtVtV2+jhG318/V8R4JQ79LBji
 IXJFOhESxve1HFswgRG5nTJ/blfxFcD16f8zz9LuhnDFQEGvMLmUBnqt1xPDTPxTR3F2
 UHxlkCaew7fGYGA1NWH+bEsjzPS8fNmBKA8ge4sydhn43kds0Br7aJqOw8nsgys43bqq
 +XxhHjPci5pdYEoWKUtlQUEsK7RtCbrhP00EmAXuXadm7JEFV+so2h2c2OMhdTF7sOr/
 uDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SpJEkhv16jwVLO2sSfJ7SapVMbBMCm5PIZfy4pO40/c=;
 b=ChP+iRC4soGgKylSespskAiNEeqsdvKR98l/l30JoJiu/16tpyvkBGU93g9+0EDsru
 dQoFmydJw6mmU01H1kFt1mh4HKV2lMj7n9NubGmANZGZPQFxV2HGgMoislUJAHmLC1WM
 ZDO5rdnOChOknTx+6CI/N0IVwWOxkxMq31+1du8qCp3PagEIzGKXuPRktSljSO1lGKpD
 EmFk/sECoDiWgsJPe9yoH7t8oB2G+WCRmNvP/B+5wY8hojNZQ+TF3x26bEgihYs38FW1
 znl7gOUHGgfcWKewLBqG2rxxRsfd9IYO7ff9BC+Un7O+5+uEmETVkfzPFUak+C2skOgX
 CwVw==
X-Gm-Message-State: APjAAAUwVM2lXA29AJkk84sz6kZOOkjRuqxn5BamdgDUF2izMpGNCvT5
 4Hko71QxYYj7KrT4oRrSKMQrtw==
X-Google-Smtp-Source: APXvYqwTAorLnL1JJGzrv713O0sksEZzjbqxPPlxmNn5n95Bw8aIX/crRrWGGgZ7Emh+mOBZG+hc4w==
X-Received: by 2002:a25:1a82:: with SMTP id a124mr1799776yba.160.1565085681984; 
 Tue, 06 Aug 2019 03:01:21 -0700 (PDT)
Received: from localhost.localdomain (li1322-146.members.linode.com.
 [45.79.223.146])
 by smtp.gmail.com with ESMTPSA id h12sm18316685ywm.91.2019.08.06.03.01.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 03:01:21 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: Russell King <linux@armlinux.org.uk>, Oleg Nesterov <oleg@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org,
 clang-built-linux@googlegroups.com, Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH v2 3/3] arm: Add support for function error injection
Date: Tue,  6 Aug 2019 18:00:15 +0800
Message-Id: <20190806100015.11256-4-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806100015.11256-1-leo.yan@linaro.org>
References: <20190806100015.11256-1-leo.yan@linaro.org>
X-Mailman-Approved-At: Wed, 07 Aug 2019 01:35:31 +1000
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
Cc: Leo Yan <leo.yan@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch implements arm specific functions regs_set_return_value() and
override_function_with_return() to support function error injection.

In the exception flow, it updates pt_regs::ARM_pc with pt_regs::ARM_lr
so can override the probed function return.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm/Kconfig              |  1 +
 arch/arm/include/asm/ptrace.h |  5 +++++
 arch/arm/lib/Makefile         |  2 ++
 arch/arm/lib/error-inject.c   | 19 +++++++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 arch/arm/lib/error-inject.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 33b00579beff..2d3d44a037f6 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -77,6 +77,7 @@ config ARM
 	select HAVE_EXIT_THREAD
 	select HAVE_FAST_GUP if ARM_LPAE
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
+	select HAVE_FUNCTION_ERROR_INJECTION if !THUMB2_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER if !THUMB2_KERNEL && !CC_IS_CLANG
 	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
 	select HAVE_GCC_PLUGINS
diff --git a/arch/arm/include/asm/ptrace.h b/arch/arm/include/asm/ptrace.h
index 91d6b7856be4..3b41f37b361a 100644
--- a/arch/arm/include/asm/ptrace.h
+++ b/arch/arm/include/asm/ptrace.h
@@ -89,6 +89,11 @@ static inline long regs_return_value(struct pt_regs *regs)
 	return regs->ARM_r0;
 }
 
+static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
+{
+	regs->ARM_r0 = rc;
+}
+
 #define instruction_pointer(regs)	(regs)->ARM_pc
 
 #ifdef CONFIG_THUMB2_KERNEL
diff --git a/arch/arm/lib/Makefile b/arch/arm/lib/Makefile
index b25c54585048..8f56484a7156 100644
--- a/arch/arm/lib/Makefile
+++ b/arch/arm/lib/Makefile
@@ -42,3 +42,5 @@ ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
   CFLAGS_xor-neon.o		+= $(NEON_FLAGS)
   obj-$(CONFIG_XOR_BLOCKS)	+= xor-neon.o
 endif
+
+obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
diff --git a/arch/arm/lib/error-inject.c b/arch/arm/lib/error-inject.c
new file mode 100644
index 000000000000..2d696dc94893
--- /dev/null
+++ b/arch/arm/lib/error-inject.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/error-injection.h>
+#include <linux/kprobes.h>
+
+void override_function_with_return(struct pt_regs *regs)
+{
+	/*
+	 * 'regs' represents the state on entry of a predefined function in
+	 * the kernel/module and which is captured on a kprobe.
+	 *
+	 * 'regs->ARM_lr' contains the the link register for the probed
+	 * function, when kprobe returns back from exception it will override
+	 * the end of probed function and directly return to the predefined
+	 * function's caller.
+	 */
+	instruction_pointer_set(regs, regs->ARM_lr);
+}
+NOKPROBE_SYMBOL(override_function_with_return);
-- 
2.17.1

