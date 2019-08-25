Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 069E39C434
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Aug 2019 15:55:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Gc8b1wdkzDqjQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Aug 2019 23:55:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=changbin.du@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XlOYWrX8"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GbTT3DtSzDqfc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 23:24:45 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id o13so8737663pgp.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 06:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ABqbUOb9yTlWBycLA+vVgy10aa3RFNPi90+kbWnXnj4=;
 b=XlOYWrX84QfUGfxVujtYSDLQjkO2n+X/V1vEeWQMWM0vBDv5dZmYayL7ewK9/lbe5f
 puws9gxnBBL3ZtW3KScqzRc6gHb1KEsyl2y4yQhDyRG12zSj06u/4BhqS6ynaWZhcInC
 Jp4HYYwgNMLWg2Ghh9y1+QkLbuG/aRj1cGJLC2LO3yJRuIkfwU5za3pe3qi4aGcuhY2k
 7OebOSPIuR/+smUIR4lMDKkb/t7HmfEDAj3+b1z7UddF8v1iR7b851xb4Zpfzt15eWOb
 SR2YAFMULehg2fpkKPwipTt84L1s26e4zUxtTuEXMUwo8IfVPP0ODxn+3EWkpC+gdOC1
 eAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ABqbUOb9yTlWBycLA+vVgy10aa3RFNPi90+kbWnXnj4=;
 b=Z1whNR7BE477E52r6w+hn/rOvAsx99INPaxtTWrqkYpCazNNy1CesE9aQlp4+U+2tT
 RDeex9omsud+J1dV4a9QfjnrUz9q+PXvvuKmOHiHkfAVhx65rblcyZiRATdL3Oarok9L
 YcbwDcrHpL0hG+/IKXxZvRnfbCVvsWAjARy0NwnMt05oalH1hGQMIv3A2lyzUiwYUKFC
 FUK883JXzZR1OzD+ma8jh59zELtkb1TzYuAFT1pekhZZGDayRTvMeRDVve207mCT2F2j
 oz6aX8SAqkCi/CnCe+1PGDoS/niv1gKut/KiLOMVXpSOdG8ryh6z+DdYQVEGI1XuYtWh
 c2gA==
X-Gm-Message-State: APjAAAX9s0xAYK9xwJhdKeVlCrr4rTAFvFliL8MXiuhcjdD7lklpIDvp
 RNTOdjsw0HvAGmbYKe3FlOE=
X-Google-Smtp-Source: APXvYqyBC/JTyOCCBr2L81Di8jkyCQ7yEHU7nHNyqfLhe02b3ofAjzg1rsOUutsL2IFiJsmTOyG3Yg==
X-Received: by 2002:a63:69c1:: with SMTP id
 e184mr11615522pgc.198.1566739482405; 
 Sun, 25 Aug 2019 06:24:42 -0700 (PDT)
Received: from localhost.localdomain ([149.28.153.17])
 by smtp.gmail.com with ESMTPSA id y23sm11076562pfr.86.2019.08.25.06.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2019 06:24:42 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Subject: [PATCH 07/11] ftrace: prepare arch specific interfaces for function
 prototype feature
Date: Sun, 25 Aug 2019 21:23:26 +0800
Message-Id: <20190825132330.5015-8-changbin.du@gmail.com>
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

