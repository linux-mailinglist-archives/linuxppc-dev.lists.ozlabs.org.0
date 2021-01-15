Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 201B12F82E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:49:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHTGQ1pwtzDsn2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 04:49:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dYZzvqKM; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRzR4gH9zDsj8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:51:47 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id n7so6376073pgg.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HEWAXK+x84YSg5ms7hftrng9H6mozd/eeqE/TGW8oVk=;
 b=dYZzvqKMqc5gmkmU/DVbSlNXfBUJ6WbK0RtevaYk35aNabjDxjJIFhf4fp6qw5eHN3
 cYjxziND7OiYIe9pm5irU/IcVcoWP+BQ3riacQ+QNP94zdmsE3JjLH1XrFVI/IlXtAqX
 ZEhmePR801ioapLWSCBRE790KiL9izsKC2QVfQ/j+BaT2QazvZ6iPyv7rPfeEDTepb5n
 B+3GLjGXi+Gq6IWu+uvy0gddv8Scx6r4Ld2+6/pAYDNK9Dnq9mOeSKzJYpn/89Ox+E+Q
 WRYn4MYNEHcuuUFjHJ1LxMJmmzy635eGnJvIqPZqPxdiMs0LIb0DTNI8txMbTmogM1Ht
 3yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HEWAXK+x84YSg5ms7hftrng9H6mozd/eeqE/TGW8oVk=;
 b=D5q0PtNuSwii++xAJ+YD2j44V7LWc6RsaBkond4XRrRh4sT9ubzFJZUvYv9luK1EP+
 N1GPPM5lH5lKLD/WSiB0HduCCRN8ROtpvek9Rl+4syYEoHNcP3ljUhITQGceayuZRnjH
 t9WTK6OJ0B1ZT9ADXCh+oha23Bs+NSn5+g3A5iXr7cSPnIWXmgAi5U9dQmp3ugb5IPZ4
 JykAnt9l09kDNV4XOzu+1euMfDMyLFuTX4+vgXts899fhh6aG0/LEK1XvZwETx+u3rxK
 7syZrQqqDazJ6JGdeF9GBdrdTeulnIebT6VLavr7pAGMCv7o8/cagL1BdalcgBqLP0HZ
 PfPA==
X-Gm-Message-State: AOAM5319kiHOwIicpZbKBVdNor98O6WE8F4ct9dJHmVpeOYMS3tQNnct
 XpsvqKgBs7dESmrs4JVL1EZa8nkKdsY=
X-Google-Smtp-Source: ABdhPJwFMHjU2Z36ZMdxFYJCHFVX4Ih0EYjUBZu7vcDfNWhO1iy4hB2myCJS8fTEvnZd7bwZJpAJmQ==
X-Received: by 2002:a63:725d:: with SMTP id c29mr8105185pgn.236.1610729505084; 
 Fri, 15 Jan 2021 08:51:45 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:51:44 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 23/39] powerpc: interrupt handler wrapper functions
