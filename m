Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D50002A0645
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 14:12:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CN2mT039jzDqn2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Oct 2020 00:12:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CN2gT4YSVzDqmq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Oct 2020 00:08:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rfcpHo3sYbHG9663+/oEKU5+yDacWVNSfCtmxqY30IA=; b=JKDGOHNWU/V8Y+2rs/k7xDcd+D
 ywFaOKdh66CG7CRxohaMqHaFLXYS9D8UEmY4cTPadxISCv3CHKX+79wCldI0LV8nLjJimNpRjUFot
 BbcFgkfMoOoVVqbSn6at/tUwkE3W4TeiBSkn85uGjZxEhlxcEUEn86bKSTG6W3x+/e6w76iTiIDMo
 +S7YG45wv9UKO0gFrKbYfO0n5SfTbF1pG2kSlc2FKZXNaKU1XoICbQHjohPVjgTGHFNPIe1Xmtc6u
 jm1U+Hxe5+XhivRe6Qrj/AgJuMiGDjrS/uMW8LgIirsxF3LkwsBxbZgQIkCutkdRTk0XP+Op+X95w
 kA9B9H+g==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kYU6t-0002Yw-HM; Fri, 30 Oct 2020 13:06:27 +0000
Date: Fri, 30 Oct 2020 13:06:27 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic
 & friends
Message-ID: <20201030130627.GI27442@casper.infradead.org>
References: <20201029221806.189523375@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029221806.189523375@linutronix.de>
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

On Thu, Oct 29, 2020 at 11:18:06PM +0100, Thomas Gleixner wrote:
> This series provides kmap_local.* iomap_local variants which only disable
> migration to keep the virtual mapping address stable accross preemption,
> but do neither disable pagefaults nor preemption. The new functions can be
> used in any context, but if used in atomic context the caller has to take
> care of eventually disabling pagefaults.

Could I ask for a CONFIG_KMAP_DEBUG which aliases all the kmap variants
to vmap()?  I think we currently have a problem in iov_iter on HIGHMEM
configs:

copy_page_to_iter() calls page_copy_sane() which checks:

        head = compound_head(page);
        if (likely(n <= v && v <= page_size(head)))
                return true;

but then:

                void *kaddr = kmap_atomic(page);
                size_t wanted = copy_to_iter(kaddr + offset, bytes, i);
                kunmap_atomic(kaddr);

so if offset to offset+bytes is larger than PAGE_SIZE, this is going to
work for lowmem pages and fail miserably for highmem pages.  I suggest
vmap() because vmap has a PAGE_SIZE gap between each allocation.

Alternatively if we could have a kmap_atomic_compound(), that would
be awesome, but probably not realistic to implement.  I've more
or less resigned myself to having to map things one page at a time.
