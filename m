Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B050276BE2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 10:29:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxpBP4431zDqhD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 18:29:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=hyyxtagO; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxp8Y5xfszDqc6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 18:28:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=y2iJgnscDndNOOEI7TjT3t+4iiMWsDCq+S6UjvfrIic=; b=hyyxtagO7Po6QNPknYfGECqZwu
 /x1kle7ejuwJCG51p+rr1z3q34nZ5cJkbU8M1Cwiy+m+9qIX51Ellrl1eJ03yjphwsH//6rWYXAQe
 BWcw0C8olnQN+uVzdhwIT6hjz9OQ/8BX9A1ZD25FQ/va/P7pKYEE9i3Ky/12CxwKV1ulGk7bPUNsu
 X9YprgZC5nz4SROXw02x6E3whJSj8Ec8Qyh7rvXWGB+Mvp9eXt89N+YBovVg1ttK4BBXITy6zQD2u
 DcXvKKwYeBbAd5o/iAubFSmIoKtH94PzABVhzf98FBCIx8sye/7TMPCfMDgDz3i3oWQ+DrM8yPt3g
 QqrUzTHA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLMb4-0003jy-6l; Thu, 24 Sep 2020 08:27:22 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CD73C3059DE;
 Thu, 24 Sep 2020 10:27:17 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id ACF8A2BC141E8; Thu, 24 Sep 2020 10:27:17 +0200 (CEST)
Date: Thu, 24 Sep 2020 10:27:17 +0200
From: peterz@infradead.org
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
Message-ID: <20200924082717.GA1362448@hirez.programming.kicks-ass.net>
References: <87mu1lc5mp.fsf@nanos.tec.linutronix.de>
 <87k0wode9a.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
 <87eemwcpnq.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
 <87a6xjd1dw.fsf@nanos.tec.linutronix.de>
 <CAHk-=wjhxzx3KHHOMvdDj3Aw-_Mk5eRiNTUBB=tFf=vTkw1FeA@mail.gmail.com>
 <87sgbbaq0y.fsf@nanos.tec.linutronix.de>
 <20200923084032.GU1362448@hirez.programming.kicks-ass.net>
 <20200923115251.7cc63a7e@oasis.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923115251.7cc63a7e@oasis.local.home>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, David Airlie <airlied@linux.ie>,
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
 Mel Gorman <mgorman@suse.de>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Greentime Hu <green.hu@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
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

On Wed, Sep 23, 2020 at 11:52:51AM -0400, Steven Rostedt wrote:
> On Wed, 23 Sep 2020 10:40:32 +0200
> peterz@infradead.org wrote:
> 
> > However, with migrate_disable() we can have each task preempted in a
> > migrate_disable() region, worse we can stack them all on the _same_ CPU
> > (super ridiculous odds, sure). And then we end up only able to run one
> > task, with the rest of the CPUs picking their nose.
> 
> What if we just made migrate_disable() a local_lock() available for !RT?

Can't, neiter migrate_disable() nor migrate_enable() are allowed to
block -- which is what makes their implementation so 'interesting'.

> This should lower the SHC in theory, if you can't have stacked migrate
> disables on the same CPU.

See this email in that other thread (you're on Cc too IIRC):

  https://lkml.kernel.org/r/20200923170809.GY1362448@hirez.programming.kicks-ass.net

I think that is we 'frob' the balance PULL, we'll end up with something
similar.

Whichever way around we turn this thing, the migrate_disable() runtime
(we'll have to add a tracer for that), will be an interference term on
the lower priority task, exactly like preempt_disable() would be. We'll
just not exclude a higher priority task from running.


AFAICT; the best case is a single migrate_disable() nesting, where a
higher priority task preempts in a migrate_disable() section -- this is
per design.

When this preempted task becomes elegible to run under the ideal model
(IOW it becomes one of the M highest priority tasks), it might still
have to wait for the preemptee's migrate_disable() section to complete.
Thereby suffering interference in the exact duration of
migrate_disable() section.

Per this argument, the change from preempt_disable() to
migrate_disable() gets us:

 - higher priority tasks gain reduced wake-up latency
 - lower priority tasks are unchanged and are subject to the exact same
   interference term as if the higher priority task were using
   preempt_disable().

Since we've already established this term is unbounded, any task but the
highest priority task is basically buggered.

TL;DR, if we get balancing fixed and achieve (near) the optimal case
above, migrate_disable() is an over-all win. But it's provably
non-deterministic as long as the migrate_disable() sections are
non-deterministic.


The reason this all mostly works in practise is (I think) because:

 - People care most about the higher prio RT tasks and craft them to
   mostly avoid the migrate_disable() infected code.

 - The preemption scenario is most pronounced at higher utilization
   scenarios, and I suspect this is fairly rare to begin with.

 - And while many of these migrate_disable() regions are unbound in
   theory, in practise they're often fairly reasonable.


So my current todo list is:

 - Change RT PULL
 - Change DL PULL
 - Add migrate_disable() tracer; exactly like preempt/irqoff, except
   measuring task-runtime instead of cpu-time.
 - Add a mode that measures actual interference.
 - Add a traceevent to detect preemption in migrate_disable().


And then I suppose I should twist Daniel's arm to update his model to
include these scenarios and numbers.
