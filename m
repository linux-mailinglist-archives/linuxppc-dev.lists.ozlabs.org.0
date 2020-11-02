Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 533EC2A22B3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 02:09:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPZZm0N9RzDqXV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 12:09:52 +1100 (AEDT)
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
 header.s=2020 header.b=XrgDk26V; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=w804GlJ3; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPZY82J8gzDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Nov 2020 12:08:27 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604279303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4uGtzWR3XDWVzxJPeTJwUrr+92QjqUI1P4Rl6d07MCc=;
 b=XrgDk26VSw3lMWxT80X6p2BiIELFfSd45uXmpqg40hcbZPvcaSEbWpk3R+GxKbboSmpFo7
 63BVEl/BSGohNcNmokSUofaOuAyVB8TF4zkcITLfRQimdDp0/NzDabt6xoWCRv1KCKeW7F
 JBfHL2Zd4jfQiOa73d8ngQE8XEVUJ3AcbNTfvECT7y8NW8OaNw3Ie/CbXJDQBPmopC0hi6
 3UpqoW4N6M5pY4xkTcBxiJGRWb665zE7gX5m+PKTKEvvjyV6Hoqyt5gxZLMHwAEcjlgo+r
 WdCkNHrQQLMZuU+RDrUNzqVy0E0MpRf3weVrn07sYqVIDzra4XxQNgHUkZAAnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604279303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4uGtzWR3XDWVzxJPeTJwUrr+92QjqUI1P4Rl6d07MCc=;
 b=w804GlJ3cTjryaWI6xXsdwM5po9NFzF1/LMSPDCaZtr/gWtzM/1QwrA9gqRhs9hURGxtuJ
 nFG9PzKRhgh+hKBA==
To: LKML <linux-kernel@vger.kernel.org>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
In-Reply-To: <20201029221806.189523375@linutronix.de>
References: <20201029221806.189523375@linutronix.de>
Date: Mon, 02 Nov 2020 02:08:23 +0100
Message-ID: <87k0v48t14.fsf@nanos.tec.linutronix.de>
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
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Ben Segall <bsegall@google.com>, linux-mm@kvack.org,
 Guo Ren <guoren@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 sparclinux@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-arch@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
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
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, "David
 S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 29 2020 at 23:18, Thomas Gleixner wrote:
>
> There is also a still to be investigated question from Linus on the initial
> posting versus the per cpu / per task mapping stack depth which might need
> to be made larger due to the ability to take page faults within a mapping
> region.

I looked deeper into that and we have a stack depth of 20. That's plenty
and I couldn't find a way to get above 10 nested ones including faults,
interrupts, softirqs. With some stress testing I was not able to get over
a maximum of 6 according to the traceprintk I added.

For some obscure reason when CONFIG_DEBUG_HIGHMEM is enabled the stack
depth is increased from 20 to 41. But the only thing DEBUG_HIGHMEM does
is to enable a few BUG_ON()'s in the mapping code.

That's a leftover from the historical mapping code which had fixed
entries for various purposes. DEBUG_HIGHMEM inserted guard mappings
between the map types. But that got all ditched when kmap_atomic()
switched to a stack based map management. Though the WITH_KM_FENCE magic
survived without being functional. All the thing does today is to
increase the stack depth.

I just made that functional again by keeping the stack depth increase
and utilizing every second slot. That should catch Willy's mapping
problem nicely if he bothers to test on 32bit :)

Thanks,

        tglx

