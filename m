Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B204CDB33
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 18:43:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K9FZd5Gs9z3bbw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Mar 2022 04:43:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K9FZF2Hkbz2xsc
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Mar 2022 04:43:16 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 18C7068BEB; Fri,  4 Mar 2022 18:43:09 +0100 (CET)
Date: Fri, 4 Mar 2022 18:43:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Message-ID: <20220304174308.GA13515@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
 <ca748512-12bb-7d75-13f1-8d5ec9703e26@oracle.com>
 <20220304172859.GA12860@lst.de>
 <fc3992a8-896b-f0fc-e500-9010ec085c57@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc3992a8-896b-f0fc-e500-9010ec085c57@oracle.com>
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 tboot-devel@lists.sourceforge.net, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw2@infradead.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 04, 2022 at 12:36:17PM -0500, Boris Ostrovsky wrote:
>>> I bisected it to "x86: remove the IOMMU table infrastructure" but haven't actually looked at the code yet.
>> That looks like the swiotlb buffer did not get initialized at all, but I
>> can't really explain why.
>>
>> Can you stick in a printk and see if xen_swiotlb_init_early gets called
>> at all?
>
>
>
> Actually, that's the only thing I did do so far and yes, it does get called.

So, specifically for "x86: remove the IOMMU table infrastructure" I
think we need the one-liner below so that swiotlb_exit doesn't get called
for the Xen case.  But that should have been fixed up by the next
patch already.

diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index 2ac0ef9c2fb76..1173aa282ab27 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -70,7 +70,7 @@ static void __init pci_xen_swiotlb_init(void)
 	if (!xen_initial_domain() && !x86_swiotlb_enable &&
 	    swiotlb_force != SWIOTLB_FORCE)
 		return;
-	x86_swiotlb_enable = false;
+	x86_swiotlb_enable = true;
 	xen_swiotlb = true;
 	xen_swiotlb_init_early();
 	dma_ops = &xen_swiotlb_dma_ops;
