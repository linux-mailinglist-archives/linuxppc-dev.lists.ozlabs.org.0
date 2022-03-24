Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D744E6AB5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 23:33:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPg4H3HcMz300Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 09:33:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=srs0=cvhx=ud=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPg3p5Z9tz2xBl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 09:33:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 63F1DCE2747;
 Thu, 24 Mar 2022 22:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E774C340EC;
 Thu, 24 Mar 2022 22:33:22 +0000 (UTC)
Date: Thu, 24 Mar 2022 18:33:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1] ftrace: Make ftrace_graph_is_dead() static inline
Message-ID: <20220324183320.000d7088@gandalf.local.home>
In-Reply-To: <529ece004e0901ca04ea0e07d6bf8476612e2294.1648116004.git.christophe.leroy@csgroup.eu>
References: <529ece004e0901ca04ea0e07d6bf8476612e2294.1648116004.git.christophe.leroy@csgroup.eu>
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
Cc: Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 24 Mar 2022 11:01:45 +0100
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> @@ -1006,7 +1006,20 @@ unsigned long ftrace_graph_ret_addr(struct task_struct *task, int *idx,
>  extern int register_ftrace_graph(struct fgraph_ops *ops);
>  extern void unregister_ftrace_graph(struct fgraph_ops *ops);
>  
> -extern bool ftrace_graph_is_dead(void);
> +/**
> + * ftrace_graph_is_dead - returns true if ftrace_graph_stop() was called
> + *
> + * ftrace_graph_stop() is called when a severe error is detected in
> + * the function graph tracing. This function is called by the critical
> + * paths of function graph to keep those paths from doing any more harm.
> + */
> +extern bool kill_ftrace_graph;
> +
> +static inline bool ftrace_graph_is_dead(void)
> +{
> +	return kill_ftrace_graph;
> +}
> +
>  extern void ftrace_graph_stop(void);

The reason I did not expose that variable, is because I didn't want it to
be touched outside of the kernel/trace directory. Or the ftrace.c file for
that matter (although, I could put it in fgraph.c :-/)

What would be better, is to make it a static branch.

extern struct static_key fgraph_dead;

static inline bool ftrace_graph_is_dead(void)
{
	if (static_key_false(&fgraph_dead))
		return true;
	return false;
}

That way we even get rid of the conditional branch.

Yeah, the fgraph_dead is still exposed for anyone to touch, but it still
requires a function to modify it, so I'm not as worried it will be touched
as easily.

-- Steve
