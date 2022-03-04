Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0894CE0F0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Mar 2022 00:23:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K9P6z0Q5tz30jZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Mar 2022 10:23:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rQAjzobs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=sstabellini@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rQAjzobs; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K9P6F53Vgz30Dh
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Mar 2022 10:23:01 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2E4BBB82B66;
 Fri,  4 Mar 2022 23:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31A5C340E9;
 Fri,  4 Mar 2022 23:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646436175;
 bh=JGCldX7FEWqVZ5Q+U58HuEVwslrSLhbhnML6kEBr9Ws=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=rQAjzobsYiAs9wsfWE2rkUFtA1eVSkOA2Iav4ks0CqW9RP+ItlZh454EggaFHA0t7
 cMuMuy/be5qJ5PPtyG/1I9k0vG8LWuC0s+fh9P52rFCGl1J82aaAj6ulLeOz4jBEd+
 Nd/6EoXUpXBY6u39E8iSHqihbbZHokm82wpl1YjLkM0+9H+801fikQc/d+uXwGJnhl
 XBKYJYaojo34JXtttn23IyibunqEvz4QH2Jr0xJKJVWlwM1v3PugwJccgZI7srIP8x
 7QO2Nby/+u0TkfMtRQBDDfBlWCbEwfvoCjXrEBxdGWWN5TvTd9q9BnIh/lHE9wt82J
 YB5glRBbksGuA==
Date: Fri, 4 Mar 2022 15:22:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
In-Reply-To: <20220304163430.GA12317@lst.de>
Message-ID: <alpine.DEB.2.22.394.2203041511090.3261@ubuntu-linux-20-04-desktop>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
 <20220302081500.GB23075@lst.de>
 <alpine.DEB.2.22.394.2203021709470.3261@ubuntu-linux-20-04-desktop>
 <20220303105931.GA15137@lst.de>
 <alpine.DEB.2.22.394.2203031447120.3261@ubuntu-linux-20-04-desktop>
 <20220304163430.GA12317@lst.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 tboot-devel@lists.sourceforge.net, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw2@infradead.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 4 Mar 2022, Christoph Hellwig wrote:
> On Thu, Mar 03, 2022 at 02:49:29PM -0800, Stefano Stabellini wrote:
> > On Thu, 3 Mar 2022, Christoph Hellwig wrote:
> > > On Wed, Mar 02, 2022 at 05:25:10PM -0800, Stefano Stabellini wrote:
> > > > Thinking more about it we actually need to drop the xen_initial_domain()
> > > > check otherwise some cases won't be functional (Dom0 not 1:1 mapped, or
> > > > DomU 1:1 mapped).
> > > 
> > > Hmm, but that would be the case even before this series, right?
> > 
> > Before this series we only have the xen_swiotlb_detect() check in
> > xen_mm_init, we don't have a second xen_initial_domain() check.
> > 
> > The issue is that this series is adding one more xen_initial_domain()
> > check in xen_mm_init.
> 
> In current mainline xen_mm_init calls xen_swiotlb_init unconditionally.
> But xen_swiotlb_init then calls xen_swiotlb_fixup after allocating
> the memory, which in turn calls xen_create_contiguous_region.
> xen_create_contiguous_region fails with -EINVAL for the
> !xen_initial_domain() and thus caues xen_swiotlb_fixup and
> xen_swiotlb_init to unwind and return -EINVAL.
> 
> So as far as I can tell there is no change in behavior, but maybe I'm
> missing something subtle?

You are right.

The xen_initial_domain() check in xen_create_contiguous_region() is
wrong and we should get rid of it. It is a leftover from before the
xen_swiotlb_detect rework.

We could either remove it or change it into another xen_swiotlb_detect()
check.

Feel free to add the patch to your series or fold it with another patch
or rework it as you prefer. Thanks for spotting this!

---

arm/xen: don't check for xen_initial_domain() in xen_create_contiguous_region

It used to be that Linux enabled swiotlb-xen when running a dom0 on ARM.
Since f5079a9a2a31 "xen/arm: introduce XENFEAT_direct_mapped and
XENFEAT_not_direct_mapped", Linux detects whether to enable or disable
swiotlb-xen based on the new feature flags: XENFEAT_direct_mapped and
XENFEAT_not_direct_mapped.

However, there is still a leftover xen_initial_domain() check in
xen_create_contiguous_region. Remove the check as
xen_create_contiguous_region is only called by swiotlb-xen during
initialization. If xen_create_contiguous_region is called, we know Linux
is running 1:1 mapped so there is no need for additional checks.

Also update the in-code comment.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>


diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index a7e54a087b80..28c207060253 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -122,10 +122,7 @@ int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
 				 unsigned int address_bits,
 				 dma_addr_t *dma_handle)
 {
-	if (!xen_initial_domain())
-		return -EINVAL;
-
-	/* we assume that dom0 is mapped 1:1 for now */
+	/* the domain is 1:1 mapped to use swiotlb-xen */
 	*dma_handle = pstart;
 	return 0;
 }
