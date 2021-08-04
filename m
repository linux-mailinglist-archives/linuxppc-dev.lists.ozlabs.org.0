Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4268F3E00EC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 14:13:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfrH01Q0bz3cY8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 22:13:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=pJykIc+x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=pJykIc+x; dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfrGT5JZQz2yyM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 22:12:32 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 296761FDD5;
 Wed,  4 Aug 2021 12:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1628079148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bn9YVbCSQKeHHPfP05oD5rwX8ODweOX9w/K+lArk/DE=;
 b=pJykIc+xN1nPCYR+8lVCwGNHacbjeH4BnxYNPAjN5HwhwpgixEWNbXHGIVGxw0toxjfyE+
 3Cz/TV2a/vLe+bxLld3Yxu29dFROf4HRFFmsffjqCyRRUT/p7QefScdDc8u+qL9c428dDi
 8yrfvbcQ6E33HugPCEHnK31du1EvPTE=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 18078A3B84;
 Wed,  4 Aug 2021 12:12:26 +0000 (UTC)
Date: Wed, 4 Aug 2021 14:12:22 +0200
From: Petr Mladek <pmladek@suse.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH printk v1 03/10] kgdb: delay roundup if holding printk
 cpulock
Message-ID: <YQqEJtmNFxVxH3U/@alley>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <20210803131301.5588-4-john.ogness@linutronix.de>
 <20210803142558.cz7apumpgijs5y4y@maple.lan>
 <87tuk635rb.fsf@jogness.linutronix.de>
 <20210804113159.lsnoyylifg6v5i35@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804113159.lsnoyylifg6v5i35@maple.lan>
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
 kgdb-bugreport@lists.sourceforge.net, John Ogness <john.ogness@linutronix.de>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 2021-08-04 12:31:59, Daniel Thompson wrote:
> On Tue, Aug 03, 2021 at 05:36:32PM +0206, John Ogness wrote:
> > On 2021-08-03, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> > > On Tue, Aug 03, 2021 at 03:18:54PM +0206, John Ogness wrote:
> > >> kgdb makes use of its own cpulock (@dbg_master_lock, @kgdb_active)
> > >> during cpu roundup. This will conflict with the printk cpulock.
> > >
> > > When the full vision is realized what will be the purpose of the printk
> > > cpulock?
> > >
> > > I'm asking largely because it's current role is actively unhelpful
> > > w.r.t. kdb. It is possible that cautious use of in_dbg_master() might
> > > be a better (and safer) solution. However it sounds like there is a
> > > larger role planned for the printk cpulock...
> > 
> > The printk cpulock is used as a synchronization mechanism for
> > implementing atomic consoles, which need to be able to safely interrupt
> > the console write() activity at any time and immediately continue with
> > their own printing. The ultimate goal is to move all console printing
> > into per-console dedicated kthreads, so the primary function of the
> > printk cpulock is really to immediately _stop_ the CPU/kthread
> > performing write() in order to allow write_atomic() (from any context on
> > any CPU) to safely and reliably take over.
> 
> I see.
> 
> Is there any mileage in allowing in_dbg_master() to suppress taking
> the console lock?
> 
> There's a couple of reasons to worry about the current approach.
> 
> The first is that we don't want this code to trigger in the case when
> kgdb is enabled and kdb is not since it is only kdb (a self-hosted
> debugger) than uses the consoles. This case is relatively trivial to
> address since we can rename it kdb_roundup_delay() and alter the way it
> is conditionally compiled.
> 
> The second is more of a problem however. kdb will only call into the
> console code from the debug master. By default this is the CPU that
> takes the debug trap so initial prints will work fine. However it is
> possible to switch to a different master (so we can read per-CPU
> registers and things like that). This will result in one of the CPUs
> that did the IPI round up calling into console code and this is unsafe
> in that instance.
> 
> There are a couple of tricks we could adopt to work around this but
> given the slightly odd calling context for kdb (all CPUs quiesced, no
> log interleaving possible) it sounds like it would remain safe to
> bypass the lock if in_dbg_master() is true.
> 
> Bypassing an inconvenient lock might sound icky but:
> 
> 1. If the lock is not owned by any CPU then what kdb will do is safe.
>
> 2. If the lock is owned by any CPU then we have quiesced it anyway
>    and this makes is safe for the owning CPU to share its ownership
>    (since it isn't much different to recursive acquisition on a single
>    CPU)

I think about the following:

void kgdb_roundup_cpus(void)
{
	__printk_cpu_lock();
	__kgdb_roundup_cpus();
}

, where __printk_cpu_lock() waits/takes printk_cpu_lock()
	__kgdb_roundup_cpus() is the original kgdb_roundup_cpus();


The idea is that kgdb_roundup_cpus() caller takes the printk_cpu lock.
The owner will be well defined.

As a result any other CPU will not be able to take the printk_cpu lock
as long as it is owned by the kgdb lock. But as you say, kgdb will
make sure that everything is serialized at this stage. So that
the original raw_printk_cpu_lock_irqsave() might just disable
IRQs when called under debugger.

Does it make any sense?

I have to say that it is a bit hairy. But it looks slightly better
than the delayed/repeated IPI proposed by this patch.

Best Regards,
Petr
