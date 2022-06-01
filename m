Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B8C53ACEE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 20:40:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCydV0jpMz3c7N
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 04:40:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SV4cmB3M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SV4cmB3M;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCycp5rlyz3blF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 04:40:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B8B8761684;
	Wed,  1 Jun 2022 18:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E30C385B8;
	Wed,  1 Jun 2022 18:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654108806;
	bh=vpZ1oNTlay8NWlxGY9rUMzeRkjnKLNWUB5LHGYBDV9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SV4cmB3MpgVr8rN3mq/AgsHnJ59ZjgcffarURyAfkAdkEzNpXND21AvmUXs/TCSKG
	 JN6Kln9Qh2fKKoNGqhtzaeN3GVMD5O+WlHNEGZq1+TVFKTgXvUeTxpOC2opw2jzy3M
	 bzs+i28vGY/FzwHvhAo/7MfauYLqirVh5qrYbf/9uggvCsKOW9dGOrTbtu8Bly2ogq
	 gdOF0hMn+j3+XeZkNnzwCZiw7gyMKIj6V8TC3bRb8s5c+amjSWyv+xMo80ucbbrM+M
	 K8Ccnhjy4g9orAMgOh/NR3ZQR6ir+xGwf35PRNSGyFHOR15Ppn2g/2bRwSBc69z3WO
	 cpjY5uJWVEvrQ==
Date: Wed, 1 Jun 2022 11:40:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/15] swiotlb: make the swiotlb_init interface more
 useful
Message-ID: <Ypeyg2Dm/WfoKDZt@dev-arch.thelio-3990X>
References: <20220404050559.132378-1-hch@lst.de>
 <20220404050559.132378-10-hch@lst.de>
 <YpehC7BwBlnuxplF@dev-arch.thelio-3990X>
 <20220601173441.GB27582@lst.de>
 <YpemDuzdoaO3rijX@Ryzen-9-3900X.>
 <20220601175743.GA28082@lst.de>
 <Yper7agk7XfCCQNa@dev-arch.thelio-3990X>
 <20220601182141.GA28309@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601182141.GA28309@lst.de>
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Joerg Roedel <joro@8bytes.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, tboot-devel@lists.sourceforge.net, xen-devel@lists.xenproject.org, David Woodhouse <dwmw2@infradead.org>, Tom Lendacky <thomas.lendacky@amd.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 01, 2022 at 08:21:41PM +0200, Christoph Hellwig wrote:
> On Wed, Jun 01, 2022 at 11:11:57AM -0700, Nathan Chancellor wrote:
> > On Wed, Jun 01, 2022 at 07:57:43PM +0200, Christoph Hellwig wrote:
> > > On Wed, Jun 01, 2022 at 10:46:54AM -0700, Nathan Chancellor wrote:
> > > > On Wed, Jun 01, 2022 at 07:34:41PM +0200, Christoph Hellwig wrote:
> > > > > Can you send me the full dmesg and the content of
> > > > > /sys/kernel/debug/swiotlb/io_tlb_nslabs for a good and a bad boot?
> > > > 
> > > > Sure thing, they are attached! If there is anything else I can provide
> > > > or test, I am more than happy to do so.
> > > 
> > > Nothing interesting.  But the performance numbers almost look like
> > > swiotlb=force got ignored before (even if I can't explain why).
> > 
> > I was able to get my performance back with this diff but I don't know if
> > this is a hack or a proper fix in the context of the series.
> 
> This looks good, but needs a little tweak.  I'd go for this variant of
> it:

Tested-by: Nathan Chancellor <nathan@kernel.org>

Thanks a lot for the quick fix!

> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index dfa1de89dc944..cb50f8d383606 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -192,7 +192,7 @@ void __init swiotlb_update_mem_attributes(void)
>  }
>  
>  static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
> -				    unsigned long nslabs, bool late_alloc)
> +		unsigned long nslabs, unsigned int flags, bool late_alloc)
>  {
>  	void *vaddr = phys_to_virt(start);
>  	unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
> @@ -203,8 +203,7 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
>  	mem->index = 0;
>  	mem->late_alloc = late_alloc;
>  
> -	if (swiotlb_force_bounce)
> -		mem->force_bounce = true;
> +	mem->force_bounce = swiotlb_force_bounce || (flags & SWIOTLB_FORCE);
>  
>  	spin_lock_init(&mem->lock);
>  	for (i = 0; i < mem->nslabs; i++) {
> @@ -275,8 +274,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
>  		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
>  		      __func__, alloc_size, PAGE_SIZE);
>  
> -	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
> -	mem->force_bounce = flags & SWIOTLB_FORCE;
> +	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, flags, false);
>  
>  	if (flags & SWIOTLB_VERBOSE)
>  		swiotlb_print_info();
> @@ -348,7 +346,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  
>  	set_memory_decrypted((unsigned long)vstart,
>  			     (nslabs << IO_TLB_SHIFT) >> PAGE_SHIFT);
> -	swiotlb_init_io_tlb_mem(mem, virt_to_phys(vstart), nslabs, true);
> +	swiotlb_init_io_tlb_mem(mem, virt_to_phys(vstart), nslabs, 0, true);
>  
>  	swiotlb_print_info();
>  	return 0;
> @@ -835,8 +833,8 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
>  
>  		set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
>  				     rmem->size >> PAGE_SHIFT);
> -		swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false);
> -		mem->force_bounce = true;
> +		swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, SWIOTLB_FORCE,
> +				false);
>  		mem->for_alloc = true;
>  
>  		rmem->priv = mem;
> 

Cheers,
Nathan
