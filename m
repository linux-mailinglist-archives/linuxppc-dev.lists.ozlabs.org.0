Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 882693E03DA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 17:05:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gfw5h3ct1z3cZj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 01:05:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AuCKuZ40;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32f;
 helo=mail-wm1-x32f.google.com; envelope-from=daniel.thompson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AuCKuZ40; dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gfw573LWdz3bWs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 01:04:41 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 n12-20020a05600c3b8cb029025a67bbd40aso4184225wms.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Aug 2021 08:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6aUVH/oLofEmmm6h+v2hcxaCiBX9BgRXOiDFnU5oRiQ=;
 b=AuCKuZ40QgcSYPXdblKcj4kcdmjIXcOcMu/6OXSijGIKG+9ZEduszPOpb6Wy7siTBu
 aDQVeDRRtfKHh0DSmUUnlF1MyhHeBuyTFWDz/rupBcCkanJFAcmVn1gxD3M6jhUJFR0c
 aoFBS42Y8iEZuJJQYwiiK3FqrE/vD3HCdLTc4iOAMmb39QE7stztPLYdeO1xj59IttAw
 Efh4T2Avp4vh+kGDf6xZUpTuy8gBk+TQ3lZ79PfmtRvth5ggDb7V/l4jQGHEnU2YolWg
 kMcSWvW28mM9WsaGCvSH5yGp2CcQgK5ZiNGB/S/efgdqNxucA/BVLVUMVAVuHWYqZwHs
 g0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6aUVH/oLofEmmm6h+v2hcxaCiBX9BgRXOiDFnU5oRiQ=;
 b=euDma3HVZLd/rCs/CWMhpLGn4rNwAH+KVv8o0P7Mb9ohE6jvhx0g/HRr4QQfsvLYMR
 yHFRUCbpip628a+lS3cxI7Tg/kqxGfU0u7jUQJYVIZIQJX4JWhThVa1kdLdA5ranXqOF
 6+SO3CZbF7ZxtNHwK2FbnYrHGVdoRDn9sbkFpKn10NXtuTdk9Y+o/qyhR/vjg1mSavp1
 L5TaXl5L7wd0Wqz6L/Y7wJeJibC6UIFdPCOPoIjXgV9LC/rKpRGi9PIP7oyLZ8SYXP7+
 ZGd6Fgk0vHIH+F1A77cBp2FnfWlAraKiGIfpf0cSuz5dBxYJZ+WpqTS1tbA6ajRxzKoz
 Yv+g==
X-Gm-Message-State: AOAM533PX0nS3d+rxQ3x7hTeZcTO6w0BF88E0j6Hg1T3zClAo3I0tnw+
 Rffy4d37xRWHBP4uQftyNQdvgw==
X-Google-Smtp-Source: ABdhPJyVKS2KYPrHTlu7TD/lkdA7+BjOWbghd40OQTpu+TAAM9zjd70hDbrMzKWO8CQhm4tJjA99gA==
X-Received: by 2002:a05:600c:4f0d:: with SMTP id
 l13mr93288wmq.18.1628089474526; 
 Wed, 04 Aug 2021 08:04:34 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id w5sm3361185wro.45.2021.08.04.08.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 08:04:33 -0700 (PDT)
Date: Wed, 4 Aug 2021 16:04:31 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH printk v1 03/10] kgdb: delay roundup if holding printk
 cpulock
