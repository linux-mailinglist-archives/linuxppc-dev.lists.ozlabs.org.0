Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 465D43976A4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 17:28:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvbfS4bgsz3037
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 01:28:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=ly5d=k3=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fvbf7371fz2yZF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 01:28:31 +1000 (AEST)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5720B613AB;
 Tue,  1 Jun 2021 15:28:26 +0000 (UTC)
Date: Tue, 1 Jun 2021 11:28:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 1/6] trace/stack: Move code to save the stack trace
 into a separate function
Message-ID: <20210601112824.29c5f168@oasis.local.home>
In-Reply-To: <6a8b68f8bd64f8c16d97ef943534c639781e7f77.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
 <6a8b68f8bd64f8c16d97ef943534c639781e7f77.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: Torsten Duwe <duwe@suse.de>, Michal Suchanek <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 21 May 2021 12:18:36 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> In preparation to add support for stack tracer to powerpc, move code to
> save stack trace and to calculate the frame sizes into a separate weak
> function. Also provide access to some of the data structures used by the
> stack trace code so that architectures can update those.
> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  include/linux/ftrace.h     |  8 ++++
>  kernel/trace/trace_stack.c | 98 ++++++++++++++++++++------------------
>  2 files changed, 60 insertions(+), 46 deletions(-)
> 
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index a69f363b61bf73..8263427379f05c 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -368,10 +368,18 @@ static inline void arch_ftrace_set_direct_caller(struct pt_regs *regs,
>  
>  #ifdef CONFIG_STACK_TRACER
>  
> +#define STACK_TRACE_ENTRIES 500
> +
> +extern unsigned long stack_dump_trace[STACK_TRACE_ENTRIES];
> +extern unsigned stack_trace_index[STACK_TRACE_ENTRIES];
> +extern unsigned int stack_trace_nr_entries;
> +extern unsigned long stack_trace_max_size;
>  extern int stack_tracer_enabled;
>  
>  int stack_trace_sysctl(struct ctl_table *table, int write, void *buffer,
>  		       size_t *lenp, loff_t *ppos);
> +void stack_get_trace(unsigned long traced_ip, unsigned long *stack_ref,
> +					unsigned long stack_size, int *tracer_frame);
>  
>  /* DO NOT MODIFY THIS VARIABLE DIRECTLY! */
>  DECLARE_PER_CPU(int, disable_stack_tracer);
> diff --git a/kernel/trace/trace_stack.c b/kernel/trace/trace_stack.c
> index 63c28504205162..5b63dbd37c8c25 100644
> --- a/kernel/trace/trace_stack.c
> +++ b/kernel/trace/trace_stack.c
> @@ -19,13 +19,11 @@
>  
>  #include "trace.h"
>  
> -#define STACK_TRACE_ENTRIES 500
> +unsigned long stack_dump_trace[STACK_TRACE_ENTRIES];
> +unsigned stack_trace_index[STACK_TRACE_ENTRIES];
>  
> -static unsigned long stack_dump_trace[STACK_TRACE_ENTRIES];
> -static unsigned stack_trace_index[STACK_TRACE_ENTRIES];
> -
> -static unsigned int stack_trace_nr_entries;
> -static unsigned long stack_trace_max_size;
> +unsigned int stack_trace_nr_entries;
> +unsigned long stack_trace_max_size;
>  static arch_spinlock_t stack_trace_max_lock =
>  	(arch_spinlock_t)__ARCH_SPIN_LOCK_UNLOCKED;
>  
> @@ -152,49 +150,19 @@ static void print_max_stack(void)
>   * Although the entry function is not displayed, the first function (sys_foo)
>   * will still include the stack size of it.
>   */
> -static void check_stack(unsigned long ip, unsigned long *stack)

I just got back from PTO and have a ton of other obligations to attend
to before I can dig deeper into this. I'm not opposed to this change,
but the stack_tracer has not been getting the love that it deserves and
I think you hit one of the issues that needs to be addressed. I'm not
sure this is a PPC only issue, and would like to see if I can get more
time (or someone else can) to reevaluate the way stack tracer works,
and see if it can be made a bit more robust.

-- Steve
