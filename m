Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E639C43E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Aug 2019 16:00:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GcGr068hzDqH5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 00:00:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=changbin.du@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cOVJF79W"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GbTp4KWBzDqdp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 23:25:02 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id i30so9822696pfk.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 06:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JqpgoR8V6SjsIuqoJ+8NqdaMmEPfAbLAaPv+Hcgdg84=;
 b=cOVJF79WqvqKRT3ZXzzxuLNI4rbZt4lfbP6az49c1byhyK2QahOrqbSI2dB2fZhWCC
 xJCbft2VLYrbwdzXF9jIiXUwPyokyE/gLjMn6UbplIiyUIshSRGBh09bXozM15K1nsuc
 hVqsLwo8519kPAFe9mVCqIiwt6iUC7u7wKwV7QZ33C4FGl/cd3m96WtMvKbt7c4jcDwj
 QB3okZeBtzimdK2gKfpcMlyKmkszszsFr79e3wOM8/ErGZfWwWpwQlwOhcLgo9WKQzwE
 CO6qHnCy0oV9Gt51zgP/CeciV8d7/eTmq3bR5PhIONNKkekvCWxA77q6JHkEqqoviw1X
 t/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JqpgoR8V6SjsIuqoJ+8NqdaMmEPfAbLAaPv+Hcgdg84=;
 b=NfbRenU6rzhotTk0A8wTrI/S5Wob8ueVJbZ/1GVlIiZ8QaVB2nxXcn5XaDGKD64NFj
 /PhPAKP30kQaovUOjZtO/paWCjWgYbshRQInENoHUdUswexKf9JJ6ia/DUTL+4ibThRY
 QldHxohzSgE3UtX6lpx5o19qigmFH7XEd6t37RSsp+y0ZZY7vBL414wSn8EzyonTw6nY
 xy0MQ45KnvFSoB2/alu5Gc0TghLxhfQQe8AP6wfUyIupRHa4auJgsfwjNhQJvfb5+kf3
 JpnGlO/5XQMHBsqNifSFD548S4vHvxkdJ5P7NUrWsLB2w1eiJkuUo36HUFfpouwacEIn
 8atw==
X-Gm-Message-State: APjAAAWv7vQsO7ODohBqt9GH3iEquUKyNMbGAhTM3Ljr+cdH1mAlF9Wo
 GmLaGQfuqh6Q9TIjF9T+K+g=
X-Google-Smtp-Source: APXvYqwQzM/nOUwplTcnKi74XFc9NcY/wLN6wqU0HucyOEq0vc6nrliugvK9Jha3kK8nxmI1irB8+w==
X-Received: by 2002:a63:fb14:: with SMTP id o20mr11958817pgh.136.1566739498486; 
 Sun, 25 Aug 2019 06:24:58 -0700 (PDT)
Received: from localhost.localdomain ([149.28.153.17])
 by smtp.gmail.com with ESMTPSA id y23sm11076562pfr.86.2019.08.25.06.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2019 06:24:58 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Subject: [PATCH 09/11] x86_64: add function prototype recording support
Date: Sun, 25 Aug 2019 21:23:28 +0800
Message-Id: <20190825132330.5015-10-changbin.du@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190825132330.5015-1-changbin.du@gmail.com>
References: <20190825132330.5015-1-changbin.du@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-parisc@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, sparclinux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Changbin Du <changbin.du@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch implements the arch_fgraph_record_params() function for x86_64
platform and deliver the return value of function to ftrace core part.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 arch/x86/Kconfig            |  1 +
 arch/x86/kernel/ftrace.c    | 84 +++++++++++++++++++++++++++++++++++--
 arch/x86/kernel/ftrace_64.S |  4 +-
 3 files changed, 85 insertions(+), 4 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 222855cc0158..34e583bfdab8 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -31,6 +31,7 @@ config X86_64
 	select NEED_DMA_MAP_STATE
 	select SWIOTLB
 	select ARCH_HAS_SYSCALL_WRAPPER
+	select HAVE_FTRACE_FUNC_PROTOTYPE
 
 config FORCE_DYNAMIC_FTRACE
 	def_bool y
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index a044734167af..fc0a062ce762 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -31,6 +31,7 @@
 #include <asm/ftrace.h>
 #include <asm/nops.h>
 #include <asm/text-patching.h>
