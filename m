Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 768662A11C8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Oct 2020 00:54:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CNK0m5Y8GzDqyZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Oct 2020 10:54:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=zRWoFFCv; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=KMZe+VR6; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CNJzB0bmKzDqwl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Oct 2020 10:53:09 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604101982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fz1Lo4xloh2gm7jGRA98jpsF7G0W8WZ1zm340/bMNFg=;
 b=zRWoFFCvgFXvkgiRgd2PrNXxw0olM8jN9MbSlnu8Yx/bkkIwLGoWTGgE5i+fkO7y7sfeaU
 x3+aPSzi0iAtwo1vhwTgPleVK5/xOYWH8N2RRruBT8TdPfY1yZYoa6ljibdSog6RQ3gP6b
 u9DvoOLBFkfo24RQ7jamXSeMyTSj793ZoUFCoaa1YGqH033ahp/DnCR4xlXAoXzFSpH1x6
 yOJ/OV0er2B/4NNw+gN17a5j9W4zYUWj6YivuiRxMsRVquNHl+BF1GTYOstjhD+cwgQEKq
 s06u8I7IY1uEbPndJCEK7r6MHG28vjegHSi8SyClVAIgl5+Ri/+FYGlgYb5bjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604101982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fz1Lo4xloh2gm7jGRA98jpsF7G0W8WZ1zm340/bMNFg=;
 b=KMZe+VR6xvtTrU+cGlKn5VqvqFkwQoQ6BREOoFpj295prEyjjry9cru4z4uwe8nMiBCbyb
 2nsiSuFASxudGAAw==
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
In-Reply-To: <87pn4zl2ia.fsf@nanos.tec.linutronix.de>
References: <20201029221806.189523375@linutronix.de>
 <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
 <87pn50ob0s.fsf@nanos.tec.linutronix.de>
 <87blgknjcw.fsf@nanos.tec.linutronix.de>
 <CAHk-=whsJv0bwWRVZHsLoSe48ykAea6T7Oi=G+r8ckLrZ0YUpg@mail.gmail.com>
 <87sg9vl59i.fsf@nanos.tec.linutronix.de>
 <CAHk-=wjjO9BtTUAsLraqZqdzaPGJ-qvubZfwUsmRUX896eHcGw@mail.gmail.com>
 <87pn4zl2ia.fsf@nanos.tec.linutronix.de>
Date: Sat, 31 Oct 2020 00:53:02 +0100
Message-ID: <87mu03l19d.fsf@nanos.tec.linutronix.de>
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
 Ben Segall <bsegall@google.com>, Linux-MM <linux-mm@kvack.org>,
 Guo Ren <guoren@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-sparc <sparclinux@vger.kernel.org>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>,
 Mel Gorman <mgorman@suse.de>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>, Greentime Hu <green.hu@gmail.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, "David
 S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Oct 31 2020 at 00:26, Thomas Gleixner wrote:

> On Fri, Oct 30 2020 at 15:46, Linus Torvalds wrote:
>> On Fri, Oct 30, 2020 at 3:26 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>> To me, your patch series has two big advantages:
>>
>>  - more common code
>>
>>  - kmap_local() becomes more of a no-op
>>
>> and the last thing we want is to expand on kmap.
>
> Happy to go with that.
>
> While trying to document the mess, I just stumbled over the abuse of
> kmap_atomic_prot() in
>
> drivers/gpu/drm/ttm/ttm_bo_util.c:      dst = kmap_atomic_prot(d, prot);
> drivers/gpu/drm/ttm/ttm_bo_util.c:      src = kmap_atomic_prot(s, prot);
> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:   kmap_atomic_prot(d->dst_pages[dst_page],
> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:   kmap_atomic_prot(d->src_pages[src_page],
>
> For !HIGHMEM kmap_atomic_prot() just ignores the 'prot' argument and
> returns the page address. 
>
> Moar patches to be written ... Sigh!

Or not. This is actually correct by some definition of correct. For
the non highmem case pgprot is set via the set_memory_*() functions and
this just handles the highmem case.

Comments are overrrated...
