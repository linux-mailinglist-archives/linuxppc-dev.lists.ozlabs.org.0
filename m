Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3DE1055A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 16:31:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Jk784gLQzDr8L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 02:31:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Jk1s53zMzDqDB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 02:26:57 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9128268BFE; Thu, 21 Nov 2019 16:26:50 +0100 (CET)
Date: Thu, 21 Nov 2019 16:26:50 +0100
From: Christoph Hellwig <hch@lst.de>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v2] dma-mapping: treat dev->bus_dma_mask as a DMA limit
Message-ID: <20191121152650.GA651@lst.de>
References: <20191121092646.8449-1-nsaenzjulienne@suse.de>
 <20191121152457.GA525@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191121152457.GA525@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
 Paul Mackerras <paulus@samba.org>, Hanjun Guo <guohanjun@huawei.com>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Burton <paulburton@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, James Hogan <jhogan@kernel.org>,
 Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, iommu@lists.linux-foundation.org,
 Sudeep Holla <sudeep.holla@arm.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 21, 2019 at 04:24:57PM +0100, Christoph Hellwig wrote:
> On Thu, Nov 21, 2019 at 10:26:44AM +0100, Nicolas Saenz Julienne wrote:
> > Using a mask to represent bus DMA constraints has a set of limitations.
> > The biggest one being it can only hold a power of two (minus one). The
> > DMA mapping code is already aware of this and treats dev->bus_dma_mask
> > as a limit. This quirk is already used by some architectures although
> > still rare.
> > 
> > With the introduction of the Raspberry Pi 4 we've found a new contender
> > for the use of bus DMA limits, as its PCIe bus can only address the
> > lower 3GB of memory (of a total of 4GB). This is impossible to represent
> > with a mask. To make things worse the device-tree code rounds non power
> > of two bus DMA limits to the next power of two, which is unacceptable in
> > this case.
> > 
> > In the light of this, rename dev->bus_dma_mask to dev->bus_dma_limit all
> > over the tree and treat it as such. Note that dev->bus_dma_limit should
> > contain the higher accesible DMA address.
> > 
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> 
> I've tentatively added this patch to the dma-mapping tree based on
> Robins principal approval of the last version.  That way tomorrows
> linux-next run should still pick it up.

Actually.  This doesn't apply because the dma-mapping tree doesn't
have you zone_dma_bits change.  I guess we'll need to wait for the
next merge window, or maybe post rc1 if this happens to fix the
powerpc problem that Christian reported.