+#include <asm-generic/dwarf.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 
@@ -918,7 +919,8 @@ static void *addr_from_call(void *ptr)
 }
 
 void prepare_ftrace_return(unsigned long self_addr, unsigned long *parent,
-			   unsigned long frame_pointer);
+			   unsigned long frame_pointer,
+			   struct pt_regs *pt_regs);
 
 /*
  * If the ops->trampoline was not allocated, then it probably
@@ -973,6 +975,82 @@ void arch_ftrace_trampoline_free(struct ftrace_ops *ops)
 	ops->trampoline = 0;
 }
 
+#ifdef CONFIG_FTRACE_FUNC_PROTOTYPE
+void arch_fgraph_record_params(struct ftrace_graph_ent *trace,
+			       struct func_prototype *proto,
+			       struct pt_regs *pt_regs)
+{
+	int i;
+
+	trace->nr_param = min(proto->nr_param, (uint8_t)FTRACE_MAX_FUNC_PARAMS);
+
+	for (i = 0; i < trace->nr_param; i++) {
+		struct func_param *param = &proto->params[i];
+		unsigned int sz = FTRACE_PROTOTYPE_SIZE(param->type);
+		long off = (char)param->loc[1];
+		unsigned long value = 0;
+		bool good = true;
+
+		if (sz > sizeof(value)) {
+			/* Don't record value of complex type. */
+			trace->param_types[i] = param->type;
+			trace->param_values[i] = 0;
+			continue;
+		}
+
+		switch (param->loc[0]) {
+		case DW_OP_reg1:
+			value = pt_regs->dx;
+			break;
+		case DW_OP_reg2:
+			value = pt_regs->cx;
+			break;
+		case DW_OP_reg3:
+			value = pt_regs->bx;
+			break;
+		case DW_OP_reg4:
+			value = pt_regs->si;
+			break;
+		case DW_OP_reg5:
+			value = pt_regs->di;
+			break;
+		case DW_OP_reg6:
+			value = pt_regs->bp;
+			break;
+		case DW_OP_reg8:
+			value = pt_regs->r8;
+			break;
+		case DW_OP_reg9:
+			value = pt_regs->r9;
+			break;
+		case DW_OP_fbreg:
+			if (probe_kernel_read(&value,
+					(void *)pt_regs->bp + off,
+					sz))
+				good = false;
+			break;
+		case DW_OP_breg7:
+			if (probe_kernel_read(&value,
+					(void *)pt_regs->sp + off,
+					sz))
+				good = false;
+			break;
+		default:
+			/* unexpected loc expression */
+			good = false;
+		}
+
+		trace->param_names[i] = param->name;
+		if (good) {
+			trace->param_types[i] = param->type;
+			trace->param_values[i] = value;
+		} else {
+			/* set the type to 0 so we skip it when printing. */
+			trace->param_types[i] = 0;
+		}
+	}
+}
+#endif /* CONFIG_FTRACE_FUNC_PROTOTYPE */
 #endif /* CONFIG_X86_64 */
 #endif /* CONFIG_DYNAMIC_FTRACE */
 
@@ -1017,7 +1095,7 @@ int ftrace_disable_ftrace_graph_caller(void)
  * in current thread info.
  */
 void prepare_ftrace_return(unsigned long self_addr, unsigned long *parent,
-			   unsigned long frame_pointer)
+			   unsigned long frame_pointer, struct pt_regs *pt_regs)
 {
 	unsigned long old;
 	int faulted;
@@ -1072,7 +1150,7 @@ void prepare_ftrace_return(unsigned long self_addr, unsigned long *parent,
 		return;
 	}
 
-	if (function_graph_enter(old, self_addr, frame_pointer, parent, NULL))
+	if (function_graph_enter(old, self_addr, frame_pointer, parent, pt_regs))
 		*parent = old;
 }
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
diff --git a/arch/x86/kernel/ftrace_64.S b/arch/x86/kernel/ftrace_64.S
index 809d54397dba..e01d6358e859 100644
--- a/arch/x86/kernel/ftrace_64.S
+++ b/arch/x86/kernel/ftrace_64.S
@@ -289,7 +289,8 @@ ENTRY(ftrace_graph_caller)
 
 	leaq MCOUNT_REG_SIZE+8(%rsp), %rsi
 	movq $0, %rdx	/* No framepointers needed */
-	call	prepare_ftrace_return
+	movq %rsp, %rcx /* the fourth parameter */
+	call prepare_ftrace_return
 
 	restore_mcount_regs
 
@@ -304,6 +305,7 @@ ENTRY(return_to_handler)
 	movq %rax, (%rsp)
 	movq %rdx, 8(%rsp)
 	movq %rbp, %rdi
+	movq %rax, %rsi
 
 	call ftrace_return_to_handler
 
-- 
2.20.1