To record function parameter and return value, we need the arch specific
code to pass the saved register context. It is only valid if the
CONFIG_FTRACE_FUNC_PROTOTYPE feature is enabled. This patch only changes
the interfaces, real implementation will be added later.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 arch/arm/kernel/ftrace.c             |  2 +-
 arch/arm64/kernel/ftrace.c           |  2 +-
 arch/csky/kernel/ftrace.c            |  2 +-
 arch/microblaze/kernel/ftrace.c      |  2 +-
 arch/mips/kernel/ftrace.c            |  2 +-
 arch/nds32/kernel/ftrace.c           |  5 +++--
 arch/parisc/kernel/ftrace.c          |  2 +-
 arch/powerpc/kernel/trace/ftrace.c   |  2 +-
 arch/riscv/kernel/ftrace.c           |  2 +-
 arch/s390/kernel/ftrace.c            |  2 +-
 arch/sh/kernel/ftrace.c              |  2 +-
 arch/sparc/kernel/ftrace.c           |  2 +-
 arch/x86/kernel/ftrace.c             |  2 +-
 include/linux/ftrace.h               | 10 +++++++---
 kernel/trace/fgraph.c                | 21 +++++++++++++++------
 kernel/trace/ftrace.c                |  4 +++-
 kernel/trace/trace.h                 |  2 +-
 kernel/trace/trace_functions_graph.c |  2 +-
 kernel/trace/trace_irqsoff.c         |  3 ++-
 kernel/trace/trace_sched_wakeup.c    |  3 ++-
 20 files changed, 46 insertions(+), 28 deletions(-)

diff --git a/arch/arm/kernel/ftrace.c b/arch/arm/kernel/ftrace.c
index bda949fd84e8..fd01c08b2dcb 100644
--- a/arch/arm/kernel/ftrace.c
+++ b/arch/arm/kernel/ftrace.c
@@ -191,7 +191,7 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
 	old = *parent;
 	*parent = return_hooker;
 
-	if (function_graph_enter(old, self_addr, frame_pointer, NULL))
+	if (function_graph_enter(old, self_addr, frame_pointer, NULL, NULL))
 		*parent = old;
 }
 
diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index 171773257974..dc8cc516c00a 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -233,7 +233,7 @@ void prepare_ftrace_return(unsigned long self_addr, unsigned long *parent,
 	 */
 	old = *parent;
 
-	if (!function_graph_enter(old, self_addr, frame_pointer, NULL))
+	if (!function_graph_enter(old, self_addr, frame_pointer, NULL, NULL))
 		*parent = return_hooker;
 }
 
diff --git a/arch/csky/kernel/ftrace.c b/arch/csky/kernel/ftrace.c
index 44f4880179b7..5bc67f447e78 100644
--- a/arch/csky/kernel/ftrace.c
+++ b/arch/csky/kernel/ftrace.c
@@ -148,7 +148,7 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
 	old = *parent;
 
 	if (!function_graph_enter(old, self_addr,
-			*(unsigned long *)frame_pointer, parent)) {
+			*(unsigned long *)frame_pointer, parent, NULL)) {
 		/*
 		 * For csky-gcc function has sub-call:
 		 * subi	sp,	sp, 8
diff --git a/arch/microblaze/kernel/ftrace.c b/arch/microblaze/kernel/ftrace.c
index 224eea40e1ee..9722e98cd01d 100644
--- a/arch/microblaze/kernel/ftrace.c
+++ b/arch/microblaze/kernel/ftrace.c
@@ -62,7 +62,7 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr)
 		return;
 	}
 
-	if (function_graph_enter(old, self_addr, 0, NULL))
+	if (function_graph_enter(old, self_addr, 0, NULL, NULL))
 		*parent = old;
 }
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
diff --git a/arch/mips/kernel/ftrace.c b/arch/mips/kernel/ftrace.c
index 2625232bfe52..24668bf079d2 100644
--- a/arch/mips/kernel/ftrace.c
+++ b/arch/mips/kernel/ftrace.c
@@ -378,7 +378,7 @@ void prepare_ftrace_return(unsigned long *parent_ra_addr, unsigned long self_ra,
 	insns = core_kernel_text(self_ra) ? 2 : MCOUNT_OFFSET_INSNS + 1;
 	self_ra -= (MCOUNT_INSN_SIZE * insns);
 
-	if (function_graph_enter(old_parent_ra, self_ra, fp, NULL))
+	if (function_graph_enter(old_parent_ra, self_ra, fp, NULL, NULL))
 		*parent_ra_addr = old_parent_ra;
 	return;
 out:
diff --git a/arch/nds32/kernel/ftrace.c b/arch/nds32/kernel/ftrace.c
index fd2a54b8cd57..3dbf0017dfdf 100644
--- a/arch/nds32/kernel/ftrace.c
+++ b/arch/nds32/kernel/ftrace.c
@@ -217,7 +217,7 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
 
 	old = *parent;
 
-	if (!function_graph_enter(old, self_addr, frame_pointer, NULL))
+	if (!function_graph_enter(old, self_addr, frame_pointer, NULL, NULL))
 		*parent = return_hooker;
 }
 
@@ -235,7 +235,8 @@ noinline void ftrace_graph_caller(void)
 	prepare_ftrace_return(parent_ip, selfpc, frame_pointer);
 }
 
-extern unsigned long ftrace_return_to_handler(unsigned long frame_pointer);
+extern unsigned long ftrace_return_to_handler(unsigned long frame_pointer,
+					      unsigned long retval);
 void __naked return_to_handler(void)
 {
 	__asm__ __volatile__ (
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index b6fb30f2e4bf..ea02f36e4f84 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -40,7 +40,7 @@ static void __hot prepare_ftrace_return(unsigned long *parent,
 
 	old = *parent;
 
-	if (!function_graph_enter(old, self_addr, 0, NULL))
+	if (!function_graph_enter(old, self_addr, 0, NULL, NULL))
 		/* activate parisc_return_to_handler() as return point */
 		*parent = (unsigned long) &parisc_return_to_handler;
 }
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index be1ca98fce5c..78174bbb257e 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -956,7 +956,7 @@ unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip)
 
 	return_hooker = ppc_function_entry(return_to_handler);
 
