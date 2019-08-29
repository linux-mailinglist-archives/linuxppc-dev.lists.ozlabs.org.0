Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EDAA13F6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 10:40:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JwzK3jYwzDqTw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 18:40:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jwx63jNrzDqLb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 18:38:16 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5996268B20; Thu, 29 Aug 2019 10:38:10 +0200 (CEST)
Date: Thu, 29 Aug 2019 10:38:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v7 1/7] kvmppc: Driver to manage pages of secure guest
Message-ID: <20190829083810.GA13039@lst.de>
References: <20190822102620.21897-1-bharata@linux.ibm.com>
 <20190822102620.21897-2-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822102620.21897-2-bharata@linux.ibm.com>
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 22, 2019 at 03:56:14PM +0530, Bharata B Rao wrote:
> +/*
> + * Bits 60:56 in the rmap entry will be used to identify the
> + * different uses/functions of rmap.
> + */
> +#define KVMPPC_RMAP_DEVM_PFN	(0x2ULL << 56)

How did you come up with this specific value?

> +
> +static inline bool kvmppc_rmap_is_devm_pfn(unsigned long pfn)
> +{
> +	return !!(pfn & KVMPPC_RMAP_DEVM_PFN);
> +}

No need for !! when returning a bool.  Also the helper seems a little
pointless, just opencoding it would make the code more readable in my
opinion.

> +#ifdef CONFIG_PPC_UV
> +extern int kvmppc_devm_init(void);
> +extern void kvmppc_devm_free(void);

There is no need for extern in a function declaration.

> +static int
> +kvmppc_devm_migrate_alloc_and_copy(struct migrate_vma *mig,
> +				   unsigned long *rmap, unsigned long gpa,
> +				   unsigned int lpid, unsigned long page_shift)
> +{
> +	struct page *spage = migrate_pfn_to_page(*mig->src);
> +	unsigned long pfn = *mig->src >> MIGRATE_PFN_SHIFT;
> +	struct page *dpage;
> +
> +	*mig->dst = 0;
> +	if (!spage || !(*mig->src & MIGRATE_PFN_MIGRATE))
> +		return 0;
> +
> +	dpage = kvmppc_devm_get_page(rmap, gpa, lpid);
> +	if (!dpage)
> +		return -EINVAL;
> +
> +	if (spage)
> +		uv_page_in(lpid, pfn << page_shift, gpa, 0, page_shift);
> +
> +	*mig->dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> +	return 0;
> +}

I think you can just merge this trivial helper into the only caller.

> +static int
> +kvmppc_devm_fault_migrate_alloc_and_copy(struct migrate_vma *mig,
> +					 unsigned long page_shift)
> +{
> +	struct page *dpage, *spage;
> +	struct kvmppc_devm_page_pvt *pvt;
> +	unsigned long pfn;
> +	int ret;
> +
> +	spage = migrate_pfn_to_page(*mig->src);
> +	if (!spage || !(*mig->src & MIGRATE_PFN_MIGRATE))
> +		return 0;
> +	if (!is_zone_device_page(spage))
> +		return 0;
> +
> +	dpage = alloc_page_vma(GFP_HIGHUSER, mig->vma, mig->start);
> +	if (!dpage)
> +		return -EINVAL;
> +	lock_page(dpage);
> +	pvt = spage->zone_device_data;
> +
> +	pfn = page_to_pfn(dpage);
> +	ret = uv_page_out(pvt->lpid, pfn << page_shift, pvt->gpa, 0,
> +			  page_shift);
> +	if (ret == U_SUCCESS)
> +		*mig->dst = migrate_pfn(pfn) | MIGRATE_PFN_LOCKED;
> +	else {
> +		unlock_page(dpage);
> +		__free_page(dpage);
> +	}
> +	return ret;
> +}

Here we actually have two callers, but they have a fair amount of
duplicate code in them.  I think you want to move that common
code (including setting up the migrate_vma structure) into this
function and maybe also give it a more descriptive name.

> +static void kvmppc_devm_page_free(struct page *page)
> +{
> +	unsigned long pfn = page_to_pfn(page);
> +	unsigned long flags;
> +	struct kvmppc_devm_page_pvt *pvt;
> +
> +	spin_lock_irqsave(&kvmppc_devm_pfn_lock, flags);
> +	pvt = page->zone_device_data;
> +	page->zone_device_data = NULL;
> +
> +	bitmap_clear(kvmppc_devm_pfn_bitmap,
> +		     pfn - (kvmppc_devm_pgmap.res.start >> PAGE_SHIFT), 1);

Nit: I'd just initialize pfn to the value you want from the start.
That makes the code a little easier to read, and keeps a tiny bit more
code outside the spinlock.

	unsigned long pfn = page_to_pfn(page) -
			(kvmppc_devm_pgmap.res.start >> PAGE_SHIFT);

	..

	 bitmap_clear(kvmppc_devm_pfn_bitmap, pfn, 1);


> +	kvmppc_devm_pgmap.type = MEMORY_DEVICE_PRIVATE;
> +	kvmppc_devm_pgmap.res = *res;
> +	kvmppc_devm_pgmap.ops = &kvmppc_devm_ops;
> +	addr = memremap_pages(&kvmppc_devm_pgmap, -1);

This -1 should be NUMA_NO_NODE for clarity.
