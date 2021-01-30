Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A5C3095DB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:21:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSbwT6ccJzDqMk
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:20:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lvalAo1B; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZMC3lSxzDrTs
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:10:31 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id y10so2839205plk.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HEWAXK+x84YSg5ms7hftrng9H6mozd/eeqE/TGW8oVk=;
 b=lvalAo1Be9Yl0Zt9FSc9WFkoF7uLbay/R97S8a+yVMBstEbrTWckwtctdy9CrMys0B
 Q8yCQb/GP6+Mn0WndWT2CDhrN4xRYKZyQm6Jwqd2seIZQ3TDH5IbSVsBh9sIpRK+w/lo
 ECMx+PJCdMPf1pbDlLcsWOtGs2gVLg8c3DVICr/hlVHsnotwpx0/Pfp+x7brHo+9jdpc
 bi9Au0xy91Gl69OIFf5wkpQvptA6V/WJGT2W24A6UiGR+59rboBo8MUqfFCyFuAPROwo
 Vqz+YR4tUpyk3Qu1R+jCvXuZ0IqGe+7AyhV2+nxOiH2cmLZlbuVh0we23lOxD/ypXsZ6
 qngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HEWAXK+x84YSg5ms7hftrng9H6mozd/eeqE/TGW8oVk=;
 b=GXhvzUabb++xaEgb/JRyY88O9Yf354vSTxCLnBYIgxcaxwwRjVAvvtz4wCgS1XOmkS
 KEpmVpDkr1/sE7SzLNM0w94uw0Ekl6RzbjiGuNDRgEaSumVRHLqxpgvtoR+BmBDxw+bH
 5u/F4J8Q1SNKQoh6x+6wgh4aI0v9Ft3yo0DBFrqohSXPxmDbvCI66up+dVXALJsN9NGM
 FdhYrsLkz+YsAHf0gxJm/M/qWgFJliPYFM0dVAgQJDCi5UgcyhBBxX52Y27mStIESHlI
 GoPL461vo7j+FiVv/KtC9qBX2wkVon2bSE6lESZ/abSkxY8VR6gMxrjFx8fpAmqriAl6
 LW+g==
X-Gm-Message-State: AOAM533WtckDigL8EJajblpgp4bfKhhkv8TczK0pi6TXIPIvDVNOzI1T
 1rBiY6lCvQ+GqxH7eYb77RoimSeK2w4=
X-Google-Smtp-Source: ABdhPJw8eifcYFLokl2RYBSR9pDOYmS4muzUCv8+TunWdh67+KEx68mBcQvq1JN44UyH9K8FyoZlUw==
X-Received: by 2002:a17:902:a9c9:b029:e1:82d:75cc with SMTP id
 b9-20020a170902a9c9b02900e1082d75ccmr3906616plr.51.1612012228664; 
 Sat, 30 Jan 2021 05:10:28 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:10:28 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 26/42] powerpc: interrupt handler wrapper functions
Date: Sat, 30 Jan 2021 23:08:36 +1000
Message-Id: <20210130130852.2952424-27-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
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

