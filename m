Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB2D43E262
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 15:36:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg65p3ftMz3cCT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 00:36:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=tr8k=pq=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg65P3T8Sz2xXm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 00:35:53 +1100 (AEDT)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFF5261038;
 Thu, 28 Oct 2021 13:35:49 +0000 (UTC)
Date: Thu, 28 Oct 2021 09:35:47 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 0/5] Implement livepatch on PPC32
Message-ID: <20211028093547.48c69dfe@gandalf.local.home>
In-Reply-To: <cover.1635423081.git.christophe.leroy@csgroup.eu>
References: <cover.1635423081.git.christophe.leroy@csgroup.eu>
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
 Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 live-patching@vger.kernel.org, "Naveen
 N . Rao" <naveen.n.rao@linux.vnet.ibm.com>, Miroslav Benes <mbenes@suse.cz>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 28 Oct 2021 14:24:00 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> This series implements livepatch on PPC32.
> 
> This is largely copied from what's done on PPC64.
> 
> Christophe Leroy (5):
>   livepatch: Fix build failure on 32 bits processors
>   powerpc/ftrace: No need to read LR from stack in _mcount()
>   powerpc/ftrace: Add module_trampoline_target() for PPC32
>   powerpc/ftrace: Activate HAVE_DYNAMIC_FTRACE_WITH_REGS on PPC32
>   powerpc/ftrace: Add support for livepatch to PPC32
> 
>  arch/powerpc/Kconfig                  |   2 +-
>  arch/powerpc/include/asm/livepatch.h  |   4 +-
>  arch/powerpc/kernel/module_32.c       |  33 +++++
>  arch/powerpc/kernel/trace/ftrace.c    |  53 +++-----
>  arch/powerpc/kernel/trace/ftrace_32.S | 187 ++++++++++++++++++++++++--
>  kernel/livepatch/core.c               |   4 +-
>  6 files changed, 230 insertions(+), 53 deletions(-)
> 

This is great that you are doing this, but I wonder if it would even be
easier, and more efficient, if you could implement
HAVE_DYNAMIC_FTRACE_WITH_ARGS?

Then you don't need to save all regs for live kernel patching. And I am
also working on function tracing with arguments with this too.

That is, to call a generic ftrace callback, you need to save all the args
that are stored in registers to prevent the callback from clobbering them.
As live kernel patching only needs to have the arguments of the functions,
you save time from having to save the other regs as well.

The callbacks now have "struct ftrace_regs" instead of pt_regs, because it
will allow non ftrace_regs_caller functions to access the arguments if it
is supported.

Look at how x86_64 implements this. It should be possible to do this for
all other archs as well.

Also note, by doing this, we can then get rid of the ftrace_graph_caller,
and have function graph tracer be a function tracing callback, as it will
allow ftrace_graph_caller to have access to the stack and the return as
well.

If you need any more help or information to do this, I'd be happy to assist
you.

Note, you can implement this first, (I looked over the patches and they
seem fine) and then update both ppc64 and ppc32 to implement
DYNAMIC_FTRACE_WITH_ARGS.

Cheers,

-- Steve
