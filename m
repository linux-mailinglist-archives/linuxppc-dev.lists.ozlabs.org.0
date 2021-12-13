Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D411B4732C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 18:16:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCSpG60btz3c9V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 04:16:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=srs0=gc06=q6=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCSnr65Zmz2yMc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 04:15:44 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7FEE7B8119C;
 Mon, 13 Dec 2021 17:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F6FC34602;
 Mon, 13 Dec 2021 17:15:38 +0000 (UTC)
Date: Mon, 13 Dec 2021 12:15:36 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 0/5] Implement livepatch on PPC32
Message-ID: <20211213121536.25e5488d@gandalf.local.home>
In-Reply-To: <6209682d-0caa-b779-8763-376a984d8ed8@csgroup.eu>
References: <cover.1635423081.git.christophe.leroy@csgroup.eu>
 <20211028093547.48c69dfe@gandalf.local.home>
 <6209682d-0caa-b779-8763-376a984d8ed8@csgroup.eu>
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jiri Kosina <jikos@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>, "Naveen
 N . Rao" <naveen.n.rao@linux.vnet.ibm.com>, Miroslav Benes <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Dec 2021 14:39:15 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> > Note, you can implement this first, (I looked over the patches and they
> > seem fine) and then update both ppc64 and ppc32 to implement
> > DYNAMIC_FTRACE_WITH_ARGS.
> >   
> 
> I tried to activate DYNAMIC_FTRACE_WITH_ARGS on PPC32.
> 
> I copied into powerpc the changes from 5740a7c71ab6 ("s390/ftrace: add 
> HAVE_DYNAMIC_FTRACE_WITH_ARGS support")
> 
> Ftrace selftests tell "Testing tracer function_graph: FAILED!".
> 
> Is there anything else to do ?

Yes. Because BPF is now hooking into the function callbacks, it causes
issues with function graph tracer. So what we did was to have function
graph tracing to now use the function tracer callback as well (this allows
both the BPF direct trampolines to work with function graph tracer).

As it requires DYNAMIC_FTRACE_WITH_ARGS, and x86 was the only one to
support that for now, I decided to make all the archs change function graph
tracing when they implement DYNAMIC_FTRACE_WITH_ARGS too. (It is becoming a
pain to have too many variants of function tracing between the archs).

The change that did this for x86 was:

0c0593b45c9b4 ("x86/ftrace: Make function graph use ftrace directly")

This actually simplifies the function graph tracer, as you no longer need
it's own entry trampoline (still need the trampoline for the return of the
function).

What you need to do is:

In your arch/*/include/asm/ftrace.h add:

struct ftrace_ops;

#define ftrace_graph_func ftrace_graph_func
void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
                      struct ftrace_ops *op, struct ftrace_regs *fregs);


Where ftrace_graph_func() is now what is called for the function graph
tracer, directly from the ftrace callbacks (no longer a secondary
trampoline).

Define the ftrace_graph_func() to be something like:

void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
                      struct ftrace_ops *op, struct ftrace_regs *fregs)
{
       struct pt_regs *regs = &fregs->regs;
       unsigned long *stack = (unsigned long *)kernel_stack_pointer(regs);

       prepare_ftrace_return(ip, (unsigned long *)stack, 0);
}

This is called by the function tracer code. But because with
DYNAMIC_FTRACE_WITH_ARGS, we have access to the argument register, we should
also have access to the link register and the stack. Then you can use that
to modify the stack and or link register to jump to the the return
trampoline.

This should all work with powerpc (both 64 and 32) but if it does not, let
me know. I'm happy to help out.

-- Steve
