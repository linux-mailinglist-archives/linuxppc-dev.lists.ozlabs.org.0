Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CBA2A10D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 23:28:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CNH5B756BzDqy1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Oct 2020 09:28:14 +1100 (AEDT)
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
 header.s=2020 header.b=LxHJ68FH; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=2rJuYiPt; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CNH3S251YzDqvL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Oct 2020 09:26:44 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604096793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=26Ts76LEb5dF8UM0hmSIHaJpUqiGiJWBHMp5iFf7PiU=;
 b=LxHJ68FH0YuIEFWx2pJpQimCZfTiqoGgDDau1FguLxRy0zRx9jDZctdAlFRJ324v8CuoYi
 ZcuxU/DPzAwKZjuk1f5n85YkZURSL9nRFHt8mfu6t3it4VWyE7SlneV0erS9MR7nX9FzlP
 P+HNof6Xh5RpyyaWT992LVmq2zyMt7WHQ/M2MkeRhrztzkZ4okq5IzkTTD/fUPiSmr0pHZ
 BD6hj5xP7axA2OIEeQSYPyXK4XbM9OHuPNmPWTriLFFXeAcRngKo5tuvQR0c5M5uRZiaiR
 7vOFKe6AAtTBf3UuZjT2hn26v4yx6tPJ2p6ldMkYWP3ZaJp8ZxNVmOK4vPxpMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604096793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=26Ts76LEb5dF8UM0hmSIHaJpUqiGiJWBHMp5iFf7PiU=;
 b=2rJuYiPt20Oowm+h+GqzEiWNX0OgtYb09gN+zSFDN57qQiTBtXhd6AncITU48GjmrMPQTD
 wElJt4hkBKleVUBg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
In-Reply-To: <CAHk-=whsJv0bwWRVZHsLoSe48ykAea6T7Oi=G+r8ckLrZ0YUpg@mail.gmail.com>
References: <20201029221806.189523375@linutronix.de>
 <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
 <87pn50ob0s.fsf@nanos.tec.linutronix.de>
 <87blgknjcw.fsf@nanos.tec.linutronix.de>
 <CAHk-=whsJv0bwWRVZHsLoSe48ykAea6T7Oi=G+r8ckLrZ0YUpg@mail.gmail.com>
Date: Fri, 30 Oct 2020 23:26:33 +0100
Message-ID: <87sg9vl59i.fsf@nanos.tec.linutronix.de>
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

On Fri, Oct 30 2020 at 13:28, Linus Torvalds wrote:
> On Fri, Oct 30, 2020 at 2:39 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> But then we really should not name it kmap_local. 'local' suggests
>> locality, think local_irq*, local_bh* ... kmap_task would be more
>> accurate then.
>
> So the main reason I'd like to see it is because I think on a
> non-highmem machine, the new kmap should be a complete no-op. IOW,
> we'd make sure that there are no costs, no need to increment any
> "restrict migration" counts etc.

Fair enough.

> It's been a bit of a pain to have kmap_atomic() have magical side
> semantics that people might then depend on.

kmap_atomic() will still have the side semantics :)

> I think "local" could still work as a name, because it would have to
> be thread-local (and maybe we'd want a debug mode where that gets
> verified, as actual HIGHMEM machines are getting rare).
>
> I'd avoid "task", because that implies (to me, at least) that it
> wouldn't be good for interrupts etc that don't have a task context.
>
> I think the main issue is that it has to be released in the same
> context as it was created (ie no passing those things around to other
> contexts). I think "local" is fine for that, but I could imagine other
> names. The ones that come to mind are somewhat cumbersome, though
> ("shortterm" or "local_ctx" or something along those lines).

Yeah, not really intuitive either.

Let's stick with _local and add proper function documentation which
clearly says, that the side effect of non-migratability applies only for
the 32bit highmem case in order to make it work at all.

So code which needs CPU locality cannot rely on it and we have enough
debug stuff to catch something like:

    kmap_local()
    this_cpu_write(....)
    kunmap_local()

Let me redo the pile.

While at it I might have a look at that debug request from Willy in the
other end of this thread. Any comment on that?

 https://lore.kernel.org/r/87k0v7mrrd.fsf@nanos.tec.linutronix.de

Thanks,

        tglx


      
