Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5343BA2A6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 17:14:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGdsg1x81z306D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jul 2021 01:14:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GGdsF3HL5z2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Jul 2021 01:14:06 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26FB4D6E;
 Fri,  2 Jul 2021 08:14:02 -0700 (PDT)
Received: from [10.57.40.45] (unknown [10.57.40.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A13EA3F5A1;
 Fri,  2 Jul 2021 08:13:54 -0700 (PDT)
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
To: Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-7-tientzu@chromium.org>
 <YNvMDFWKXSm4LRfZ@Ryzen-9-3900X.localdomain>
 <CALiNf2-a-haQN0-4+gX8+wa++52-0CnO2O4BEkxrQCxoTa_47w@mail.gmail.com>
 <20210630114348.GA8383@willie-the-truck>
 <YNyUQwiagNeZ9YeJ@Ryzen-9-3900X.localdomain>
 <20210701074045.GA9436@willie-the-truck>
 <ea28db1f-846e-4f0a-4f13-beb67e66bbca@kernel.org>
 <20210702135856.GB11132@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
Date: Fri, 2 Jul 2021 16:13:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702135856.GB11132@willie-the-truck>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
 Dan Williams <dan.j.williams@intel.com>, jani.nikula@linux.intel.com,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Claire Chang <tientzu@chromium.org>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Qian Cai <quic_qiancai@quicinc.com>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Tom Lendacky <thomas.lendacky@amd.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-07-02 14:58, Will Deacon wrote:
> Hi Nathan,
> 
> On Thu, Jul 01, 2021 at 12:52:20AM -0700, Nathan Chancellor wrote:
>> On 7/1/2021 12:40 AM, Will Deacon wrote:
>>> On Wed, Jun 30, 2021 at 08:56:51AM -0700, Nathan Chancellor wrote:
>>>> On Wed, Jun 30, 2021 at 12:43:48PM +0100, Will Deacon wrote:
>>>>> On Wed, Jun 30, 2021 at 05:17:27PM +0800, Claire Chang wrote:
>>>>>> `BUG: unable to handle page fault for address: 00000000003a8290` and
>>>>>> the fact it crashed at `_raw_spin_lock_irqsave` look like the memory
>>>>>> (maybe dev->dma_io_tlb_mem) was corrupted?
>>>>>> The dev->dma_io_tlb_mem should be set here
>>>>>> (https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pci/probe.c#n2528)
>>>>>> through device_initialize.
>>>>>
>>>>> I'm less sure about this. 'dma_io_tlb_mem' should be pointing at
>>>>> 'io_tlb_default_mem', which is a page-aligned allocation from memblock.
>>>>> The spinlock is at offset 0x24 in that structure, and looking at the
>>>>> register dump from the crash:
>>>>>
>>>>> Jun 29 18:28:42 hp-4300G kernel: RSP: 0018:ffffadb4013db9e8 EFLAGS: 00010006
>>>>> Jun 29 18:28:42 hp-4300G kernel: RAX: 00000000003a8290 RBX: 0000000000000000 RCX: ffff8900572ad580
>>>>> Jun 29 18:28:42 hp-4300G kernel: RDX: ffff89005653f024 RSI: 00000000000c0000 RDI: 0000000000001d17
>>>>> Jun 29 18:28:42 hp-4300G kernel: RBP: 000000000a20d000 R08: 00000000000c0000 R09: 0000000000000000
>>>>> Jun 29 18:28:42 hp-4300G kernel: R10: 000000000a20d000 R11: ffff89005653f000 R12: 0000000000000212
>>>>> Jun 29 18:28:42 hp-4300G kernel: R13: 0000000000001000 R14: 0000000000000002 R15: 0000000000200000
>>>>> Jun 29 18:28:42 hp-4300G kernel: FS:  00007f1f8898ea40(0000) GS:ffff890057280000(0000) knlGS:0000000000000000
>>>>> Jun 29 18:28:42 hp-4300G kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>> Jun 29 18:28:42 hp-4300G kernel: CR2: 00000000003a8290 CR3: 00000001020d0000 CR4: 0000000000350ee0
>>>>> Jun 29 18:28:42 hp-4300G kernel: Call Trace:
>>>>> Jun 29 18:28:42 hp-4300G kernel:  _raw_spin_lock_irqsave+0x39/0x50
>>>>> Jun 29 18:28:42 hp-4300G kernel:  swiotlb_tbl_map_single+0x12b/0x4c0
>>>>>
>>>>> Then that correlates with R11 holding the 'dma_io_tlb_mem' pointer and
>>>>> RDX pointing at the spinlock. Yet RAX is holding junk :/
>>>>>
>>>>> I agree that enabling KASAN would be a good idea, but I also think we
>>>>> probably need to get some more information out of swiotlb_tbl_map_single()
>>>>> to see see what exactly is going wrong in there.
>>>>
>>>> I can certainly enable KASAN and if there is any debug print I can add
>>>> or dump anything, let me know!
>>>
>>> I bit the bullet and took v5.13 with swiotlb/for-linus-5.14 merged in, built
>>> x86 defconfig and ran it on my laptop. However, it seems to work fine!
>>>
>>> Please can you share your .config?
>>
>> Sure thing, it is attached. It is just Arch Linux's config run through
>> olddefconfig. The original is below in case you need to diff it.
>>
>> https://raw.githubusercontent.com/archlinux/svntogit-packages/9045405dc835527164f3034b3ceb9a67c7a53cd4/trunk/config
>>
>> If there is anything more that I can provide, please let me know.
> 
> I eventually got this booting (for some reason it was causing LD to SEGV
> trying to link it for a while...) and sadly it works fine on my laptop. Hmm.
> 
> Did you manage to try again with KASAN?
> 
> It might also be worth taking the IOMMU out of the equation, since that
> interfaces differently with SWIOTLB and I couldn't figure out the code path
> from the log you provided. What happens if you boot with "amd_iommu=off
> swiotlb=force"?

Oh, now there's a thing... the chat from the IOMMU API in the boot log 
implies that the IOMMU *should* be in the picture - we see that default 
domains are IOMMU_DOMAIN_DMA default and the GPU 0000:0c:00.0 was added 
to a group. That means dev->dma_ops should be set and DMA API calls 
should be going through iommu-dma, yet the callstack in the crash says 
we've gone straight from dma_map_page_attrs() to swiotlb_map(), implying 
the inline dma_direct_map_page() path.

If dev->dma_ops didn't look right in the first place, it's perhaps less 
surprising that dev->dma_io_tlb_mem might be wild as well. It doesn't 
seem plausible that we should have a race between initialising the 
device and probing its driver, so maybe the whole dev pointer is getting 
trampled earlier in the callchain (or is fundamentally wrong to begin 
with, but from a quick skim of the amdgpu code it did look like 
adev->dev and adev->pdev are appropriately set early on by 
amdgpu_pci_probe()).

> (although word of warning here: i915 dies horribly on my laptop if I pass
> swiotlb=force, even with the distro 5.10 kernel)

FWIW I'd imagine you probably need to massively increase the SWIOTLB 
buffer size to have hope of that working.

Robin.
