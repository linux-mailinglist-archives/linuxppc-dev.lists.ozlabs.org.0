Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532D83BA77B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jul 2021 07:56:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GH1Ql1Q5Qz30Cm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jul 2021 15:55:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I0O6LGfd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=I0O6LGfd; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GH1Q83sQdz2yxx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Jul 2021 15:55:28 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74FC461424;
 Sat,  3 Jul 2021 05:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625291725;
 bh=HbboShhJw0f/xTnUHQfXIFinz/CiXs1HWoUcY3xQXJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I0O6LGfdCvtS7x+XbgKrTkXDiWa9+ydNpeJ+Hpd6thPwMt/pojOE7wFc9EaMa5s/7
 fzphfhgg11VE20oFX64ca0R8nMN+8vPQbIU1BgmW4rl6XbnuFKZDhNjV8cRQqP0aY/
 FYsbmLfYPBUSfZ61FOTt8DbsSGB4+VMnlmpSxUQAttiKVwK+o8pXqyAD2ddyoHmIgj
 0e7EjrXmY1/a7Nazd1WwuwVUez38Y6EoEwEcX6CsBiVsyBW0zgITA8LugP+eVTC2Bd
 ov/kHYh9GLPWR8A0vxWjZQwwD5frujwFh8tpknLuguSreNmEDXPVqcNA1c0N8kxgBn
 Wddj3pL7y93qw==
Date: Fri, 2 Jul 2021 22:55:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-7-tientzu@chromium.org>
 <YNvMDFWKXSm4LRfZ@Ryzen-9-3900X.localdomain>
 <CALiNf2-a-haQN0-4+gX8+wa++52-0CnO2O4BEkxrQCxoTa_47w@mail.gmail.com>
 <20210630114348.GA8383@willie-the-truck>
 <YNyUQwiagNeZ9YeJ@Ryzen-9-3900X.localdomain>
 <20210701074045.GA9436@willie-the-truck>
 <ea28db1f-846e-4f0a-4f13-beb67e66bbca@kernel.org>
 <20210702135856.GB11132@willie-the-truck>
 <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="IzhtKCoR/XhZJq5z"
Content-Disposition: inline
In-Reply-To: <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
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
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Will Deacon <will@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, jani.nikula@linux.intel.com,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Claire Chang <tientzu@chromium.org>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Qian Cai <quic_qiancai@quicinc.com>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--IzhtKCoR/XhZJq5z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will and Robin,

