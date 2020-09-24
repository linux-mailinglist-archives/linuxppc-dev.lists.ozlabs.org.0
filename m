Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63446276A7E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 09:18:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxmcD4J9TzDqgM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 17:18:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=ToSaPZLx; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=EvF/Nhfc; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxm8Q6lF7zDqg9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 16:57:58 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600930672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5rTYnFSI7MvYdctqS1tc/c91OuHk2uQv9NNDSCQ04XQ=;
 b=ToSaPZLxQ2AH6wpji2/x8TcisM3A51I/7u6foK9kSTrf7OV6+B/sYvPqQhMtEJrg0N9zIx
 Cxs2etUyPDaehZQCOzhxH7PpvSyJSfy+zT5nw6FTVB78t6JNp7mDPmryw8BrJtWSznRbjf
 8WXrnLC1goQovtz1OVkxeDIie+039a2C5Ao2dLue3fpVFSN5R/cBi6m5tXzS9aMxE6UJwX
 Uwp2HtahcdV3lHGQhtB2rKe1baF/Au/D2y5x0sKC4vrpIL/XuoPxLZOPdKWgIlvAl5aFPa
 sm2IQ31/n393ddHyPDhkeJ4Ev5cXAXShQDmJK93cRSzGvYG6PFna1CfbOLLbSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600930672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5rTYnFSI7MvYdctqS1tc/c91OuHk2uQv9NNDSCQ04XQ=;
 b=EvF/NhfcVha3UwOSEREyL46c1SondfygAd7QtbHcK6NXwedthX3cPGyjT7D4JChbCJd2jo
 pNgVY6bwfByW4sDA==
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
In-Reply-To: <20200923171234.0001402d@oasis.local.home>
References: <20200919091751.011116649@linutronix.de>
 <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <87mu1lc5mp.fsf@nanos.tec.linutronix.de>
 <87k0wode9a.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
 <87eemwcpnq.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
 <87a6xjd1dw.fsf@nanos.tec.linutronix.de>
 <CAHk-=wjhxzx3KHHOMvdDj3Aw-_Mk5eRiNTUBB=tFf=vTkw1FeA@mail.gmail.com>
 <87sgbbaq0y.fsf@nanos.tec.linutronix.de>
 <20200923084032.GU1362448@hirez.programming.kicks-ass.net>
 <20200923115251.7cc63a7e@oasis.local.home>
 <874kno9pr9.fsf@nanos.tec.linutronix.de>
 <20200923171234.0001402d@oasis.local.home>
Date: Thu, 24 Sep 2020 08:57:52 +0200
Message-ID: <871riracgf.fsf@nanos.tec.linutronix.de>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, peterz@infradead.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Greentime Hu <green.hu@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel@ffwll.ch>, Vineet Gupta <vgupta@synopsys.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 23 2020 at 17:12, Steven Rostedt wrote:
> On Wed, 23 Sep 2020 22:55:54 +0200
> Then scratch the idea of having anonymous local_lock() and just bring
> local_lock in directly? Then have a kmap local lock, which would only
> block those that need to do a kmap.

That's still going to end up in lock ordering nightmares and you lose
the ability to use kmap_local from arbitrary contexts which was again
one of the goals of this exercise.

Aside of that you're imposing reentrancy protections on something which
does not need it in the first place.

> Now as for migration disabled nesting, at least now we would have
> groupings of this, and perhaps the theorists can handle that. I mean,
> how is this much different that having a bunch of tasks blocked on a
> mutex with the owner is pinned on a CPU?
>
> migrate_disable() is a BKL of pinning affinity.

No. That's just wrong. preempt disable is a concurrency control,
i.e. protecting against reentrancy on a given CPU. But it's a cpu global
protection which means that it's not protecting a specific code path.

Contrary to preempt disable, migrate disable is not protecting against
reentrancy on a given CPU. It's a temporary restriction to the scheduler
on placement.

The fact that disabling preemption implicitely disables migration does
not make them semantically equivalent.

> If we only have local_lock() available (even on !RT), then it makes
> the blocking in groups. At least this way you could grep for all the
> different local_locks in the system and plug that into the algorithm
> for WCS, just like one would with a bunch of mutexes.

You cannot do that on RT at all where migrate disable is substituting
preempt disable in spin and rw locks. The result would be the same as
with a !RT kernel just with horribly bad performance.

That means the stacking problem has to be solved anyway.

So why on earth do you want to create yet another special duct tape case
for kamp_local() which proliferates inconsistency instead of aiming for
consistency accross all preemption models?

Thanks,

        tglx
