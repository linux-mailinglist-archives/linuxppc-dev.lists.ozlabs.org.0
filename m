Return-Path: <linuxppc-dev+bounces-1377-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD6D9795D5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2024 10:54:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X620v0bRcz2yGY;
	Sun, 15 Sep 2024 18:54:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726390479;
	cv=none; b=duDy9LOCiTxH3a6BwtxYv6Yx56+hiL8l9Lgu2DBPKYLz+Z7PaNDGj/enGgJ+YjQUMXxl3ZdQ1ixUyIWYriXePRTLcZ5FXLMvj69UyxOpbsUEUsAqEBVyUOaYOqpg2yDsF/3xBnSHI5LpH2xmAxrhYbtDRFr4/nJWZWoZvK+cpJBlSe1YS/RibYXDgKh3vaDfNCber2NLn+q/PSBDmp1vEY0BG31NWMnzZXJM4Yuenh6ubscSgS3GmyPTY+Zf+Gbm9NgPdBQo9wWCBHJZGsB9qdAu6nQGbeG3aXbV4NjEw5cOkUtj8sZnzr/0nkwpgVNRlec0uPAg1Dk/d8T6q6iR5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726390479; c=relaxed/relaxed;
	bh=TlZ31AAai8dWg6nK2ST8Ib2FrAE9HTfOlpRGrNZ2QgU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lDdOSYpz8DU48EHh/ZHKxH0XEHoVAELTaRDM86BcyFS46xxOcmdex/foWmEDx3yw7WW6Q85mS9tWhXEURiNP6GawmqBOq+1vfUKcCh1xQ53itRFpE2ETh9z+Gn02A6myh4GDiNi3f2fOHS3VUy9SzTwHvy0r5sMo7XMgDuxgkpuK4RtcJ27ZAcoJfiBnPkMrzh40BP5Bmc3GHOT7+HSVhhZZ33sG1agJfO3emNEe6q1DvOHEqfafErzoxjFIjrpl86MX93U8KfaOSEOp6Ikeq41EnLYUgtyEosO/aQwcUPHaKWg3H+tLOlW+ifGdK+QCZwqE1YpuNHkKb1uRdnIcCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=f26y=qn=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=f26y=qn=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X620t4np3z2xdN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2024 18:54:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1E755C10BD;
	Sun, 15 Sep 2024 08:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AC0C4CEC3;
	Sun, 15 Sep 2024 08:54:32 +0000 (UTC)
Date: Sun, 15 Sep 2024 04:54:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Florent Revest
 <revest@chromium.org>, linux-trace-kernel@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Jiri
 Olsa <jolsa@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v14 05/19] function_graph: Pass ftrace_regs to retfunc
Message-ID: <20240915045428.2b7be046@rorschach.local.home>
In-Reply-To: <172615374207.133222.13117574733580053025.stgit@devnote2>
References: <172615368656.133222.2336770908714920670.stgit@devnote2>
 <172615374207.133222.13117574733580053025.stgit@devnote2>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Can I get an Acked-by from the POWERPC maintainers for this patch?

Thanks!

-- Steve

[ Note this is modifies the return side ]

On Fri, 13 Sep 2024 00:09:02 +0900
"Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:

> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Pass ftrace_regs to the fgraph_ops::retfunc(). If ftrace_regs is not
> available, it passes a NULL instead. User callback function can access
> some registers (including return address) via this ftrace_regs.
> 
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> ---
>  Changes in v8:
>   - Pass ftrace_regs to retfunc, instead of adding retregfunc.
>  Changes in v6:
>   - update to use ftrace_regs_get_return_value() because of reordering
>     patches.
>  Changes in v3:
>   - Update for new multiple fgraph.
>   - Save the return address to instruction pointer in ftrace_regs.
> ---
>  include/linux/ftrace.h               |    3 ++-
>  kernel/trace/fgraph.c                |   16 +++++++++++-----
>  kernel/trace/ftrace.c                |    3 ++-
>  kernel/trace/trace.h                 |    3 ++-
>  kernel/trace/trace_functions_graph.c |    7 ++++---
>  kernel/trace/trace_irqsoff.c         |    3 ++-
>  kernel/trace/trace_sched_wakeup.c    |    3 ++-
>  kernel/trace/trace_selftest.c        |    3 ++-
>  8 files changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 13987cd63553..e7c41d9988e1 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -1069,7 +1069,8 @@ struct fgraph_ops;
>  
>  /* Type of the callback handlers for tracing function graph*/
>  typedef void (*trace_func_graph_ret_t)(struct ftrace_graph_ret *,
> -				       struct fgraph_ops *); /* return */
> +				       struct fgraph_ops *,
> +				       struct ftrace_regs *); /* return */
>  typedef int (*trace_func_graph_ent_t)(struct ftrace_graph_ent *,
>  				      struct fgraph_ops *,
>  				      struct ftrace_regs *); /* entry */
> diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
> index 30bebe43607d..6a3e2db16aa4 100644
> --- a/kernel/trace/fgraph.c
> +++ b/kernel/trace/fgraph.c
> @@ -297,7 +297,8 @@ static int entry_run(struct ftrace_graph_ent *trace, struct fgraph_ops *ops,
>  }
>  
>  /* ftrace_graph_return set to this to tell some archs to run function graph */
> -static void return_run(struct ftrace_graph_ret *trace, struct fgraph_ops *ops)
> +static void return_run(struct ftrace_graph_ret *trace, struct fgraph_ops *ops,
> +		       struct ftrace_regs *fregs)
>  {
>  }
>  
> @@ -491,7 +492,8 @@ int ftrace_graph_entry_stub(struct ftrace_graph_ent *trace,
>  }
>  
>  static void ftrace_graph_ret_stub(struct ftrace_graph_ret *trace,
> -				  struct fgraph_ops *gops)
> +				  struct fgraph_ops *gops,
> +				  struct ftrace_regs *fregs)
>  {
>  }
>  
> @@ -787,6 +789,9 @@ __ftrace_return_to_handler(struct ftrace_regs *fregs, unsigned long frame_pointe
>  	}
>  
>  	trace.rettime = trace_clock_local();
> +	if (fregs)
> +		ftrace_regs_set_instruction_pointer(fregs, ret);
> +
>  #ifdef CONFIG_FUNCTION_GRAPH_RETVAL
>  	trace.retval = ftrace_regs_get_return_value(fregs);
>  #endif
> @@ -796,7 +801,7 @@ __ftrace_return_to_handler(struct ftrace_regs *fregs, unsigned long frame_pointe
>  #ifdef CONFIG_HAVE_STATIC_CALL
>  	if (static_branch_likely(&fgraph_do_direct)) {
>  		if (test_bit(fgraph_direct_gops->idx, &bitmap))
> -			static_call(fgraph_retfunc)(&trace, fgraph_direct_gops);
> +			static_call(fgraph_retfunc)(&trace, fgraph_direct_gops, fregs);
>  	} else
>  #endif
>  	{
> @@ -806,7 +811,7 @@ __ftrace_return_to_handler(struct ftrace_regs *fregs, unsigned long frame_pointe
>  			if (gops == &fgraph_stub)
>  				continue;
>  
> -			gops->retfunc(&trace, gops);
> +			gops->retfunc(&trace, gops, fregs);
>  		}
>  	}
>  
> @@ -956,7 +961,8 @@ void ftrace_graph_sleep_time_control(bool enable)
>   * Simply points to ftrace_stub, but with the proper protocol.
>   * Defined by the linker script in linux/vmlinux.lds.h
>   */
> -void ftrace_stub_graph(struct ftrace_graph_ret *trace, struct fgraph_ops *gops);
> +void ftrace_stub_graph(struct ftrace_graph_ret *trace, struct fgraph_ops *gops,
> +		       struct ftrace_regs *fregs);
>  
>  /* The callbacks that hook a function */
>  trace_func_graph_ret_t ftrace_graph_return = ftrace_stub_graph;
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 775040a9f541..fd6c5a50c5e5 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -840,7 +840,8 @@ static int profile_graph_entry(struct ftrace_graph_ent *trace,
>  }
>  
>  static void profile_graph_return(struct ftrace_graph_ret *trace,
> -				 struct fgraph_ops *gops)
> +				 struct fgraph_ops *gops,
> +				 struct ftrace_regs *fregs)
>  {
>  	struct ftrace_ret_stack *ret_stack;
>  	struct ftrace_profile_stat *stat;
> diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
> index 28d8ad5e31e6..f4a3f75bd916 100644
> --- a/kernel/trace/trace.h
> +++ b/kernel/trace/trace.h
> @@ -682,7 +682,8 @@ void trace_latency_header(struct seq_file *m);
>  void trace_default_header(struct seq_file *m);
>  void print_trace_header(struct seq_file *m, struct trace_iterator *iter);
>  
> -void trace_graph_return(struct ftrace_graph_ret *trace, struct fgraph_ops *gops);
> +void trace_graph_return(struct ftrace_graph_ret *trace, struct fgraph_ops *gops,
> +			struct ftrace_regs *fregs);
>  int trace_graph_entry(struct ftrace_graph_ent *trace, struct fgraph_ops *gops,
>  		      struct ftrace_regs *fregs);
>  
> diff --git a/kernel/trace/trace_functions_graph.c b/kernel/trace/trace_functions_graph.c
> index b9785fc919c9..241407000109 100644
> --- a/kernel/trace/trace_functions_graph.c
> +++ b/kernel/trace/trace_functions_graph.c
> @@ -240,7 +240,7 @@ void __trace_graph_return(struct trace_array *tr,
>  }
>  
>  void trace_graph_return(struct ftrace_graph_ret *trace,
> -			struct fgraph_ops *gops)
> +			struct fgraph_ops *gops, struct ftrace_regs *fregs)
>  {
>  	unsigned long *task_var = fgraph_get_task_var(gops);
>  	struct trace_array *tr = gops->private;
> @@ -270,7 +270,8 @@ void trace_graph_return(struct ftrace_graph_ret *trace,
>  }
>  
>  static void trace_graph_thresh_return(struct ftrace_graph_ret *trace,
> -				      struct fgraph_ops *gops)
> +				      struct fgraph_ops *gops,
> +				      struct ftrace_regs *fregs)
>  {
>  	ftrace_graph_addr_finish(gops, trace);
>  
> @@ -283,7 +284,7 @@ static void trace_graph_thresh_return(struct ftrace_graph_ret *trace,
>  	    (trace->rettime - trace->calltime < tracing_thresh))
>  		return;
>  	else
> -		trace_graph_return(trace, gops);
> +		trace_graph_return(trace, gops, fregs);
>  }
>  
>  static struct fgraph_ops funcgraph_ops = {
> diff --git a/kernel/trace/trace_irqsoff.c b/kernel/trace/trace_irqsoff.c
> index ad739d76fc86..504de7a05498 100644
> --- a/kernel/trace/trace_irqsoff.c
> +++ b/kernel/trace/trace_irqsoff.c
> @@ -208,7 +208,8 @@ static int irqsoff_graph_entry(struct ftrace_graph_ent *trace,
>  }
>  
>  static void irqsoff_graph_return(struct ftrace_graph_ret *trace,
> -				 struct fgraph_ops *gops)
> +				 struct fgraph_ops *gops,
> +				 struct ftrace_regs *fregs)
>  {
>  	struct trace_array *tr = irqsoff_trace;
>  	struct trace_array_cpu *data;
> diff --git a/kernel/trace/trace_sched_wakeup.c b/kernel/trace/trace_sched_wakeup.c
> index 23360a2700de..9ffbd9326898 100644
> --- a/kernel/trace/trace_sched_wakeup.c
> +++ b/kernel/trace/trace_sched_wakeup.c
> @@ -144,7 +144,8 @@ static int wakeup_graph_entry(struct ftrace_graph_ent *trace,
>  }
>  
>  static void wakeup_graph_return(struct ftrace_graph_ret *trace,
> -				struct fgraph_ops *gops)
> +				struct fgraph_ops *gops,
> +				struct ftrace_regs *fregs)
>  {
>  	struct trace_array *tr = wakeup_trace;
>  	struct trace_array_cpu *data;
> diff --git a/kernel/trace/trace_selftest.c b/kernel/trace/trace_selftest.c
> index 89067f02094a..1ebd0899238f 100644
> --- a/kernel/trace/trace_selftest.c
> +++ b/kernel/trace/trace_selftest.c
> @@ -807,7 +807,8 @@ static __init int store_entry(struct ftrace_graph_ent *trace,
>  }
>  
>  static __init void store_return(struct ftrace_graph_ret *trace,
> -				struct fgraph_ops *gops)
> +				struct fgraph_ops *gops,
> +				struct ftrace_regs *fregs)
>  {
>  	struct fgraph_fixture *fixture = container_of(gops, struct fgraph_fixture, gops);
>  	const char *type = fixture->store_type_name;