On Fri, Jul 02, 2021 at 04:13:50PM +0100, Robin Murphy wrote:
> On 2021-07-02 14:58, Will Deacon wrote:
> > Hi Nathan,
> > 
> > On Thu, Jul 01, 2021 at 12:52:20AM -0700, Nathan Chancellor wrote:
> > > On 7/1/2021 12:40 AM, Will Deacon wrote:
> > > > On Wed, Jun 30, 2021 at 08:56:51AM -0700, Nathan Chancellor wrote:
> > > > > On Wed, Jun 30, 2021 at 12:43:48PM +0100, Will Deacon wrote:
> > > > > > On Wed, Jun 30, 2021 at 05:17:27PM +0800, Claire Chang wrote:
> > > > > > > `BUG: unable to handle page fault for address: 00000000003a8290` and
> > > > > > > the fact it crashed at `_raw_spin_lock_irqsave` look like the memory
> > > > > > > (maybe dev->dma_io_tlb_mem) was corrupted?
> > > > > > > The dev->dma_io_tlb_mem should be set here
> > > > > > > (https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pci/probe.c#n2528)
> > > > > > > through device_initialize.
> > > > > > 
> > > > > > I'm less sure about this. 'dma_io_tlb_mem' should be pointing at
> > > > > > 'io_tlb_default_mem', which is a page-aligned allocation from memblock.
> > > > > > The spinlock is at offset 0x24 in that structure, and looking at the
> > > > > > register dump from the crash:
> > > > > > 
> > > > > > Jun 29 18:28:42 hp-4300G kernel: RSP: 0018:ffffadb4013db9e8 EFLAGS: 00010006
> > > > > > Jun 29 18:28:42 hp-4300G kernel: RAX: 00000000003a8290 RBX: 0000000000000000 RCX: ffff8900572ad580
> > > > > > Jun 29 18:28:42 hp-4300G kernel: RDX: ffff89005653f024 RSI: 00000000000c0000 RDI: 0000000000001d17
> > > > > > Jun 29 18:28:42 hp-4300G kernel: RBP: 000000000a20d000 R08: 00000000000c0000 R09: 0000000000000000
> > > > > > Jun 29 18:28:42 hp-4300G kernel: R10: 000000000a20d000 R11: ffff89005653f000 R12: 0000000000000212
> > > > > > Jun 29 18:28:42 hp-4300G kernel: R13: 0000000000001000 R14: 0000000000000002 R15: 0000000000200000
> > > > > > Jun 29 18:28:42 hp-4300G kernel: FS:  00007f1f8898ea40(0000) GS:ffff890057280000(0000) knlGS:0000000000000000
> > > > > > Jun 29 18:28:42 hp-4300G kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > > > Jun 29 18:28:42 hp-4300G kernel: CR2: 00000000003a8290 CR3: 00000001020d0000 CR4: 0000000000350ee0
> > > > > > Jun 29 18:28:42 hp-4300G kernel: Call Trace:
> > > > > > Jun 29 18:28:42 hp-4300G kernel:  _raw_spin_lock_irqsave+0x39/0x50
> > > > > > Jun 29 18:28:42 hp-4300G kernel:  swiotlb_tbl_map_single+0x12b/0x4c0
> > > > > > 
> > > > > > Then that correlates with R11 holding the 'dma_io_tlb_mem' pointer and
> > > > > > RDX pointing at the spinlock. Yet RAX is holding junk :/
> > > > > > 
> > > > > > I agree that enabling KASAN would be a good idea, but I also think we
> > > > > > probably need to get some more information out of swiotlb_tbl_map_single()
> > > > > > to see see what exactly is going wrong in there.
> > > > > 
> > > > > I can certainly enable KASAN and if there is any debug print I can add
> > > > > or dump anything, let me know!
> > > > 
> > > > I bit the bullet and took v5.13 with swiotlb/for-linus-5.14 merged in, built
> > > > x86 defconfig and ran it on my laptop. However, it seems to work fine!
> > > > 
> > > > Please can you share your .config?
> > > 
> > > Sure thing, it is attached. It is just Arch Linux's config run through
> > > olddefconfig. The original is below in case you need to diff it.
> > > 
> > > https://raw.githubusercontent.com/archlinux/svntogit-packages/9045405dc835527164f3034b3ceb9a67c7a53cd4/trunk/config
> > > 
> > > If there is anything more that I can provide, please let me know.
> > 
> > I eventually got this booting (for some reason it was causing LD to SEGV
> > trying to link it for a while...) and sadly it works fine on my laptop. Hmm.

Seems like it might be something specific to the amdgpu module?

> > Did you manage to try again with KASAN?

Yes, it took a few times to reproduce the issue but I did manage to get
a dmesg, please find it attached. I build from commit 7d31f1c65cc9 ("swiotlb:
fix implicit debugfs declarations") in Konrad's tree.

> > It might also be worth taking the IOMMU out of the equation, since that
> > interfaces differently with SWIOTLB and I couldn't figure out the code path
> > from the log you provided. What happens if you boot with "amd_iommu=off
> > swiotlb=force"?
> 
> Oh, now there's a thing... the chat from the IOMMU API in the boot log
> implies that the IOMMU *should* be in the picture - we see that default
> domains are IOMMU_DOMAIN_DMA default and the GPU 0000:0c:00.0 was added to a
> group. That means dev->dma_ops should be set and DMA API calls should be
> going through iommu-dma, yet the callstack in the crash says we've gone
> straight from dma_map_page_attrs() to swiotlb_map(), implying the inline
> dma_direct_map_page() path.
> 
> If dev->dma_ops didn't look right in the first place, it's perhaps less
> surprising that dev->dma_io_tlb_mem might be wild as well. It doesn't seem
> plausible that we should have a race between initialising the device and
> probing its driver, so maybe the whole dev pointer is getting trampled
> earlier in the callchain (or is fundamentally wrong to begin with, but from
> a quick skim of the amdgpu code it did look like adev->dev and adev->pdev
> are appropriately set early on by amdgpu_pci_probe()).
> 
> > (although word of warning here: i915 dies horribly on my laptop if I pass
> > swiotlb=force, even with the distro 5.10 kernel)
> 
> FWIW I'd imagine you probably need to massively increase the SWIOTLB buffer
> size to have hope of that working.

Is it worth trying this still then?

Cheers,
Nathan

--IzhtKCoR/XhZJq5z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="7d31f1c65cc9-kasan.log"

[    0.000000] Linux version 5.12.0-rc3-debug (nathan@archlinux-ax161) (gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1) #1 SMP PREEMPT Fri Jul 2 22:22:23 MST 2021
[    0.000000] Command line: initrd=\amd-ucode.img initrd=\initramfs-linux-mainline-llvm.img root=PARTUUID=8680aa0c-cf09-4a69-8cf3-970478040ee7 rw intel_pstate=no_hwp debug ignore_loglevel earlyprintk=efi,keep log_buf_len=16M
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009c0ffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009c10000-0x0000000009ffffff] reserved
[    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff] usable
[    0.000000] BIOS-e820: [mem 0x000000000a200000-0x000000000a20cfff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000000a20d000-0x000000000affffff] usable
[    0.000000] BIOS-e820: [mem 0x000000000b000000-0x000000000b01ffff] reserved
[    0.000000] BIOS-e820: [mem 0x000000000b020000-0x00000000b838ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000b8390000-0x00000000b86c5fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000b86c6000-0x00000000b8721fff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000b8722000-0x00000000b8a14fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000b8a15000-0x00000000badfefff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000badff000-0x00000000bbffffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000bc000000-0x00000000bdffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000bf000000-0x00000000bfffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000f0000000-0x00000000f7ffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fd200000-0x00000000fd2fffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fd600000-0x00000000fd6fffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fea00000-0x00000000fea0ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000feb80000-0x00000000fec01fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec30000-0x00000000fec30fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed40000-0x00000000fed44fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed8ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fedc2000-0x00000000fedcffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fedd4000-0x00000000fedd5fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000021f37ffff] usable
[    0.000000] BIOS-e820: [mem 0x000000021f380000-0x000000023fffffff] reserved
[    0.000000] intel_pstate: HWP disabled
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] e820: update [mem 0xb4c66018-0xb4c73457] usable ==> usable
[    0.000000] e820: update [mem 0xb4c66018-0xb4c73457] usable ==> usable
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] reserve setup_data: [mem 0x00000000000a0000-0x00000000000fffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000009c0ffff] usable
[    0.000000] reserve setup_data: [mem 0x0000000009c10000-0x0000000009ffffff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000a000000-0x000000000a1fffff] usable
[    0.000000] reserve setup_data: [mem 0x000000000a200000-0x000000000a20cfff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x000000000a20d000-0x000000000affffff] usable
[    0.000000] reserve setup_data: [mem 0x000000000b000000-0x000000000b01ffff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000b020000-0x00000000b4c66017] usable
[    0.000000] reserve setup_data: [mem 0x00000000b4c66018-0x00000000b4c73457] usable
[    0.000000] reserve setup_data: [mem 0x00000000b4c73458-0x00000000b838ffff] usable
[    0.000000] reserve setup_data: [mem 0x00000000b8390000-0x00000000b86c5fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000b86c6000-0x00000000b8721fff] ACPI data
[    0.000000] reserve setup_data: [mem 0x00000000b8722000-0x00000000b8a14fff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x00000000b8a15000-0x00000000badfefff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000badff000-0x00000000bbffffff] usable
[    0.000000] reserve setup_data: [mem 0x00000000bc000000-0x00000000bdffffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000bf000000-0x00000000bfffffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000f0000000-0x00000000f7ffffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fd200000-0x00000000fd2fffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fd600000-0x00000000fd6fffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fea00000-0x00000000fea0ffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000feb80000-0x00000000fec01fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec30000-0x00000000fec30fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed40000-0x00000000fed44fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed80000-0x00000000fed8ffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fedc2000-0x00000000fedcffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fedd4000-0x00000000fedd5fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000021f37ffff] usable
[    0.000000] reserve setup_data: [mem 0x000000021f380000-0x000000023fffffff] reserved
[    0.000000] efi: EFI v2.70 by American Megatrends
[    0.000000] efi: ACPI=0xb8721000 ACPI 2.0=0xb8721014 TPMFinalLog=0xb89c8000 SMBIOS=0xbac0f000 SMBIOS 3.0=0xbac0e000 MEMATTR=0xb5184018 ESRT=0xb6dde918 RNG=0xbac3e998 TPMEventLog=0xb5185018 
[    0.000000] efi: seeding entropy pool
[    0.000000] SMBIOS 3.3.0 present.
[    0.000000] DMI: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17/2020
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 3793.113 MHz processor
[    0.000282] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000289] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000312] last_pfn = 0x21f380 max_arch_pfn = 0x400000000
[    0.000759] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.001796] e820: update [mem 0xc0000000-0xffffffff] usable ==> reserved
[    0.001811] last_pfn = 0xbc000 max_arch_pfn = 0x400000000
[    0.006400] esrt: Reserving ESRT space from 0x00000000b6dde918 to 0x00000000b6dde950.
[    0.006423] e820: update [mem 0xb6dde000-0xb6ddefff] usable ==> reserved
[    0.006833] check: Scanning 1 areas for low memory corruption
[    0.006842] Using GB pages for direct mapping
[    0.028975] printk: log_buf_len: 16777216 bytes
[    0.028982] printk: early log buf free: 123936(94%)
[    0.028986] Secure boot disabled
[    0.028988] RAMDISK: [mem 0x7f7c7000-0x7fff5fff]
[    0.029012] ACPI: Early table checksum verification disabled
[    0.029022] ACPI: RSDP 0x00000000B8721014 000024 (v02 HPQOEM)
[    0.029032] ACPI: XSDT 0x00000000B8720728 0000EC (v01 HPQOEM SLIC-CPC 01072009 AMI  01000013)
[    0.029045] ACPI: FACP 0x00000000B870F000 000114 (v06 HPQOEM SLIC-CPC 01072009 AMI  00010013)
[    0.029059] ACPI: DSDT 0x00000000B86FE000 01050C (v02 HPQOEM SLIC-CPC 01072009 INTL 20120913)
[    0.029068] ACPI: FACS 0x00000000B89F8000 000040
[    0.029076] ACPI: MSDM 0x00000000B871F000 000055 (v03 HPQOEM SLIC-CPC 01072009 AMI  01000013)
[    0.029085] ACPI: SSDT 0x00000000B871E000 000050 (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
[    0.029093] ACPI: IVRS 0x00000000B871D000 0000D0 (v02 HPQOEM SLIC-CPC 00000001 AMD  00000000)
[    0.029102] ACPI: SSDT 0x00000000B8715000 007229 (v02 HPQOEM SLIC-CPC 00000002 MSFT 04000000)
[    0.029110] ACPI: SSDT 0x00000000B8711000 003BA1 (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
[    0.029119] ACPI: SSDT 0x00000000B8710000 000094 (v02 HPQOEM SLIC-CPC 01072009 AMI  01072009)
[    0.029128] ACPI: FIDT 0x00000000B86FD000 00009C (v01 HPQOEM SLIC-CPC 01072009 AMI  00010013)
[    0.029136] ACPI: MCFG 0x00000000B86FC000 00003C (v01 HPQOEM SLIC-CPC 01072009 MSFT 00010013)
[    0.029145] ACPI: HPET 0x00000000B86FB000 000038 (v01 HPQOEM SLIC-CPC 01072009 AMI  00000005)
[    0.029154] ACPI: VFCT 0x00000000B86ED000 00D484 (v01 HPQOEM SLIC-CPC 00000001 AMD  31504F47)
[    0.029162] ACPI: BGRT 0x00000000B86EC000 000038 (v01 HPQOEM SLIC-CPC 01072009 AMI  00010013)
[    0.029171] ACPI: TPM2 0x00000000B86EB000 00004C (v04 HPQOEM SLIC-CPC 00000001 AMI  00000000)
[    0.029179] ACPI: SSDT 0x00000000B86E9000 001CE4 (v02 HPQOEM SLIC-CPC 00000001 AMD  00000001)
[    0.029188] ACPI: CRAT 0x00000000B86E8000 0007E8 (v01 HPQOEM SLIC-CPC 00000001 AMD  00000001)
[    0.029197] ACPI: CDIT 0x00000000B86E7000 000029 (v01 HPQOEM SLIC-CPC 00000001 AMD  00000001)
[    0.029205] ACPI: SSDT 0x00000000B86E6000 000D37 (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
[    0.029214] ACPI: SSDT 0x00000000B86E4000 0010A5 (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
[    0.029222] ACPI: SSDT 0x00000000B86E0000 00333E (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
[    0.029231] ACPI: SSDT 0x00000000B86DF000 0000BF (v01 HPQOEM SLIC-CPC 00001000 INTL 20120913)
[    0.029240] ACPI: WSMT 0x00000000B86DE000 000028 (v01 HPQOEM SLIC-CPC 01072009 AMI  00010013)
[    0.029248] ACPI: APIC 0x00000000B86DD000 00015E (v03 HPQOEM SLIC-CPC 01072009 AMI  00010013)
[    0.029257] ACPI: SSDT 0x00000000B86DC000 000517 (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
[    0.029266] ACPI: SSDT 0x00000000B86DA000 0010AF (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
[    0.029274] ACPI: FPDT 0x00000000B86D9000 000044 (v01 HPQOEM SLIC-CPC 01072009 AMI  01000013)
[    0.029288] ACPI: Local APIC address 0xfee00000
[    0.029611] No NUMA configuration found
[    0.029614] Faking a node at [mem 0x0000000000000000-0x000000021f37ffff]
[    0.029626] NODE_DATA(0) allocated [mem 0x21ab7c000-0x21ab7ffff]
[    0.029690] Zone ranges:
[    0.029693]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.029698]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.029702]   Normal   [mem 0x0000000100000000-0x000000021f37ffff]
[    0.029707]   Device   empty
[    0.029710] Movable zone start for each node
[    0.029713] Early memory node ranges
[    0.029715]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.029718]   node   0: [mem 0x0000000000100000-0x0000000009c0ffff]
[    0.029722]   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
[    0.029725]   node   0: [mem 0x000000000a20d000-0x000000000affffff]
[    0.029728]   node   0: [mem 0x000000000b020000-0x00000000b838ffff]
[    0.029732]   node   0: [mem 0x00000000badff000-0x00000000bbffffff]
[    0.029735]   node   0: [mem 0x0000000100000000-0x000000021f37ffff]
[    0.029740] Initmem setup node 0 [mem 0x0000000000001000-0x000000021f37ffff]
[    0.029744] On node 0 totalpages: 1934483
[    0.029748]   DMA zone: 64 pages used for memmap
[    0.029751]   DMA zone: 26 pages reserved
[    0.029754]   DMA zone: 3999 pages, LIFO batch:0
[    0.032133]   DMA zone: 28769 pages in unavailable ranges
[    0.032137]   DMA32 zone: 11782 pages used for memmap
[    0.032140]   DMA32 zone: 754036 pages, LIFO batch:63
[    0.076694]   DMA32 zone: 28300 pages in unavailable ranges
[    0.076706]   Normal zone: 18382 pages used for memmap
[    0.076709]   Normal zone: 1176448 pages, LIFO batch:63
[    0.143245]   Normal zone: 3200 pages in unavailable ranges
[    0.274167] kasan: KernelAddressSanitizer initialized
[    0.274679] ACPI: PM-Timer IO Port: 0x808
[    0.274683] ACPI: Local APIC address 0xfee00000
[    0.274697] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.274714] IOAPIC[0]: apic_id 9, version 33, address 0xfec00000, GSI 0-23
[    0.274723] IOAPIC[1]: apic_id 10, version 33, address 0xfec01000, GSI 24-55
[    0.274729] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.274733] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.274738] ACPI: IRQ0 used by override.
[    0.274742] ACPI: IRQ9 used by override.
[    0.274747] Using ACPI (MADT) for SMP configuration information
[    0.274751] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.274779] e820: update [mem 0xb5158000-0xb517ffff] usable ==> reserved
[    0.274812] smpboot: Allowing 32 CPUs, 24 hotplug CPUs
[    0.274935] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.274943] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000fffff]
[    0.274951] PM: hibernation: Registered nosave memory: [mem 0x09c10000-0x09ffffff]
[    0.274959] PM: hibernation: Registered nosave memory: [mem 0x0a200000-0x0a20cfff]
[    0.274967] PM: hibernation: Registered nosave memory: [mem 0x0b000000-0x0b01ffff]
[    0.274975] PM: hibernation: Registered nosave memory: [mem 0xb4c66000-0xb4c66fff]
[    0.274983] PM: hibernation: Registered nosave memory: [mem 0xb4c73000-0xb4c73fff]
[    0.274991] PM: hibernation: Registered nosave memory: [mem 0xb5158000-0xb517ffff]
[    0.274999] PM: hibernation: Registered nosave memory: [mem 0xb6dde000-0xb6ddefff]
[    0.275007] PM: hibernation: Registered nosave memory: [mem 0xb8390000-0xb86c5fff]
[    0.275010] PM: hibernation: Registered nosave memory: [mem 0xb86c6000-0xb8721fff]
[    0.275013] PM: hibernation: Registered nosave memory: [mem 0xb8722000-0xb8a14fff]
[    0.275016] PM: hibernation: Registered nosave memory: [mem 0xb8a15000-0xbadfefff]
[    0.275024] PM: hibernation: Registered nosave memory: [mem 0xbc000000-0xbdffffff]
[    0.275028] PM: hibernation: Registered nosave memory: [mem 0xbe000000-0xbeffffff]
[    0.275031] PM: hibernation: Registered nosave memory: [mem 0xbf000000-0xbfffffff]
[    0.275034] PM: hibernation: Registered nosave memory: [mem 0xc0000000-0xefffffff]
[    0.275037] PM: hibernation: Registered nosave memory: [mem 0xf0000000-0xf7ffffff]
[    0.275040] PM: hibernation: Registered nosave memory: [mem 0xf8000000-0xfd1fffff]
[    0.275043] PM: hibernation: Registered nosave memory: [mem 0xfd200000-0xfd2fffff]
[    0.275046] PM: hibernation: Registered nosave memory: [mem 0xfd300000-0xfd5fffff]
[    0.275049] PM: hibernation: Registered nosave memory: [mem 0xfd600000-0xfd6fffff]
[    0.275052] PM: hibernation: Registered nosave memory: [mem 0xfd700000-0xfe9fffff]
[    0.275055] PM: hibernation: Registered nosave memory: [mem 0xfea00000-0xfea0ffff]
[    0.275058] PM: hibernation: Registered nosave memory: [mem 0xfea10000-0xfeb7ffff]
[    0.275061] PM: hibernation: Registered nosave memory: [mem 0xfeb80000-0xfec01fff]
[    0.275064] PM: hibernation: Registered nosave memory: [mem 0xfec02000-0xfec0ffff]
[    0.275067] PM: hibernation: Registered nosave memory: [mem 0xfec10000-0xfec10fff]
[    0.275070] PM: hibernation: Registered nosave memory: [mem 0xfec11000-0xfec2ffff]
[    0.275073] PM: hibernation: Registered nosave memory: [mem 0xfec30000-0xfec30fff]
[    0.275076] PM: hibernation: Registered nosave memory: [mem 0xfec31000-0xfecfffff]
[    0.275079] PM: hibernation: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
[    0.275082] PM: hibernation: Registered nosave memory: [mem 0xfed01000-0xfed3ffff]
[    0.275085] PM: hibernation: Registered nosave memory: [mem 0xfed40000-0xfed44fff]
[    0.275088] PM: hibernation: Registered nosave memory: [mem 0xfed45000-0xfed7ffff]
[    0.275091] PM: hibernation: Registered nosave memory: [mem 0xfed80000-0xfed8ffff]
[    0.275095] PM: hibernation: Registered nosave memory: [mem 0xfed90000-0xfedc1fff]
[    0.275098] PM: hibernation: Registered nosave memory: [mem 0xfedc2000-0xfedcffff]
[    0.275101] PM: hibernation: Registered nosave memory: [mem 0xfedd0000-0xfedd3fff]
[    0.275104] PM: hibernation: Registered nosave memory: [mem 0xfedd4000-0xfedd5fff]
[    0.275107] PM: hibernation: Registered nosave memory: [mem 0xfedd6000-0xfeffffff]
[    0.275110] PM: hibernation: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.275116] [mem 0xc0000000-0xefffffff] available for PCI devices
[    0.275120] Booting paravirtualized kernel on bare hardware
[    0.275125] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
[    0.283746] setup_percpu: NR_CPUS:320 nr_cpumask_bits:320 nr_cpu_ids:32 nr_node_ids:1
[    0.285877] percpu: Embedded 64 pages/cpu s225280 r8192 d28672 u262144
[    0.285919] pcpu-alloc: s225280 r8192 d28672 u262144 alloc=1*2097152
[    0.285926] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 13 14 15 
[    0.285954] pcpu-alloc: [0] 16 17 18 19 20 21 22 23 [0] 24 25 26 27 28 29 30 31 
[    0.286068] Built 1 zonelists, mobility grouping on.  Total pages: 1904229
[    0.286072] Policy zone: Normal
[    0.286075] Kernel command line: initrd=\amd-ucode.img initrd=\initramfs-linux-mainline-llvm.img root=PARTUUID=8680aa0c-cf09-4a69-8cf3-970478040ee7 rw intel_pstate=no_hwp debug ignore_loglevel earlyprintk=efi,keep log_buf_len=16M
[    0.287383] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.288005] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[    0.288283] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.487941] Memory: 6325388K/7737932K available (20488K kernel code, 7278K rwdata, 8472K rodata, 2012K init, 5244K bss, 1412288K reserved, 0K cma-reserved)
[    0.487959] random: get_random_u64 called from __kmem_cache_create+0x2a/0x540 with crng_init=0
[    0.488611] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=32, Nodes=1
[    0.488656] ftrace: allocating 41984 entries in 165 pages
[    0.513537] ftrace: allocated 164 pages with 3 groups
[    0.514222] rcu: Preemptible hierarchical RCU implementation.
[    0.514225] rcu: 	RCU dyntick-idle grace-period acceleration is enabled.
[    0.514228] rcu: 	RCU restricting CPUs from NR_CPUS=320 to nr_cpu_ids=32.
[    0.514230] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
[    0.514234] 	Trampoline variant of Tasks RCU enabled.
[    0.514236] 	Rude variant of Tasks RCU enabled.
[    0.514238] 	Tracing variant of Tasks RCU enabled.
[    0.514240] rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
[    0.514243] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=32
[    0.530610] NR_IRQS: 20736, nr_irqs: 1224, preallocated irqs: 16
[    0.531305] Console: colour dummy device 80x25
[    0.532581] printk: console [tty0] enabled
[    0.532672] ACPI: Core revision 20210105
[    0.534075] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
[    0.534108] APIC: Switch to symmetric I/O mode setup
[    0.536014] Switched APIC routing to physical flat.
[    0.536980] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.550788] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x6d59da3440c, max_idle_ns: 881590460744 ns
[    0.550813] Calibrating delay loop (skipped), value calculated using timer frequency.. 7589.31 BogoMIPS (lpj=12643710)
[    0.550826] pid_max: default: 32768 minimum: 301
[    0.560533] LSM: Security Framework initializing
[    0.560572] Yama: becoming mindful.
[    0.560704] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.560737] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.561938] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.562014] LVT offset 1 assigned for vector 0xf9
[    0.562063] LVT offset 2 assigned for vector 0xf4
[    0.562083] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
[    0.562090] Last level dTLB entries: 4KB 2048, 2MB 2048, 4MB 1024, 1GB 0
[    0.562103] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.562113] Spectre V2 : Mitigation: Full AMD retpoline
[    0.562119] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.562127] Spectre V2 : Enabling Restricted Speculation for firmware calls
[    0.562134] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.562143] Spectre V2 : User space: Mitigation: STIBP via seccomp and prctl
[    0.562151] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
[    0.562517] Freeing SMP alternatives memory: 32K
[    0.670524] smpboot: CPU0: AMD Ryzen 3 4300G with Radeon Graphics (family: 0x17, model: 0x60, stepping: 0x1)
[    0.670806] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
[    0.670806] ... version:                0
[    0.670806] ... bit width:              48
[    0.670806] ... generic registers:      6
[    0.670806] ... value mask:             0000ffffffffffff
[    0.670806] ... max period:             00007fffffffffff
[    0.670806] ... fixed-purpose events:   0
[    0.670806] ... event mask:             000000000000003f
[    0.670806] rcu: Hierarchical SRCU implementation.
[    0.670898] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.672692] smp: Bringing up secondary CPUs ...
[    0.673345] x86: Booting SMP configuration:
[    0.673351] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7
[    0.693536] smp: Brought up 1 node, 8 CPUs
[    0.693536] smpboot: Max logical packages: 4
[    0.693536] smpboot: Total of 8 processors activated (60714.55 BogoMIPS)
[    0.695830] devtmpfs: initialized
[    0.695830] x86/mm: Memory block size: 128MB
[    0.705546] PM: Registering ACPI NVS region [mem 0x0a200000-0x0a20cfff] (53248 bytes)
[    0.705546] PM: Registering ACPI NVS region [mem 0xb8722000-0xb8a14fff] (3092480 bytes)
[    0.707584] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[    0.707638] futex hash table entries: 8192 (order: 7, 524288 bytes, linear)
[    0.708029] pinctrl core: initialized pinctrl subsystem
[    0.708720] PM: RTC time: 05:52:33, date: 2021-07-03
[    0.709499] NET: Registered protocol family 16
[    0.710265] DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic allocations
[    0.710411] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.710565] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.710649] audit: initializing netlink subsys (disabled)
[    0.710823] audit: type=2000 audit(1625291553.176:1): state=initialized audit_enabled=0 res=1
[    0.711826] thermal_sys: Registered thermal governor 'fair_share'
[    0.711829] thermal_sys: Registered thermal governor 'bang_bang'
[    0.711837] thermal_sys: Registered thermal governor 'step_wise'
[    0.711842] thermal_sys: Registered thermal governor 'user_space'
[    0.711848] thermal_sys: Registered thermal governor 'power_allocator'
[    0.711909] cpuidle: using governor ladder
[    0.711909] cpuidle: using governor menu
[    0.711909] ACPI: bus type PCI registered
[    0.711909] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.711909] PCI: MMCONFIG for domain 0000 [bus 00-7f] at [mem 0xf0000000-0xf7ffffff] (base 0xf0000000)
[    0.711909] PCI: MMCONFIG at [mem 0xf0000000-0xf7ffffff] reserved in E820
[    0.719382] PCI: Using configuration type 1 for base access
[    0.734924] Kprobes globally optimized
[    0.734949] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.734949] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.738422] fbcon: Taking over console
[    0.738518] ACPI: Added _OSI(Module Device)
[    0.738524] ACPI: Added _OSI(Processor Device)
[    0.738529] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.738534] ACPI: Added _OSI(Processor Aggregator Device)
[    0.738545] ACPI: Added _OSI(Linux-Dell-Video)
[    0.738555] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.738565] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    1.267709] ACPI: 12 ACPI AML tables successfully acquired and loaded
[    1.300337] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    1.393616] ACPI: EC: EC started
[    1.393628] ACPI: EC: interrupt blocked
[    1.393658] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    1.393669] ACPI: \_SB_.PCI0.SBRG.EC0_: Boot DSDT EC used to handle transactions
[    1.393680] ACPI: Interpreter enabled
[    1.393805] ACPI: (supports S0 S3 S4 S5)
[    1.393811] ACPI: Using IOAPIC for interrupt routing
[    1.397606] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    1.407707] ACPI: Enabled 4 GPEs in block 00 to 1F
[    1.658446] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    1.658486] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
[    1.664502] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug AER LTR DPC]
[    1.670343] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    1.670482] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [bus 00-7f] only partially covers this bridge
[    1.680552] PCI host bridge to bus 0000:00
[    1.680564] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
[    1.680577] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
[    1.680588] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
[    1.680599] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    1.680610] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    1.680623] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dffff window]
[    1.680635] pci_bus 0000:00: root bus resource [mem 0xc0000000-0xfec2ffff window]
[    1.680647] pci_bus 0000:00: root bus resource [mem 0xfee00000-0xffffffff window]
[    1.680660] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.680766] pci 0000:00:00.0: [1022:1630] type 00 class 0x060000
[    1.682372] pci 0000:00:00.2: [1022:1631] type 00 class 0x080600
[    1.683965] pci 0000:00:01.0: [1022:1632] type 00 class 0x060000
[    1.685111] pci 0000:00:02.0: [1022:1632] type 00 class 0x060000
[    1.686247] pci 0000:00:02.1: [1022:1634] type 01 class 0x060400
[    1.686276] pci 0000:00:02.1: enabling Extended Tags
[    1.686363] pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
[    1.689305] pci 0000:00:02.2: [1022:1634] type 01 class 0x060400
[    1.689335] pci 0000:00:02.2: enabling Extended Tags
[    1.689421] pci 0000:00:02.2: PME# supported from D0 D3hot D3cold
[    1.691208] pci 0000:00:08.0: [1022:1632] type 00 class 0x060000
[    1.692342] pci 0000:00:08.1: [1022:1635] type 01 class 0x060400
[    1.692370] pci 0000:00:08.1: enabling Extended Tags
[    1.692452] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    1.694225] pci 0000:00:08.2: [1022:1635] type 01 class 0x060400
[    1.694252] pci 0000:00:08.2: enabling Extended Tags
[    1.694335] pci 0000:00:08.2: PME# supported from D0 D3hot D3cold
[    1.696116] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
[    1.697735] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
[    1.699364] pci 0000:00:18.0: [1022:1448] type 00 class 0x060000
[    1.700480] pci 0000:00:18.1: [1022:1449] type 00 class 0x060000
[    1.701595] pci 0000:00:18.2: [1022:144a] type 00 class 0x060000
[    1.702711] pci 0000:00:18.3: [1022:144b] type 00 class 0x060000
[    1.703821] pci 0000:00:18.4: [1022:144c] type 00 class 0x060000
[    1.704933] pci 0000:00:18.5: [1022:144d] type 00 class 0x060000
[    1.706045] pci 0000:00:18.6: [1022:144e] type 00 class 0x060000
[    1.707156] pci 0000:00:18.7: [1022:144f] type 00 class 0x060000
[    1.708924] pci 0000:01:00.0: [1022:43d1] type 00 class 0x0c0330
[    1.708949] pci 0000:01:00.0: reg 0x10: [mem 0xfcda0000-0xfcda7fff 64bit]
[    1.708994] pci 0000:01:00.0: enabling Extended Tags
[    1.709154] pci 0000:01:00.0: PME# supported from D3hot D3cold
[    1.710181] pci 0000:01:00.1: [1022:43c8] type 00 class 0x010601
[    1.710222] pci 0000:01:00.1: reg 0x24: [mem 0xfcd80000-0xfcd9ffff]
[    1.710234] pci 0000:01:00.1: reg 0x30: [mem 0xfcd00000-0xfcd7ffff pref]
[    1.710247] pci 0000:01:00.1: enabling Extended Tags
[    1.710386] pci 0000:01:00.1: PME# supported from D3hot D3cold
[    1.716376] pci 0000:01:00.2: [1022:43c6] type 01 class 0x060400
[    1.716425] pci 0000:01:00.2: enabling Extended Tags
[    1.716567] pci 0000:01:00.2: PME# supported from D3hot D3cold
[    1.717573] pci 0000:00:02.1: PCI bridge to [bus 01-0a]
[    1.717584] pci 0000:00:02.1:   bridge window [io  0xd000-0xefff]
[    1.717592] pci 0000:00:02.1:   bridge window [mem 0xfcb00000-0xfcdfffff]
[    1.719436] pci 0000:02:00.0: [1022:43c7] type 01 class 0x060400
[    1.719487] pci 0000:02:00.0: enabling Extended Tags
[    1.719697] pci 0000:02:00.0: PME# supported from D3hot D3cold
[    1.720977] pci 0000:02:01.0: [1022:43c7] type 01 class 0x060400
[    1.721029] pci 0000:02:01.0: enabling Extended Tags
[    1.721242] pci 0000:02:01.0: PME# supported from D3hot D3cold
[    1.722508] pci 0000:02:02.0: [1022:43c7] type 01 class 0x060400
[    1.722559] pci 0000:02:02.0: enabling Extended Tags
[    1.722767] pci 0000:02:02.0: PME# supported from D3hot D3cold
[    1.724053] pci 0000:02:03.0: [1022:43c7] type 01 class 0x060400
[    1.724105] pci 0000:02:03.0: enabling Extended Tags
[    1.724316] pci 0000:02:03.0: PME# supported from D3hot D3cold
[    1.725577] pci 0000:02:04.0: [1022:43c7] type 01 class 0x060400
[    1.725628] pci 0000:02:04.0: enabling Extended Tags
[    1.725836] pci 0000:02:04.0: PME# supported from D3hot D3cold
[    1.727111] pci 0000:02:05.0: [1022:43c7] type 01 class 0x060400
[    1.727162] pci 0000:02:05.0: enabling Extended Tags
[    1.727370] pci 0000:02:05.0: PME# supported from D3hot D3cold
[    1.728654] pci 0000:02:06.0: [1022:43c7] type 01 class 0x060400
[    1.728706] pci 0000:02:06.0: enabling Extended Tags
[    1.728914] pci 0000:02:06.0: PME# supported from D3hot D3cold
[    1.730188] pci 0000:02:07.0: [1022:43c7] type 01 class 0x060400
[    1.730239] pci 0000:02:07.0: enabling Extended Tags
[    1.730448] pci 0000:02:07.0: PME# supported from D3hot D3cold
[    1.731709] pci 0000:01:00.2: PCI bridge to [bus 02-0a]
[    1.731721] pci 0000:01:00.2:   bridge window [io  0xd000-0xefff]
[    1.731730] pci 0000:01:00.2:   bridge window [mem 0xfcb00000-0xfccfffff]
[    1.732133] pci 0000:02:00.0: PCI bridge to [bus 03]
[    1.732535] pci 0000:02:01.0: PCI bridge to [bus 04]
[    1.732932] pci 0000:02:02.0: PCI bridge to [bus 05]
[    1.733334] pci 0000:02:03.0: PCI bridge to [bus 06]
[    1.733741] pci 0000:02:04.0: PCI bridge to [bus 07]
[    1.733934] pci 0000:02:05.0: PCI bridge to [bus 08]
[    1.734170] pci 0000:09:00.0: [10ec:c821] type 00 class 0x028000
[    1.734203] pci 0000:09:00.0: reg 0x10: [io  0xe000-0xe0ff]
[    1.734242] pci 0000:09:00.0: reg 0x18: [mem 0xfcc00000-0xfcc0ffff 64bit]
[    1.734638] pci 0000:09:00.0: supports D1 D2
[    1.734644] pci 0000:09:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.735243] pci 0000:02:06.0: PCI bridge to [bus 09]
[    1.735254] pci 0000:02:06.0:   bridge window [io  0xe000-0xefff]
[    1.735263] pci 0000:02:06.0:   bridge window [mem 0xfcc00000-0xfccfffff]
[    1.735488] pci 0000:0a:00.0: [10ec:8168] type 00 class 0x020000
[    1.735521] pci 0000:0a:00.0: reg 0x10: [io  0xd000-0xd0ff]
[    1.735564] pci 0000:0a:00.0: reg 0x18: [mem 0xfcb04000-0xfcb04fff 64bit]
[    1.735593] pci 0000:0a:00.0: reg 0x20: [mem 0xfcb00000-0xfcb03fff 64bit]
[    1.735965] pci 0000:0a:00.0: supports D1 D2
[    1.735971] pci 0000:0a:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.736571] pci 0000:02:07.0: PCI bridge to [bus 0a]
[    1.736582] pci 0000:02:07.0:   bridge window [io  0xd000-0xdfff]
[    1.736590] pci 0000:02:07.0:   bridge window [mem 0xfcb00000-0xfcbfffff]
[    1.737022] pci 0000:0b:00.0: [1c5c:1339] type 00 class 0x010802
[    1.737046] pci 0000:0b:00.0: reg 0x10: [mem 0xfcf00000-0xfcf03fff 64bit]
[    1.737248] pci 0000:0b:00.0: supports D1
[    1.737254] pci 0000:0b:00.0: PME# supported from D0 D1 D3hot
[    1.737325] pci 0000:0b:00.0: 15.752 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x2 link at 0000:00:02.2 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
[    1.737750] pci 0000:00:02.2: PCI bridge to [bus 0b]
[    1.737760] pci 0000:00:02.2:   bridge window [mem 0xfcf00000-0xfcffffff]
[    1.739105] pci 0000:0c:00.0: [1002:1636] type 00 class 0x030000
[    1.739123] pci 0000:0c:00.0: reg 0x10: [mem 0xd0000000-0xdfffffff 64bit pref]
[    1.739138] pci 0000:0c:00.0: reg 0x18: [mem 0xe0000000-0xe01fffff 64bit pref]
[    1.739150] pci 0000:0c:00.0: reg 0x20: [io  0xf000-0xf0ff]
[    1.739161] pci 0000:0c:00.0: reg 0x24: [mem 0xfca00000-0xfca7ffff]
[    1.739176] pci 0000:0c:00.0: enabling Extended Tags
[    1.739281] pci 0000:0c:00.0: BAR 0: assigned to efifb
[    1.739327] pci 0000:0c:00.0: PME# supported from D1 D2 D3hot D3cold
[    1.739367] pci 0000:0c:00.0: 126.016 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x16 link at 0000:00:08.1 (capable of 252.048 Gb/s with 16.0 GT/s PCIe x16 link)
[    1.740514] pci 0000:0c:00.1: [1002:1637] type 00 class 0x040300
[    1.740528] pci 0000:0c:00.1: reg 0x10: [mem 0xfca88000-0xfca8bfff]
[    1.740555] pci 0000:0c:00.1: enabling Extended Tags
[    1.740684] pci 0000:0c:00.1: PME# supported from D1 D2 D3hot D3cold
[    1.741827] pci 0000:0c:00.2: [1022:15df] type 00 class 0x108000
[    1.741847] pci 0000:0c:00.2: reg 0x18: [mem 0xfc900000-0xfc9fffff]
[    1.741863] pci 0000:0c:00.2: reg 0x24: [mem 0xfca8c000-0xfca8dfff]
[    1.741876] pci 0000:0c:00.2: enabling Extended Tags
[    1.743084] pci 0000:0c:00.3: [1022:1639] type 00 class 0x0c0330
[    1.743102] pci 0000:0c:00.3: reg 0x10: [mem 0xfc800000-0xfc8fffff 64bit]
[    1.743131] pci 0000:0c:00.3: enabling Extended Tags
[    1.743261] pci 0000:0c:00.3: PME# supported from D0 D3hot D3cold
[    1.744407] pci 0000:0c:00.4: [1022:1639] type 00 class 0x0c0330
[    1.744425] pci 0000:0c:00.4: reg 0x10: [mem 0xfc700000-0xfc7fffff 64bit]
[    1.744455] pci 0000:0c:00.4: enabling Extended Tags
[    1.744583] pci 0000:0c:00.4: PME# supported from D0 D3hot D3cold
[    1.745722] pci 0000:0c:00.6: [1022:15e3] type 00 class 0x040300
[    1.745737] pci 0000:0c:00.6: reg 0x10: [mem 0xfca80000-0xfca87fff]
[    1.745764] pci 0000:0c:00.6: enabling Extended Tags
[    1.745892] pci 0000:0c:00.6: PME# supported from D0 D3hot D3cold
[    1.747111] pci 0000:00:08.1: PCI bridge to [bus 0c]
[    1.747120] pci 0000:00:08.1:   bridge window [io  0xf000-0xffff]
[    1.747128] pci 0000:00:08.1:   bridge window [mem 0xfc700000-0xfcafffff]
[    1.747137] pci 0000:00:08.1:   bridge window [mem 0xd0000000-0xe01fffff 64bit pref]
[    1.747640] pci 0000:0d:00.0: [1022:7901] type 00 class 0x010601
[    1.747668] pci 0000:0d:00.0: reg 0x24: [mem 0xfce01000-0xfce017ff]
[    1.747681] pci 0000:0d:00.0: enabling Extended Tags
[    1.747842] pci 0000:0d:00.0: 126.016 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x16 link at 0000:00:08.2 (capable of 252.048 Gb/s with 16.0 GT/s PCIe x16 link)
[    1.748684] pci 0000:0d:00.1: [1022:7901] type 00 class 0x010601
[    1.748712] pci 0000:0d:00.1: reg 0x24: [mem 0xfce00000-0xfce007ff]
[    1.748725] pci 0000:0d:00.1: enabling Extended Tags
[    1.749708] pci 0000:00:08.2: PCI bridge to [bus 0d]
[    1.749718] pci 0000:00:08.2:   bridge window [mem 0xfce00000-0xfcefffff]
[    1.758356] ACPI: PCI Interrupt Link [LNKA] (IRQs 4 5 7 10 11 14 15) *0
[    1.759656] ACPI: PCI Interrupt Link [LNKB] (IRQs 4 5 7 10 11 14 15) *0
[    1.760873] ACPI: PCI Interrupt Link [LNKC] (IRQs 4 5 7 10 11 14 15) *0
[    1.762239] ACPI: PCI Interrupt Link [LNKD] (IRQs 4 5 7 10 11 14 15) *0
[    1.763530] ACPI: PCI Interrupt Link [LNKE] (IRQs 4 5 7 10 11 14 15) *0
[    1.764630] ACPI: PCI Interrupt Link [LNKF] (IRQs 4 5 7 10 11 14 15) *0
[    1.765726] ACPI: PCI Interrupt Link [LNKG] (IRQs 4 5 7 10 11 14 15) *0
[    1.766833] ACPI: PCI Interrupt Link [LNKH] (IRQs 4 5 7 10 11 14 15) *0
[    1.779473] ACPI: EC: interrupt unblocked
[    1.779480] ACPI: EC: event unblocked
[    1.779489] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    1.779495] ACPI: EC: GPE=0x3
[    1.779505] ACPI: \_SB_.PCI0.SBRG.EC0_: Boot DSDT EC initialization complete
[    1.779523] ACPI: \_SB_.PCI0.SBRG.EC0_: EC: Used to handle transactions and events
[    1.779871] iommu: Default domain type: Translated 
[    1.779965] pci 0000:0c:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    1.779965] pci 0000:0c:00.0: vgaarb: bridge control possible
[    1.779965] pci 0000:0c:00.0: vgaarb: setting as boot device
[    1.779965] vgaarb: loaded
[    1.781850] SCSI subsystem initialized
[    1.781893] libata version 3.00 loaded.
[    1.781893] ACPI: bus type USB registered
[    1.781893] usbcore: registered new interface driver usbfs
[    1.781893] usbcore: registered new interface driver hub
[    1.781893] usbcore: registered new device driver usb
[    1.781893] pps_core: LinuxPPS API ver. 1 registered
[    1.781893] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    1.781893] PTP clock support registered
[    1.781893] EDAC MC: Ver: 3.0.0
[    1.781893] Registered efivars operations
[    1.785136] NetLabel: Initializing
[    1.785143] NetLabel:  domain hash size = 128
[    1.785148] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    1.785246] NetLabel:  unlabeled traffic allowed by default
[    1.785269] PCI: Using ACPI for IRQ routing
[    1.789174] PCI: pci_cache_line_size set to 64 bytes
[    1.789273] e820: reserve RAM buffer [mem 0x09c10000-0x0bffffff]
[    1.789288] e820: reserve RAM buffer [mem 0x0a200000-0x0bffffff]
[    1.789300] e820: reserve RAM buffer [mem 0x0b000000-0x0bffffff]
[    1.789312] e820: reserve RAM buffer [mem 0xb4c66018-0xb7ffffff]
[    1.789324] e820: reserve RAM buffer [mem 0xb5158000-0xb7ffffff]
[    1.789336] e820: reserve RAM buffer [mem 0xb6dde000-0xb7ffffff]
[    1.789347] e820: reserve RAM buffer [mem 0xb8390000-0xbbffffff]
[    1.789360] e820: reserve RAM buffer [mem 0x21f380000-0x21fffffff]
[    1.789385] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    1.789385] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    1.791525] clocksource: Switched to clocksource tsc-early
[    1.886355] VFS: Disk quotas dquot_6.6.0
[    1.886463] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    1.887380] pnp: PnP ACPI init
[    1.888708] system 00:00: [mem 0xf0000000-0xf7ffffff] has been reserved
[    1.888751] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
[    1.889901] system 00:01: [mem 0x220000000-0x23fffffff window] has been reserved
[    1.889932] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.892039] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    1.904512] system 00:03: [io  0x0a00-0x0a0f] has been reserved
[    1.904531] system 00:03: [io  0x0a10-0x0a1f] has been reserved
[    1.904547] system 00:03: [io  0x0a20-0x0a2f] has been reserved
[    1.904564] system 00:03: [io  0x0a30-0x0a3f] has been reserved
[    1.904580] system 00:03: [io  0x0a40-0x0a4f] has been reserved
[    1.904596] system 00:03: [io  0x0a50-0x0a5f] has been reserved
[    1.904614] system 00:03: [io  0x0a60-0x0a6f] has been reserved
[    1.904630] system 00:03: [io  0x0a70-0x0a7f] has been reserved
[    1.904646] system 00:03: [io  0x0a80-0x0a8f] has been reserved
[    1.904662] system 00:03: [io  0x0a90-0x0b8e] has been reserved
[    1.904678] system 00:03: [io  0x0aa0-0x0aaf] has been reserved
[    1.904694] system 00:03: [io  0x0ab0-0x0abf] has been reserved
[    1.904711] system 00:03: [io  0x0ac0-0x0acf] has been reserved
[    1.904727] system 00:03: [io  0x0ad0-0x0adf] has been reserved
[    1.904755] system 00:03: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.909811] system 00:04: [io  0x04d0-0x04d1] has been reserved
[    1.909829] system 00:04: [io  0x040b] has been reserved
[    1.909845] system 00:04: [io  0x04d6] has been reserved
[    1.909861] system 00:04: [io  0x0c00-0x0c01] has been reserved
[    1.909877] system 00:04: [io  0x0c14] has been reserved
[    1.909893] system 00:04: [io  0x0c50-0x0c51] has been reserved
[    1.909909] system 00:04: [io  0x0c52] has been reserved
[    1.909925] system 00:04: [io  0x0c6c] has been reserved
[    1.909941] system 00:04: [io  0x0c6f] has been reserved
[    1.909957] system 00:04: [io  0x0cd0-0x0cd1] has been reserved
[    1.909973] system 00:04: [io  0x0cd2-0x0cd3] has been reserved
[    1.909990] system 00:04: [io  0x0cd4-0x0cd5] has been reserved
[    1.910006] system 00:04: [io  0x0cd6-0x0cd7] has been reserved
[    1.910022] system 00:04: [io  0x0cd8-0x0cdf] has been reserved
[    1.910038] system 00:04: [io  0x0800-0x089f] has been reserved
[    1.910055] system 00:04: [io  0x0b00-0x0b0f] has been reserved
[    1.910071] system 00:04: [io  0x0b20-0x0b3f] has been reserved
[    1.910088] system 00:04: [io  0x0900-0x090f] has been reserved
[    1.910104] system 00:04: [io  0x0910-0x091f] has been reserved
[    1.910132] system 00:04: [mem 0xfec00000-0xfec00fff] could not be reserved
[    1.910159] system 00:04: [mem 0xfec01000-0xfec01fff] could not be reserved
[    1.910179] system 00:04: [mem 0xfedc0000-0xfedc0fff] has been reserved
[    1.910202] system 00:04: [mem 0xfee00000-0xfee00fff] has been reserved
[    1.910229] system 00:04: [mem 0xfed80000-0xfed8ffff] could not be reserved
[    1.910248] system 00:04: [mem 0xfec10000-0xfec10fff] has been reserved
[    1.910266] system 00:04: [mem 0xff000000-0xffffffff] has been reserved
[    1.910296] system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.920974] pnp: PnP ACPI: found 5 devices
[    1.934928] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    1.935177] NET: Registered protocol family 2
[    1.936737] tcp_listen_portaddr_hash hash table entries: 4096 (order: 4, 65536 bytes, linear)
[    1.936894] TCP established hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    1.937457] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[    1.937992] TCP: Hash tables configured (established 65536 bind 65536)
[    1.938701] MPTCP token hash table entries: 8192 (order: 5, 196608 bytes, linear)
[    1.938849] UDP hash table entries: 4096 (order: 5, 131072 bytes, linear)
[    1.938946] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes, linear)
[    1.939477] NET: Registered protocol family 1
[    1.939502] NET: Registered protocol family 44
[    1.939541] pci 0000:02:00.0: PCI bridge to [bus 03]
[    1.939565] pci 0000:02:01.0: PCI bridge to [bus 04]
[    1.939580] pci 0000:02:02.0: PCI bridge to [bus 05]
[    1.939595] pci 0000:02:03.0: PCI bridge to [bus 06]
[    1.939610] pci 0000:02:04.0: PCI bridge to [bus 07]
[    1.939625] pci 0000:02:05.0: PCI bridge to [bus 08]
[    1.939640] pci 0000:02:06.0: PCI bridge to [bus 09]
[    1.939647] pci 0000:02:06.0:   bridge window [io  0xe000-0xefff]
[    1.939657] pci 0000:02:06.0:   bridge window [mem 0xfcc00000-0xfccfffff]
[    1.939671] pci 0000:02:07.0: PCI bridge to [bus 0a]
[    1.939678] pci 0000:02:07.0:   bridge window [io  0xd000-0xdfff]
[    1.939687] pci 0000:02:07.0:   bridge window [mem 0xfcb00000-0xfcbfffff]
[    1.939700] pci 0000:01:00.2: PCI bridge to [bus 02-0a]
[    1.939707] pci 0000:01:00.2:   bridge window [io  0xd000-0xefff]
[    1.939717] pci 0000:01:00.2:   bridge window [mem 0xfcb00000-0xfccfffff]
[    1.939730] pci 0000:00:02.1: PCI bridge to [bus 01-0a]
[    1.939736] pci 0000:00:02.1:   bridge window [io  0xd000-0xefff]
[    1.939744] pci 0000:00:02.1:   bridge window [mem 0xfcb00000-0xfcdfffff]
[    1.939755] pci 0000:00:02.2: PCI bridge to [bus 0b]
[    1.939762] pci 0000:00:02.2:   bridge window [mem 0xfcf00000-0xfcffffff]
[    1.939775] pci 0000:00:08.1: PCI bridge to [bus 0c]
[    1.939782] pci 0000:00:08.1:   bridge window [io  0xf000-0xffff]
[    1.939790] pci 0000:00:08.1:   bridge window [mem 0xfc700000-0xfcafffff]
[    1.939798] pci 0000:00:08.1:   bridge window [mem 0xd0000000-0xe01fffff 64bit pref]
[    1.939809] pci 0000:00:08.2: PCI bridge to [bus 0d]
[    1.939816] pci 0000:00:08.2:   bridge window [mem 0xfce00000-0xfcefffff]
[    1.939830] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
[    1.939838] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
[    1.939845] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
[    1.939852] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
[    1.939859] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000bffff window]
[    1.939866] pci_bus 0000:00: resource 9 [mem 0x000c0000-0x000dffff window]
[    1.939873] pci_bus 0000:00: resource 10 [mem 0xc0000000-0xfec2ffff window]
[    1.939881] pci_bus 0000:00: resource 11 [mem 0xfee00000-0xffffffff window]
[    1.939889] pci_bus 0000:01: resource 0 [io  0xd000-0xefff]
[    1.939895] pci_bus 0000:01: resource 1 [mem 0xfcb00000-0xfcdfffff]
[    1.939902] pci_bus 0000:02: resource 0 [io  0xd000-0xefff]
[    1.939909] pci_bus 0000:02: resource 1 [mem 0xfcb00000-0xfccfffff]
[    1.939916] pci_bus 0000:09: resource 0 [io  0xe000-0xefff]
[    1.939923] pci_bus 0000:09: resource 1 [mem 0xfcc00000-0xfccfffff]
[    1.939930] pci_bus 0000:0a: resource 0 [io  0xd000-0xdfff]
[    1.939937] pci_bus 0000:0a: resource 1 [mem 0xfcb00000-0xfcbfffff]
[    1.939944] pci_bus 0000:0b: resource 1 [mem 0xfcf00000-0xfcffffff]
[    1.939952] pci_bus 0000:0c: resource 0 [io  0xf000-0xffff]
[    1.939958] pci_bus 0000:0c: resource 1 [mem 0xfc700000-0xfcafffff]
[    1.939965] pci_bus 0000:0c: resource 2 [mem 0xd0000000-0xe01fffff 64bit pref]
[    1.939974] pci_bus 0000:0d: resource 1 [mem 0xfce00000-0xfcefffff]
[    1.942791] pci 0000:0c:00.1: D0 power state depends on 0000:0c:00.0
[    1.945901] PCI: CLS 64 bytes, default 64
[    1.946192] Trying to unpack rootfs image as initramfs...
[    2.206923] Freeing initrd memory: 8380K
[    2.337507] pci 0000:00:00.2: AMD-Vi: Unable to read/write to IOMMU perf counter.
[    2.338662] pci 0000:00:00.2: can't derive routing for PCI INT A
[    2.338673] pci 0000:00:00.2: PCI INT A: not connected
[    2.338859] pci 0000:00:01.0: Adding to iommu group 0
[    2.338992] pci 0000:00:02.0: Adding to iommu group 1
[    2.339096] pci 0000:00:02.1: Adding to iommu group 2
[    2.339204] pci 0000:00:02.2: Adding to iommu group 3
[    2.339341] pci 0000:00:08.0: Adding to iommu group 4
[    2.339407] pci 0000:00:08.1: Adding to iommu group 4
[    2.339475] pci 0000:00:08.2: Adding to iommu group 4
[    2.339588] pci 0000:00:14.0: Adding to iommu group 5
[    2.339638] pci 0000:00:14.3: Adding to iommu group 5
[    2.339789] pci 0000:00:18.0: Adding to iommu group 6
[    2.339839] pci 0000:00:18.1: Adding to iommu group 6
[    2.339895] pci 0000:00:18.2: Adding to iommu group 6
[    2.339951] pci 0000:00:18.3: Adding to iommu group 6
[    2.340000] pci 0000:00:18.4: Adding to iommu group 6
[    2.340050] pci 0000:00:18.5: Adding to iommu group 6
[    2.340101] pci 0000:00:18.6: Adding to iommu group 6
[    2.340151] pci 0000:00:18.7: Adding to iommu group 6
[    2.340254] pci 0000:01:00.0: Adding to iommu group 7
[    2.340308] pci 0000:01:00.1: Adding to iommu group 7
[    2.340362] pci 0000:01:00.2: Adding to iommu group 7
[    2.340402] pci 0000:02:00.0: Adding to iommu group 7
[    2.340441] pci 0000:02:01.0: Adding to iommu group 7
[    2.340481] pci 0000:02:02.0: Adding to iommu group 7
[    2.340524] pci 0000:02:03.0: Adding to iommu group 7
[    2.340566] pci 0000:02:04.0: Adding to iommu group 7
[    2.340606] pci 0000:02:05.0: Adding to iommu group 7
[    2.340651] pci 0000:02:06.0: Adding to iommu group 7
[    2.340690] pci 0000:02:07.0: Adding to iommu group 7
[    2.340731] pci 0000:09:00.0: Adding to iommu group 7
[    2.340774] pci 0000:0a:00.0: Adding to iommu group 7
[    2.340865] pci 0000:0b:00.0: Adding to iommu group 8
[    2.340917] pci 0000:0c:00.0: Adding to iommu group 4
[    2.340956] pci 0000:0c:00.1: Adding to iommu group 4
[    2.340996] pci 0000:0c:00.2: Adding to iommu group 4
[    2.341038] pci 0000:0c:00.3: Adding to iommu group 4
[    2.341078] pci 0000:0c:00.4: Adding to iommu group 4
[    2.341122] pci 0000:0c:00.6: Adding to iommu group 4
[    2.341163] pci 0000:0d:00.0: Adding to iommu group 4
[    2.341203] pci 0000:0d:00.1: Adding to iommu group 4
[    2.361821] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
[    2.361839] pci 0000:00:00.2: AMD-Vi: Extended features (0x206d73ef22254ade):
[    2.361846]  PPR X2APIC NX GT IA GA PC GA_vAPIC
[    2.361861] AMD-Vi: Interrupt remapping enabled
[    2.361865] AMD-Vi: Virtual APIC enabled
[    2.361870] AMD-Vi: X2APIC enabled
[    2.362272] AMD-Vi: Lazy IO/TLB flushing enabled
[    2.362422] amd_uncore: 4  amd_df counters detected
[    2.362449] amd_uncore: 6  amd_l3 counters detected
[    2.363111] LVT offset 0 assigned for vector 0x400
[    2.363391] perf: AMD IBS detected (0x000003ff)
[    2.366963] check: Scanning for low memory corruption every 60 seconds
[    2.370830] Initialise system trusted keyrings
[    2.370874] Key type blacklist registered
[    2.371070] workingset: timestamp_bits=41 max_order=21 bucket_order=0
[    2.387358] zbud: loaded
[    2.392535] Key type asymmetric registered
[    2.392543] Asymmetric key parser 'x509' registered
[    2.392593] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 243)
[    2.392758] io scheduler mq-deadline registered
[    2.392767] io scheduler kyber registered
[    2.393069] io scheduler bfq registered
[    2.395473] pcieport 0000:00:02.1: PME: Signaling with IRQ 26
[    2.396128] pcieport 0000:00:02.2: PME: Signaling with IRQ 27
[    2.396753] pcieport 0000:00:08.1: PME: Signaling with IRQ 28
[    2.398314] pcieport 0000:00:08.2: PME: Signaling with IRQ 29
[    2.408158] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    2.408334] efifb: probing for efifb
[    2.408723] efifb: framebuffer at 0xd0000000, using 3072k, total 3072k
[    2.408731] efifb: mode is 1024x768x32, linelength=4096, pages=1
[    2.408737] efifb: scrolling: redraw
[    2.408741] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    2.409539] Console: switching to colour frame buffer device 128x48
[    2.414601] fb0: EFI VGA frame buffer device
[    2.415135] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
[    2.415443] ACPI: button: Power Button [PWRB]
[    2.415762] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
[    2.417681] ACPI: button: Power Button [PWRF]
[    2.418097] Monitor-Mwait will be used to enter C-1 state
[    2.418214] ACPI: \_PR_.C000: Found 3 idle states
[    2.419216] ACPI: \_PR_.C002: Found 3 idle states
[    2.420364] ACPI: \_PR_.C004: Found 3 idle states
[    2.421422] ACPI: \_PR_.C006: Found 3 idle states
[    2.422445] ACPI: \_PR_.C001: Found 3 idle states
[    2.423446] ACPI: \_PR_.C003: Found 3 idle states
[    2.424566] ACPI: \_PR_.C005: Found 3 idle states
[    2.426058] ACPI: \_PR_.C007: Found 3 idle states
[    2.438042] thermal LNXTHERM:00: registered as thermal_zone0
[    2.438115] ACPI: thermal: Thermal Zone [HPTZ] (30 C)
[    2.439130] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    2.452629] Non-volatile memory driver v1.3
[    2.452687] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[    2.459169] nvme nvme0: pci function 0000:0b:00.0
[    2.459441] ahci 0000:01:00.1: version 3.0
[    2.459494] ahci 0000:01:00.1: enabling device (0100 -> 0102)
[    2.460857] ahci 0000:01:00.1: SSS flag set, parallel bus scan disabled
[    2.462739] ahci 0000:01:00.1: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0xff impl SATA mode
[    2.464583] ahci 0000:01:00.1: flags: 64bit ncq sntf stag pm led clo only pmp pio slum part sxs deso sadm sds apst 
[    2.464969] ==================================================================
[    2.468288] BUG: KASAN: use-after-free in __iommu_dma_unmap_swiotlb+0x64/0xb0
[    2.468288] Read of size 8 at addr ffff8881d7830000 by task swapper/0/0

