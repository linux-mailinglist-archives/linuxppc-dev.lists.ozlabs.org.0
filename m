Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B61542712BA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 08:42:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvJ0Z3NlyzDqww
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 16:42:38 +1000 (AEST)
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
 header.s=2020 header.b=ZbudrrXW; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=hJcFT5y1; 
 dkim-atps=neutral
X-Greylist: delayed 75060 seconds by postgrey-1.36 at bilbo;
 Sun, 20 Sep 2020 16:41:09 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvHys1NHvzDqPb
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 16:41:08 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600584063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CoLGj4bgeeSGrBtXaSAQtCzCSINs+vZ2LYYnDPrnZo8=;
 b=ZbudrrXW3BmBlMSesKPCFcaOuHlyqPwGJ2rDhOMbxt3mPAnInwIbTwlFWdXYV8k68cqtaX
 KfEuU6M33k6TNgEv2z3BoREDlGO2O9Fw5TgP2+5hcpWK7uStRqjbWtSKwO3gS4QCuyivwy
 26cuDkJvS5X9yMAUHVa9s0UJUt+J6543xHxV5P3DaWXrCCPeOCRdXjTt3mHzSFT/GSvW6o
 JaVOcgOKbttRfnVUr6cHm/Y19mE/tWAhhxXhM/hU7XhieUh+8YV+lRCkQmefuoxYeKpcBS
 Vf7k79LGubJaArfFULHNmfuj7TyKvSea5/MDMs+6uMgB8Li/jQ7m/qvIhWo6HA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600584063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CoLGj4bgeeSGrBtXaSAQtCzCSINs+vZ2LYYnDPrnZo8=;
 b=hJcFT5y1jFrtCoruYoZORnqggnYSJ5Wm/G+vHz1SccOLs4xq3SNs6bWtqMz5RIfu775hAi
 dKKPo41u4g/pn4AQ==
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
In-Reply-To: <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
References: <20200919091751.011116649@linutronix.de>
 <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
Date: Sun, 20 Sep 2020 08:41:02 +0200
Message-ID: <87mu1lc5mp.fsf@nanos.tec.linutronix.de>
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

On Sat, Sep 19 2020 at 10:18, Linus Torvalds wrote:
> On Sat, Sep 19, 2020 at 2:50 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> this provides a preemptible variant of kmap_atomic & related
>> interfaces. This is achieved by:
>
> Ack. This looks really nice, even apart from the new capability.
>
> The only thing I really reacted to is that the name doesn't make sense
> to me: "kmap_temporary()" seems a bit odd.

Yeah. Couldn't come up with something useful.

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

Right, _local or _thread would be more intuitive.

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
>
> Maybe I've missed something.  Is it because the new interface still
> does "pagefault_disable()" perhaps?
>
> But does it even need the pagefault_disable() at all? Yes, the
> *atomic* one obviously needed it. But why does this new one need to
> disable page faults?

It disables pagefaults because it can be called from atomic and
non-atomic context. That was the point to get rid of

         if (preeemptible())
         	kmap();
         else
                kmap_atomic();

If it does not disable pagefaults, then it's just a lightweight variant
of kmap() for short lived mappings.

> But apart from that question about naming (and perhaps replacing
> kmap() entirely), I very much like it.

I thought about it, but then I figured that kmap pointers can be
handed to other contexts from the thread which sets up the mapping
because it's 'permanent'.

I'm not sure whether that actually happens, so we'd need to audit all
kmap() users to be sure. If there is no such use case, then we surely
can get of rid of kmap() completely. It's only 300+ instances to stare
at and quite some of them are wrapped into other functions.

Highmem sucks no matter what and the only sane solution is to remove it
completely.

Thanks,

        tglx

