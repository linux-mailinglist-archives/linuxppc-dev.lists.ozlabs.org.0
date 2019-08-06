Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 109D68357D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 17:41:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462zPQ2dZjzDr70
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 01:40:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::c41; helo=mail-yw1-xc41.google.com;
 envelope-from=leo.yan@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="ryN6Ug8N"; 
 dkim-atps=neutral
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462qsQ60CQzDr2F
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 20:01:14 +1000 (AEST)
Received: by mail-yw1-xc41.google.com with SMTP id l124so30632845ywd.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2019 03:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=X1kq35amQF0eADWBqq2tRXGYPbvo4jnAQagrNi2mP5k=;
 b=ryN6Ug8NTpg6DdZSRbeCs9SgNy9VYtFjReXZvH386JZijbFKUzuZ1IjFN+pJi8xLPk
 LukM2OHMl1jpO+jAcXDzJzG1kaH2PnG+tcT5DoqbCGgCYAsjKehsHtqdpjk7TYaP+3CV
 HZ1GbOcghRxf92Hbf1SK5LK2/I8WDRR2FVLhSdgtj7ZW3y/uM0N3UDKoHjXcgpIcRbHD
 1AYRQOWT3JC1YJ6kRjEADY9+WyGfW67uyh8F5pYDNBg65QJ+un2Ii1vzMKBODmSrobuN
 Vw2Yd3mHVNb3h8K0DrfYubyUTL2jde6CpXbbokcZVLtq5/WG2hhHq4YewOfhnaY442nK
 tnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=X1kq35amQF0eADWBqq2tRXGYPbvo4jnAQagrNi2mP5k=;
 b=Qtr+iRR12C6RuTHfvJ3bdbk3AEA8F4YQkG+V9aAmWyTxql4aB/bjJyV1fJMfNN2xc3
 /Ttx9RqklH4Y/mHi5fOiLx0hsek0I0v/AUWCAoSq0dHC3Z351bDA6/vRP/SGzxP8yBGJ
 X3Xq/HOmEbjniBsaZ7n++AQkAecY2f6iXeblJc9xmOQGKNl3GMnKQHf+OnjT5NGbQ4Od
 FIt1RyeWR8OxthYny+ATh5j+kLQfxCZyYsApUA4w6fkPP+x/z7LXC5C2ApYCK9TKIpnT
 88TfeuYjHQYG3E2cFIRg0vQjdF8lhXvREgESMcMAkhEMN+a7Zm14MO7nvDOg/bKYEgN6
 y5Zg==
X-Gm-Message-State: APjAAAUPJvWXlKcW16nocZ8RBbzmLduvnLX+bGqYFyW11NP/fdDdklBJ
 PoZZe6vUvTxnu4lqFt5fLjPhgA==
X-Google-Smtp-Source: APXvYqwIma0HV1pnR7Z1+fYCWlNvk6seDzFUGYoiNt+a7UQALBxCkV/06ohxlMAH3c2ynUJgGkffCA==
X-Received: by 2002:a81:2545:: with SMTP id l66mr1596296ywl.489.1565085671977; 
 Tue, 06 Aug 2019 03:01:11 -0700 (PDT)
Received: from localhost.localdomain (li1322-146.members.linode.com.
 [45.79.223.146])
 by smtp.gmail.com with ESMTPSA id h12sm18316685ywm.91.2019.08.06.03.01.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 03:01:11 -0700 (PDT)
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
Subject: [PATCH v2 2/3] arm64: Add support for function error injection
Date: Tue,  6 Aug 2019 18:00:14 +0800
Message-Id: <20190806100015.11256-3-leo.yan@linaro.org>
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

Inspired by the commit 7cd01b08d35f ("powerpc: Add support for function
error injection"), this patch supports function error injection for
Arm64.

This patch mainly support two functions: one is regs_set_return_value()
which is used to overwrite the return value; the another function is
override_function_with_return() which is to override the probed
function returning and jump to its caller.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/Kconfig              |  1 +
 arch/arm64/include/asm/ptrace.h |  5 +++++
 arch/arm64/lib/Makefile         |  2 ++
 arch/arm64/lib/error-inject.c   | 18 ++++++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 arch/arm64/lib/error-inject.c

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 3adcec05b1f6..b15803afb2a0 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -148,6 +148,7 @@ config ARM64
 	select HAVE_FAST_GUP
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_FUNCTION_TRACER
+	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_GCC_PLUGINS
 	select HAVE_HW_BREAKPOINT if PERF_EVENTS
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index b1dd039023ef..891b9995cb4b 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -301,6 +301,11 @@ static inline unsigned long regs_return_value(struct pt_regs *regs)
 	return regs->regs[0];
 }
 
+static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
+{
+	regs->regs[0] = rc;
+}
+
 /**
  * regs_get_kernel_argument() - get Nth function argument in kernel
  * @regs:	pt_regs of that context
diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 33c2a4abda04..f182ccb0438e 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -33,3 +33,5 @@ UBSAN_SANITIZE_atomic_ll_sc.o	:= n
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
 
 obj-$(CONFIG_CRC32) += crc32.o
+
+obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
diff --git a/arch/arm64/lib/error-inject.c b/arch/arm64/lib/error-inject.c
new file mode 100644
index 000000000000..ed15021da3ed
--- /dev/null
+++ b/arch/arm64/lib/error-inject.c
@@ -0,0 +1,18 @@
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
+	 * When kprobe returns back from exception it will override the end
+	 * of probed function and directly return to the predefined
+	 * function's caller.
+	 */
+	instruction_pointer_set(regs, procedure_link_pointer(regs));
+}
+NOKPROBE_SYMBOL(override_function_with_return);
-- 
2.17.1

