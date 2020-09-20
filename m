Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD7D271634
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 19:07:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvYsv0VJ9zDqWb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 03:07:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=O7YDY5EZ; 
 dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvYqK5rMczDqC6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 03:05:31 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id n13so10553198edo.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 10:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Govkq2c7yVsAEyCudSuE8qhnS6+zy4O8TiKkmkv2nIk=;
 b=O7YDY5EZgHd0ux+0JI623n4+xCNSLKkbNn75HK0PfnOR4wlB9CfHJM9R8MpDNxC4Bt
 StinnqnJ77DBvptD2dta7OTELHl1G548xZdBUVNIayCFE6KgnVNuKWIqgtvMj+8UMN/e
 7pSxwfkCe8prPQ3KSbQLetFJedeblKFxQgFMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Govkq2c7yVsAEyCudSuE8qhnS6+zy4O8TiKkmkv2nIk=;
 b=X1pkD06gdXBpL3PxrwShyaYMqoKSRvsW0OcEhik+njNtWF1qaeRKF37lwKhvRNaDEj
 0qiuxGg7Jljyd4/I17X1tgE4/fOndoZtM92NR9UIQcfADAIeach+1YO7WmU+LdjivYPI
 sPepGTgF/Us6BtuIxWmbWccGfmL6CJkGvDYlM49ppbnGVn0UjfdNVHt0ZbR5ojPamt15
 Z++SBLjGhutnM/XOaIKJKCvKm3jm9MYG0TMBIdvIt5CvwNyuRiCIh6nJt9B/TmWMmdN9
 FSSMV/T2eosAx+xyIeQ97ZJYcUCw/6mO9pj98n9pCzLARhbuq7mS7hEc3KEZyzE3zBun
 dZ6A==
X-Gm-Message-State: AOAM532vmsUV5xpFP9EYrd7ll+zdQpNt5tnr2T5Y7h5+cQcQ9yOSCo5B
 dd3QCdzM+toASdIWD/9Gcw8h9nGust1OOA==
X-Google-Smtp-Source: ABdhPJySC1iym3Zo0uvNdG5J40HH/Ig/duFf9Gm2x/hVkI6vq/f+vTjIAB0ntZ1eagPkkf3UzoJ2og==
X-Received: by 2002:a05:6402:1717:: with SMTP id
 y23mr50731057edu.112.1600621527071; 
 Sun, 20 Sep 2020 10:05:27 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43])
 by smtp.gmail.com with ESMTPSA id b13sm6822160edf.89.2020.09.20.10.05.26
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Sep 2020 10:05:26 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id j2so10361938wrx.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 10:05:26 -0700 (PDT)
X-Received: by 2002:ac2:5594:: with SMTP id v20mr15170982lfg.344.1600621076988; 
 Sun, 20 Sep 2020 09:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de>
 <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <87mu1lc5mp.fsf@nanos.tec.linutronix.de>
 <87k0wode9a.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87k0wode9a.fsf@nanos.tec.linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 20 Sep 2020 09:57:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
Message-ID: <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
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

On Sun, Sep 20, 2020 at 1:49 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Actually most usage sites of kmap atomic do not need page faults to be
> disabled at all.

Right. I think the pagefault disabling has (almost) nothing at all to
do with the kmap() itself - it comes from the "atomic" part, not the
"kmap" part.

I say *almost*, because there is one issue that needs some thought:
the amount of kmap nesting.

The kmap_atomic() interface - and your local/temporary/whatever
versions of it - depends very much inherently on being strictly
nesting. In fact, it depends so much on it that maybe that should be
part of the new name?

It's very wrong to do

    addr1 = kmap_atomic();
    addr2 = kmap_atomic();
    ..do something with addr 1..
    kunmap_atomic(addr1);
    .. do something with addr 2..
    kunmap_atomic(addr2);

because the way we allocate the slots is by using a percpu-atomic
inc-return (and we deallocate using dec).

So it's fundamentally a stack.

And that's perfectly fine for page faults - if they do any kmaps,
those will obviously nest.

So the only issue with page faults might be that the stack grows
_larger_. And that might need some thought. We already make the kmap
stack bigger for CONFIG_DEBUG_HIGHMEM, and it's possibly that if we
allow page faults we need to make the kmap stack bigger still.

Btw, looking at the stack code, Ithink your new implementation of it
is a bit scary:

   static inline int kmap_atomic_idx_push(void)
   {
  -       int idx = __this_cpu_inc_return(__kmap_atomic_idx) - 1;
  +       int idx = current->kmap_ctrl.idx++;

and now that 'current->kmap_ctrl.idx' is not atomic wrt

 (a) NMI's (this may be ok, maybe we never do kmaps in NMIs, and with
nesting I think it's fine anyway - the NMI will undo whatever it did)

 (b) the prev/next switch

And that (b) part worries me. You do the kmap_switch_temporary() to
switch the entries, but you do that *separately* from actually
switching 'current' to the new value.

So kmap_switch_temporary() looks safe, but I don't think it actually
is. Because while it first unmaps the old entries and then remaps the
new ones, an interrupt can come in, and at that point it matters what
is *CURRENT*.

And regardless of whether 'current' is 'prev' or 'next', that
kmap_switch_temporary() loop may be doing the wrong thing, depending
on which one had the deeper stack. The interrupt will be using
whatever "current->kmap_ctrl.idx" is, but that might overwrite entries
that are in the process of being restored (if current is still 'prev',
but kmap_switch_temporary() is in the "restore @next's kmaps" pgase),
or it might stomp on entries that have been pte_clear()'ed by the
'prev' thing.

I dunno. The latter may be one of those "it works anyway, it
overwrites things we don't care about", but the former will most
definitely not work.

And it will be completely impossible to debug, because it will depend
on an interrupt that uses kmap_local/atomic/whatever() coming in
_just_ at the right point in the scheduler, and only when the
scheduler has been entered with the right number of kmap entries on
the prev/next stack.

And no developer will ever see this with any amount of debug code
enabled, because it will only hit on legacy platforms that do this
kmap anyway.

So honestly, that code scares me. I think it's buggy. And even if it
"happens to work", it does so for all the wrong reasons, and is very
fragile.

So I would suggest:

 - continue to use an actual per-cpu kmap_atomic_idx

 - make the switching code save the old idx, then unmap the old
entries one by one (while doing the proper "pop" action), and then map
the new entries one by one (while doing the proper "push" action).

which would mean that the only index that is actually ever *USED* is
the percpu one, and it's always up-to-date and pushed/popped for
individual entries, rather than this - imho completely bogus -
optimization where you use "p->kmap_ctrl.idx" directly and very very
unsafely.

Alternatively, that process counter would need about a hundred lines
of commentary about exactly why it's safe. Because I don't think it
is.

                   Linus