[    2.468288] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.12.0-rc3-debug #1
[    2.468288] Hardware name: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17/2020
[    2.468288] Call Trace:
[    2.468288]  <IRQ>
[    2.479433]  dump_stack+0x9c/0xcf
[    2.479433]  print_address_description.constprop.0+0x18/0x130
[    2.479433]  ? __iommu_dma_unmap_swiotlb+0x64/0xb0
[    2.479433]  kasan_report.cold+0x7f/0x111
[    2.479433]  ? __iommu_dma_unmap_swiotlb+0x64/0xb0
[    2.479433]  __iommu_dma_unmap_swiotlb+0x64/0xb0
[    2.479433]  nvme_pci_complete_rq+0x73/0x130
[    2.479433]  blk_complete_reqs+0x6f/0x80
[    2.479433]  __do_softirq+0xfc/0x3be
[    2.479433]  irq_exit_rcu+0xce/0x120
[    2.479433]  common_interrupt+0x80/0xa0
[    2.479433]  </IRQ>
[    2.479433]  asm_common_interrupt+0x1e/0x40
[    2.479433] RIP: 0010:cpuidle_enter_state+0xf9/0x590
[    2.479433] Code: 3d 24 0f 37 6d e8 67 ac 49 ff 49 89 c5 0f 1f 44 00 00 31 ff e8 28 c1 49 ff 80 3c 24 00 0f 85 aa 02 00 00 fb 66 0f 1f 44 00 00 <45> 85 f6 0f 88 39 02 00 00 49 63 ee 48 8d 44 6d 00 48 8d 44 85 00
[    2.479433] RSP: 0018:ffffffff94007df0 EFLAGS: 00000246
[    2.479433] RAX: 0000000000000000 RBX: ffff8881075a8000 RCX: ffffffff92144885
[    2.479433] RDX: dffffc0000000000 RSI: 0000000000000008 RDI: ffff8881d6a35648
[    2.479433] RBP: 0000000000000003 R08: 0000000000000001 R09: ffff8881d6a356d7
[    2.479433] R10: ffffed103ad46ada R11: 0000000000000001 R12: ffffffff9445ba80
[    2.479433] R13: 0000000092ec3156 R14: 0000000000000003 R15: ffffffff9445bc10
[    2.479433]  ? sched_idle_set_state+0x25/0x30
[    2.479433]  ? ladder_select_state+0x350/0x370
[    2.479433]  cpuidle_enter+0x3c/0x60
[    2.525920]  do_idle+0x2fa/0x3c0
[    2.525920]  ? arch_cpu_idle_exit+0x40/0x40
[    2.525920]  cpu_startup_entry+0x19/0x20
[    2.525920]  start_kernel+0x3a9/0x3c7
[    2.525920]  secondary_startup_64_no_verify+0xc2/0xcb

