Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B77102C20FE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 10:19:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgJPy4gPjzDqWf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 20:19:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgJMh2tFyzDqNn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 20:17:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=TLAvajNWCtLYQc6h362LPCaUkCwaOPXBmH7kXtBxK1A=; b=JGVMTeen3uaW8IT02uuOx9oKIL
 GLXvsHiTJc2zmxAvVvzk5qxlHjVsXOOGV3gtWwVnAvM53uFTiG+3DU1ir/d7ajBG3RoSMXweMOUAn
 9W78x4tiaOc1HabFl+90U7zdVh1oi/W1Fc3EZZiOQWXgKs0HQK5j7kaDh4DbCmJNcSHh3QxT9CrIm
 R2OGQfijeOw+QV8hPZfa+9ZUpChHCCt53q237m1UwRmG7IOcI9zvOB/HurEBPPDch5dHtY6uyF6Bl
 gM4XiW18LRVbjdIb1ldoixi2REh2qSJqdasSHA0Ld9dpvDHJVPEcCPIENhByEvZlRoty36MDrZUol
 vLtAqwqg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1khUSA-0006rp-IB; Tue, 24 Nov 2020 09:17:38 +0000
Date: Tue, 24 Nov 2020 09:17:38 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Christophe Lombard <clombard@linux.vnet.ibm.com>
Subject: Re: [PATCH V2 4/5] ocxl: Add mmu notifier
Message-ID: <20201124091738.GA26078@infradead.org>
References: <20201120173241.59229-1-clombard@linux.vnet.ibm.com>
 <20201120173241.59229-5-clombard@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120173241.59229-5-clombard@linux.vnet.ibm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linuxppc-dev@lists.ozlabs.org, ajd@linux.ibm.com,
 fbarrat@linux.vnet.ibm.com, Jason Gunthorpe <jgg@nvidia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

You probably want to add Jason for an audit of new notifier uses.

