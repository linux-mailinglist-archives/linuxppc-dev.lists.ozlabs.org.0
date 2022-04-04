Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F31CC4F1553
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 14:57:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KX9mg645dz2xnc
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 22:57:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=170520fj header.b=AaIuI+NV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fujitsu.com (client-ip=85.158.142.1;
 helo=mail1.bemta36.messagelabs.com; envelope-from=alan.robinson@fujitsu.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256
 header.s=170520fj header.b=AaIuI+NV; dkim-atps=neutral
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KX0zJ2KdMz2xfP
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Apr 2022 16:21:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1649053283; i=@fujitsu.com;
 bh=b7vEbVpHlcau47iLeXRDHN/idN8gpdHUoNjZroKIPeE=;
 h=Date:To:Cc:Subject:Message-ID:Reply-To:References:MIME-Version:
 Content-Type:In-Reply-To:From;
 b=AaIuI+NVYBx0pSQjblOU1uOigYvSV6YRIjvJ66Vklj/Ejksf411E887/O2drI5l/Q
 SMZMyGyRF3qkUYgkKGzVhdiGqL6Y/4WVKwpoWtiERltD5l8WYanb/1W7nTf+htR9q8
 l2EKb9PC/E+uGcX7wgAryjzycCyybMmwdSUFjfIhXXYAdynlS9JHmetNa0asK32Xrg
 CzUwHoWPlEjCwUVCaNdh+7KtcfEUi22V9juMg/QzN/L4tqYWqo3mvmyOxYa24UdcW+
 luiOexRQlX/nLZV54FX47w9lftfJhmpUZl9KG6PxCLwmYxMKGrKoyc41A6F2kykIZn
 7fjn8hi79IEIQ==
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-7.tower-528.messagelabs.com: domain of fujitsu.com designates 
 85.158.142.210 as permitted sender) smtp.mailfrom=fujitsu.com; dkim=none 
 (message not signed); dmarc=pass (p=none sp=none adkim=r aspf=r) 
 header.from=fujitsu.com
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSbUxTVxiAe257LxdCyW3RcajotNsSRmzXEpW
 zuC3G8OMOCWN/EMVYb+mF1rUVe9sJYgIbEKRbCRWIirPUiTo+Vmv50AzHJojCBjIJne2Myxxl
 UeYYk2y4NJD10vixf0/Oc97n/fOSQuknhIxkS62sxcwY5USc6J23yCbF3vosrWo5tBaNjHyKo
 YGRQtTt7CXQ7eM1IuRsbxSi9s5hDLm/2Yo+C6ajulPeGHT+7AxAvukfcdTsnCfQ/NE5HNX5eg
 Ead90kUN9CNYEazlQJUXhxGUfX5kM46vRo0KXHUzHoetMAjp54p3G02NOIbYN06JoLo2smlwi
 6y9UFaO/Hjwi6+4s02tdRR9Cu0ffp7rYKujFwAdATJ84Aut+9gNFD81Miuj9YSdB/zfwkoi/2
 +EX0gm9dLrUbN5i1B0r34Xr3nZ+JkqNppfbrf+OVYFFuB7GklDoNYLU/L8o2+MjrAjyLqFfh5
 c6eGJ5XUXI4MzseeY8jhVRHHGweDa+IRCofBm56VlhMpcOq/n5hNPQKPO1fIvgBMfUgFrYufY
 5HRTk89q1DFB2QwNGToRUWUmkwsPwQswMywmvghWWSx1gqD95reJ3/AakUGG5fJHheHcl7zo4
 C/gtBvQFnHUwDkLS80Gx5odnyvOkGwg7wttZiKNZbTYzBqFCrVAq1erNiC1Kkb1IyhxWMkrUp
 Clmz1cJErJI5xClZjlNyZaZCo05pZq0+ELkRHZcJr4Bg/b/KQZBMYvLV4j/sWVppgvaArkzPc
 HqNxWZkuUGQQpJyKG7jncTCFrOlRQZj5NKeakjGy1eJW3kt5koYE2cojqrvwAZZkniHIyIoXu
 ht5mdjT290EqyVJYqBQCCQxpewFpPB+n8/C5JIIE8U5/KVeIPZ+qw+G1mMRRbPjb3LL7Yyz5W
 sEkt4kFTrDmz9faL4cUCyfeK34Jrd/2wPLH/0/f4m77r8sZmFiUF714mpQ84M4j4orKYU3S9X
 iHuTaXpYec7l8idU3G7csGtb3VjRr3szN+l7Lw4Jb5FW55uJKeE+TJh8f1AjzXDiBXez5/w3i
 jyck9iSNzTu+eWOJ2xzbRZNk+vBDt1Jx0PBLnT40kaYXTZ2RV5/1ZSbX6WkajQ7v5y8d3dn7d
 c/pNrOfTA8EH98/RHW7ZUVtanKUzuCexw5Bbmqfc6Y2oOprW6g3fNS8/msrwSqI9kaRagr872
 rt1I+LLgheaIr65NnqC5vXDKfOrZfTcqGg76c1/6sDmXlHCyXDclFnJ5RpwktHPMfZBBxiR4E
 AAA=
