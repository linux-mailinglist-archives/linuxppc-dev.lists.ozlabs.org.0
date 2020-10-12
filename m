Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 260BD28ADFC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 07:54:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8ntP08g5zDqcv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 16:54:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8nrY3kJJzDqg8;
 Mon, 12 Oct 2020 16:52:23 +1100 (AEDT)
IronPort-SDR: kTwb0GqYtLmHxaGfsygL1TbfbTZQQ6KTOw2RSz9RRpTXt1fjnPtkaPHaZej6jtiJr5mxmvHNay
 6+ekxI+gV1pw==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="165805942"
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; d="scan'208";a="165805942"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 22:52:20 -0700
IronPort-SDR: Ya9EDAn3SOMd08SCKVKBtueoni+yyq9EF8H8N9tr+YE/IrdFHweYy6SREcwPgxnde0DbbLRvxa
 rOKYCbITG9ew==
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; d="scan'208";a="520573207"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 22:52:19 -0700
Date: Sun, 11 Oct 2020 22:52:19 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH RFC PKS/PMEM 57/58] nvdimm/pmem: Stray access protection
 for pmem->virt_addr
Message-ID: <20201012055218.GA2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-58-ira.weiny@intel.com>
 <bd3f5ece-0e7b-4c15-abbc-1b3b943334dc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd3f5ece-0e7b-4c15-abbc-1b3b943334dc@nvidia.com>
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
 Thomas Gleixner <tglx@linutronix.de>, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 ceph-devel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 io-uring@vger.kernel.org, cluster-devel@redhat.com,
 Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, linux-afs@lists.infradead.org,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-cachefs@redhat.com,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 09, 2020 at 07:53:07PM -0700, John Hubbard wrote:
> On 10/9/20 12:50 PM, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > The pmem driver uses a cached virtual address to access its memory
> > directly.  Because the nvdimm driver is well aware of the special
> > protections it has mapped memory with, we call dev_access_[en|dis]able()
> > around the direct pmem->virt_addr (pmem_addr) usage instead of the
> > unnecessary overhead of trying to get a page to kmap.
> > 
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > ---
> >   drivers/nvdimm/pmem.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> > index fab29b514372..e4dc1ae990fc 100644
> > --- a/drivers/nvdimm/pmem.c
> > +++ b/drivers/nvdimm/pmem.c
> > @@ -148,7 +148,9 @@ static blk_status_t pmem_do_read(struct pmem_device *pmem,
> >   	if (unlikely(is_bad_pmem(&pmem->bb, sector, len)))
> >   		return BLK_STS_IOERR;
> > +	dev_access_enable(false);
> >   	rc = read_pmem(page, page_off, pmem_addr, len);
> > +	dev_access_disable(false);
> 
> Hi Ira!
> 
> The APIs should be tweaked to use a symbol (GLOBAL, PER_THREAD), instead of
> true/false. Try reading the above and you'll see that it sounds like it's
> doing the opposite of what it is ("enable_this(false)" sounds like a clumsy
> API design to *disable*, right?). And there is no hint about the scope.

Sounds reasonable.

> 
> And it *could* be so much more readable like this:
> 
>     dev_access_enable(DEV_ACCESS_THIS_THREAD);

I'll think about the flag name.  I'm not liking 'this thread'.

Maybe DEV_ACCESS_[GLOBAL|THREAD]

Ira

