Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCA02A01A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 10:41:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMy3s6XtvzDqvp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 20:40:57 +1100 (AEDT)
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
 header.s=2020 header.b=Ijhg5aiO; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=irizuuQY; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMy1w6gm7zDqdd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 20:39:16 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604050752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EWXvaZJ4n33nUPpVqCcdjcDSYO5R/m7YAVCZo4qnz/w=;
 b=Ijhg5aiOMjBRx5rip6SYYGDFE2m3YLjbUBNKk+3NGBAB4R2XV1b2EqqlklIKhs9UUNQWQk
 z/BOQowWvycG+wd7WP6RDL8dKFwe1UJ0MqD2fe1iCRjFdXzP4PF0WPpHnySjM4mSn8TEDZ
 +rgRtwXuNFbgN3K9VuqJ5Qlvu3gg80bUbRb6nNMR+/JhtI3yWewHHZND9q4GfI+B5nak5E
 Txo5XRuNfIVvWuFUn8S5xduuQjkyrzj/pylK3pN+rsWG4as9auyvNfq1rB+V6+q9oD9RYg
 uWDVVgapgL3toLNiaXgwAR/Xo8x02IWniqNGp0tW1Ptti3gNq/7xKk1DGerynA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604050752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EWXvaZJ4n33nUPpVqCcdjcDSYO5R/m7YAVCZo4qnz/w=;
 b=irizuuQYfZdKA41k2RTCVBIm8nOzrSmQrzmbTW+9NWSzofxsL3XYrjHU85eqQdOWzHFOzN
 nZb9SEwnLnGs5ZBQ==
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
In-Reply-To: <87pn50ob0s.fsf@nanos.tec.linutronix.de>
References: <20201029221806.189523375@linutronix.de>
 <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
 <87pn50ob0s.fsf@nanos.tec.linutronix.de>
Date: Fri, 30 Oct 2020 10:39:11 +0100
Message-ID: <87blgknjcw.fsf@nanos.tec.linutronix.de>
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
 Guo Ren <guoren@kernel.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
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

On Fri, Oct 30 2020 at 00:41, Thomas Gleixner wrote:
> On Thu, Oct 29 2020 at 16:11, Linus Torvalds wrote:
> No, you're not misreading it, but doing it conditionally would be a
> complete semantical disaster. kmap_atomic*() also disables preemption
> and pagefaults unconditionaly.  If that wouldn't be the case then every
> caller would have to have conditionals like 'if (CONFIG_HIGHMEM)' or
> worse 'if (PageHighMem(page)'.
>
> Let's not go there.
>
> Migrate disable is a less horrible plague than preempt and pagefault
> disable even if the scheduler people disagree due to the lack of theory
> backing that up :)
>
> The charm of the new interface is that users still can rely on per
> cpuness independent of being on a highmem plagued system. For non
> highmem systems the extra migrate disable/enable is really a minor
> nuissance.

thinking about it some more after having sleep and coffee, we actually
could hide the migrate disable in the actual highmem part.

But then we really should not name it kmap_local. 'local' suggests
locality, think local_irq*, local_bh* ... kmap_task would be more
accurate then.

Toughts?

        tglx
