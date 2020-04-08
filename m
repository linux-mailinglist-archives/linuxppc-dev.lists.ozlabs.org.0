Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCEA1A2330
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 15:41:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y55p0DJ4zDqQY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 23:41:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y3KZ03Y5zDqM1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 22:21:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=MaMka7xA; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48y3KV3x0wz9sTG;
 Wed,  8 Apr 2020 22:21:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1586348478;
 bh=4rUz+H7v2Waw0n15vK+mmX8ZhtuacfaRbQ798xCdaM0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=MaMka7xAc3QkSqtY2z/tAQFXfmV4ucoolb1YqB7wefK3LbcrOrxfX6f+CLllXsIuK
 lmZVWGu2izJKrnQfReazlBh48q/o6auoc12hucM6QxPR1ju+Gyi71q4qkEA3tv7OrA
 kGWbDF6LxWTs9R9CyQKRIQd2IdCOStaxL5kCklL8tIRpRqitBPYdrI90PkbHGAOgKp
 ehDhGwwFteQ6pwz2dDzSmkyyeNzlrbRvu5f5ZAlri2k93vHk0+NNUIbaToBShXTabn
 ipiEocP6c8sr74GvXc0BbiybpCI0B4XxuwKC7d0MaNLGVKLThKG/blEw6nUmwhV1xF
 3CA6d2ywW4snQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Leonardo Bras <leonardo@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Enrico Weigelt <info@metux.net>, Paul Mackerras <paulus@samba.org>,
 peterz@infradead.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3 1/1] ppc/crash: Reset spinlocks during crash
In-Reply-To: <fb98f346a4d6a9d689ae64dae33cbd45d2f8b0df.camel@linux.ibm.com>
References: <20200401000020.590447-1-leonardo@linux.ibm.com>
 <871rp6t9di.fsf@mpe.ellerman.id.au>
 <02e74be19534ab1db2f16a0c89ecb164e380c12a.camel@linux.ibm.com>
 <1585895551.7o9oa0ey62.astroid@bobo.none>
 <fb98f346a4d6a9d689ae64dae33cbd45d2f8b0df.camel@linux.ibm.com>
Date: Wed, 08 Apr 2020 22:21:29 +1000
Message-ID: <87v9majhh2.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Leonardo Bras <leonardo@linux.ibm.com> writes:
> Hello Nick, Michael,
>
> On Fri, 2020-04-03 at 16:41 +1000, Nicholas Piggin wrote:
> [...]
>> > > PAPR says we are not allowed to have multiple CPUs calling RTAS at once,
>> > > except for a very small list of RTAS calls. So if we bust the RTAS lock
>> > > there's a risk we violate that part of PAPR and crash even harder.
>> > 
>> > Interesting, I was not aware.
>> > 
>> > > Also it's not specific to kdump, we can't even get through a normal
>> > > reboot if we crash with the RTAS lock held.
>> > > 
>> > > Anyway here's a patch with some ideas. That allows me to get from a
>> > > crash with the RTAS lock held through kdump into the 2nd kernel. But it
>> > > only works if it's the crashing CPU that holds the RTAS lock.
>> > > 
>> > 
>> > Nice idea. 
>> > But my test environment is just triggering a crash from sysrq, so I
>> > think it would not improve the result, given that this thread is
>> > probably not holding the lock by the time.
>> 
>> Crash paths should not take that RTAS lock, it's a massive pain. I'm 
>> fixing it for machine check, for other crashes I think it can be removed 
>> too, it just needs to be unpicked. The good thing with crashing is that 
>> you can reasonably *know* that you're single threaded, so you can 
>> usually reason through situations like above.
>> 
>> > I noticed that when rtas is locked, irqs and preemption are also
>> > disabled.
>> > 
>> > Should the IPI send by crash be able to interrupt a thread with
>> > disabled irqs?
>> 
>> Yes. It's been a bit painful, but in the long term it means that a CPU 
>> which hangs with interrupts off can be debugged, and it means we can 
>> take it offline to crash without risking that it will be clobbering what 
>> we're doing.
>> 
>> Arguably what I should have done is try a regular IPI first, wait a few 
>> seconds, then NMI IPI.
>> 
>> A couple of problems with that. Firstly it probably avoids this issue 
>> you hit almost all the time, so it won't get fixed. So when we really 
>> need the NMI IPI in the field, it'll still be riddled with deadlocks.
>> 
>> Secondly, sending the IPI first in theory can be more intrusive to the 
>> state that we want to debug. It uses the currently running stack, paca 
>> save areas, ec. NMI IPI uses its own stack and save regions so it's a 
>> little more isolated. Maybe this is only a small advantage but I'd like 
>> to have it if we can.  
>
> I think the printk issue is solved (sent a patch on that), now what is
> missing is the rtas call spinlock.
>
> I noticed that rtas.lock is taken on machine_kexec_mask_interrupts(),
> which happen after crashing the other threads and getting into
> realmode. 
>
> The following rtas are called each IRQ with valid interrupt descriptor:
> ibm,int-off : Reset mask bit for that interrupt
> ibm,set_xive : Set XIVE priority to 0xff
>
> By what I could understand, these rtas calls happen to put the next
> kexec kernel (kdump kernel) in a safer environment, so I think it's not
> safe to just remove them.

Yes.

> (See commit d6c1a9081080c6c4658acf2a06d851feb2855933)

In hindsight the person who wrote that commit was being lazy. We
*should* have made the 2nd kernel robust against the IRQ state being
messed up.

> On the other hand, busting the rtas.lock could be dangerous, because
> it's code we can't control.
>
> According with LoPAR, for both of these rtas-calls, we have:
>
> For the PowerPC External Interrupt option: The call must be reentrant
> to the number of processors on the platform.
> For the PowerPC External Interrupt option: The argument call buffer for
> each simultaneous call must be physically unique.

Oh well spotted. Where is that in the doc?

> Which I think means this rtas-calls can be done simultaneously.

I think so too. I'll read PAPR in the morning and make sure.

> Would it mean that busting the rtas.lock for these calls would be safe?

What would be better is to make those specific calls not take the global
RTAS lock to begin with.

We should be able to just allocate the rtas_args on the stack, it's only
~80 odd bytes. And then we can use rtas_call_unlocked() which doesn't
take the global lock.

cheers
