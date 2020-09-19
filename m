Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 721CE270FDA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 19:42:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Btygs4kpzzDqty
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 03:42:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=GA8JmFgA; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtyfK1SVmzDqXX
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 03:40:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=K7cFTcsHe45qv1JJ+UknwUT4mvbkrB+z2Jy5+goIZf0=; b=GA8JmFgANuCgqfeQ26a1OMpRZE
 ZlbdTi1XaGMnZkdmimNhxcmAfB4GoKEHChTyR/daa8IK0MpK+Ph2ryH9b//aJ7p80Ibs7l4BswfKA
 sIzYu18LtoXosTxZAkge/rc7Gjb4PaaE+FfoSKec+IBx6JDUvF50gAZCGBJozVv3Q9TlSsMTvnq4U
 keH99iWU1/g/8GqcgNItUNMFJkFHNg8zhSjOTYLGYkT6E6wJJ/7Hz/Yg8vF2N30AJY+JgAxJpcH7t
 m+E+NNmErAuLXNLlz9CT3fJe5cNWm4y9wNwF8wRjFWgpkB/kQEiLyYiDCjBe1dWILsbbqWV9yJF6I
 kDktgdcw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kJgpG-0007zK-4s; Sat, 19 Sep 2020 17:39:06 +0000
Date: Sat, 19 Sep 2020 18:39:06 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
Message-ID: <20200919173906.GQ32101@casper.infradead.org>
References: <20200919091751.011116649@linutronix.de>
 <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
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
 Steven Rostedt <rostedt@goodmis.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 19, 2020 at 10:18:54AM -0700, Linus Torvalds wrote:
> On Sat, Sep 19, 2020 at 2:50 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> >
> > this provides a preemptible variant of kmap_atomic & related
> > interfaces. This is achieved by:
> 
> Ack. This looks really nice, even apart from the new capability.
> 
> The only thing I really reacted to is that the name doesn't make sense
> to me: "kmap_temporary()" seems a bit odd.
> 
> Particularly for an interface that really is basically meant as a
> better replacement of "kmap_atomic()" (but is perhaps also a better
> replacement for "kmap()").
> 
> I think I understand how the name came about: I think the "temporary"
> is there as a distinction from the "longterm" regular kmap(). So I
> think it makes some sense from an internal implementation angle, but I
> don't think it makes a lot of sense from an interface name.
> 
> I don't know what might be a better name, but if we want to emphasize
> that it's thread-private and a one-off, maybe "local" would be a
> better naming, and make it distinct from the "global" nature of the
> old kmap() interface?
> 
> However, another solution might be to just use this new preemptible
> "local" kmap(), and remove the old global one entirely. Yes, the old
> global one caches the page table mapping and that sounds really
> efficient and nice. But it's actually horribly horribly bad, because
> it means that we need to use locking for them. Your new "temporary"
> implementation seems to be fundamentally better locking-wise, and only
> need preemption disabling as locking (and is equally fast for the
> non-highmem case).
> 
> So I wonder if the single-page TLB flush isn't a better model, and
> whether it wouldn't be a lot simpler to just get rid of the old
> complex kmap() entirely, and replace it with this?
> 
> I agree we can't replace the kmap_atomic() version, because maybe
> people depend on the preemption disabling it also implied. But what
> about replacing the non-atomic kmap()?

My concern with that is people might use kmap() and then pass the address
to a different task.  So we need to audit the current users of kmap()
and convert any that do that into using vmap() instead.

I like kmap_local().  Or kmap_thread().
