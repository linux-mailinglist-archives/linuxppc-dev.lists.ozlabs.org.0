Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F2627336A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 22:00:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwFfQ1Z7nzDqrn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 06:00:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwFcQ6mtLzDqnZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 05:58:29 +1000 (AEST)
IronPort-SDR: VxAL+SV449/oj7KM/pE+JeN46iS6TFHH03IR5e7G5TF4FgBtRRxt7CGCazh6oS1UurXCnqt+H/
 15voUTUcyQhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="140471501"
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; d="scan'208";a="140471501"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 12:58:26 -0700
IronPort-SDR: uOMQ77kzm8Nf+yWek1kTuScXulU6TmYu78CjdACPceLW7H1QaWd6t0P9Uf87NBJvd3fOhvq6oe
 f2Bh5k5J2ZCg==
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; d="scan'208";a="485647918"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 12:58:25 -0700
Date: Mon, 21 Sep 2020 12:58:25 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
Message-ID: <20200921195824.GM2540965@iweiny-DESK2.sc.intel.com>
References: <20200919091751.011116649@linutronix.de>
 <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <20200919173906.GQ32101@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200919173906.GQ32101@casper.infradead.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel@ffwll.ch>, Vineet Gupta <vgupta@synopsys.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 19, 2020 at 06:39:06PM +0100, Matthew Wilcox wrote:
> On Sat, Sep 19, 2020 at 10:18:54AM -0700, Linus Torvalds wrote:
> > On Sat, Sep 19, 2020 at 2:50 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> > >
> > > this provides a preemptible variant of kmap_atomic & related
> > > interfaces. This is achieved by:
> > 
> > Ack. This looks really nice, even apart from the new capability.
> > 
> > The only thing I really reacted to is that the name doesn't make sense
> > to me: "kmap_temporary()" seems a bit odd.
> > 
> > Particularly for an interface that really is basically meant as a
> > better replacement of "kmap_atomic()" (but is perhaps also a better
> > replacement for "kmap()").
> > 
> > I think I understand how the name came about: I think the "temporary"
> > is there as a distinction from the "longterm" regular kmap(). So I
> > think it makes some sense from an internal implementation angle, but I
> > don't think it makes a lot of sense from an interface name.
> > 
> > I don't know what might be a better name, but if we want to emphasize
> > that it's thread-private and a one-off, maybe "local" would be a
> > better naming, and make it distinct from the "global" nature of the
> > old kmap() interface?
> > 
> > However, another solution might be to just use this new preemptible
> > "local" kmap(), and remove the old global one entirely. Yes, the old
> > global one caches the page table mapping and that sounds really
> > efficient and nice. But it's actually horribly horribly bad, because
> > it means that we need to use locking for them. Your new "temporary"
> > implementation seems to be fundamentally better locking-wise, and only
> > need preemption disabling as locking (and is equally fast for the
> > non-highmem case).
> > 
> > So I wonder if the single-page TLB flush isn't a better model, and
> > whether it wouldn't be a lot simpler to just get rid of the old
> > complex kmap() entirely, and replace it with this?
> > 
> > I agree we can't replace the kmap_atomic() version, because maybe
> > people depend on the preemption disabling it also implied. But what
> > about replacing the non-atomic kmap()?
> 
> My concern with that is people might use kmap() and then pass the address
> to a different task.  So we need to audit the current users of kmap()
> and convert any that do that into using vmap() instead.
> 

I've done some of this work.[3]  PKS and pmem stray write protection[2] depend
on kmap to enable the correct PKS settings.  After working through the
exception handling we realized that some users of kmap() seem to be doing just
this; passing the address to a different task.

From what I have found ~90% of kmap() callers are 'kmap_thread()' and the other
~10% are kmap().[3]  But of those 10% I'm not familiar with the code enough to
know if they really require a 'global' map.  What I do know is they save an
address which appears to be used in other threads.  But I could be wrong.

For PKS I added a 'global' implementation which could then be called by kmap()
and added a new kmap_thread() call which used the original 'local' version of
the PKS interface.  The PKS work is still being reviewed internally for the TIP
core code.  But I've pushed it all to git hub for purposes of this
discussion.[1]

> I like kmap_local().  Or kmap_thread().

I chose kmap_thread() so that makes sense to me.  I also thought about using
kmap_global() as an alternative interface which would change just ~10% of the
callers and make the series much smaller.  But internal discussions lead me to
chose kmap_thread() as the new interface so that we don't change the semantics
of kmap().

Ira


[1] https://github.com/weiny2/linux-kernel/tree/lm-pks-pmem-for-5.10-v3

[2] https://lore.kernel.org/lkml/20200717072056.73134-1-ira.weiny@intel.com/

[3]
12:42:06 > git grep ' kmap(' *.c | grep -v '* ' | wc -l
22

12:43:32 > git grep ' kmap_thread(' *.c | grep -v '* ' | wc -l
204

Here are the callers which hand an address to another thread.

12:45:25 > git grep ' kmap(' *.c | grep -v '* '
arch/x86/mm/dump_pagetables.c:  [PKMAP_BASE_NR]         = { 0UL, "Persistent kmap() Area" },
drivers/firewire/net.c:         ptr = kmap(dev->broadcast_rcv_buffer.pages[u]);
drivers/gpu/drm/i915/gem/i915_gem_pages.c:              return kmap(sg_page(sgt->sgl));
drivers/gpu/drm/i915/selftests/i915_perf.c:     scratch = kmap(ce->vm->scratch[0].base.page);
drivers/gpu/drm/ttm/ttm_bo_util.c:              map->virtual = kmap(map->page);
drivers/infiniband/hw/qib/qib_user_sdma.c:      mpage = kmap(page);
drivers/misc/vmw_vmci/vmci_host.c:      context->notify = kmap(context->notify_page) + (uva & (PAGE_SIZE - 1));
drivers/misc/xilinx_sdfec.c:            addr = kmap(pages[i]);
drivers/mmc/host/usdhi6rol0.c:  host->pg.mapped         = kmap(host->pg.page);
drivers/mmc/host/usdhi6rol0.c:  host->pg.mapped = kmap(host->pg.page);
drivers/mmc/host/usdhi6rol0.c:  host->pg.mapped = kmap(host->pg.page);
drivers/nvme/target/tcp.c:              iov->iov_base = kmap(sg_page(sg)) + sg->offset + sg_offset;
drivers/scsi/libiscsi_tcp.c:            segment->sg_mapped = kmap(sg_page(sg));
drivers/target/iscsi/iscsi_target.c:            iov[i].iov_base = kmap(sg_page(sg)) + sg->offset + page_off;
drivers/target/target_core_transport.c:         return kmap(sg_page(sg)) + sg->offset;
fs/btrfs/check-integrity.c:             block_ctx->datav[i] = kmap(block_ctx->pagev[i]);
fs/ceph/dir.c:          cache_ctl->dentries = kmap(cache_ctl->page);
fs/ceph/inode.c:                ctl->dentries = kmap(ctl->page);
lib/scatterlist.c:              miter->addr = kmap(miter->page) + miter->__offset;
net/ceph/pagelist.c:    pl->mapped_tail = kmap(page);
net/ceph/pagelist.c:            pl->mapped_tail = kmap(page);
virt/kvm/kvm_main.c:                    hva = kmap(page);

