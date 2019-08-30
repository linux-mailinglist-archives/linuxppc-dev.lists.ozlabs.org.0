Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D638A3EE3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 22:19:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KrS92CytzDr7H
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 06:19:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=slzo=w2=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KrN03RKKzDr70
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 06:16:16 +1000 (AEST)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92D2D23427;
 Fri, 30 Aug 2019 20:16:13 +0000 (UTC)
Date: Fri, 30 Aug 2019 16:16:12 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] ftrace: Fix NULL pointer dereference in t_probe_next()
Message-ID: <20190830161612.1842fb09@gandalf.local.home>
In-Reply-To: <05e021f757625cbbb006fad41380323dbe4e3b43.1562249521.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1562249521.git.naveen.n.rao@linux.vnet.ibm.com>
 <05e021f757625cbbb006fad41380323dbe4e3b43.1562249521.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu,  4 Jul 2019 20:04:41 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> LTP testsuite on powerpc results in the below crash:
> 
>   Unable to handle kernel paging request for data at address 0x00000000
>   Faulting instruction address: 0xc00000000029d800
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   LE SMP NR_CPUS=2048 NUMA PowerNV
>   ...
>   CPU: 68 PID: 96584 Comm: cat Kdump: loaded Tainted: G        W
>   NIP:  c00000000029d800 LR: c00000000029dac4 CTR: c0000000001e6ad0
>   REGS: c0002017fae8ba10 TRAP: 0300   Tainted: G        W
>   MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 28022422  XER: 20040000
>   CFAR: c00000000029d90c DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 0
>   ...
>   NIP [c00000000029d800] t_probe_next+0x60/0x180
>   LR [c00000000029dac4] t_mod_start+0x1a4/0x1f0
>   Call Trace:
>   [c0002017fae8bc90] [c000000000cdbc40] _cond_resched+0x10/0xb0 (unreliable)
>   [c0002017fae8bce0] [c0000000002a15b0] t_start+0xf0/0x1c0
>   [c0002017fae8bd30] [c0000000004ec2b4] seq_read+0x184/0x640
>   [c0002017fae8bdd0] [c0000000004a57bc] sys_read+0x10c/0x300
>   [c0002017fae8be30] [c00000000000b388] system_call+0x5c/0x70
> 
> The test (ftrace_set_ftrace_filter.sh) is part of ftrace stress tests
> and the crash happens when the test does 'cat
> $TRACING_PATH/set_ftrace_filter'.
> 
> The address points to the second line below, in t_probe_next(), where
> filter_hash is dereferenced:
>   hash = iter->probe->ops.func_hash->filter_hash;
>   size = 1 << hash->size_bits;
> 
> This happens due to a race with register_ftrace_function_probe(). A new
> ftrace_func_probe is created and added into the func_probes list in
> trace_array under ftrace_lock. However, before initializing the filter,
> we drop ftrace_lock, and re-acquire it after acquiring regex_lock. If
> another process is trying to read set_ftrace_filter, it will be able to
> acquire ftrace_lock during this window and it will end up seeing a NULL
> filter_hash.
> 
> Fix this by just checking for a NULL filter_hash in t_probe_next(). If
> the filter_hash is NULL, then this probe is just being added and we can
> simply return from here.

Hmm, this is very subtle. I'll take a deeper look at this to see if we
can keep the race from happening.

Thanks!

-- Steve

> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  kernel/trace/ftrace.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 7b037295a1f1..0791eafb693d 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -3093,6 +3093,10 @@ t_probe_next(struct seq_file *m, loff_t *pos)
>  		hnd = &iter->probe_entry->hlist;
>  
>  	hash = iter->probe->ops.func_hash->filter_hash;
> +
> +	if (!hash)
> +		return NULL;
> +
>  	size = 1 << hash->size_bits;
>  
>   retry:

