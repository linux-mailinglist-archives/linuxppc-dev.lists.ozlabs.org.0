Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1F010563E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 16:58:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Jkjk4DmXzDr9L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 02:58:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 47JkgB5rtTzDr6S
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 02:55:47 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD340328;
 Thu, 21 Nov 2019 07:55:44 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 841A33F52E;
 Thu, 21 Nov 2019 07:55:40 -0800 (PST)
Subject: Re: [PATCH v2] dma-mapping: treat dev->bus_dma_mask as a DMA limit
To: Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
References: <20191121092646.8449-1-nsaenzjulienne@suse.de>
 <20191121152457.GA525@lst.de> <20191121152650.GA651@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <70359d2a-10c6-09c7-a857-805085affb0a@arm.com>
Date: Thu, 21 Nov 2019 15:55:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191121152650.GA651@lst.de>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Paul Burton <paulburton@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 James Hogan <jhogan@kernel.org>, Len Brown <lenb@kernel.org>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Hanjun Guo <guohanjun@huawei.com>,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 iommu@lists.linux-foundation.org, Sudeep Holla <sudeep.holla@arm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21/11/2019 3:26 pm, Christoph Hellwig wrote:
> On Thu, Nov 21, 2019 at 04:24:57PM +0100, Christoph Hellwig wrote:
>> On Thu, Nov 21, 2019 at 10:26:44AM +0100, Nicolas Saenz Julienne wrote:
>>> Using a mask to represent bus DMA constraints has a set of limitations.
>>> The biggest one being it can only hold a power of two (minus one). The
>>> DMA mapping code is already aware of this and treats dev->bus_dma_mask
>>> as a limit. This quirk is already used by some architectures although
>>> still rare.
>>>
>>> With the introduction of the Raspberry Pi 4 we've found a new contender
>>> for the use of bus DMA limits, as its PCIe bus can only address the
>>> lower 3GB of memory (of a total of 4GB). This is impossible to represent
>>> with a mask. To make things worse the device-tree code rounds non power
>>> of two bus DMA limits to the next power of two, which is unacceptable in
>>> this case.
>>>
>>> In the light of this, rename dev->bus_dma_mask to dev->bus_dma_limit all
>>> over the tree and treat it as such. Note that dev->bus_dma_limit should
>>> contain the higher accesible DMA address.
>>>
>>> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>>
>> I've tentatively added this patch to the dma-mapping tree based on
>> Robins principal approval of the last version.  That way tomorrows
>> linux-next run should still pick it up.
> 
> Actually.  This doesn't apply because the dma-mapping tree doesn't
> have you zone_dma_bits change.  I guess we'll need to wait for the
> next merge window, or maybe post rc1 if this happens to fix the
> powerpc problem that Christian reported.

Hmm, there's no functional dependency though, is there? AFAICS it's 
essentially just a context conflict. Is it worth simply dropping (or 
postponing) the local renaming in __dma_direct_optimal_gfp_mask(), or 
perhaps even cross-merging arm64/for-next/zone-dma into dma/for-next?

Robin.
