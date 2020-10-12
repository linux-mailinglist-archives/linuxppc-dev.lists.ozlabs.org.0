Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCA228C54B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 01:33:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9FNX0KwczDqGx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 10:33:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9FLg34rMzDqgn;
 Tue, 13 Oct 2020 10:31:33 +1100 (AEDT)
IronPort-SDR: xnq1x7XX2ZwvyJVS/AbtB79h9D/aiKETXBVLEosIMoAwrC5fsHE4p/Mqj2vBilviXAuoL7j76c
 NEDS9Qmd9/WQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="153648413"
X-IronPort-AV: E=Sophos;i="5.77,368,1596524400"; d="scan'208";a="153648413"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 16:31:28 -0700
IronPort-SDR: tYujEEKuwB7pwkDEJNgfSBtOh7hwJ+YZEVhRvoIibttlBusG3o0pRElwiIGjx+C70rOitVdHyl
 N8yvUi3stUVQ==
X-IronPort-AV: E=Sophos;i="5.77,368,1596524400"; d="scan'208";a="313606559"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 16:31:27 -0700
Date: Mon, 12 Oct 2020 16:31:26 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH RFC PKS/PMEM 22/58] fs/f2fs: Utilize new kmap_thread()
Message-ID: <20201012233126.GD2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-23-ira.weiny@intel.com>
 <20201009213434.GA839@sol.localdomain>
 <20201010003954.GW20115@casper.infradead.org>
 <20201010013036.GD1122@sol.localdomain>
 <20201012065635.GB2046448@iweiny-DESK2.sc.intel.com>
 <20201012161946.GA858@sol.localdomain>
 <5d621db9-23d4-e140-45eb-d7fca2093d2b@intel.com>
 <20201012164438.GA20115@casper.infradead.org>
 <20201012195354.GC2046448@iweiny-DESK2.sc.intel.com>
 <20201012200254.GB20115@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012200254.GB20115@casper.infradead.org>
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Dave Hansen <dave.hansen@intel.com>,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
 Eric Biggers <ebiggers@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 intel-wired-lan@lists.osuosl.org, kexec@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 bpf@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, io-uring@vger.kernel.org, linux-cachefs@redhat.com,
 linux-nfs@vger.kernel.org, linux-mm@kvack.org,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 12, 2020 at 09:02:54PM +0100, Matthew Wilcox wrote:
> On Mon, Oct 12, 2020 at 12:53:54PM -0700, Ira Weiny wrote:
> > On Mon, Oct 12, 2020 at 05:44:38PM +0100, Matthew Wilcox wrote:
> > > On Mon, Oct 12, 2020 at 09:28:29AM -0700, Dave Hansen wrote:
> > > > kmap_atomic() is always preferred over kmap()/kmap_thread().
> > > > kmap_atomic() is _much_ more lightweight since its TLB invalidation is
> > > > always CPU-local and never broadcast.
> > > > 
> > > > So, basically, unless you *must* sleep while the mapping is in place,
> > > > kmap_atomic() is preferred.
> > > 
> > > But kmap_atomic() disables preemption, so the _ideal_ interface would map
> > > it only locally, then on preemption make it global.  I don't even know
> > > if that _can_ be done.  But this email makes it seem like kmap_atomic()
> > > has no downsides.
> > 
> > And that is IIUC what Thomas was trying to solve.
> > 
> > Also, Linus brought up that kmap_atomic() has quirks in nesting.[1]
> > 
> > >From what I can see all of these discussions support the need to have something
> > between kmap() and kmap_atomic().
> > 
> > However, the reason behind converting call sites to kmap_thread() are different
> > between Thomas' patch set and mine.  Both require more kmap granularity.
> > However, they do so with different reasons and underlying implementations but
> > with the _same_ resulting semantics; a thread local mapping which is
> > preemptable.[2]  Therefore they each focus on changing different call sites.
> > 
> > While this patch set is huge I think it serves a valuable purpose to identify a
> > large number of call sites which are candidates for this new semantic.
> 
> Yes, I agree.  My problem with this patch-set is that it ties it to
> some Intel feature that almost nobody cares about.

I humbly disagree.  At this level the only thing this is tied to is the idea
that there are additional memory protections available which can be enabled
quickly on a per-thread basis.  PKS on Intel is but 1 implementation of that.

Even the kmap code only has knowledge that there is something which needs to be
done special on a devm page.

>
> Maybe we should
> care about it, but you didn't try very hard to make anyone care about
> it in the cover letter.

Ok my bad.  We have customers who care very much about restricting access to
the PMEM pages to prevent bugs in the kernel from causing permanent damage to
their data/file systems.  I'll reword the cover letter better.

> 
> For a future patch-set, I'd like to see you just introduce the new
> API.  Then you can optimise the Intel implementation of it afterwards.
> Those patch-sets have entirely different reviewers.

I considered doing this.  But this seemed more logical because the feature is
being driven by PMEM which is behind the kmap interface not by the users of the
API.

I can introduce a patch set with a kmap_thread() call which does nothing if
that is more palatable but it seems wrong to me to do so.

Ira