X-Env-Sender: Alan.Robinson@fujitsu.com
X-Msg-Ref: server-7.tower-528.messagelabs.com!1649053277!135886!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8161 invoked from network); 4 Apr 2022 06:21:18 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-7.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Apr 2022 06:21:18 -0000
Received: from nera.osd.abg.fsc.net ([172.17.20.8])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with SMTP id 2346Jn5d030109;
 Mon, 4 Apr 2022 07:19:56 +0100
Received: by nera.osd.abg.fsc.net (Postfix, from userid 5004)
 id 1A288174782; Mon,  4 Apr 2022 08:19:46 +0200 (CEST)
Date: Mon, 4 Apr 2022 08:19:46 +0200
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 12/15] swiotlb: provide swiotlb_init variants that remap
 the buffer
Message-ID: <20220404061946.GA1905@ts.fujitsu.com>
Mail-Followup-To: Alan.Robinson@fujitsu.com, Christoph Hellwig <hch@lst.de>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "x86@kernel.org" <x86@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "tboot-devel@lists.sourceforge.net" <tboot-devel@lists.sourceforge.net>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <20220404050559.132378-1-hch@lst.de>
 <67c1784af6f24f3e871ddfb1478e821c@FR3P281MB0843.DEUP281.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67c1784af6f24f3e871ddfb1478e821c@FR3P281MB0843.DEUP281.PROD.OUTLOOK.COM>
X-sent-by-me: robin@sanpedro
User-Agent: Mutt/1.9.3 (2018-01-21)
From: Alan.Robinson@fujitsu.com (Alan Robinson)
X-Mailman-Approved-At: Mon, 04 Apr 2022 22:57:19 +1000
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
Reply-To: Alan.Robinson@fujitsu.com
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "tboot-devel@lists.sourceforge.net" <tboot-devel@lists.sourceforge.net>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw2@infradead.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Juergen Gross <jgross@suse.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,

On Mon, Apr 04, 2022 at 05:05:56AM +0000, Christoph Hellwig wrote:
> From: Christoph Hellwig <hch@lst.de>
> Subject: [PATCH 12/15] swiotlb: provide swiotlb_init variants that remap
>  the buffer
> 
> To shared more code between swiotlb and xen-swiotlb, offer a
> swiotlb_init_remap interface and add a remap callback to
> swiotlb_init_late that will allow Xen to remap the buffer the

s/the buffer//

> buffer without duplicating much of the logic.