[    2.525920] The buggy address belongs to the page:
[    2.525920] page:0000000016c8183d refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1d7830
[    2.525920] flags: 0x2ffff0000000000()
[    2.525920] raw: 02ffff0000000000 dead000000000100 dead000000000122 0000000000000000
[    2.525920] raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
[    2.525920] page dumped because: kasan: bad access detected

[    2.525920] Memory state around the buggy address:
[    2.525920]  ffff8881d782ff00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[    2.525920]  ffff8881d782ff80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[    2.525920] >ffff8881d7830000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[    2.525920]                    ^
[    2.525920]  ffff8881d7830080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[    2.525920]  ffff8881d7830100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[    2.525920] ==================================================================
[    2.525920] Disabling lock debugging due to kernel taint
[    2.566191] nvme nvme0: missing or invalid SUBNQN field.
[    2.566573] scsi host0: ahci
[    2.571284] scsi host1: ahci
[    2.573925] scsi host2: ahci
[    2.575531] nvme nvme0: 16/0/0 default/read/poll queues
[    2.576652] scsi host3: ahci
[    2.580305] scsi host4: ahci
[    2.582369]  nvme0n1: p1 p2
[    2.583114] scsi host5: ahci
[    2.586918] scsi host6: ahci
[    2.589693] scsi host7: ahci
[    2.591895] ata1: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80100 irq 44
[    2.593562] ata2: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80180 irq 44
[    2.595213] ata3: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80200 irq 44
[    2.596830] ata4: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80280 irq 44
[    2.598384] ata5: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80300 irq 44
[    2.599856] ata6: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80380 irq 44
[    2.601282] ata7: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80400 irq 44
[    2.602663] ata8: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80480 irq 44
[    2.604233] ahci 0000:0d:00.0: enabling device (0100 -> 0102)
[    2.624072] ahci 0000:0d:00.0: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1 impl SATA mode
[    2.626047] ahci 0000:0d:00.0: flags: 64bit ncq sntf ilck pm led clo only pmp fbs pio slum part 
[    2.629115] scsi host8: ahci
[    2.631134] ata9: SATA max UDMA/133 abar m2048@0xfce01000 port 0xfce01100 irq 62
[    2.632725] ahci 0000:0d:00.1: enabling device (0100 -> 0102)
[    2.645647] ahci 0000:0d:00.1: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1 impl SATA mode
[    2.647377] ahci 0000:0d:00.1: flags: 64bit ncq sntf ilck pm led clo only pmp fbs pio slum part 
[    2.650684] scsi host9: ahci
[    2.652987] ata10: SATA max UDMA/133 abar m2048@0xfce00000 port 0xfce00100 irq 64
[    2.654771] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.656479] ehci-pci: EHCI PCI platform driver
[    2.658223] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.659922] ohci-pci: OHCI PCI platform driver
[    2.661613] uhci_hcd: USB Universal Host Controller Interface driver
[    2.663598] usbcore: registered new interface driver usbserial_generic
[    2.665273] usbserial: USB Serial support registered for generic
[    2.667509] rtc_cmos 00:02: RTC can wake from S4
[    2.670325] rtc_cmos 00:02: registered as rtc0
[    2.672456] rtc_cmos 00:02: setting system clock to 2021-07-03T05:52:35 UTC (1625291555)
[    2.674292] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
[    2.676648] ledtrig-cpu: registered to indicate activity on CPUs
[    2.680761] hid: raw HID events driver (C) Jiri Kosina
[    2.682838] drop_monitor: Initializing network drop monitor service
[    2.684723] Initializing XFRM netlink socket
[    2.687522] NET: Registered protocol family 10
[    2.706529] Segment Routing with IPv6
[    2.708311] RPL Segment Routing with IPv6
[    2.710080] NET: Registered protocol family 17
[    2.717145] microcode: CPU0: patch_level=0x08600106
[    2.719302] microcode: CPU1: patch_level=0x08600106
[    2.721700] microcode: CPU2: patch_level=0x08600106
[    2.723611] microcode: CPU3: patch_level=0x08600106
[    2.725354] microcode: CPU4: patch_level=0x08600106
[    2.727673] microcode: CPU5: patch_level=0x08600106
[    2.729894] microcode: CPU6: patch_level=0x08600106
[    2.732003] microcode: CPU7: patch_level=0x08600106
[    2.733779] microcode: Microcode Update Driver: v2.2.
[    2.734648] resctrl: L3 allocation detected
[    2.738008] resctrl: L3DATA allocation detected
[    2.739649] resctrl: L3CODE allocation detected
[    2.741298] resctrl: MB allocation detected
[    2.742960] resctrl: L3 monitoring detected
[    2.744639] IPI shorthand broadcast: enabled
[    2.746420] sched_clock: Marking stable (2741486890, 3147034)->(2749935265, -5301341)
[    2.748947] registered taskstats version 1
[    2.750823] Loading compiled-in X.509 certificates
[    2.762366] Loaded X.509 cert 'Build time autogenerated kernel key: 2e7560f4a0c00f3b7155a946e3c119b89f094b3b'
[    2.768372] zswap: loaded using pool lz4/z3fold
[    2.771903] Key type ._fscrypt registered
[    2.773785] Key type .fscrypt registered
[    2.775622] Key type fscrypt-provisioning registered
[    2.784028] PM:   Magic number: 13:98:870
[    2.787045] RAS: Correctable Errors collector initialized.
[    2.917218] ata1: SATA link down (SStatus 0 SControl 300)
[    2.943732] ata9: SATA link down (SStatus 0 SControl 300)
[    2.966342] ata10: SATA link down (SStatus 0 SControl 300)
[    3.233062] ata2: SATA link down (SStatus 0 SControl 300)
[    3.384422] tsc: Refined TSC clocksource calibration: 3819.247 MHz
[    3.386233] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x6e1abb3f6be, max_idle_ns: 881590761792 ns
[    3.388357] clocksource: Switched to clocksource tsc
[    3.546862] ata3: SATA link down (SStatus 0 SControl 300)
[    3.859988] ata4: SATA link down (SStatus 0 SControl 300)
[    4.173723] ata5: SATA link down (SStatus 0 SControl 300)
[    4.485990] ata6: SATA link down (SStatus 0 SControl 300)
[    4.800108] ata7: SATA link down (SStatus 0 SControl 300)
[    5.113290] ata8: SATA link down (SStatus 0 SControl 300)
[    5.124842] Freeing unused decrypted memory: 2036K
[    5.127293] Freeing unused kernel image (initmem) memory: 2012K
[    5.128839] Write protecting the kernel read-only data: 32768k
[    5.131774] Freeing unused kernel image (text/rodata gap) memory: 2036K
[    5.134151] Freeing unused kernel image (rodata/data gap) memory: 1768K
[    5.193177] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    5.194740] rodata_test: all tests were successful
[    5.196302] Run /init as init process
[    5.197816]   with arguments:
[    5.199318]     /init
[    5.200791]   with environment:
[    5.202284]     HOME=/
[    5.203786]     TERM=linux
[    5.672103] xhci_hcd 0000:01:00.0: xHCI Host Controller
[    5.674778] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 1
[    5.731851] xhci_hcd 0000:01:00.0: hcc params 0x0200ef81 hci version 0x110 quirks 0x0000000000000410
[    5.736868] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.12
[    5.738700] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    5.740524] usb usb1: Product: xHCI Host Controller
[    5.742360] usb usb1: Manufacturer: Linux 5.12.0-rc3-debug xhci-hcd
[    5.744342] usb usb1: SerialNumber: 0000:01:00.0
[    5.747557] hub 1-0:1.0: USB hub found
[    5.749393] hub 1-0:1.0: 14 ports detected
[    5.758482] xhci_hcd 0000:01:00.0: xHCI Host Controller
[    5.760257] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 2
[    5.761988] xhci_hcd 0000:01:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[    5.763890] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    5.766015] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.12
[    5.767821] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    5.769624] usb usb2: Product: xHCI Host Controller
[    5.771537] usb usb2: Manufacturer: Linux 5.12.0-rc3-debug xhci-hcd
[    5.773341] usb usb2: SerialNumber: 0000:01:00.0
[    5.776368] hub 2-0:1.0: USB hub found
[    5.778218] hub 2-0:1.0: 8 ports detected
[    5.786159] xhci_hcd 0000:0c:00.3: xHCI Host Controller
[    5.788013] xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus number 3
[    5.790016] xhci_hcd 0000:0c:00.3: hcc params 0x0268ffe5 hci version 0x110 quirks 0x0000000000000410
[    5.794538] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.12
[    5.796327] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    5.798153] usb usb3: Product: xHCI Host Controller
[    5.799989] usb usb3: Manufacturer: Linux 5.12.0-rc3-debug xhci-hcd
[    5.801878] usb usb3: SerialNumber: 0000:0c:00.3
[    5.804989] hub 3-0:1.0: USB hub found
[    5.806943] hub 3-0:1.0: 4 ports detected
[    5.810968] xhci_hcd 0000:0c:00.3: xHCI Host Controller
[    5.812911] xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus number 4
[    5.814852] xhci_hcd 0000:0c:00.3: Host supports USB 3.1 Enhanced SuperSpeed
[    5.816914] usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
[    5.819226] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.12
[    5.821220] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    5.823188] usb usb4: Product: xHCI Host Controller
[    5.825148] usb usb4: Manufacturer: Linux 5.12.0-rc3-debug xhci-hcd
[    5.827132] usb usb4: SerialNumber: 0000:0c:00.3
[    5.830304] hub 4-0:1.0: USB hub found
[    5.832356] hub 4-0:1.0: 2 ports detected
[    5.836607] xhci_hcd 0000:0c:00.4: xHCI Host Controller
[    5.838724] xhci_hcd 0000:0c:00.4: new USB bus registered, assigned bus number 5
[    5.841046] xhci_hcd 0000:0c:00.4: hcc params 0x0268ffe5 hci version 0x110 quirks 0x0000000000000410
[    5.845927] usb usb5: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.12
[    5.848104] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    5.850279] usb usb5: Product: xHCI Host Controller
[    5.852448] usb usb5: Manufacturer: Linux 5.12.0-rc3-debug xhci-hcd
[    5.854628] usb usb5: SerialNumber: 0000:0c:00.4
[    5.857964] hub 5-0:1.0: USB hub found
[    5.860097] hub 5-0:1.0: 4 ports detected
[    5.864318] xhci_hcd 0000:0c:00.4: xHCI Host Controller
[    5.866417] xhci_hcd 0000:0c:00.4: new USB bus registered, assigned bus number 6
[    5.868521] xhci_hcd 0000:0c:00.4: Host supports USB 3.1 Enhanced SuperSpeed
[    5.870764] usb usb6: We don't know the algorithms for LPM for this host, disabling LPM.
[    5.873234] usb usb6: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.12
[    5.875410] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    5.877581] usb usb6: Product: xHCI Host Controller
[    5.879736] usb usb6: Manufacturer: Linux 5.12.0-rc3-debug xhci-hcd
[    5.881917] usb usb6: SerialNumber: 0000:0c:00.4
[    5.885175] hub 6-0:1.0: USB hub found
[    5.887373] hub 6-0:1.0: 2 ports detected
[    5.972196] random: fast init done
[    6.087608] usb 1-11: new full-speed USB device number 2 using xhci_hcd
[    6.273180] SGI XFS with ACLs, security attributes, realtime, scrub, repair, quota, no debug enabled
[    6.283881] XFS (nvme0n1p2): Mounting V5 Filesystem
[    6.301438] XFS (nvme0n1p2): Ending clean mount
[    6.307594] xfs filesystem being mounted at /new_root supports timestamps until 2038 (0x7fffffff)
[    6.423979] usb 1-11: New USB device found, idVendor=046d, idProduct=c534, bcdDevice=29.01
[    6.426964] usb 1-11: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    6.429116] usb 1-11: Product: USB Receiver
[    6.431270] usb 1-11: Manufacturer: Logitech
[    6.512460] random: crng init done
[    6.514601] systemd[1]: Successfully credited entropy passed from boot loader.
[    6.519182] systemd[1]: systemd 248.3-2-arch running in system mode. (+PAM +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY +P11KIT -QRENCODE +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +XKBCOMMON +UTMP -SYSVINIT default-hierarchy=unified)
[    6.526303] systemd[1]: No virtualization found in DMI
[    6.544505] systemd[1]: UML virtualization not found in /proc/cpuinfo.
[    6.547123] systemd[1]: No virtualization found in CPUID
[    6.549421] systemd[1]: Virtualization XEN not found, /proc/xen does not exist
[    6.551947] systemd[1]: This platform does not support /proc/device-tree
[    6.554174] systemd[1]: This platform does not support /proc/sysinfo
[    6.556362] systemd[1]: Found VM virtualization none
[    6.558608] systemd[1]: Detected architecture x86-64.
[    6.561488] systemd[1]: Detected initialized system, this is not the first boot.
[    6.572027] systemd[1]: Hostname set to <hp-4300G>.
[    6.575932] systemd[1]: Successfully added address 127.0.0.1 to loopback interface
[    6.578272] systemd[1]: Successfully added address ::1 to loopback interface
[    6.580513] systemd[1]: Successfully brought loopback interface up
[    6.583278] systemd[1]: Setting 'fs/file-max' to '9223372036854775807'.
[    6.585597] systemd[1]: Setting 'fs/nr_open' to '2147483640'.
[    6.587895] systemd[1]: Couldn't write fs.nr_open as 2147483640, halving it.
[    6.590142] systemd[1]: Setting 'fs/nr_open' to '1073741816'.
[    6.592386] systemd[1]: Successfully bumped fs.nr_open to 1073741816
[    6.596797] systemd[1]: Found cgroup2 on /sys/fs/cgroup/, full unified hierarchy
[    6.599105] systemd[1]: Unified cgroup hierarchy is located at /sys/fs/cgroup.
[    6.612552] systemd[1]: Got EBADF when using BPF_F_ALLOW_MULTI, which indicates it is supported. Yay!
[    6.615700] systemd[1]: Controller 'cpu' supported: yes
[    6.618063] systemd[1]: Controller 'cpuacct' supported: no
[    6.620391] systemd[1]: Controller 'cpuset' supported: yes
[    6.622710] systemd[1]: Controller 'io' supported: yes
[    6.624999] systemd[1]: Controller 'blkio' supported: no
[    6.627232] systemd[1]: Controller 'memory' supported: yes
[    6.629416] systemd[1]: Controller 'devices' supported: no
[    6.631609] systemd[1]: Controller 'pids' supported: yes
[    6.633741] systemd[1]: Controller 'bpf-firewall' supported: yes
[    6.635832] systemd[1]: Controller 'bpf-devices' supported: yes
[    6.637483] usb 1-12: new full-speed USB device number 3 using xhci_hcd
[    6.638244] systemd[1]: Set up TFD_TIMER_CANCEL_ON_SET timerfd.
[    6.643315] systemd[1]: Enabling (yes) showing of status (commandline).
[    6.646012] systemd[1]: Serializing system-environment-generators to memfd.
[    6.649222] systemd[1]: Successfully forked off '(sd-executor)' as PID 242.
[    6.650166] systemd[242]: Serializing 10-arch to memfd.
[    6.654825] systemd[242]: Successfully forked off '(direxec)' as PID 243.
[    6.676007] systemd[242]: /usr/lib/systemd/system-environment-generators/10-arch succeeded.
[    6.680054] systemd[1]: (sd-executor) succeeded.
[    6.683877] systemd[1]: Successfully forked off '(sd-executor)' as PID 244.
[    6.687068] systemd[244]: Successfully forked off '(direxec)' as PID 245.
[    6.690471] systemd[244]: Successfully forked off '(direxec)' as PID 246.
[    6.693787] systemd[244]: Successfully forked off '(direxec)' as PID 247.
[    6.694955] systemd-bless-boot-generator[245]: Skipping generator, not booted with boot counting in effect.
[    6.697112] systemd[244]: Successfully forked off '(direxec)' as PID 248.
[    6.703122] systemd[244]: Successfully forked off '(direxec)' as PID 249.
[    6.707898] systemd[244]: Successfully forked off '(direxec)' as PID 250.
[    6.708383] systemd-fstab-generator[248]: Parsing /etc/fstab...
[    6.712179] systemd[244]: Successfully forked off '(direxec)' as PID 251.
[    6.713256] systemd-fstab-generator[248]: Found entry what=tmpfs where=/tmp type=tmpfs makefs=no growfs=no noauto=no nofail=no
[    6.715761] systemd-gpt-auto-generator[250]: Disabling root partition auto-detection, root= is defined.
[    6.717146] systemd[244]: Successfully forked off '(direxec)' as PID 252.
[    6.719246] systemd[244]: Successfully forked off '(direxec)' as PID 253.
[    6.719689] systemd-hibernate-resume-generator[251]: Not running in an initrd, quitting.
[    6.721290] systemd[244]: Successfully forked off '(direxec)' as PID 254.
[    6.721414] systemd[244]: /usr/lib/systemd/system-generators/systemd-bless-boot-generator succeeded.
[    6.721802] systemd-fstab-generator[248]: Found entry what=/dev/disk/by-uuid/5457d04f-1fb0-4138-8f28-be95c401b449 where=/ type=xfs makefs=no growfs=no noauto=no nofail=no
[    6.725160] systemd-gpt-auto-generator[250]: Failed to chase block device '/', ignoring: No such file or directory
[    6.728250] systemd-fstab-generator[248]: Found entry what=
[    6.730487] systemd[244]: /usr/lib/systemd/system-generators/systemd-veritysetup-generator succeeded.
[    6.731508] systemd-gpt-auto-generator[250]: nvme0n1p2: Root device /dev/nvme0n1.
[    6.732467] systemd-fstab-generator[248]:  where= type= makefs=no growfs=no noauto=no nofail=no
[    6.735097] systemd[244]: /usr/lib/systemd/system-generators/systemd-debug-generator succeeded.
[    6.737246] systemd-fstab-generator[248]: Mount point  is not a valid path, ignoring.
[    6.759523] systemd-fstab-generator[248]: Found entry what=/dev/disk/by-uuid/BABE-8F35 where=/boot type=vfat makefs=no growfs=no noauto=no nofail=no
[    6.759864] systemd-fstab-generator[248]: Checking was requested for /dev/disk/by-uuid/BABE-8F35, but fsck.vfat does not exist.
[    6.767403] systemd[244]: /usr/lib/systemd/system-generators/systemd-getty-generator succeeded.
[    6.770973] systemd-fstab-generator[248]: Found entry what=
[    6.772029] systemd-gpt-auto-generator[250]: /boot specified in fstab, ignoring.
[    6.773734] systemd[244]: /usr/lib/systemd/system-generators/systemd-gpt-auto-generator succeeded.
[    6.776211] systemd-fstab-generator[248]:  where= type= makefs=no growfs=no noauto=no nofail=no
[    6.778971] systemd[244]: /usr/lib/systemd/system-generators/systemd-cryptsetup-generator succeeded.
[    6.781788] systemd-fstab-generator[248]: Mount point  is not a valid path, ignoring.
[    6.784696] systemd[244]: /usr/lib/systemd/system-generators/systemd-run-generator succeeded.
[    6.793437] systemd[244]: /usr/lib/systemd/system-generators/systemd-fstab-generator succeeded.
[    6.796378] systemd[244]: /usr/lib/systemd/system-generators/systemd-system-update-generator succeeded.
[    6.799363] systemd[244]: /usr/lib/systemd/system-generators/systemd-hibernate-resume-generator succeeded.
[    6.803548] systemd[1]: (sd-executor) succeeded.
[    6.806739] systemd[1]: Looking for unit files in (higher priority first):
[    6.809609] systemd[1]: 	/etc/systemd/system.control
[    6.812462] systemd[1]: 	/run/systemd/system.control
[    6.815276] systemd[1]: 	/run/systemd/transient
[    6.818037] systemd[1]: 	/run/systemd/generator.early
[    6.820789] systemd[1]: 	/etc/systemd/system
[    6.823485] systemd[1]: 	/etc/systemd/system.attached
[    6.826236] systemd[1]: 	/run/systemd/system
[    6.828956] systemd[1]: 	/run/systemd/system.attached
[    6.831666] systemd[1]: 	/run/systemd/generator
[    6.834269] systemd[1]: 	/usr/local/lib/systemd/system
[    6.836896] systemd[1]: 	/usr/lib/systemd/system
[    6.839528] systemd[1]: 	/run/systemd/generator.late
[    6.845675] systemd[1]: Modification times have changed, need to update cache.
[    6.850304] systemd[1]: unit_file_build_name_map: alias: /etc/systemd/system/dbus-org.freedesktop.network1.service \xe2\x86\x92 systemd-networkd.service
[    6.856480] systemd[1]: unit_file_build_name_map: alias: /etc/systemd/system/dbus-org.freedesktop.resolve1.service \xe2\x86\x92 systemd-resolved.service
[    6.863257] systemd[1]: unit_file_build_name_map: alias: /etc/systemd/system/display-manager.service \xe2\x86\x92 lightdm.service
[    6.866353] systemd[1]: unit_file_build_name_map: normal unit file: /run/systemd/generator/boot.mount
[    6.869294] systemd[1]: unit_file_build_name_map: normal unit file: /run/systemd/generator/-.mount
[    6.872181] systemd[1]: unit_file_build_name_map: normal unit file: /run/systemd/generator/tmp.mount
[    6.875369] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/nscd.service
[    6.878183] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/e2scrub@.service
[    6.880963] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/e2scrub_all.service
[    6.883569] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/e2scrub_all.timer
[    6.886114] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/e2scrub_fail@.service
[    6.888620] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/e2scrub_reap.service
[    6.891050] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/krb5-kadmind.service
[    6.893434] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/krb5-kdc.service
[    6.895760] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/krb5-kpropd.service
[    6.898037] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/krb5-kpropd.socket
[    6.900256] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/krb5-kpropd@.service
[    6.902397] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/auditd.service
[    6.904446] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/pam_namespace.service
[    6.906420] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/shadow.service
[    6.908333] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/shadow.timer
[    6.910192] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/fstrim.service
[    6.912016] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/fstrim.timer
[    6.913777] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/rfkill-block@.service
[    6.915500] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/rfkill-unblock@.service
[    6.917175] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/uuidd.service
[    6.918800] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/uuidd.socket
[    6.920355] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/dm-event.service
[    6.921915] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/dm-event.socket
[    6.923449] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/dbus.service
[    6.924964] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/dbus.socket
[    6.926407] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/ip6tables.service
[    6.927831] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/iptables.service
[    6.930110] systemd[1]: unit_file_build_name_map: alias: /usr/lib/systemd/system/autovt@.service \xe2\x86\x92 getty@.service
[    6.931600] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/basic.target
[    6.933085] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/blockdev@.target
[    6.934657] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/bluetooth.target
[    6.936130] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/boot-complete.target
[    6.937632] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/console-getty.service
[    6.939126] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/container-getty@.service
[    6.940631] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/cryptsetup-pre.target
[    6.942179] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/cryptsetup.target
[    6.944347] systemd[1]: unit_file_build_name_map: alias: /usr/lib/systemd/system/ctrl-alt-del.target \xe2\x86\x92 reboot.target
[    6.946586] systemd[1]: unit_file_build_name_map: alias: /usr/lib/systemd/system/dbus-org.freedesktop.hostname1.service \xe2\x86\x92 systemd-hostnamed.service
[    6.948141] usb 1-12: New USB device found, idVendor=0bda, idProduct=b00a, bcdDevice= 1.10
[    6.949923] systemd[1]: unit_file_build_name_map: alias: /usr/lib/systemd/system/dbus-org.freedesktop.import1.service \xe2\x86\x92 systemd-importd.service
[    6.951214] usb 1-12: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    6.951218] usb 1-12: Product: Bluetooth Radio 
[    6.951221] usb 1-12: Manufacturer: Realtek 
[    6.951224] usb 1-12: SerialNumber: 00e04c000001
[    6.960240] systemd[1]: unit_file_build_name_map: alias: /usr/lib/systemd/system/dbus-org.freedesktop.locale1.service \xe2\x86\x92 systemd-localed.service
[    6.963512] systemd[1]: unit_file_build_name_map: alias: /usr/lib/systemd/system/dbus-org.freedesktop.login1.service \xe2\x86\x92 systemd-logind.service
[    6.967129] systemd[1]: unit_file_build_name_map: alias: /usr/lib/systemd/system/dbus-org.freedesktop.machine1.service \xe2\x86\x92 systemd-machined.service
[    6.971105] systemd[1]: unit_file_build_name_map: alias: /usr/lib/systemd/system/dbus-org.freedesktop.oom1.service \xe2\x86\x92 systemd-oomd.service
[    6.975430] systemd[1]: unit_file_build_name_map: alias: /usr/lib/systemd/system/dbus-org.freedesktop.portable1.service \xe2\x86\x92 systemd-portabled.service
[    6.980097] systemd[1]: unit_file_build_name_map: alias: /usr/lib/systemd/system/dbus-org.freedesktop.timedate1.service \xe2\x86\x92 systemd-timedated.service
[    6.984954] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/debug-shell.service
[    6.987737] systemd[1]: unit_file_build_name_map: alias: /usr/lib/systemd/system/default.target \xe2\x86\x92 graphical.target
[    6.990354] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/dev-hugepages.mount
[    6.993004] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/dev-mqueue.mount
[    6.995660] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/emergency.service
[    6.998322] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/emergency.target
[    7.000974] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/exit.target
[    7.003615] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/final.target
[    7.006254] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/first-boot-complete.target
[    7.008911] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/getty-pre.target
[    7.011574] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/getty.target
[    7.014226] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/getty@.service
[    7.016876] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/graphical.target
[    7.019531] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/halt.target
[    7.022186] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/hibernate.target
[    7.024847] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/hybrid-sleep.target
[    7.027513] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/initrd-cleanup.service
[    7.030139] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/initrd-fs.target
[    7.032744] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/initrd-parse-etc.service
[    7.035352] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/initrd-root-device.target
[    7.037972] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/initrd-root-fs.target
[    7.040576] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/initrd-switch-root.service
[    7.043185] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/initrd-switch-root.target
[    7.045788] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/initrd-udevadm-cleanup-db.service
[    7.048385] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/initrd.target
[    7.050982] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/kexec.target
[    7.053539] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/kmod-static-nodes.service
[    7.056091] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/ldconfig.service
[    7.058560] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/local-fs-pre.target
[    7.061013] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/local-fs.target
[    7.063340] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/machine.slice
[    7.065635] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/machines.target
[    7.067821] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/modprobe@.service
[    7.069984] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/multi-user.target
[    7.072149] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/network-online.target
[    7.074314] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/network-pre.target
[    7.076390] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/network.target
[    7.078380] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/nss-lookup.target
[    7.080285] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/nss-user-lookup.target
[    7.082114] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/paths.target
[    7.083838] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/poweroff.target
[    7.085486] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/printer.target
[    7.087037] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/proc-sys-fs-binfmt_misc.automount
[    7.088535] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/proc-sys-fs-binfmt_misc.mount
[    7.089934] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/quotaon.service
[    7.091252] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/reboot.target
[    7.092494] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/remote-cryptsetup.target
[    7.093651] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/remote-fs-pre.target
[    7.094730] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/remote-fs.target
[    7.095759] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/remote-veritysetup.target
[    7.096760] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/rescue.service
[    7.097755] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/rescue.target
[    7.098738] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/rpcbind.target
[    7.099729] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/serial-getty@.service
[    7.100725] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/shutdown.target
[    7.101726] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/sigpwr.target
[    7.102714] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/sleep.target
[    7.103691] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/slices.target
[    7.104668] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/smartcard.target
[    7.105647] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/sockets.target
[    7.106628] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/sound.target
[    7.107608] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/suspend-then-hibernate.target
[    7.108608] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/suspend.target
[    7.109596] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/swap.target
[    7.110574] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/sys-fs-fuse-connections.mount
[    7.111581] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/sys-kernel-config.mount
[    7.112589] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/sys-kernel-debug.mount
[    7.113585] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/sys-kernel-tracing.mount
[    7.114596] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/sysinit.target
[    7.115592] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/syslog.socket
[    7.116586] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/system-systemd\x2dcryptsetup.slice
[    7.118571] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/system-update-cleanup.service
[    7.119742] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/system-update-pre.target
[    7.120901] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/system-update.target
[    7.122044] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-ask-password-console.path
[    7.123206] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-ask-password-console.service
[    7.125488] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-ask-password-wall.path
[    7.126811] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-ask-password-wall.service
[    7.128135] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-backlight@.service
[    7.129455] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-binfmt.service
[    7.130771] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-bless-boot.service
[    7.132096] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-boot-check-no-failures.service
[    7.134745] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-boot-system-token.service
[    7.136252] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-coredump.socket
[    7.137755] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-coredump@.service
[    7.139256] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-exit.service
[    7.140757] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-firstboot.service
[    7.142252] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-fsck-root.service
[    7.143740] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-fsck@.service
[    7.145216] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-halt.service
[    7.146691] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-hibernate-resume@.service
[    7.148178] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-hibernate.service
[    7.149658] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-homed-activate.service
[    7.151143] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-homed.service
[    7.152627] systemd[1]: unit_file_build_name_map: normal unit file: /usr/lib/systemd/system/systemd-hostnamed.service
[    7.324732] Linux agpgart interface v0.103
[    7.339568] fuse: init (API version 7.33)
[    7.355563] systemd-journald[265]: Auditing in kernel turned on.
[    7.359014] systemd-journald[265]: Journal effective settings seal=no keyed_hash=yes compress=yes compress_threshold_bytes=512B
[    7.359112] systemd-journald[265]: Fixed min_use=16.0M max_use=313.3M max_size=39.1M min_size=512.0K keep_free=156.6M n_max_files=100
[    7.367696] XFS: attr2 mount option is deprecated.
[    7.368118] systemd-journald[265]: Reserving 333 entries in field hash table.
[    7.372374] xfs filesystem being remounted at / supports timestamps until 2038 (0x7fffffff)
[    7.374992] Asymmetric key parser 'pkcs8' registered
[    7.377914] systemd-journald[265]: Reserving 71310 entries in data hash table.
[    7.381564] systemd-journald[265]: Vacuuming...
[    7.381627] systemd-journald[265]: Vacuuming done, freed 0B of archived journals from /run/log/journal/983425690c9a4432866996cdc56b7fd4.
[    7.381665] systemd-journald[265]: Flushing /dev/kmsg...
[    7.404037] audit: type=1130 audit(1625291560.226:2): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=kmod-static-nodes comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.412624] audit: type=1130 audit(1625291560.236:3): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=modprobe@configfs comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.419004] audit: type=1131 audit(1625291560.236:4): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=modprobe@configfs comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.427185] audit: type=1130 audit(1625291560.249:5): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=modprobe@drm comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.434060] audit: type=1131 audit(1625291560.249:6): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=modprobe@drm comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.444751] audit: type=1130 audit(1625291560.266:7): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=modprobe@fuse comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.451199] audit: type=1131 audit(1625291560.266:8): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=modprobe@fuse comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.462023] audit: type=1130 audit(1625291560.286:9): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-modules-load comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.472536] audit: type=1130 audit(1625291560.296:10): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-remount-fs comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.554217] audit: type=1130 audit(1625291560.376:11): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-binfmt comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.619871] systemd-journald[265]: systemd-journald running as PID 265 for the system.
[    7.620170] systemd-journald[265]: Sent READY=1 notification.
[    7.620230] systemd-journald[265]: Sent WATCHDOG=1 notification.
[    7.622326] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.636767] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.640546] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.645323] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.649119] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.649502] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.649868] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.650251] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.650623] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.651251] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.651514] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.652468] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.677672] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.680654] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.681201] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.681611] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.682019] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.682430] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.683685] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.698929] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.702646] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.711638] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    7.721958] systemd-journald[265]: n/a: New incoming connection.
[    7.723759] systemd-journald[265]: varlink-20: varlink: setting state idle-server
[    7.726435] systemd-journald[265]: varlink-20: New incoming message: {"method":"io.systemd.Journal.FlushToVar","parameters":{}}
[    7.730145] systemd-journald[265]: varlink-20: varlink: changing state idle-server \xe2\x86\x92 processing-method
[    7.732073] systemd-journald[265]: Received client request to flush runtime journal.
[    7.734994] systemd-journald[265]: Journal effective settings seal=yes keyed_hash=yes compress=yes compress_threshold_bytes=512B
[    7.741586] systemd-journald[265]: Fixed min_use=16.0M max_use=4.0G max_size=128.0M min_size=512.0K keep_free=4.0G n_max_files=100
[    7.758328] systemd-journald[265]: Flushing to /var/log/journal/983425690c9a4432866996cdc56b7fd4...
[    7.760632] systemd-journald[265]: Considering root directory '/run/log/journal'.
[    7.762999] systemd-journald[265]: Root directory /run/log/journal added.
[    7.765265] systemd-journald[265]: Considering directory '/run/log/journal/983425690c9a4432866996cdc56b7fd4'.
[    7.767501] systemd-journald[265]: Directory /run/log/journal/983425690c9a4432866996cdc56b7fd4 added.
[    7.769900] systemd-journald[265]: Journal effective settings seal=no keyed_hash=yes compress=no compress_threshold_bytes=8B
[    7.772279] systemd-journald[265]: File /run/log/journal/983425690c9a4432866996cdc56b7fd4/system.journal added.
[    7.774603] systemd-journald[265]: Considering root directory '/var/log/journal'.
[    7.776898] systemd-journald[265]: Considering root directory '/var/log/journal/remote'.
[    8.150185] systemd-journald[265]: Root directory /run/log/journal removed.
[    8.152553] systemd-journald[265]: Directory /run/log/journal/983425690c9a4432866996cdc56b7fd4 removed.
[    8.154907] systemd-journald[265]: mmap cache statistics: 109427 context cache hit, 3 window list hit, 1 miss
[    8.157320] systemd-journald[265]: Journal effective settings seal=no keyed_hash=yes compress=yes compress_threshold_bytes=512B
[    8.162642] systemd-journald[265]: Vacuuming...
[    8.221524] systemd-journald[265]: Vacuuming done, freed 0B of archived journals from /var/log/journal/983425690c9a4432866996cdc56b7fd4.
[    8.232172] systemd-journald[265]: varlink-20: Sending message: {"parameters":{}}
[    8.234888] systemd-journald[265]: varlink-20: varlink: changing state processing-method \xe2\x86\x92 processed-method
[    8.237737] systemd-journald[265]: varlink-20: varlink: changing state processed-method \xe2\x86\x92 idle-server
[    8.243581] systemd-journald[265]: varlink-20: Got POLLHUP from socket.
[    8.246412] systemd-journald[265]: varlink-20: varlink: changing state idle-server \xe2\x86\x92 pending-disconnect
[    8.249306] systemd-journald[265]: varlink-20: varlink: changing state pending-disconnect \xe2\x86\x92 processing-disconnect
[    8.252261] systemd-journald[265]: varlink-20: varlink: changing state processing-disconnect \xe2\x86\x92 disconnected
[    8.308619] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    8.517310] acpi_cpufreq: overriding BIOS provided _PSD data
[    8.540118] acpi-tad ACPI000E:00: Missing _PRW
[    8.607758] ACPI: video: Video Device [VGA1] (multi-head: yes  rom: no  post: no)
[    8.618373] acpi device:1e: registered as cooling_device8
[    8.626848] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1d/LNXVIDEO:01/input/input2
[    8.825614] acpi PNP0C14:01: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
[    8.902194] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.0/0003:046D:C534.0001/input/input3
[    8.939361] ccp 0000:0c:00.2: enabling device (0100 -> 0102)
[    8.955972] ccp 0000:0c:00.2: ccp: unable to access the device: you might be running a broken BIOS.
[    8.963592] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    8.970655] hid-generic 0003:046D:C534.0001: input,hidraw0: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:01:00.0-11/input0
[    8.971435] ccp 0000:0c:00.2: tee enabled
[    8.983107] ccp 0000:0c:00.2: psp enabled
[    8.993491] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
[    8.997884] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
[    9.001767] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
[    9.007282] input: Logitech USB Receiver Mouse as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/input/input4
[    9.019415] input: Logitech USB Receiver Consumer Control as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/input/input5
[    9.034973] input: PC Speaker as /devices/platform/pcspkr/input/input9
[    9.046118] FAT-fs (nvme0n1p1): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.
[    9.054500] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    9.057035] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO address
[    9.059986] sp5100-tco sp5100-tco: initialized. heartbeat=60 sec (nowayout=0)
[    9.081027] libphy: r8169: probed
[    9.082100] input: Logitech USB Receiver System Control as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/input/input6
[    9.087214] r8169 0000:0a:00.0 eth0: RTL8168h/8111h, 00:68:eb:ad:98:43, XID 541, IRQ 91
[    9.094618] hid-generic 0003:046D:C534.0002: input,hiddev96,hidraw1: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:01:00.0-11/input1
[    9.097120] r8169 0000:0a:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksumming: ko]
[    9.104420] usbcore: registered new interface driver usbhid
[    9.112544] usbhid: USB HID core driver
[    9.124878] Bluetooth: Core ver 2.22
[    9.130875] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    9.144288] NET: Registered protocol family 31
[    9.149041] Bluetooth: HCI device and connection manager initialized
[    9.153017] Bluetooth: HCI socket layer initialized
[    9.156925] Bluetooth: L2CAP socket layer initialized
[    9.160735] Bluetooth: SCO socket layer initialized
[    9.209776] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    9.215973] RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840 ms ovfl timer
[    9.237135] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    9.242388] RAPL PMU: hw unit of domain package 2^-16 Joules
[    9.243515] platform regulatory.0: Direct firmware load for regulatory.db failed with error -2
[    9.251002] cfg80211: failed to load regulatory.db
[    9.258468] usbcore: registered new interface driver btusb
[    9.263470] Bluetooth: hci0: RTL: examining hci_ver=08 hci_rev=000c lmp_ver=08 lmp_subver=8821
[    9.271407] Bluetooth: hci0: RTL: rom_version status=0 version=1
[    9.276096] Bluetooth: hci0: RTL: loading rtl_bt/rtl8821c_fw.bin
[    9.282586] Bluetooth: hci0: RTL: loading rtl_bt/rtl8821c_config.bin
[    9.286578] cryptd: max_cpu_qlen set to 1000
[    9.290204] Bluetooth: hci0: RTL: cfg_sz 10, total sz 31990
[    9.304981] irq 7: nobody cared (try booting with the "irqpoll" option)
[    9.308994] CPU: 4 PID: 308 Comm: systemd-udevd Tainted: G    B             5.12.0-rc3-debug #1
[    9.313266] Hardware name: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17/2020
[    9.317902] Call Trace:
[    9.322386]  <IRQ>
[    9.326452]  dump_stack+0x9c/0xcf
[    9.330599]  __report_bad_irq+0x43/0xde
[    9.334691]  note_interrupt.cold+0x28/0x8b
[    9.339026]  ? add_interrupt_randomness+0x152/0x270
[    9.343255]  handle_irq_event+0x14e/0x160
[    9.347069]  ? handle_irq_event_percpu+0xf0/0xf0
[    9.350865]  ? _raw_spin_lock+0x81/0xe0
[    9.354551]  ? _raw_spin_lock_bh+0xe0/0xe0
[    9.358106]  handle_fasteoi_irq+0xfa/0x370
[    9.361574]  __common_interrupt+0x4f/0xc0
[    9.365067]  common_interrupt+0x7b/0xa0
[    9.368562]  </IRQ>
[    9.371968]  asm_common_interrupt+0x1e/0x40
[    9.375328] RIP: 0010:mpihelp_submul_1+0x4a/0x100
[    9.378586] Code: 48 83 ec 20 48 89 5c 24 08 31 db 48 89 7c 24 10 48 89 74 24 18 48 89 04 24 eb 03 49 63 c5 48 2b 04 24 4c 8d 34 c5 00 00 00 00 <48> 8b 44 24 18 4e 8d 24 30 4c 89 e7 e8 55 85 c4 ff 49 8b 34 24 48
[    9.385354] RSP: 0018:ffffc90001dc7360 EFLAGS: 00000202
[    9.388625] RAX: 000000000000003d RBX: 58b15c7a1664d4fd RCX: ffffffff92809c85
[    9.391896] RDX: dffffc0000000000 RSI: 95a5834bb0a7f6e5 RDI: ffff8881035301e8
[    9.395056] RBP: 00000000901b3ef1 R08: 6ee397ce901b3ef1 R09: 000000003f8f75f4
[    9.398127] R10: fffffbfff298d729 R11: 0000000000000001 R12: 7c892be55ef82e4f
[    9.401275] R13: 00000000fffffffd R14: 00000000000001e8 R15: 58b15c7972392b28
[    9.404440]  ? mpihelp_submul_1+0xd5/0x100
[    9.407665]  mpihelp_divrem+0x167/0x9e0
[    9.410828]  mpi_powm+0x86e/0xe00
[    9.413898]  ? mpihelp_mul_karatsuba_case+0x5b0/0x5b0
[    9.416845]  ? asm_common_interrupt+0x1e/0x40
[    9.419918]  ? __sg_page_iter_next+0xa7/0x100
[    9.422804]  ? mpihelp_cmp+0x4f/0x80
[    9.425790]  rsa_enc+0x140/0x1f0
[    9.428676]  ? rsa_dec+0x1f0/0x1f0
[    9.431576]  pkcs1pad_verify+0x296/0x320
[    9.434458]  public_key_verify_signature+0x548/0x6f0
[    9.437358]  ? software_key_eds_op+0x620/0x620
[    9.440180]  ? keyring_search+0x136/0x190
[    9.442934]  ? common_interrupt+0x1c/0xa0
[    9.445676]  ? asm_common_interrupt+0x1e/0x40
[    9.448371]  ? pkcs7_validate_trust+0x2f7/0x330
[    9.451023]  pkcs7_validate_trust+0x303/0x330
[    9.453667]  verify_pkcs7_message_sig+0xe2/0x190
[    9.456285]  ? restrict_link_by_builtin_trusted+0x20/0x20
[    9.458959]  ? kfree+0xc3/0x480
[    9.461558]  verify_pkcs7_signature+0x4c/0x80
[    9.464115]  mod_verify_sig+0xe6/0x130
[    9.466542]  ? is_module_text_address+0x30/0x30
[    9.469037]  ? common_interrupt+0x1c/0xa0
[    9.471471]  load_module+0x48f/0x41a0
[    9.473945]  ? __kernel_read+0x338/0x4f0
[    9.476449]  ? __kernel_read+0x340/0x4f0
[    9.478938]  ? __x64_sys_sendfile64+0x140/0x140
[    9.481427]  ? module_frob_arch_sections+0x20/0x20
[    9.481442]  ? kernel_read+0x46/0xb0
[    9.481450]  ? kernel_read_file+0x1d2/0x3e0
[    9.481458]  ? __x64_sys_fspick+0x230/0x230
[    9.481464]  ? kasan_check_range+0x185/0x1d0
[    9.481470]  ? _raw_write_unlock+0x30/0x30
[    9.481478]  ? __do_sys_finit_module+0x110/0x1a0
[    9.481484]  __do_sys_finit_module+0x110/0x1a0
[    9.481491]  ? __ia32_sys_init_module+0x40/0x40
[    9.481496]  ? get_nth_filter.part.0+0x170/0x170
[    9.481503]  ? rcu_momentary_dyntick_idle+0x50/0x50
[    9.481512]  ? __do_softirq+0x209/0x3be
[    9.481517]  ? __audit_syscall_entry+0x193/0x1f0
[    9.481522]  ? ktime_get_coarse_real_ts64+0x4a/0x70
[    9.516734]  do_syscall_64+0x33/0x40
[    9.516747]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[    9.516754] RIP: 0033:0x7f079a72618d
[    9.516759] Code: b4 0c 00 0f 05 eb a9 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 6c 0c 00 f7 d8 64 89 01 48
[    9.516763] RSP: 002b:00007ffdde055848 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    9.516768] RAX: ffffffffffffffda RBX: 0000559b1868c870 RCX: 00007f079a72618d
[    9.516772] RDX: 0000000000000000 RSI: 00007f079a883a9d RDI: 0000000000000015
[    9.516774] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000559b1868c870
[    9.516777] R10: 0000000000000015 R11: 0000000000000246 R12: 00007f079a883a9d
[    9.516779] R13: 0000000000000000 R14: 0000559b1869b820 R15: 0000559b1868c870
[    9.516785] handlers:
[    9.516786] [<00000000619962db>] amd_gpio_irq_handler [pinctrl_amd]
[    9.516796] Disabling IRQ #7
[    9.518500] AVX2 version of gcm_enc/dec engaged.
[    9.518550] AES CTR mode by8 optimization enabled
[    9.518794] snd_hda_intel 0000:0c:00.1: enabling device (0100 -> 0102)
[    9.519962] snd_hda_intel 0000:0c:00.1: Handle vga_switcheroo audio client
[    9.570729] snd_hda_intel 0000:0c:00.6: enabling device (0100 -> 0102)
[    9.614031] input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:0c:00.1/sound/card0/input10
[    9.705675] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC671: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:line
[    9.708420] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    9.708761] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    9.714896] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[    9.718876] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
[    9.718897] snd_hda_codec_realtek hdaudioC1D0:    inputs:
[    9.718904] snd_hda_codec_realtek hdaudioC1D0:      Mic=0x19
[    9.718915] snd_hda_codec_realtek hdaudioC1D0:      Line=0x1b
[    9.749261] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    9.770716] input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:08.1/0000:0c:00.6/sound/card1/input11
[    9.771375] input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:08.1/0000:0c:00.6/sound/card1/input12
[    9.771987] input: HD-Audio Generic Line Out as /devices/pci0000:00/0000:00:08.1/0000:0c:00.6/sound/card1/input13
[    9.772603] input: HD-Audio Generic Front Headphone as /devices/pci0000:00/0000:00:08.1/0000:0c:00.6/sound/card1/input14
[    9.797844] rtw_8821ce 0000:09:00.0: enabling device (0100 -> 0103)
[    9.798837] rtw_8821ce 0000:09:00.0: Firmware version 24.8.0, H2C version 12
[    9.861369] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    9.920626] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[    9.968295] kvm: Nested Virtualization enabled
[    9.970665] [drm] amdgpu kernel modesetting enabled.
[    9.971787] SVM: kvm: Nested Paging enabled
[    9.975655] Virtual CRAT table created for CPU
[    9.977941] SVM: Virtual VMLOAD VMSAVE supported
[    9.977945] SVM: Virtual GIF supported
[    9.989227] amdgpu: Topology: Add CPU node
[    9.993923] checking generic (d0000000 300000) vs hw (d0000000 10000000)
[    9.998240] fb0: switching to amdgpudrmfb from EFI VGA
[   10.002978] Console: switching to colour dummy device 80x25
[   10.003328] amdgpu 0000:0c:00.0: vgaarb: deactivate vga console
[   10.004163] amdgpu 0000:0c:00.0: enabling device (0106 -> 0107)
[   10.005925] [drm] initializing kernel modesetting (RENOIR 0x1002:0x1636 0x103C:0x87D6 0xCA).
[   10.005985] amdgpu 0000:0c:00.0: amdgpu: Trusted Memory Zone (TMZ) feature disabled as experimental (default)
[   10.006259] [drm] register mmio base: 0xFCA00000
[   10.006288] [drm] register mmio size: 524288
[   10.006317] [drm] PCIE atomic ops is not supported
[   10.007372] [drm] add ip block number 0 <soc15_common>
[   10.007411] [drm] add ip block number 1 <gmc_v9_0>
[   10.007474] [drm] add ip block number 2 <vega10_ih>
[   10.007492] [drm] add ip block number 3 <psp>
[   10.007498] [drm] add ip block number 4 <smu>
[   10.007505] [drm] add ip block number 5 <gfx_v9_0>
[   10.007512] [drm] add ip block number 6 <sdma_v4_0>
[   10.007520] [drm] add ip block number 7 <dm>
[   10.007527] [drm] add ip block number 8 <vcn_v2_0>
[   10.007562] [drm] add ip block number 9 <jpeg_v2_0>
[   10.007700] amdgpu 0000:0c:00.0: amdgpu: Fetched VBIOS from VFCT
[   10.007815] amdgpu: ATOM BIOS: 113-RENOIR-026
[   10.010428] [drm] VCN decode is enabled in VM mode
[   10.010443] [drm] VCN encode is enabled in VM mode
[   10.010448] [drm] JPEG decode is enabled in VM mode
[   10.011043] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
[   10.011118] amdgpu 0000:0c:00.0: amdgpu: VRAM: 512M 0x000000F400000000 - 0x000000F41FFFFFFF (512M used)
[   10.011133] amdgpu 0000:0c:00.0: amdgpu: GART: 1024M 0x0000000000000000 - 0x000000003FFFFFFF
[   10.011146] amdgpu 0000:0c:00.0: amdgpu: AGP: 267419648M 0x000000F800000000 - 0x0000FFFFFFFFFFFF
[   10.011192] [drm] Detected VRAM RAM=512M, BAR=512M
[   10.011201] [drm] RAM width 64bits DDR4
[   10.011685] [TTM] Zone  kernel: Available graphics memory: 3208866 KiB
[   10.011699] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[   10.046111] MCE: In-kernel MCE decoding enabled.
[   10.050870] [drm] amdgpu: 512M of VRAM memory ready
[   10.050941] [drm] amdgpu: 3072M of GTT memory ready.
[   10.051000] general protection fault, probably for non-canonical address 0xff2439eaff279143: 0000 [#1] PREEMPT SMP KASAN NOPTI
[   10.051018] CPU: 1 PID: 294 Comm: systemd-udevd Tainted: G    B             5.12.0-rc3-debug #1
[   10.051033] Hardware name: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17/2020
[   10.051043] RIP: 0010:native_queued_spin_lock_slowpath+0x317/0x490
[   10.051064] Code: 3c d5 00 d9 db 93 48 89 14 24 49 81 c7 40 57 03 00 e8 9d f2 2c 00 48 8b 14 24 4c 03 3c d5 00 d9 db 93 4c 89 ff e8 29 f3 2c 00 <49> 89 2f eb 02 f3 90 4c 89 f7 e8 3a f1 2c 00 8b 45 08 85 c0 74 ef
[   10.051087] RSP: 0018:ffffc9000089f050 EFLAGS: 00010086
[   10.051099] RAX: 0000000000000000 RBX: ffff8881d7830024 RCX: ffffffff92182ed7
[   10.051110] RDX: 0000000000000001 RSI: 0000000000000008 RDI: ff2439eaff279143
[   10.051121] RBP: ffff8881d6a75740 R08: 0000000000000001 R09: ffff8881d7830027
[   10.051132] R10: ffffed103af06004 R11: 0000000000000001 R12: 0000000000080000
[   10.051143] R13: 1ffff92000113e0b R14: ffff8881d6a75748 R15: ff2439eaff279143
[   10.051155] FS:  00007f0799df6a40(0000) GS:ffff8881d6a40000(0000) knlGS:0000000000000000
[   10.051168] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.051179] CR2: 00007f14f6fa9f10 CR3: 000000010a888000 CR4: 0000000000350ee0
[   10.051190] Call Trace:
[   10.051197]  ? .slowpath+0xe/0xe
[   10.051207]  ? kasan_save_stack+0x32/0x40
[   10.051223]  ? __kasan_kmalloc+0x99/0xc0
[   10.051235]  ? amdgpu_ttm_init.cold+0x153/0x16f [amdgpu]
[   10.052171]  ? gmc_v9_0_sw_init+0x64c/0x980 [amdgpu]
[   10.053184]  ? amdgpu_device_init.cold+0x1483/0x2400 [amdgpu]
[   10.054225]  ? amdgpu_driver_load_kms+0xb1/0x3f0 [amdgpu]
[   10.055217]  ? amdgpu_pci_probe+0x172/0x200 [amdgpu]
[   10.056218]  ? local_pci_probe+0x74/0xc0
[   10.056234]  _raw_spin_lock_irqsave+0xe0/0xf0
[   10.056247]  ? _raw_write_unlock_bh+0x30/0x30
[   10.056257]  ? __do_sys_finit_module+0x110/0x1a0
[   10.056271]  ? entry_SYSCALL_64_after_hwframe+0x44/0xae
[   10.056285]  swiotlb_tbl_map_single+0x1de/0x6f0
[   10.056298]  ? irq_work_queue+0xb/0x40
[   10.056314]  ? add_hole+0x294/0x310 [drm]
[   10.056457]  swiotlb_map+0xc1/0x3f0
[   10.056467]  ? drm_mm_init+0x126/0x140 [drm]
[   10.056607]  ? swiotlb_sync_single_for_cpu+0x20/0x20
[   10.056620]  ? ttm_range_man_init+0xdd/0x100 [ttm]
[   10.056650]  ? amdgpu_ttm_init.cold+0x153/0x16f [amdgpu]
[   10.057586]  dma_map_page_attrs+0x299/0x390
[   10.057599]  ? dmam_free_coherent+0xe0/0xe0
[   10.057611]  amdgpu_gart_init+0x77/0xf0 [amdgpu]
[   10.058480]  gmc_v9_0_sw_init+0x910/0x980 [amdgpu]
[   10.059373]  ? gmc_v9_0_late_init+0xe0/0xe0 [amdgpu]
[   10.060260]  ? __drmm_add_action+0xf0/0x140 [drm]
[   10.060386]  ? drm_mode_config_cleanup+0x480/0x480 [drm]
[   10.060513]  ? drm_mode_config_cleanup+0x480/0x480 [drm]
[   10.060641]  amdgpu_device_init.cold+0x1483/0x2400 [amdgpu]
[   10.061600]  ? amdgpu_device_cache_pci_state+0x90/0x90 [amdgpu]
[   10.062639]  ? pci_find_saved_ext_cap+0x80/0x80
[   10.062654]  ? pci_enable_device_flags+0xcb/0x250
[   10.062667]  ? pci_enable_device_flags+0x19c/0x250
[   10.062679]  ? pci_enable_bridge+0xe0/0xe0
[   10.062690]  amdgpu_driver_load_kms+0xb1/0x3f0 [amdgpu]
[   10.063709]  amdgpu_pci_probe+0x172/0x200 [amdgpu]
[   10.064737]  ? amdgpu_pci_remove+0x80/0x80 [amdgpu]
[   10.065697]  local_pci_probe+0x74/0xc0
[   10.065710]  pci_device_probe+0x1ee/0x300
[   10.065721]  ? pci_device_remove+0x100/0x100
[   10.065732]  ? kernfs_put+0x18/0x30
[   10.065741]  ? sysfs_do_create_link_sd+0x76/0xd0
[   10.065754]  really_probe+0x185/0x6c0
[   10.065764]  driver_probe_device+0x13f/0x1d0
[   10.065774]  device_driver_attach+0x110/0x120
[   10.065784]  ? device_driver_attach+0x120/0x120
[   10.065793]  __driver_attach+0xae/0x1a0
[   10.065803]  ? device_driver_attach+0x120/0x120
[   10.065812]  bus_for_each_dev+0xe6/0x140
[   10.065823]  ? subsys_dev_iter_exit+0x10/0x10
[   10.065833]  ? __list_add_valid+0x2b/0xa0
[   10.065844]  bus_add_driver+0x1f8/0x2e0
[   10.065857]  driver_register+0x10f/0x190
[   10.065866]  ? 0xffffffffc133b000
[   10.065875]  do_one_initcall+0x89/0x2a0
[   10.065886]  ? perf_trace_initcall_level+0x230/0x230
[   10.065897]  ? kfree+0xc3/0x480
[   10.065907]  ? kasan_set_track+0x1c/0x30
[   10.065917]  ? kasan_unpoison+0x3a/0x60
[   10.065927]  ? kasan_unpoison+0x3a/0x60
[   10.065938]  do_init_module+0xfd/0x3c0
[   10.065950]  load_module+0x3f44/0x41a0
[   10.065961]  ? xfs_file_buffered_read+0x82/0x130 [xfs]
[   10.066346]  ? module_frob_arch_sections+0x20/0x20
[   10.066358]  ? kernel_read+0x46/0xb0
[   10.066369]  ? kernel_read_file+0x1d2/0x3e0
[   10.066384]  ? __do_sys_finit_module+0x110/0x1a0
[   10.066394]  __do_sys_finit_module+0x110/0x1a0
[   10.066404]  ? __ia32_sys_init_module+0x40/0x40
[   10.066414]  ? get_nth_filter.part.0+0x170/0x170
[   10.066426]  ? randomize_stack_top+0x80/0x80
[   10.066436]  ? __ia32_compat_sys_newlstat+0x30/0x30
[   10.066450]  ? __audit_syscall_entry+0x193/0x1f0
[   10.066459]  ? ktime_get_coarse_real_ts64+0x4a/0x70
[   10.066471]  do_syscall_64+0x33/0x40
[   10.066482]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   10.066494] RIP: 0033:0x7f079a72618d
[   10.066502] Code: b4 0c 00 0f 05 eb a9 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 6c 0c 00 f7 d8 64 89 01 48
[   10.066522] RSP: 002b:00007ffdde055848 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   10.066535] RAX: ffffffffffffffda RBX: 0000559b1868c810 RCX: 00007f079a72618d
[   10.066545] RDX: 0000000000000000 RSI: 00007f079a883a9d RDI: 0000000000000018
[   10.066554] RBP: 0000000000020000 R08: 0000000000000000 R09: 00007f079aab65ea
[   10.066564] R10: 0000000000000018 R11: 0000000000000246 R12: 00007f079a883a9d
[   10.066573] R13: 0000000000000000 R14: 0000559b18690b60 R15: 0000559b1868c810
[   10.066585] Modules linked in: edac_mce_amd fjes(-) kvm_amd rtw88_8821ce kvm rtw88_8821c rtw88_pci amdgpu(+) rtw88_core irqbypass snd_hda_codec_realtek crct10dif_pclmul crc32_pclmul ghash_clmulni_intel snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi mac80211 aesni_intel snd_hda_intel snd_intel_dspcfg crypto_simd cryptd gpu_sched snd_intel_sdw_acpi btusb i2c_algo_bit snd_hda_codec btrtl drm_ttm_helper btbcm btintel rapl ttm snd_hda_core drm_kms_helper cfg80211 snd_hwdep bluetooth sp5100_tco vfat pcspkr snd_pcm ecdh_generic k10temp fat r8169 i2c_piix4 cec snd_timer syscopyarea realtek sysfillrect snd mdio_devres sysimgblt rfkill ccp fb_sys_fops soundcore libphy libarc4 ecc usbhid crc16 wmi tpm_crb tpm_tis tpm_tis_core video tpm gpio_amdpt gpio_generic rng_core pinctrl_amd mac_hid acpi_tad acpi_cpufreq pkcs8_key_parser drm fuse agpgart bpf_preload ip_tables x_tables xfs libcrc32c crc32c_generic crc32c_intel xhci_pci xhci_pci_renesas
[   10.066824] ---[ end trace f566d89392370240 ]---
[   10.066831] RIP: 0010:native_queued_spin_lock_slowpath+0x317/0x490
[   10.066844] Code: 3c d5 00 d9 db 93 48 89 14 24 49 81 c7 40 57 03 00 e8 9d f2 2c 00 48 8b 14 24 4c 03 3c d5 00 d9 db 93 4c 89 ff e8 29 f3 2c 00 <49> 89 2f eb 02 f3 90 4c 89 f7 e8 3a f1 2c 00 8b 45 08 85 c0 74 ef
[   10.066863] RSP: 0018:ffffc9000089f050 EFLAGS: 00010086
[   10.066873] RAX: 0000000000000000 RBX: ffff8881d7830024 RCX: ffffffff92182ed7
[   10.066882] RDX: 0000000000000001 RSI: 0000000000000008 RDI: ff2439eaff279143
[   10.066892] RBP: ffff8881d6a75740 R08: 0000000000000001 R09: ffff8881d7830027
[   10.066903] R10: ffffed103af06004 R11: 0000000000000001 R12: 0000000000080000
[   10.066913] R13: 1ffff92000113e0b R14: ffff8881d6a75748 R15: ff2439eaff279143
[   10.066924] FS:  00007f0799df6a40(0000) GS:ffff8881d6a40000(0000) knlGS:0000000000000000
[   10.066936] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.066944] CR2: 00007f14f6fa9f10 CR3: 000000010a888000 CR4: 0000000000350ee0
[   10.066955] note: systemd-udevd[294] exited with preempt_count 1
[   10.074564] systemd-journald[265]: Compressed data object 946 -> 537 using ZSTD
[   10.076050] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[   10.089990] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[   10.114635] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[   10.226512] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[   10.234727] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[   10.249690] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[   10.292469] r8169 0000:0a:00.0 enp10s0: renamed from eth0
[   10.321331] input: HP WMI hotkeys as /devices/virtual/input/input15
[   10.356875] logitech-djreceiver 0003:046D:C534.0001: hidraw0: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:01:00.0-11/input0
[   10.478801] intel_rapl_common: Found RAPL domain package
[   10.478843] intel_rapl_common: Found RAPL domain core
[   10.561785] logitech-djreceiver 0003:046D:C534.0002: hiddev96,hidraw1: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:01:00.0-11/input1
[   10.601569] Bluetooth: hci0: RTL: fw version 0x829a7644
[   10.633053] logitech-djreceiver 0003:046D:C534.0002: device of type eQUAD nano Lite (0x0a) connected on slot 1
[   10.635027] logitech-djreceiver 0003:046D:C534.0002: device of type eQUAD nano Lite (0x0a) connected on slot 2
[   10.635611] input: Logitech Wireless Keyboard PID:4075 Keyboard as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/0003:046D:4075.0003/input/input16
[   10.638901] hid-generic 0003:046D:4075.0003: input,hidraw2: USB HID v1.11 Keyboard [Logitech Wireless Keyboard PID:4075] on usb-0000:01:00.0-11/input1:1
[   10.640688] input: Logitech Wireless Mouse PID:4054 Mouse as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/0003:046D:4054.0004/input/input21
[   10.641990] hid-generic 0003:046D:4054.0004: input,hidraw3: USB HID v1.11 Mouse [Logitech Wireless Mouse PID:4054] on usb-0000:01:00.0-11/input1:2
[   10.688794] mousedev: PS/2 mouse device common for all mice
[   10.918080] input: Logitech Wireless Keyboard PID:4075 as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/0003:046D:4075.0003/input/input25
[   10.923263] logitech-hidpp-device 0003:046D:4075.0003: input,hidraw2: USB HID v1.11 Keyboard [Logitech Wireless Keyboard PID:4075] on usb-0000:01:00.0-11/input1:1
[   10.933008] rtw_8821ce 0000:09:00.0: start vif 74:12:b3:a0:4a:cb on port 0
[   10.981496] input: Logitech Wireless Mouse as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/0003:046D:4054.0004/input/input26
[   10.983168] logitech-hidpp-device 0003:046D:4054.0004: input,hidraw3: USB HID v1.11 Mouse [Logitech Wireless Mouse] on usb-0000:01:00.0-11/input1:2
[   11.004242] Generic FE-GE Realtek PHY r8169-a00:00: attached PHY driver (mii_bus:phy_addr=r8169-a00:00, irq=MAC)
[   11.174788] r8169 0000:0a:00.0 enp10s0: Link is Down
[   14.177070] r8169 0000:0a:00.0 enp10s0: Link is Up - 1Gbps/Full - flow control rx/tx
[   14.177144] IPv6: ADDRCONF(NETDEV_CHANGE): enp10s0: link becomes ready
[   15.422075] kauditd_printk_skb: 28 callbacks suppressed
[   15.422088] audit: type=1131 audit(1625291568.246:40): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   21.356047] audit: type=1101 audit(1625291574.179:41): pid=416 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:accounting grantors=pam_access,pam_unix,pam_permit,pam_time acct="nathan" exe="/usr/bin/sshd" hostname=192.168.4.54 addr=192.168.4.54 terminal=ssh res=success'
[   21.363309] audit: type=1103 audit(1625291574.186:42): pid=416 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:setcred grantors=pam_shells,pam_faillock,pam_permit,pam_env,pam_faillock acct="nathan" exe="/usr/bin/sshd" hostname=192.168.4.54 addr=192.168.4.54 terminal=ssh res=success'
[   21.363633] audit: type=1006 audit(1625291574.186:43): pid=416 uid=0 old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=1 res=1
[   21.363684] audit: type=1300 audit(1625291574.186:43): arch=c000003e syscall=1 success=yes exit=4 a0=3 a1=7ffc39581740 a2=4 a3=3e8 items=0 ppid=373 pid=416 auid=1000 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=1 comm="sshd" exe="/usr/bin/sshd" key=(null)
[   21.363717] audit: type=1327 audit(1625291574.186:43): proctitle=737368643A206E617468616E205B707269765D
[   21.395973] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[   21.432227] audit: type=1130 audit(1625291574.256:44): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=user-runtime-dir@1000 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   21.440727] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[   21.454764] audit: type=1101 audit(1625291574.279:45): pid=419 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:accounting grantors=pam_access,pam_unix,pam_permit,pam_time acct="nathan" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   21.454837] audit: type=1103 audit(1625291574.279:46): pid=419 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:setcred grantors=? acct="nathan" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=failed'
[   21.455123] audit: type=1006 audit(1625291574.279:47): pid=419 uid=0 old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=2 res=1
[   21.455183] audit: type=1300 audit(1625291574.279:47): arch=c000003e syscall=1 success=yes exit=4 a0=9 a1=7ffe190ef1b0 a2=4 a3=3e8 items=0 ppid=1 pid=419 auid=1000 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=2 comm="(systemd)" exe="/usr/lib/systemd/systemd" key=(null)
[   21.465054] systemd-journald[265]: Journal effective settings seal=yes keyed_hash=yes compress=yes compress_threshold_bytes=512B
[   21.466322] systemd-journald[265]: Fixed min_use=848.1M max_use=4.0G max_size=128.0M min_size=512.0K keep_free=4.0G n_max_files=100
[   21.493502] systemd-journald[265]: Journal effective settings seal=no keyed_hash=yes compress=yes compress_threshold_bytes=512B
[   21.629644] systemd-journald[265]: Successfully sent stream file descriptor to service manager.
[   21.681781] systemd-journald[265]: Data hash table of /var/log/journal/983425690c9a4432866996cdc56b7fd4/system.journal has a fill level at 75.0 (174763 of 233016 items, 109051904 file size, 623 bytes per hash table item), suggesting rotation.
[   21.681842] systemd-journald[265]: /var/log/journal/983425690c9a4432866996cdc56b7fd4/system.journal: Journal header limits reached or header out-of-date, rotating.
[   21.681883] systemd-journald[265]: Rotating...
[   21.684864] systemd-journald[265]: Journal effective settings seal=yes keyed_hash=yes compress=yes compress_threshold_bytes=512B
[   21.692779] systemd-journald[265]: Reserving 333 entries in field hash table.
[   21.693953] systemd-journald[265]: Reserving 233016 entries in data hash table.
[   21.728897] systemd-journald[265]: Reserving 333 entries in field hash table.
[   21.730060] systemd-journald[265]: Reserving 233016 entries in data hash table.
[   21.742082] systemd-journald[265]: Failed to parse UID from file name 'user-1000@a73e8f336cda47d99c78d917f661fa32-00000000000005cf-0005c5f19f949d34.journal', ignoring: Invalid argument
[   21.742154] systemd-journald[265]: Failed to parse UID from file name 'user-1000@2d53deb7d71c4bdb85af714a4c578449-000000000003a0f5-0005c630924d4800.journal', ignoring: Invalid argument
[   21.742209] systemd-journald[265]: Failed to parse UID from file name 'user-1000@2d53deb7d71c4bdb85af714a4c578449-000000000004b76d-0005c630bea3393f.journal', ignoring: Invalid argument
[   21.742267] systemd-journald[265]: Failed to parse UID from file name 'user-1000@2d53deb7d71c4bdb85af714a4c578449-0000000000081997-0005c6314a613b2b.journal', ignoring: Invalid argument
[   21.742342] systemd-journald[265]: Vacuuming...
[   21.752710] systemd-journald[265]: Vacuuming done, freed 0B of archived journals from /var/log/journal/983425690c9a4432866996cdc56b7fd4.
[   21.752772] systemd-journald[265]: Journal effective settings seal=no keyed_hash=yes compress=yes compress_threshold_bytes=512B
[   24.053852] systemd-journald[265]: Compressed data object 628 -> 263 using ZSTD
[   27.567518] kauditd_printk_skb: 11 callbacks suppressed
[   27.567531] audit: type=1100 audit(1625291580.389:56): pid=582 uid=1000 auid=1000 ses=1 msg='op=PAM:authentication grantors=pam_faillock,pam_permit,pam_faillock acct="nathan" exe="/usr/bin/doas" hostname=hp-4300G addr=? terminal=pts/0 res=success'
[   27.571597] audit: type=1101 audit(1625291580.396:57): pid=582 uid=1000 auid=1000 ses=1 msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="nathan" exe="/usr/bin/doas" hostname=hp-4300G addr=? terminal=pts/0 res=success'
[   27.572223] audit: type=1110 audit(1625291580.396:58): pid=582 uid=1000 auid=1000 ses=1 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_faillock acct="root" exe="/usr/bin/doas" hostname=hp-4300G addr=? terminal=pts/0 res=success'
[   27.573162] audit: type=1105 audit(1625291580.396:59): pid=582 uid=1000 auid=1000 ses=1 msg='op=PAM:session_open grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/doas" hostname=hp-4300G addr=? terminal=pts/0 res=success'

--IzhtKCoR/XhZJq5z--