Date: Sat, 16 Jan 2021 02:49:56 +1000
Message-Id: <20210115165012.1260253-24-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add wrapper functions (derived from x86 macros) for interrupt handler
functions. This allows interrupt entry code to be written in C.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 169 +++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 arch/powerpc/include/asm/interrupt.h

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
new file mode 100644
index 000000000000..5e2526aacc52
--- /dev/null
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -0,0 +1,169 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _ASM_POWERPC_INTERRUPT_H
+#define _ASM_POWERPC_INTERRUPT_H
+
+#include <linux/context_tracking.h>
+#include <asm/ftrace.h>
+
+/**
+ * DECLARE_INTERRUPT_HANDLER_RAW - Declare raw interrupt handler function
+ * @func:	Function name of the entry point
+ * @returns:	Returns a value back to asm caller
+ */
+#define DECLARE_INTERRUPT_HANDLER_RAW(func)				\
+	__visible long func(struct pt_regs *regs)
+
+/**
+ * DEFINE_INTERRUPT_HANDLER_RAW - Define raw interrupt handler function
+ * @func:	Function name of the entry point
+ * @returns:	Returns a value back to asm caller
+ *
+ * @func is called from ASM entry code.
+ *
+ * This is a plain function which does no tracing, reconciling, etc.
+ * The macro is written so it acts as function definition. Append the
+ * body with a pair of curly brackets.
+ *
+ * raw interrupt handlers must not enable or disable interrupts, or
+ * schedule, tracing and instrumentation (ftrace, lockdep, etc) would
+ * not be advisable either, although may be possible in a pinch, the
+ * trace will look odd at least.
+ *
+ * A raw handler may call one of the other interrupt handler functions
+ * to be converted into that interrupt context without these restrictions.
+ *
+ * On PPC64, _RAW handlers may return with fast_interrupt_return.
+ *
+ * Specific handlers may have additional restrictions.
+ */
+#define DEFINE_INTERRUPT_HANDLER_RAW(func)				\
+static __always_inline long ____##func(struct pt_regs *regs);		\
+									\
+__visible noinstr long func(struct pt_regs *regs)			\
+{									\
+	long ret;							\
+									\
+	ret = ____##func (regs);					\
+									\
+	return ret;							\
+}									\
+									\
+static __always_inline long ____##func(struct pt_regs *regs)
+
+/**
+ * DECLARE_INTERRUPT_HANDLER - Declare synchronous interrupt handler function
+ * @func:	Function name of the entry point
+ */
+#define DECLARE_INTERRUPT_HANDLER(func)					\
+	__visible void func(struct pt_regs *regs)
+
+/**
+ * DEFINE_INTERRUPT_HANDLER - Define synchronous interrupt handler function
+ * @func:	Function name of the entry point
+ *
+ * @func is called from ASM entry code.
+ *
+ * The macro is written so it acts as function definition. Append the
+ * body with a pair of curly brackets.
+ */
+#define DEFINE_INTERRUPT_HANDLER(func)					\
+static __always_inline void ____##func(struct pt_regs *regs);		\
+									\
+__visible noinstr void func(struct pt_regs *regs)			\
+{									\
+	____##func (regs);						\
+}									\
+									\
+static __always_inline void ____##func(struct pt_regs *regs)
+
+/**
+ * DECLARE_INTERRUPT_HANDLER_RET - Declare synchronous interrupt handler function
+ * @func:	Function name of the entry point
+ * @returns:	Returns a value back to asm caller
+ */
+#define DECLARE_INTERRUPT_HANDLER_RET(func)				\
+	__visible long func(struct pt_regs *regs)
+
+/**
+ * DEFINE_INTERRUPT_HANDLER_RET - Define synchronous interrupt handler function
+ * @func:	Function name of the entry point
+ * @returns:	Returns a value back to asm caller
+ *
+ * @func is called from ASM entry code.
+ *
+ * The macro is written so it acts as function definition. Append the
+ * body with a pair of curly brackets.
+ */
+#define DEFINE_INTERRUPT_HANDLER_RET(func)				\
+static __always_inline long ____##func(struct pt_regs *regs);		\
+									\
+__visible noinstr long func(struct pt_regs *regs)			\
+{									\
+	long ret;							\
+									\
+	ret = ____##func (regs);					\
+									\
+	return ret;							\
+}									\
+									\
+static __always_inline long ____##func(struct pt_regs *regs)
+
+/**
+ * DECLARE_INTERRUPT_HANDLER_ASYNC - Declare asynchronous interrupt handler function
+ * @func:	Function name of the entry point
+ */
+#define DECLARE_INTERRUPT_HANDLER_ASYNC(func)				\
+	__visible void func(struct pt_regs *regs)
+
+/**
+ * DEFINE_INTERRUPT_HANDLER_ASYNC - Define asynchronous interrupt handler function
+ * @func:	Function name of the entry point
+ *
+ * @func is called from ASM entry code.
+ *
+ * The macro is written so it acts as function definition. Append the
+ * body with a pair of curly brackets.
+ */
+#define DEFINE_INTERRUPT_HANDLER_ASYNC(func)				\
+static __always_inline void ____##func(struct pt_regs *regs);		\
+									\
+__visible noinstr void func(struct pt_regs *regs)			\
+{									\
+	____##func (regs);						\
+}									\
+									\
+static __always_inline void ____##func(struct pt_regs *regs)
+
+/**
+ * DECLARE_INTERRUPT_HANDLER_NMI - Declare NMI interrupt handler function
+ * @func:	Function name of the entry point
+ * @returns:	Returns a value back to asm caller
+ */
+#define DECLARE_INTERRUPT_HANDLER_NMI(func)				\
+	__visible long func(struct pt_regs *regs)
+
+/**
+ * DEFINE_INTERRUPT_HANDLER_NMI - Define NMI interrupt handler function
+ * @func:	Function name of the entry point
+ * @returns:	Returns a value back to asm caller
+ *
+ * @func is called from ASM entry code.
+ *
+ * The macro is written so it acts as function definition. Append the
+ * body with a pair of curly brackets.
+ */
+#define DEFINE_INTERRUPT_HANDLER_NMI(func)				\
+static __always_inline long ____##func(struct pt_regs *regs);		\
+									\
+__visible noinstr long func(struct pt_regs *regs)			\
+{									\
+	long ret;							\
+									\
+	ret = ____##func (regs);					\
+									\
+	return ret;							\
+}									\
+									\
+static __always_inline long ____##func(struct pt_regs *regs)
+
+#endif /* _ASM_POWERPC_INTERRUPT_H */
-- 
2.23.0