Message-ID: <20210804150431.qtra3wvh2n4m6j64@maple.lan>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <20210803131301.5588-4-john.ogness@linutronix.de>
 <20210803142558.cz7apumpgijs5y4y@maple.lan>
 <87tuk635rb.fsf@jogness.linutronix.de>
 <20210804113159.lsnoyylifg6v5i35@maple.lan>
 <YQqEJtmNFxVxH3U/@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQqEJtmNFxVxH3U/@alley>
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
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 04, 2021 at 02:12:22PM +0200, Petr Mladek wrote:
> On Wed 2021-08-04 12:31:59, Daniel Thompson wrote:
> > On Tue, Aug 03, 2021 at 05:36:32PM +0206, John Ogness wrote:
> > > On 2021-08-03, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> > > > On Tue, Aug 03, 2021 at 03:18:54PM +0206, John Ogness wrote:
> > > >> kgdb makes use of its own cpulock (@dbg_master_lock, @kgdb_active)
> > > >> during cpu roundup. This will conflict with the printk cpulock.
> > > >
> > > > When the full vision is realized what will be the purpose of the printk
> > > > cpulock?
> > > >
> > > > I'm asking largely because it's current role is actively unhelpful
> > > > w.r.t. kdb. It is possible that cautious use of in_dbg_master() might
> > > > be a better (and safer) solution. However it sounds like there is a
> > > > larger role planned for the printk cpulock...
> > > 
> > > The printk cpulock is used as a synchronization mechanism for
> > > implementing atomic consoles, which need to be able to safely interrupt
> > > the console write() activity at any time and immediately continue with
> > > their own printing. The ultimate goal is to move all console printing
> > > into per-console dedicated kthreads, so the primary function of the
> > > printk cpulock is really to immediately _stop_ the CPU/kthread
> > > performing write() in order to allow write_atomic() (from any context on
> > > any CPU) to safely and reliably take over.
> > 
> > I see.
> > 
> > Is there any mileage in allowing in_dbg_master() to suppress taking
> > the console lock?
> > 
> > There's a couple of reasons to worry about the current approach.
> > 
> > The first is that we don't want this code to trigger in the case when
> > kgdb is enabled and kdb is not since it is only kdb (a self-hosted
> > debugger) than uses the consoles. This case is relatively trivial to
> > address since we can rename it kdb_roundup_delay() and alter the way it
> > is conditionally compiled.
> > 
> > The second is more of a problem however. kdb will only call into the
> > console code from the debug master. By default this is the CPU that
> > takes the debug trap so initial prints will work fine. However it is
> > possible to switch to a different master (so we can read per-CPU
> > registers and things like that). This will result in one of the CPUs
> > that did the IPI round up calling into console code and this is unsafe
> > in that instance.
> > 
> > There are a couple of tricks we could adopt to work around this but
> > given the slightly odd calling context for kdb (all CPUs quiesced, no
> > log interleaving possible) it sounds like it would remain safe to
> > bypass the lock if in_dbg_master() is true.
> > 
> > Bypassing an inconvenient lock might sound icky but:
> > 
> > 1. If the lock is not owned by any CPU then what kdb will do is safe.
> >
> > 2. If the lock is owned by any CPU then we have quiesced it anyway
> >    and this makes is safe for the owning CPU to share its ownership
> >    (since it isn't much different to recursive acquisition on a single
> >    CPU)
> 
> I think about the following:
> 
> void kgdb_roundup_cpus(void)
> {
> 	__printk_cpu_lock();
> 	__kgdb_roundup_cpus();
> }
> 
> , where __printk_cpu_lock() waits/takes printk_cpu_lock()
> 	__kgdb_roundup_cpus() is the original kgdb_roundup_cpus();
> 
> 
> The idea is that kgdb_roundup_cpus() caller takes the printk_cpu lock.
> The owner will be well defined.
> 
> As a result any other CPU will not be able to take the printk_cpu lock
> as long as it is owned by the kgdb lock. But as you say, kgdb will
> make sure that everything is serialized at this stage. So that
> the original raw_printk_cpu_lock_irqsave() might just disable
> IRQs when called under debugger.
> 
> Does it make any sense?

Yes but I think it is still has problems.

Primarily is doesn't solve the issue I raised. It would still be unsafe
to change debug master: we can guarantee the initial master owns the
lock but if it has been multiply acquired we cannot transfer ownership
when we want to change master.

Additionally it will delay the round up of cores that do not own the
lock. The quiescing is never atomic and the operator needs to know
that but the longer CPUs are allows to execute for the more confusing
things can become for the operator.

Finally on machines without an NMI this could cause trouble with the
interrupt disable in raw_printk_cpu_lock_irqsave() (or any outer level
interrupt disable). If the master get the lock then the other processes
will become incapable of being rounded up if they are waiting for the
printk lock).


> I have to say that it is a bit hairy. But it looks slightly better
> than the delayed/repeated IPI proposed by this patch.

I'd like to reserve judgement for now which one is least worst...
largely because if the purpose of the lock simply to prevent interleaving
of console output then the debugger quiescing code should already have
this covered.

It leaves me wondering if a change like the one below is sufficient
(based on code without John's patches but hopefully still clear enough).
I've given the new code it's own branch which it doesn't, strictly
speaking, need but it is easier to comment this way... and perhaps also
just a little easier for people who have not set CONFIG_KGDB to
ignore ;-).

~~~
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 142a58d124d9..41a7e103bb66 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3599,6 +3599,18 @@ int __printk_cpu_trylock(void)
                /* This CPU is already the owner. */
                atomic_inc(&printk_cpulock_nested);
                return 1;
+       } else if (in_dbg_master()) {
+               /*
+                * If we are executing as the primary CPU and with the debugger
+                * active than all other CPUs in the system are quiesced by
+                * the time kdb winds up calling this function. To execute this
+                * branch then the lock must be owned by one of the quiesced CPUs.
+                * Happily, because it is quiesced and cannot release it, it is
+                * safe for us to allow the lock to be taken from a different CPU!
+                * The lock will be released prior to resuming the real owner.
+                */
+               atomic_inc(&printk_cpulock_nested);
+               return 1;
        }
 
        return 0;
~~~


Daniel.


PS In the interested of full disclosure there is a special case
   in the debugger to allow it to try to cope if it fails to
   quiesce a CPU and I deliberately omitted this from the long
   comment above. That special case is expected to be unstable
   but since the alternative is likely to be a permanent deadlock
   without any indication of why we choose to take the risk of
   continuing. Personally I don't recommend reasoning about
   console safety based on this emergency case hence omitting the
   comment.
