Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 978CC42FAE0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 20:21:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWF2S1JJfz3cB1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 05:21:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=a1n/=pd=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWF210K3Sz3bmr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 05:20:41 +1100 (AEDT)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5A1960FF2;
 Fri, 15 Oct 2021 18:20:35 +0000 (UTC)
Date: Fri, 15 Oct 2021 14:20:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <20211015142033.72605b47@gandalf.local.home>
In-Reply-To: <20211015180429.GK174703@worktop.programming.kicks-ass.net>
References: <20211015110035.14813389@gandalf.local.home>
 <20211015161702.GF174703@worktop.programming.kicks-ass.net>
 <20211015133504.6c0a9fcc@gandalf.local.home>
 <20211015135806.72d1af23@gandalf.local.home>
 <20211015180429.GK174703@worktop.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, Jisheng Zhang <jszhang@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org,
 linux-riscv@lists.infradead.org, Miroslav Benes <mbenes@suse.cz>,
 Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jiri Kosina <jikos@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Guo Ren <guoren@kernel.org>,
 Colin Ian King <colin.king@canonical.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 15 Oct 2021 20:04:29 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Fri, Oct 15, 2021 at 01:58:06PM -0400, Steven Rostedt wrote:
> > Something like this:  
> 
> I think having one copy of that in a header is better than having 3
> copies. But yes, something along them lines.

I was just about to ask you about this patch ;-)

diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 4d244e295e85..a6ae329aa654 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -74,6 +74,27 @@
  */
 #define FORK_PREEMPT_COUNT	(2*PREEMPT_DISABLE_OFFSET + PREEMPT_ENABLED)
 
+/**
+ * interrupt_context_level - return interrupt context level
+ *
+ * Returns the current interrupt context level.
+ *  0 - normal context
+ *  1 - softirq context
+ *  2 - hardirq context
+ *  3 - NMI context
+ */
+static __always_inline unsigned char interrupt_context_level(void)
+{
+	unsigned long pc = preempt_count();
+	unsigned char level = 0;
+
+	level += !!(pc & (NMI_MASK));
+	level += !!(pc & (NMI_MASK | HARDIRQ_MASK));
+	level += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));
+
+	return level;
+}
+
 /* preempt_count() and related functions, depends on PREEMPT_NEED_RESCHED */
 #include <asm/preempt.h>
 
diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
index 41f5bfd9e93f..018a04381556 100644
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@ -118,12 +118,7 @@ enum {
 
 static __always_inline int trace_get_context_bit(void)
 {
-	unsigned long pc = preempt_count();
-	unsigned char bit = 0;
-
-	bit += !!(pc & (NMI_MASK));
-	bit += !!(pc & (NMI_MASK | HARDIRQ_MASK));
-	bit += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));
+	unsigned char bit = interrupt_context_level();
 
 	return TRACE_CTX_NORMAL - bit;
 }
diff --git a/kernel/events/internal.h b/kernel/events/internal.h
index 228801e20788..c91711f20cf8 100644
--- a/kernel/events/internal.h
+++ b/kernel/events/internal.h
@@ -206,11 +206,7 @@ DEFINE_OUTPUT_COPY(__output_copy_user, arch_perf_out_copy_user)
 static inline int get_recursion_context(int *recursion)
 {
 	unsigned int pc = preempt_count();
-	unsigned char rctx = 0;
-
-	rctx += !!(pc & (NMI_MASK));
-	rctx += !!(pc & (NMI_MASK | HARDIRQ_MASK));
-	rctx += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));
+	unsigned char rctx = interrupt_context_level();
 
 	if (recursion[rctx])
 		return -1;
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 15d4380006e3..f6520d0a4c8c 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -3167,12 +3167,7 @@ static __always_inline int
 trace_recursive_lock(struct ring_buffer_per_cpu *cpu_buffer)
 {
 	unsigned int val = cpu_buffer->current_context;
-	unsigned long pc = preempt_count();
-	int bit = 0;
-
-	bit += !!(pc & (NMI_MASK));
-	bit += !!(pc & (NMI_MASK | HARDIRQ_MASK));
-	bit += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));
+	int bit = interrupt_context_level();
 
 	bit = RB_CTX_NORMAL - bit;
 