-	if (!function_graph_enter(parent, ip, 0, NULL))
+	if (!function_graph_enter(parent, ip, 0, NULL, NULL))
 		parent = return_hooker;
 out:
 	return parent;
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index b94d8db5ddcc..18f836727950 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -142,7 +142,7 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
 	 */
 	old = *parent;
 
-	if (function_graph_enter(old, self_addr, frame_pointer, parent))
+	if (function_graph_enter(old, self_addr, frame_pointer, parent, NULL))
 		*parent = return_hooker;
 }
 
diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
index 1bb85f60c0dd..5021a23c5089 100644
--- a/arch/s390/kernel/ftrace.c
+++ b/arch/s390/kernel/ftrace.c
@@ -209,7 +209,7 @@ unsigned long prepare_ftrace_return(unsigned long ra, unsigned long sp,
 	if (unlikely(atomic_read(&current->tracing_graph_pause)))
 		goto out;
 	ip -= MCOUNT_INSN_SIZE;
-	if (!function_graph_enter(ra, ip, 0, (void *) sp))
+	if (!function_graph_enter(ra, ip, 0, (void *) sp), NULL)
 		ra = (unsigned long) return_to_handler;
 out:
 	return ra;
diff --git a/arch/sh/kernel/ftrace.c b/arch/sh/kernel/ftrace.c
index 1b04270e5460..3a8271993e9c 100644
--- a/arch/sh/kernel/ftrace.c
+++ b/arch/sh/kernel/ftrace.c
@@ -364,7 +364,7 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr)
 		return;
 	}
 
-	if (function_graph_enter(old, self_addr, 0, NULL))
+	if (function_graph_enter(old, self_addr, 0, NULL, NULL))
 		__raw_writel(old, parent);
 }
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
diff --git a/arch/sparc/kernel/ftrace.c b/arch/sparc/kernel/ftrace.c
index 684b84ce397f..2783185719ba 100644
--- a/arch/sparc/kernel/ftrace.c
+++ b/arch/sparc/kernel/ftrace.c
@@ -130,7 +130,7 @@ unsigned long prepare_ftrace_return(unsigned long parent,
 	if (unlikely(atomic_read(&current->tracing_graph_pause)))
 		return parent + 8UL;
 
-	if (function_graph_enter(parent, self_addr, frame_pointer, NULL))
+	if (function_graph_enter(parent, self_addr, frame_pointer, NULL, NULL))
 		return parent + 8UL;
 
 	return return_hooker;
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 024c3053dbba..a044734167af 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -1072,7 +1072,7 @@ void prepare_ftrace_return(unsigned long self_addr, unsigned long *parent,
 		return;
 	}
 
-	if (function_graph_enter(old, self_addr, frame_pointer, parent))
+	if (function_graph_enter(old, self_addr, frame_pointer, parent, NULL))
 		*parent = old;
 }
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index f5aab37a8c34..e615b5e639aa 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -757,9 +757,12 @@ struct ftrace_graph_ret {
 
 /* Type of the callback handlers for tracing function graph*/
 typedef void (*trace_func_graph_ret_t)(struct ftrace_graph_ret *); /* return */
-typedef int (*trace_func_graph_ent_t)(struct ftrace_graph_ent *); /* entry */
+/* @pt_regs is only available for CONFIG_FTRACE_FUNC_PROTOTYPE. */
+typedef int (*trace_func_graph_ent_t)(struct ftrace_graph_ent *,
+				      struct pt_regs *); /* entry */
 
-extern int ftrace_graph_entry_stub(struct ftrace_graph_ent *trace);
+int ftrace_graph_entry_stub(struct ftrace_graph_ent *trace,
+			    struct pt_regs *pt_regs);
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 
@@ -797,7 +800,8 @@ extern void return_to_handler(void);
 
 extern int
 function_graph_enter(unsigned long ret, unsigned long func,
-		     unsigned long frame_pointer, unsigned long *retp);
+		     unsigned long frame_pointer, unsigned long *retp,
+		     struct pt_regs *pt_regs);
 
 struct ftrace_ret_stack *
 ftrace_graph_get_ret_stack(struct task_struct *task, int idx);
diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index 8dfd5021b933..7451dba84fee 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -96,8 +96,13 @@ ftrace_push_return_trace(unsigned long ret, unsigned long func,
 	return 0;
 }
 
