Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F5D2A0EC6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 20:37:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CNCHl5ZBDzDqxM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Oct 2020 06:37:07 +1100 (AEDT)
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
 header.s=2020 header.b=db633F26; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=il7YKHja; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CNCFm4JszzDqdP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Oct 2020 06:35:24 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604086519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KjnQMCzBdzGXaCOpmbjT8Ur9FZq3y7opRBflIXIldZw=;
 b=db633F26JvpFY6g0OD9+HbOB2bGDkf74GvzdnzaI3Jackio3Pxmuc4jaTjmmTn0rWAIpK+
 FwvojioAnGZiiH15k8FN/MiA2IKJM2U7IeHO0IsBZqBGgEsd8kwilqueFED/GNpoidpnzO
 yy2TxOvoKUkHNkNBXz892WSrXAjSj1bek74dJCnwm2fooU7rVOQjFed7q+Vvsmw9zNfHs4
 G2wInIc2Xh8w8e1+gsfiziPOVyn2tk/4xzLJndeycG1E0X5k3bHmibgmZZcOeJXy9ENlqt
 1WjhiLEbUG/fvEPPOJsLp5CaNR4eEbW+SMl/VHUu0cW+yWNLKzRpz7CwuUxChg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604086519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KjnQMCzBdzGXaCOpmbjT8Ur9FZq3y7opRBflIXIldZw=;
 b=il7YKHjaiUFmDOQKgI3UCsxgkMmYaTjOnYVZzaPy8He727Hr6NRROPSIn6WIMwC/jiW6Jw
 nlMa3TiG03b3UjDQ==
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
In-Reply-To: <20201030130627.GI27442@casper.infradead.org>
References: <20201029221806.189523375@linutronix.de>
 <20201030130627.GI27442@casper.infradead.org>
Date: Fri, 30 Oct 2020 20:35:18 +0100
Message-ID: <87k0v7mrrd.fsf@nanos.tec.linutronix.de>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-xtensa@linux-xtensa.org,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, linux-mm@kvack.org,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 linux-arch@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>,
 Mel Gorman <mgorman@suse.de>, linux-snps-arc@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Greentime Hu <green.hu@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 30 2020 at 13:06, Matthew Wilcox wrote:
> On Thu, Oct 29, 2020 at 11:18:06PM +0100, Thomas Gleixner wrote:
>> This series provides kmap_local.* iomap_local variants which only disable
>> migration to keep the virtual mapping address stable accross preemption,
>> but do neither disable pagefaults nor preemption. The new functions can be
>> used in any context, but if used in atomic context the caller has to take
>> care of eventually disabling pagefaults.
>
> Could I ask for a CONFIG_KMAP_DEBUG which aliases all the kmap variants
> to vmap()?  I think we currently have a problem in iov_iter on HIGHMEM
> configs:

For kmap() that would work, but for kmap_atomic() not so much when it is
called in non-preemptible context because vmap() might sleep.

> copy_page_to_iter() calls page_copy_sane() which checks:
>
>         head = compound_head(page);
>         if (likely(n <= v && v <= page_size(head)))
>                 return true;
>
> but then:
>
>                 void *kaddr = kmap_atomic(page);
>                 size_t wanted = copy_to_iter(kaddr + offset, bytes, i);
>                 kunmap_atomic(kaddr);
>
> so if offset to offset+bytes is larger than PAGE_SIZE, this is going to
> work for lowmem pages and fail miserably for highmem pages.  I suggest
> vmap() because vmap has a PAGE_SIZE gap between each allocation.

On 32bit highmem the kmap_atomic() case is easy: Double the number of
mapping slots and only use every second one, which gives you a guard
page between the maps.

For 64bit we could do something ugly: Enable the highmem kmap_atomic()
crud and enforce an alias mapping (at least on the architectures where
this is reasonable). Then you get the same as for 32bit.

> Alternatively if we could have a kmap_atomic_compound(), that would
> be awesome, but probably not realistic to implement.  I've more
> or less resigned myself to having to map things one page at a time.

That might be horribly awesome on 32bit :)

Thanks,

        tglx
