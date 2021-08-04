Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 190353E0136
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 14:32:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gfrj03vjjz3cGY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 22:32:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=qv89K6eJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=qv89K6eJ; dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfrhY5sLJz3bNk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 22:31:40 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 1C1141FDD3;
 Wed,  4 Aug 2021 12:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1628080298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DC4/KiaX6Vt6MBJgEki+wBHi3z9bnh0HTsoiAX5JG+Y=;
 b=qv89K6eJX6qCyTdTbWC4KoIJyZrT3KxOobSvMJygB5ThmfxOox1BDe2omC2JBPPAoLMtGB
 bKFSc+u2up5Woqc9r/hhTWJ8Ov9DX5HAMaytSa9uS/AcZYXU1vxKGHzVBgdDIPMeXPJbGJ
 AqnoLG6rfavK0Kh86LcdVpnFJG8pEbA=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 4A1B3A3B84;
 Wed,  4 Aug 2021 12:31:37 +0000 (UTC)
Date: Wed, 4 Aug 2021 14:31:36 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v1 03/10] kgdb: delay roundup if holding printk
 cpulock
Message-ID: <YQqIqKjRcNhZSaAZ@alley>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <20210803131301.5588-4-john.ogness@linutronix.de>
 <20210803142558.cz7apumpgijs5y4y@maple.lan>
 <87tuk635rb.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tuk635rb.fsf@jogness.linutronix.de>
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Chengyang Fan <cy.fan@huawei.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, kgdb-bugreport@lists.sourceforge.net,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 2021-08-03 17:36:32, John Ogness wrote:
> On 2021-08-03, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> > On Tue, Aug 03, 2021 at 03:18:54PM +0206, John Ogness wrote:
> >> kgdb makes use of its own cpulock (@dbg_master_lock, @kgdb_active)
> >> during cpu roundup. This will conflict with the printk cpulock.
> >
> >> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> >> index 3d0c933937b4..1b546e117f10 100644
> >> --- a/kernel/printk/printk.c
> >> +++ b/kernel/printk/printk.c
> >> @@ -214,6 +215,7 @@ int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
> >>  #ifdef CONFIG_SMP
> >>  static atomic_t printk_cpulock_owner = ATOMIC_INIT(-1);
> >>  static atomic_t printk_cpulock_nested = ATOMIC_INIT(0);
> >> +static unsigned int kgdb_cpu = -1;
> >
> > Is this the flag to provoke retriggering? It appears to be a write-only
> > variable (at least in this patch). How is it consumed?
> 
> Critical catch! Thank you. I am quite unhappy to see these hunks were
> accidentally dropped when generating this series.
> 
> @@ -3673,6 +3675,9 @@ EXPORT_SYMBOL(__printk_cpu_trylock);
>   */
>  void __printk_cpu_unlock(void)
>  {
> +	bool trigger_kgdb = false;
> +	unsigned int cpu;
> +
>  	if (atomic_read(&printk_cpulock_nested)) {
>  		atomic_dec(&printk_cpulock_nested);
>  		return;
> @@ -3683,6 +3688,12 @@ void __printk_cpu_unlock(void)
>  	 * LMM(__printk_cpu_unlock:A)
>  	 */
>  
> +	cpu = smp_processor_id();
> +	if (kgdb_cpu == cpu) {
> +		trigger_kgdb = true;
> +		kgdb_cpu = -1;
> +	}

Just in case that this approach is used in the end.

This code looks racy. kgdb_roundup_delay() seems to be called in NMI
context. NMI might happen at this point and set kgdb_cpu after
it was checked.

I am afraid that it won't be easy to make this safe using a single
global variable. A solution might be a per-CPU variable set
by kgdb_roundup_delay() when it owns printk_cpu_lock.
__printk_cpu_unlock() would call kgdb_roundup_cpu(cpu) when
the variable is set.

Nit: The name "kgdb_cpu" is too generic. It is not clear what is
     so special about this CPU. I would call the per-CPU variable
     "kgdb_delayed_roundup" or so.


Best Regards,
Petr

>  	/*
>  	 * Guarantee loads and stores from this CPU when it was the
>  	 * lock owner are visible to the next lock owner. This pairs
> @@ -3703,6 +3714,21 @@ void __printk_cpu_unlock(void)
>  	 */
>  	atomic_set_release(&printk_cpulock_owner,
>  			   -1); /* LMM(__printk_cpu_unlock:B) */
> +
> +	if (trigger_kgdb) {
> +		pr_warn("re-triggering kgdb roundup for CPU#%d\n", cpu);
> +		kgdb_roundup_cpu(cpu);
> +	}
>  }