On Fri, Nov 20, 2020 at 06:32:40PM +0100, Christophe Lombard wrote:
> Add invalidate_range mmu notifier, when required (ATSD access of MMIO
> registers is available), to initiate TLB invalidation commands.
> For the time being, the ATSD0 set of registers is used by default.
> 
> The pasid and bdf values have to be configured in the Process Element
> Entry.
> The PEE must be set up to match the BDF/PASID of the AFU.
> 
> Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
> ---
>  drivers/misc/ocxl/link.c | 58 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
> index 20444db8a2bb..100bdfe9ec37 100644
> --- a/drivers/misc/ocxl/link.c
> +++ b/drivers/misc/ocxl/link.c
> @@ -2,8 +2,10 @@
>  // Copyright 2017 IBM Corp.
>  #include <linux/sched/mm.h>
>  #include <linux/mutex.h>
> +#include <linux/mm.h>
>  #include <linux/mm_types.h>
>  #include <linux/mmu_context.h>
> +#include <linux/mmu_notifier.h>
>  #include <asm/copro.h>
>  #include <asm/pnv-ocxl.h>
>  #include <asm/xive.h>
> @@ -33,6 +35,7 @@
>  
>  #define SPA_PE_VALID		0x80000000
>  
> +struct ocxl_link;
>  
>  struct pe_data {
>  	struct mm_struct *mm;
> @@ -41,6 +44,8 @@ struct pe_data {
>  	/* opaque pointer to be passed to the above callback */
>  	void *xsl_err_data;
>  	struct rcu_head rcu;
> +	struct ocxl_link *link;
> +	struct mmu_notifier mmu_notifier;
>  };
>  
>  struct spa {
> @@ -83,6 +88,8 @@ struct ocxl_link {
>  	int domain;
>  	int bus;
>  	int dev;
> +	void __iomem *arva;     /* ATSD register virtual address */
> +	spinlock_t atsd_lock;   /* to serialize shootdowns */
>  	atomic_t irq_available;
>  	struct spa *spa;
>  	void *platform_data;
> @@ -403,6 +410,11 @@ static int alloc_link(struct pci_dev *dev, int PE_mask, struct ocxl_link **out_l
>  	if (rc)
>  		goto err_xsl_irq;
>  
> +	rc = pnv_ocxl_map_lpar(dev, mfspr(SPRN_LPID), 0,
> +					  &link->arva);
> +	if (!rc)
> +		spin_lock_init(&link->atsd_lock);
> +
>  	*out_link = link;
>  	return 0;
>  
> @@ -454,6 +466,11 @@ static void release_xsl(struct kref *ref)
>  {
>  	struct ocxl_link *link = container_of(ref, struct ocxl_link, ref);
>  
> +	if (link->arva) {
> +		pnv_ocxl_unmap_lpar(&link->arva);
> +		link->arva = NULL;
> +	}
> +
>  	list_del(&link->list);
>  	/* call platform code before releasing data */
>  	pnv_ocxl_spa_release(link->platform_data);
> @@ -470,6 +487,26 @@ void ocxl_link_release(struct pci_dev *dev, void *link_handle)
>  }
>  EXPORT_SYMBOL_GPL(ocxl_link_release);
>  
> +static void invalidate_range(struct mmu_notifier *mn,
> +			     struct mm_struct *mm,
> +			     unsigned long start, unsigned long end)
> +{
> +	struct pe_data *pe_data = container_of(mn, struct pe_data, mmu_notifier);
> +	struct ocxl_link *link = pe_data->link;
> +	unsigned long addr, pid, page_size = PAGE_SIZE;
> +
> +	pid = mm->context.id;
> +
> +	spin_lock(&link->atsd_lock);
> +	for (addr = start; addr < end; addr += page_size)
> +		pnv_ocxl_tlb_invalidate(&link->arva, pid, addr);
> +	spin_unlock(&link->atsd_lock);
> +}
> +
> +static const struct mmu_notifier_ops ocxl_mmu_notifier_ops = {
> +	.invalidate_range = invalidate_range,
> +};
> +
>  static u64 calculate_cfg_state(bool kernel)
>  {
>  	u64 state;
> @@ -526,6 +563,8 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>  	pe_data->mm = mm;
>  	pe_data->xsl_err_cb = xsl_err_cb;
>  	pe_data->xsl_err_data = xsl_err_data;
> +	pe_data->link = link;
> +	pe_data->mmu_notifier.ops = &ocxl_mmu_notifier_ops;
>  
>  	memset(pe, 0, sizeof(struct ocxl_process_element));
>  	pe->config_state = cpu_to_be64(calculate_cfg_state(pidr == 0));
> @@ -542,8 +581,16 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>  	 * by the nest MMU. If we have a kernel context, TLBIs are
>  	 * already global.
>  	 */
> -	if (mm)
> +	if (mm) {
>  		mm_context_add_copro(mm);
> +		if (link->arva) {
> +			/* Use MMIO registers for the TLB Invalidate
> +			 * operations.
> +			 */
> +			mmu_notifier_register(&pe_data->mmu_notifier, mm);
> +		}
> +	}
> +
>  	/*
>  	 * Barrier is to make sure PE is visible in the SPA before it
>  	 * is used by the device. It also helps with the global TLBI
> @@ -674,6 +721,15 @@ int ocxl_link_remove_pe(void *link_handle, int pasid)
>  		WARN(1, "Couldn't find pe data when removing PE\n");
>  	} else {
>  		if (pe_data->mm) {
> +			if (link->arva) {
> +				mmu_notifier_unregister(&pe_data->mmu_notifier,
> +							pe_data->mm);
> +				spin_lock(&link->atsd_lock);
> +				pnv_ocxl_tlb_invalidate(&link->arva,
> +							pe_data->mm->context.id,
> +							0ull);
> +				spin_unlock(&link->atsd_lock);
> +			}
>  			mm_context_remove_copro(pe_data->mm);
>  			mmdrop(pe_data->mm);
>  		}
> -- 
> 2.28.0
> 
---end quoted text---
