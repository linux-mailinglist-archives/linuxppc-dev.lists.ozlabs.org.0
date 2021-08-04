Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC4B3E0037
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 13:32:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfqNM5KdGz3cM3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 21:32:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IIqny7kH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::331;
 helo=mail-wm1-x331.google.com; envelope-from=daniel.thompson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IIqny7kH; dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfqMs1nK5z3bNl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 21:32:06 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so1245721wmb.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Aug 2021 04:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ITDkwNA0SrOgCt3xKILvBBfzHrvWx642jjB6XzvfTgw=;
 b=IIqny7kHdyo1TIIRVeGnK30q75dZHmNBPetoYhf9xuSUVj+HW1uX+ehq0Onoi6pQ62
 iYIcpwq+9tkd3XI5kMeSFTJShksqa3Bdy1vkQGXpnp0+aCyOQIkP2K3Vy1C0xnUPZDr5
 3wQWyF09PDzCtQQFKlOlnFYW1VU0MV8AuQ+5nl2adtN5blwmZGX0BHfxs0M1jGPidPf4
 IX6qqIQj5UAzAqiMqq21rtKWUuWwhQiEzGv3e1CrissJlKpqGdMojHcNHEtrlKIz2T00
 M4AeiKpp3pPUTLcjiWSgGx1opwpdZKB9fMXnZZSBrCDBYTgADeVtGjT6ZBGX+9U/xK5g
 h9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ITDkwNA0SrOgCt3xKILvBBfzHrvWx642jjB6XzvfTgw=;
 b=o1TLxpE1jtrKzTMa6ytNeiLSoO+2RZJByU+XE2Uhv8IF1r8ub8HOJnznb3trfLdnXP
 sf35HqXd5NXGuYDJF7XzUYdWNl9FQZzHecx03tm+7JmaJ6T8QvR+iRP/47v5JIjhMkln
 GDux2/mC4v3PZ2uBBoqLdPDcpmadufPAFLjx739yY05N3Mj5QPjpiwZ1yXQFmJdBTK3w
 1rXRAmYO3c0I1a+9nfnQPZJ59Jeu9DUwym/yt1kvbW0t9Lz3W/YOzMr6lKksEF6fdt86
 mJMBw5WnwT0tTXlIbSB9UoWUYOn8SJBTve8q762e3al1i+H7Vc2JUcH0sWnKkwxo+7/n
 NEaQ==
X-Gm-Message-State: AOAM530KqgiDQ5hsbwZn5z1NY4T82jN+2ya8H6V0JFyZ5g2QzJvSJ10E
 KTmi0DyMW4UdLkOSunDwYj+94w==
X-Google-Smtp-Source: ABdhPJy/y/96VfskHSf1nxHCfFTzgM1ULlQBbTosuqXARHtkKNr1SvBCiWrhCDLpQSPUVhnNS7JIXg==
X-Received: by 2002:a7b:ce99:: with SMTP id q25mr27852908wmj.4.1628076722619; 
 Wed, 04 Aug 2021 04:32:02 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id f3sm2350593wro.30.2021.08.04.04.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 04:32:01 -0700 (PDT)
Date: Wed, 4 Aug 2021 12:31:59 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v1 03/10] kgdb: delay roundup if holding printk
 cpulock
Message-ID: <20210804113159.lsnoyylifg6v5i35@maple.lan>
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
 Chengyang Fan <cy.fan@huawei.com>, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 kgdb-bugreport@lists.sourceforge.net, Petr Mladek <pmladek@suse.com>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 03, 2021 at 05:36:32PM +0206, John Ogness wrote:
> On 2021-08-03, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> > On Tue, Aug 03, 2021 at 03:18:54PM +0206, John Ogness wrote:
> >> kgdb makes use of its own cpulock (@dbg_master_lock, @kgdb_active)
> >> during cpu roundup. This will conflict with the printk cpulock.
> >
> > When the full vision is realized what will be the purpose of the printk
> > cpulock?
> >
> > I'm asking largely because it's current role is actively unhelpful
> > w.r.t. kdb. It is possible that cautious use of in_dbg_master() might
> > be a better (and safer) solution. However it sounds like there is a
> > larger role planned for the printk cpulock...
> 
> The printk cpulock is used as a synchronization mechanism for
> implementing atomic consoles, which need to be able to safely interrupt
> the console write() activity at any time and immediately continue with
> their own printing. The ultimate goal is to move all console printing
> into per-console dedicated kthreads, so the primary function of the
> printk cpulock is really to immediately _stop_ the CPU/kthread
> performing write() in order to allow write_atomic() (from any context on
> any CPU) to safely and reliably take over.

I see.

Is there any mileage in allowing in_dbg_master() to suppress taking
the console lock?

There's a couple of reasons to worry about the current approach.

The first is that we don't want this code to trigger in the case when
kgdb is enabled and kdb is not since it is only kdb (a self-hosted
debugger) than uses the consoles. This case is relatively trivial to
address since we can rename it kdb_roundup_delay() and alter the way it
is conditionally compiled.

The second is more of a problem however. kdb will only call into the
console code from the debug master. By default this is the CPU that
takes the debug trap so initial prints will work fine. However it is
possible to switch to a different master (so we can read per-CPU
registers and things like that). This will result in one of the CPUs
that did the IPI round up calling into console code and this is unsafe
in that instance.

There are a couple of tricks we could adopt to work around this but
given the slightly odd calling context for kdb (all CPUs quiesced, no
log interleaving possible) it sounds like it would remain safe to
bypass the lock if in_dbg_master() is true.

Bypassing an inconvenient lock might sound icky but:

1. If the lock is not owned by any CPU then what kdb will do is safe.

2. If the lock is owned by any CPU then we have quiesced it anyway
   and this makes is safe for the owning CPU to share its ownership
   (since it isn't much different to recursive acquisition on a single
   CPU)


> Atomic consoles are actually quite similar to the kgdb_io ops. For
> example, comparing:
> 
> serial8250_console_write_atomic() + serial8250_console_putchar_locked()
> 
> with
> 
> serial8250_put_poll_char()
> 
> The difference is that serial8250_console_write_atomic() is line-based
> and synchronizing with serial8250_console_write() so that if the kernel
> crashes while outputing to the console, write() can be interrupted by
> write_atomic() and cleanly formatted crash data can be output.
> 
> Also serial8250_put_poll_char() is calling into __pm_runtime_resume(),
> which includes a spinlock and possibly sleeping. This would not be
> acceptable for atomic consoles.

spinlocks aren't allowed in polled I/O either.

However IIRC there is a rather nasty trick being played here to allow
code sharing. I believe there was a deliberate unbalanced resume in the
poll_init() function that results (again IIRC) in the PM calls in
poll_char() becoming nothing but atomic add and subtract (e.g. enabling
polled I/O effectively suppresses PM activity).


Daniel.

> Although, as Andy pointed out [0], I
> will need to figure out how to deal with suspended consoles. Or just
> implement a policy that registered atomic consoles may never be
> suspended.
> 
> I had not considered merging kgdb_io ops with atomic console ops. But
> now that I look at it more closely, there may be some useful overlap. I
> will consider this. Thank you for this idea.
> 
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
> +
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
>  EXPORT_SYMBOL(__printk_cpu_unlock);
> 
> John Ogness
> 
> [0] https://lore.kernel.org/lkml/YQlKAeXS9MPmE284@smile.fi.intel.com
