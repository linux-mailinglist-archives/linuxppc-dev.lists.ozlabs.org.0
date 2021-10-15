Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D7B42FAA3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 19:58:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWDXY3ctKz3cG3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 04:58:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=a1n/=pd=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWDX661QHz2xfw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 04:58:14 +1100 (AEDT)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF98C60F93;
 Fri, 15 Oct 2021 17:58:08 +0000 (UTC)
Date: Fri, 15 Oct 2021 13:58:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <20211015135806.72d1af23@gandalf.local.home>
In-Reply-To: <20211015133504.6c0a9fcc@gandalf.local.home>
References: <20211015110035.14813389@gandalf.local.home>
 <20211015161702.GF174703@worktop.programming.kicks-ass.net>
 <20211015133504.6c0a9fcc@gandalf.local.home>
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

On Fri, 15 Oct 2021 13:35:04 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Fri, 15 Oct 2021 18:17:02 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > On Fri, Oct 15, 2021 at 11:00:35AM -0400, Steven Rostedt wrote:  
> > > From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> > > 
> > > While writing an email explaining the "bit = 0" logic for a discussion on    
> >   
> > >  	bit = trace_get_context_bit() + start;    
> > 
> > While there, you were also going to update that function to match/use
> > get_recursion_context(). Because your version is still branch hell.  
> 
> That would probably be a separate patch. This is just a fix to a design
> flaw, changing the context tests would be performance enhancement.
> 
> Thanks for the reminder (as it was on my todo list to update that code).

Something like this:

From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: [PATCH] tracing: Reuse logic from perf's get_recursion_context()

Instead of having branches that adds noise to the branch prediction, use
the addition logic to set the bit for the level of interrupt context that
the state is currently in. This copies the logic from perf's
get_recursion_context() function.

Link: https://lore.kernel.org/all/20211015161702.GF174703@worktop.programming.kicks-ass.net/

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 include/linux/trace_recursion.h | 11 ++++++-----
 kernel/trace/ring_buffer.c      | 12 ++++++------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
index 168fdf07419a..41f5bfd9e93f 100644
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@ -119,12 +119,13 @@ enum {
 static __always_inline int trace_get_context_bit(void)
 {
 	unsigned long pc = preempt_count();
+	unsigned char bit = 0;
 
-	if (!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET)))
-		return TRACE_CTX_NORMAL;
-	else
-		return pc & NMI_MASK ? TRACE_CTX_NMI :
-			pc & HARDIRQ_MASK ? TRACE_CTX_IRQ : TRACE_CTX_SOFTIRQ;
+	bit += !!(pc & (NMI_MASK));
+	bit += !!(pc & (NMI_MASK | HARDIRQ_MASK));
+	bit += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));
+
+	return TRACE_CTX_NORMAL - bit;
 }
 
 #ifdef CONFIG_FTRACE_RECORD_RECURSION
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index c5a3fbf19617..15d4380006e3 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -3168,13 +3168,13 @@ trace_recursive_lock(struct ring_buffer_per_cpu *cpu_buffer)
 {
 	unsigned int val = cpu_buffer->current_context;
 	unsigned long pc = preempt_count();
-	int bit;
+	int bit = 0;
 
-	if (!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET)))
-		bit = RB_CTX_NORMAL;
-	else
-		bit = pc & NMI_MASK ? RB_CTX_NMI :
-			pc & HARDIRQ_MASK ? RB_CTX_IRQ : RB_CTX_SOFTIRQ;
+	bit += !!(pc & (NMI_MASK));
+	bit += !!(pc & (NMI_MASK | HARDIRQ_MASK));
+	bit += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));
+
+	bit = RB_CTX_NORMAL - bit;
 
 	if (unlikely(val & (1 << (bit + cpu_buffer->nest)))) {
 		/*
-- 
2.31.1

