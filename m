Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B2F3B869E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 17:57:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFQw20xfVz3bWf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 01:57:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nFQR+NYj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nFQR+NYj; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFQvb0l7Sz2xvJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 01:56:58 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EC0061396;
 Wed, 30 Jun 2021 15:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625068615;
 bh=t4c1D/KrdZudddoFFMreAQi55GnAG0OUL4mpRujr/+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nFQR+NYjpCrpMIj0+9nBAj35wlj1qXRWbFKtyhNDLpJTAm3BAAOI+jIUn7QIQ6LMC
 /D08b/Wyq1LKmfD6NJJYuuUXm1XpHRMF+bzag+U7SE0Xnf1l+0yaFFUCUoKE4yB6Fx
 KHCUGF9UUbr1kSihYQ7S2P6QTrW/0sw9J8RiF/5y7S55QWGDrjBUVqbIJpceKtB839
 13XYMsllNYSyOsjMPZqtEclitRsqTPicPLIWpPGvJ9tnj6RZjijLVBtTMriTuGUDnx
 pujXO32GnzzUvzSsthpj3FxbtH2/lBtbWkeBfV4uT8mpQQ+qjMcUVFz7XO5LQkzFA7
 Ko9guip4RPSmA==
Date: Wed, 30 Jun 2021 08:56:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <YNyUQwiagNeZ9YeJ@Ryzen-9-3900X.localdomain>
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-7-tientzu@chromium.org>
 <YNvMDFWKXSm4LRfZ@Ryzen-9-3900X.localdomain>
 <CALiNf2-a-haQN0-4+gX8+wa++52-0CnO2O4BEkxrQCxoTa_47w@mail.gmail.com>
 <20210630114348.GA8383@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210630114348.GA8383@willie-the-truck>
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Qian Cai <quic_qiancai@quicinc.com>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Will and Claire,

On Wed, Jun 30, 2021 at 12:43:48PM +0100, Will Deacon wrote:
> On Wed, Jun 30, 2021 at 05:17:27PM +0800, Claire Chang wrote:
> > On Wed, Jun 30, 2021 at 9:43 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > On Thu, Jun 24, 2021 at 11:55:20PM +0800, Claire Chang wrote:
> > > > Propagate the swiotlb_force into io_tlb_default_mem->force_bounce and
> > > > use it to determine whether to bounce the data or not. This will be
> > > > useful later to allow for different pools.
> > > >
> > > > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > > > Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> > > > Tested-by: Will Deacon <will@kernel.org>
> > > > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> > >
> > > This patch as commit af452ec1b1a3 ("swiotlb: Use is_swiotlb_force_bounce
> > > for swiotlb data bouncing") causes my Ryzen 3 4300G system to fail to
> > > get to an X session consistently (although not every single time),
> > > presumably due to a crash in the AMDGPU driver that I see in dmesg.
> > >
> > > I have attached logs at af452ec1b1a3 and f127c9556a8e and I am happy
> > > to provide any further information, debug, or test patches as necessary.
> > 
> > Are you using swiotlb=force? or the swiotlb_map is called because of
> > !dma_capable? (https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/kernel/dma/direct.h#n93)
> 
> The command line is in the dmesg:
> 
>   | Kernel command line: initrd=\amd-ucode.img initrd=\initramfs-linux-next-llvm.img root=PARTUUID=8680aa0c-cf09-4a69-8cf3-970478040ee7 rw intel_pstate=no_hwp irqpoll
> 
> but I worry that this looks _very_ similar to the issue reported by Qian
> Cai which we thought we had fixed. Nathan -- is the failure deterministic?

Yes, for the most part. It does not happen every single boot so when I
was bisecting, I did a series of seven boots and only considered the
revision good when all seven of them made it to LightDM's greeter. My
results that I notated show most bad revisions failed anywhere from four
to six times.

> > `BUG: unable to handle page fault for address: 00000000003a8290` and
> > the fact it crashed at `_raw_spin_lock_irqsave` look like the memory
> > (maybe dev->dma_io_tlb_mem) was corrupted?
> > The dev->dma_io_tlb_mem should be set here
> > (https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pci/probe.c#n2528)
> > through device_initialize.
> 
> I'm less sure about this. 'dma_io_tlb_mem' should be pointing at
> 'io_tlb_default_mem', which is a page-aligned allocation from memblock.
> The spinlock is at offset 0x24 in that structure, and looking at the
> register dump from the crash:
> 
> Jun 29 18:28:42 hp-4300G kernel: RSP: 0018:ffffadb4013db9e8 EFLAGS: 00010006
> Jun 29 18:28:42 hp-4300G kernel: RAX: 00000000003a8290 RBX: 0000000000000000 RCX: ffff8900572ad580
> Jun 29 18:28:42 hp-4300G kernel: RDX: ffff89005653f024 RSI: 00000000000c0000 RDI: 0000000000001d17
> Jun 29 18:28:42 hp-4300G kernel: RBP: 000000000a20d000 R08: 00000000000c0000 R09: 0000000000000000
> Jun 29 18:28:42 hp-4300G kernel: R10: 000000000a20d000 R11: ffff89005653f000 R12: 0000000000000212
> Jun 29 18:28:42 hp-4300G kernel: R13: 0000000000001000 R14: 0000000000000002 R15: 0000000000200000
> Jun 29 18:28:42 hp-4300G kernel: FS:  00007f1f8898ea40(0000) GS:ffff890057280000(0000) knlGS:0000000000000000
> Jun 29 18:28:42 hp-4300G kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> Jun 29 18:28:42 hp-4300G kernel: CR2: 00000000003a8290 CR3: 00000001020d0000 CR4: 0000000000350ee0
> Jun 29 18:28:42 hp-4300G kernel: Call Trace:
> Jun 29 18:28:42 hp-4300G kernel:  _raw_spin_lock_irqsave+0x39/0x50
> Jun 29 18:28:42 hp-4300G kernel:  swiotlb_tbl_map_single+0x12b/0x4c0
> 
> Then that correlates with R11 holding the 'dma_io_tlb_mem' pointer and
> RDX pointing at the spinlock. Yet RAX is holding junk :/
> 
> I agree that enabling KASAN would be a good idea, but I also think we
> probably need to get some more information out of swiotlb_tbl_map_single()
> to see see what exactly is going wrong in there.

I can certainly enable KASAN and if there is any debug print I can add
or dump anything, let me know!

Cheers,
Nathan