+/*
+ * Called from arch specific code. @pt_regs is only available for
+ * CONFIG_FTRACE_FUNC_PROTOTYPE.
+ */
 int function_graph_enter(unsigned long ret, unsigned long func,
-			 unsigned long frame_pointer, unsigned long *retp)
+			 unsigned long frame_pointer, unsigned long *retp,
+			 struct pt_regs *pt_regs)
 {
 	struct ftrace_graph_ent trace;
 
@@ -108,7 +113,7 @@ int function_graph_enter(unsigned long ret, unsigned long func,
 		goto out;
 
 	/* Only trace if the calling function expects to */
-	if (!ftrace_graph_entry(&trace))
+	if (!ftrace_graph_entry(&trace, pt_regs))
 		goto out_ret;
 
 	return 0;
@@ -204,9 +209,11 @@ static struct notifier_block ftrace_suspend_notifier = {
 
 /*
  * Send the trace to the ring-buffer.
+ * @retval is only available for CONFIG_FTRACE_FUNC_PROTOTYPE.
  * @return the original return address.
  */
-unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
+unsigned long ftrace_return_to_handler(unsigned long frame_pointer,
+				       unsigned long retval)
 {
 	struct ftrace_graph_ret trace;
 	unsigned long ret;
@@ -327,7 +334,8 @@ void ftrace_graph_sleep_time_control(bool enable)
 	fgraph_sleep_time = enable;
 }
 
-int ftrace_graph_entry_stub(struct ftrace_graph_ent *trace)
+int ftrace_graph_entry_stub(struct ftrace_graph_ent *trace,
+			    struct pt_regs *pt_regs)
 {
 	return 0;
 }
@@ -417,11 +425,12 @@ ftrace_graph_probe_sched_switch(void *ignore, bool preempt,
 		next->ret_stack[index].calltime += timestamp;
 }
 
-static int ftrace_graph_entry_test(struct ftrace_graph_ent *trace)
+static int ftrace_graph_entry_test(struct ftrace_graph_ent *trace,
+				   struct pt_regs *pt_regs)
 {
 	if (!ftrace_ops_test(&global_ops, trace->func, NULL))
 		return 0;
-	return __ftrace_graph_entry(trace);
+	return __ftrace_graph_entry(trace, pt_regs);
 }
 
 /*
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 438b8b47198f..a1683cc55838 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -794,7 +794,9 @@ void ftrace_graph_graph_time_control(bool enable)
 	fgraph_graph_time = enable;
 }
 
-static int profile_graph_entry(struct ftrace_graph_ent *trace)
+/* @pt_regs is only available for CONFIG_FTRACE_FUNC_PROTOTYPE. */
+static int profile_graph_entry(struct ftrace_graph_ent *trace,
+			       struct pt_regs *pt_regs)
 {
 	struct ftrace_ret_stack *ret_stack;
 
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 22433a15e340..4b31176d443e 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -737,7 +737,7 @@ void print_trace_header(struct seq_file *m, struct trace_iterator *iter);
 int trace_empty(struct trace_iterator *iter);
 
 void trace_graph_return(struct ftrace_graph_ret *trace);
-int trace_graph_entry(struct ftrace_graph_ent *trace);
+int trace_graph_entry(struct ftrace_graph_ent *trace, struct pt_regs *pt_regs);
 void set_graph_array(struct trace_array *tr);
 
 void tracing_start_cmdline_record(void);
diff --git a/kernel/trace/trace_functions_graph.c b/kernel/trace/trace_functions_graph.c
index 78af97163147..f331a9ba946d 100644
--- a/kernel/trace/trace_functions_graph.c
+++ b/kernel/trace/trace_functions_graph.c
@@ -124,7 +124,7 @@ static inline int ftrace_graph_ignore_irqs(void)
 	return in_irq();
 }
 
-int trace_graph_entry(struct ftrace_graph_ent *trace)
+int trace_graph_entry(struct ftrace_graph_ent *trace, struct pt_regs *pt_regs)
 {
 	struct trace_array *tr = graph_array;
 	struct trace_array_cpu *data;
diff --git a/kernel/trace/trace_irqsoff.c b/kernel/trace/trace_irqsoff.c
index a745b0cee5d3..513e3544a45a 100644
--- a/kernel/trace/trace_irqsoff.c
+++ b/kernel/trace/trace_irqsoff.c
@@ -172,7 +172,8 @@ static int irqsoff_display_graph(struct trace_array *tr, int set)
 	return start_irqsoff_tracer(irqsoff_trace, set);
 }
 
-static int irqsoff_graph_entry(struct ftrace_graph_ent *trace)
+static int irqsoff_graph_entry(struct ftrace_graph_ent *trace,
+			       struct pt_regs *pt_regs)
 {
 	struct trace_array *tr = irqsoff_trace;
 	struct trace_array_cpu *data;
diff --git a/kernel/trace/trace_sched_wakeup.c b/kernel/trace/trace_sched_wakeup.c
index 743b2b520d34..ce18f679930c 100644
--- a/kernel/trace/trace_sched_wakeup.c
+++ b/kernel/trace/trace_sched_wakeup.c
@@ -112,7 +112,8 @@ static int wakeup_display_graph(struct trace_array *tr, int set)
 	return start_func_tracer(tr, set);
 }
 
-static int wakeup_graph_entry(struct ftrace_graph_ent *trace)
+static int wakeup_graph_entry(struct ftrace_graph_ent *trace,
+			      struct pt_regs *pt_regs)
 {
 	struct trace_array *tr = wakeup_trace;
 	struct trace_array_cpu *data;
-- 
2.20.1