Alan

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/x86/pci/sta2x11-fixup.c |  2 +-
>  include/linux/swiotlb.h      |  5 ++++-
>  kernel/dma/swiotlb.c         | 36 +++++++++++++++++++++++++++++++++---
>  3 files changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
> index c7e6faf59a861..7368afc039987 100644
> --- a/arch/x86/pci/sta2x11-fixup.c
> +++ b/arch/x86/pci/sta2x11-fixup.c
> @@ -57,7 +57,7 @@ static void sta2x11_new_instance(struct pci_dev *pdev)
>  		int size = STA2X11_SWIOTLB_SIZE;
>  		/* First instance: register your own swiotlb area */
>  		dev_info(&pdev->dev, "Using SWIOTLB (size %i)\n", size);
> -		if (swiotlb_init_late(size, GFP_DMA))
> +		if (swiotlb_init_late(size, GFP_DMA, NULL))
>  			dev_emerg(&pdev->dev, "init swiotlb failed\n");
>  	}
>  	list_add(&instance->list, &sta2x11_instance_list);
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index ee655f2e4d28b..7b50c82f84ce9 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -36,8 +36,11 @@ struct scatterlist;
>  
>  int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, unsigned int flags);
>  unsigned long swiotlb_size_or_default(void);
> +void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
> +	int (*remap)(void *tlb, unsigned long nslabs));
> +int swiotlb_init_late(size_t size, gfp_t gfp_mask,
> +	int (*remap)(void *tlb, unsigned long nslabs));
>  extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
> -int swiotlb_init_late(size_t size, gfp_t gfp_mask);
>  extern void __init swiotlb_update_mem_attributes(void);
>  
>  phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 119187afc65ec..d5fe8f5e08300 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -256,9 +256,11 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs,
>   * Statically reserve bounce buffer space and initialize bounce buffer data
>   * structures for the software IO TLB used to implement the DMA API.
>   */
> -void __init swiotlb_init(bool addressing_limit, unsigned int flags)
> +void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
> +		int (*remap)(void *tlb, unsigned long nslabs))
>  {
> -	size_t bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
> +	unsigned long nslabs = default_nslabs;
> +	size_t bytes;
>  	void *tlb;
>  
>  	if (!addressing_limit && !swiotlb_force_bounce)
> @@ -271,12 +273,23 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
>  	 * allow to pick a location everywhere for hypervisors with guest
>  	 * memory encryption.
>  	 */
> +retry:
> +	bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
>  	if (flags & SWIOTLB_ANY)
>  		tlb = memblock_alloc(bytes, PAGE_SIZE);
>  	else
>  		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
>  	if (!tlb)
>  		goto fail;
> +	if (remap && remap(tlb, nslabs) < 0) {
> +		memblock_free(tlb, PAGE_ALIGN(bytes));
> +
> +		nslabs = ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
> +		if (nslabs < IO_TLB_MIN_SLABS)
> +			panic("%s: Failed to remap %zu bytes\n",
> +			      __func__, bytes);
> +		goto retry;
> +	}
>  	if (swiotlb_init_with_tbl(tlb, default_nslabs, flags))
>  		goto fail_free_mem;
>  	return;
> @@ -287,12 +300,18 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
>  	pr_warn("Cannot allocate buffer");
>  }
>  
> +void __init swiotlb_init(bool addressing_limit, unsigned int flags)
> +{
> +	return swiotlb_init_remap(addressing_limit, flags, NULL);
> +}
> +
>  /*
>   * Systems with larger DMA zones (those that don't support ISA) can
>   * initialize the swiotlb later using the slab allocator if needed.
>   * This should be just like above, but with some error catching.
>   */
> -int swiotlb_init_late(size_t size, gfp_t gfp_mask)
> +int swiotlb_init_late(size_t size, gfp_t gfp_mask,
> +		int (*remap)(void *tlb, unsigned long nslabs))
>  {
>  	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
>  	unsigned long bytes;
> @@ -303,6 +322,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
>  	if (swiotlb_force_disable)
>  		return 0;
>  
> +retry:
>  	order = get_order(nslabs << IO_TLB_SHIFT);
>  	nslabs = SLABS_PER_PAGE << order;
>  	bytes = nslabs << IO_TLB_SHIFT;
> @@ -323,6 +343,16 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
>  			(PAGE_SIZE << order) >> 20);
>  		nslabs = SLABS_PER_PAGE << order;
>  	}
> +	if (remap)
> +		rc = remap(vstart, nslabs);
> +	if (rc) {
> +		free_pages((unsigned long)vstart, order);
> + 
> +		nslabs = ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
> +		if (nslabs < IO_TLB_MIN_SLABS)
> +			return rc;
> +		goto retry;
> +	}
>  	rc = swiotlb_late_init_with_tbl(vstart, nslabs);
>  	if (rc)
>  		free_pages((unsigned long)vstart, order);
> -- 
> 2.30.2
> 
