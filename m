Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F143627BBB8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 06:03:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0m2j02nbzDqRB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 14:03:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=BKBTYpXd; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0lv16YJDzDqRK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 13:56:45 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id t7so1954485pjd.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 20:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GkfifURdpOpHSnDc4nq3My1ZJ1Hm7ApEFLm/Rk890vM=;
 b=BKBTYpXdgql1T0NMDpdph5pGQ/env6tMcsbF6CuOHPczH1FP6boU0gK32byhN6Q3ZC
 hedE33m90QtJVVw6XulNCDDeT2+bzEmHC0IGooH5RdRwJTKk/6SMJUlnQ95ke20kQxx/
 sAIlu3ncNrycv6BTENvE0Q1BVmrnhI0VXIhxwLtOs8oFbP4jBZKe/TjdbNMAVbsS3wzm
 X4jnD4/nRFlLS9beoL3/0wbvAzm4ZzpZWDLYOrESdavxHSduqhhn7vujhNclu5bl4kUk
 k65w9V4+1C/ia9lGfbSrUXJ9eBlHFn2vYVC6QnSk7OgY6VyOHwpUZsALcgbI/jzVm/FC
 Y/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GkfifURdpOpHSnDc4nq3My1ZJ1Hm7ApEFLm/Rk890vM=;
 b=WJQCRFo5xSYD5ivB9qMdajIM6B+vmxDzpF2gFMBUK8imPAuSPG8ByKIDIWQw/UcUpg
 xnC7ZbnwfSLadVGmlnKxUO4A6q3PjS6ilmRCSgpI+NGP7R+JLfKYLTQpPzgo+LoqFD6f
 DCcVx4MSoiMVNS0dRULz1G46WTd8KrCixkXIkW5eJSd7zq8C1oCDJYYrmduNs9AmYr/z
 1AdHo2+NdLem5lEOUF6Gd+o1OTYXEirhiSjRbeO0vAUMNm9cqx7j0i0URYOzKMzscADu
 RErZUy+VoVFjJWQkjrDC28F6TlBy2QNWEWN0NwU42vHX6uY/oXeLarorFO8tdNA8T1x2
 ZFiw==
X-Gm-Message-State: AOAM532JEUuQJG2nceR9yo+ySsm569b8ccWIFKhAwCFxMv45YdXBqaw0
 hS8OPzO8UdyEnNId38g79oHgM4fgWuDRoC0j
X-Google-Smtp-Source: ABdhPJz4TYwiODr+tQBAtaQICtkkIqyac7/trV+lflpmigpiGbv/zyBL9jyJgSAmLbZWAi9bxQ8mEg==
X-Received: by 2002:a17:90a:7bcf:: with SMTP id
 d15mr2088094pjl.230.1601351802480; 
 Mon, 28 Sep 2020 20:56:42 -0700 (PDT)
Received: from [192.168.10.88] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with UTF8SMTPSA id q15sm3084193pgr.27.2020.09.28.20.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2020 20:56:41 -0700 (PDT)
Subject: Re: [PATCH v2 10/14] powerpc/pseries/iommu: Reorganize
 iommu_table_setparms*() with new helper
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-11-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <aecd317f-ba69-5676-ba30-c51cf5d4ed44@ozlabs.ru>
Date: Tue, 29 Sep 2020 13:56:36 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:82.0) Gecko/20100101
 Thunderbird/82.0
MIME-Version: 1.0
In-Reply-To: <20200911170738.82818-11-leobras.c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/09/2020 03:07, Leonardo Bras wrote:
> Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
> 
> Add a new helper _iommu_table_setparms(), and use it in
> iommu_table_setparms() and iommu_table_setparms_lpar() to avoid duplicated
> code.
> 
> Also, setting tbl->it_ops was happening outsite iommu_table_setparms*(),
> so move it to the new helper. Since we need the iommu_table_ops to be
> declared before used, move iommu_table_lpar_multi_ops and
> iommu_table_pseries_ops to before their respective iommu_table_setparms*().
> 
> The tce_exchange_pseries() also had to be moved up, since it's used in
> iommu_table_lpar_multi_ops.xchg_no_kill.


Use forward declarations (preferred) or make a separate patch for moving 
chunks (I do not see much point).


> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>   arch/powerpc/platforms/pseries/iommu.c | 149 ++++++++++++-------------
>   1 file changed, 72 insertions(+), 77 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 510ccb0521af..abd36b257725 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -495,12 +495,62 @@ static int tce_setrange_multi_pSeriesLP(unsigned long start_pfn,
>   	return rc;
>   }
>   
> +#ifdef CONFIG_IOMMU_API
> +static int tce_exchange_pseries(struct iommu_table *tbl, long index, unsigned
> +				long *tce, enum dma_data_direction *direction,
> +				bool realmode)
> +{
> +	long rc;
> +	unsigned long ioba = (unsigned long)index << tbl->it_page_shift;
> +	unsigned long flags, oldtce = 0;
> +	u64 proto_tce = iommu_direction_to_tce_perm(*direction);
> +	unsigned long newtce = *tce | proto_tce;
> +
> +	spin_lock_irqsave(&tbl->large_pool.lock, flags);
> +
> +	rc = plpar_tce_get((u64)tbl->it_index, ioba, &oldtce);
> +	if (!rc)
> +		rc = plpar_tce_put((u64)tbl->it_index, ioba, newtce);
> +
> +	if (!rc) {
> +		*direction = iommu_tce_direction(oldtce);
> +		*tce = oldtce & ~(TCE_PCI_READ | TCE_PCI_WRITE);
> +	}
> +
> +	spin_unlock_irqrestore(&tbl->large_pool.lock, flags);
> +
> +	return rc;
> +}
> +#endif
> +
>   static int tce_setrange_multi_pSeriesLP_walk(unsigned long start_pfn,
>   		unsigned long num_pfn, void *arg)
>   {
>   	return tce_setrange_multi_pSeriesLP(start_pfn, num_pfn, arg);
>   }
>   
> +static inline void _iommu_table_setparms(struct iommu_table *tbl, unsigned long busno,
> +					 unsigned long liobn, unsigned long win_addr,
> +					 unsigned long window_size, unsigned long page_shift,
> +					 unsigned long base, struct iommu_table_ops *table_ops)
> +{
> +	tbl->it_busno = busno;
> +	tbl->it_index = liobn;
> +	tbl->it_offset = win_addr >> page_shift;
> +	tbl->it_size = window_size >> page_shift;
> +	tbl->it_page_shift = page_shift;
> +	tbl->it_base = base;
> +	tbl->it_blocksize = 16;
> +	tbl->it_type = TCE_PCI;
> +	tbl->it_ops = table_ops;
> +}
> +
> +struct iommu_table_ops iommu_table_pseries_ops = {
> +	.set = tce_build_pSeries,
> +	.clear = tce_free_pSeries,
> +	.get = tce_get_pseries
> +};
> +
>   static void iommu_table_setparms(struct pci_controller *phb,
>   				 struct device_node *dn,
>   				 struct iommu_table *tbl)
> @@ -509,8 +559,13 @@ static void iommu_table_setparms(struct pci_controller *phb,
>   	const unsigned long *basep;
>   	const u32 *sizep;
>   
> -	node = phb->dn;
> +	/* Test if we are going over 2GB of DMA space */
> +	if (phb->dma_window_base_cur + phb->dma_window_size > 0x80000000ul) {
> +		udbg_printf("PCI_DMA: Unexpected number of IOAs under this PHB.\n");
> +		panic("PCI_DMA: Unexpected number of IOAs under this PHB.\n");
> +	}


s/0x80000000ul/2*SZ_1G/

but more to the point - why this check? QEMU can create windows at 0 and 
as big as the VM requested. And I am pretty sure I can construct QEMU 
command line such as it won't have MMIO32 at all and a 4GB default DMA 
window.


>   
> +	node = phb->dn;
>   	basep = of_get_property(node, "linux,tce-base", NULL);
>   	sizep = of_get_property(node, "linux,tce-size", NULL);
>   	if (basep == NULL || sizep == NULL) {
> @@ -519,33 +574,25 @@ static void iommu_table_setparms(struct pci_controller *phb,
>   		return;
>   	}
>   
> -	tbl->it_base = (unsigned long)__va(*basep);
> +	_iommu_table_setparms(tbl, phb->bus->number, 0, phb->dma_window_base_cur,
> +			      phb->dma_window_size, IOMMU_PAGE_SHIFT_4K,
> +			      (unsigned long)__va(*basep), &iommu_table_pseries_ops);
>   
>   	if (!is_kdump_kernel())
>   		memset((void *)tbl->it_base, 0, *sizep);
>   
> -	tbl->it_busno = phb->bus->number;
> -	tbl->it_page_shift = IOMMU_PAGE_SHIFT_4K;
> -
> -	/* Units of tce entries */
> -	tbl->it_offset = phb->dma_window_base_cur >> tbl->it_page_shift;
> -
> -	/* Test if we are going over 2GB of DMA space */
> -	if (phb->dma_window_base_cur + phb->dma_window_size > 0x80000000ul) {
> -		udbg_printf("PCI_DMA: Unexpected number of IOAs under this PHB.\n");
> -		panic("PCI_DMA: Unexpected number of IOAs under this PHB.\n");
> -	}
> -
>   	phb->dma_window_base_cur += phb->dma_window_size;
> -
> -	/* Set the tce table size - measured in entries */
> -	tbl->it_size = phb->dma_window_size >> tbl->it_page_shift;
> -
> -	tbl->it_index = 0;
> -	tbl->it_blocksize = 16;
> -	tbl->it_type = TCE_PCI;
>   }
>   
> +struct iommu_table_ops iommu_table_lpar_multi_ops = {
> +	.set = tce_buildmulti_pSeriesLP,
> +#ifdef CONFIG_IOMMU_API
> +	.xchg_no_kill = tce_exchange_pseries,
> +#endif
> +	.clear = tce_freemulti_pSeriesLP,
> +	.get = tce_get_pSeriesLP
> +};
> +
>   /*
>    * iommu_table_setparms_lpar
>    *
> @@ -557,28 +604,17 @@ static void iommu_table_setparms_lpar(struct pci_controller *phb,
>   				      struct iommu_table_group *table_group,
>   				      const __be32 *dma_window)
>   {
> -	unsigned long offset, size;
> +	unsigned long offset, size, liobn;
>   
> -	of_parse_dma_window(dn, dma_window, &tbl->it_index, &offset, &size);
> +	of_parse_dma_window(dn, dma_window, &liobn, &offset, &size);
>   
> -	tbl->it_busno = phb->bus->number;
> -	tbl->it_page_shift = IOMMU_PAGE_SHIFT_4K;
> -	tbl->it_base   = 0;
> -	tbl->it_blocksize  = 16;
> -	tbl->it_type = TCE_PCI;
> -	tbl->it_offset = offset >> tbl->it_page_shift;
> -	tbl->it_size = size >> tbl->it_page_shift;
> +	_iommu_table_setparms(tbl, phb->bus->number, liobn, offset, size, IOMMU_PAGE_SHIFT_4K, 0,
> +			      &iommu_table_lpar_multi_ops);
>   
>   	table_group->tce32_start = offset;
>   	table_group->tce32_size = size;
>   }
>   
> -struct iommu_table_ops iommu_table_pseries_ops = {
> -	.set = tce_build_pSeries,
> -	.clear = tce_free_pSeries,
> -	.get = tce_get_pseries
> -};
> -
>   static void pci_dma_bus_setup_pSeries(struct pci_bus *bus)
>   {
>   	struct device_node *dn;
> @@ -647,7 +683,6 @@ static void pci_dma_bus_setup_pSeries(struct pci_bus *bus)
>   	tbl = pci->table_group->tables[0];
>   
>   	iommu_table_setparms(pci->phb, dn, tbl);
> -	tbl->it_ops = &iommu_table_pseries_ops;
>   	iommu_init_table(tbl, pci->phb->node, 0, 0);
>   
>   	/* Divide the rest (1.75GB) among the children */
> @@ -658,43 +693,6 @@ static void pci_dma_bus_setup_pSeries(struct pci_bus *bus)
>   	pr_debug("ISA/IDE, window size is 0x%llx\n", pci->phb->dma_window_size);
>   }
>   
> -#ifdef CONFIG_IOMMU_API
> -static int tce_exchange_pseries(struct iommu_table *tbl, long index, unsigned
> -				long *tce, enum dma_data_direction *direction,
> -				bool realmode)
> -{
> -	long rc;
> -	unsigned long ioba = (unsigned long) index << tbl->it_page_shift;
> -	unsigned long flags, oldtce = 0;
> -	u64 proto_tce = iommu_direction_to_tce_perm(*direction);
> -	unsigned long newtce = *tce | proto_tce;
> -
> -	spin_lock_irqsave(&tbl->large_pool.lock, flags);
> -
> -	rc = plpar_tce_get((u64)tbl->it_index, ioba, &oldtce);
> -	if (!rc)
> -		rc = plpar_tce_put((u64)tbl->it_index, ioba, newtce);
> -
> -	if (!rc) {
> -		*direction = iommu_tce_direction(oldtce);
> -		*tce = oldtce & ~(TCE_PCI_READ | TCE_PCI_WRITE);
> -	}
> -
> -	spin_unlock_irqrestore(&tbl->large_pool.lock, flags);
> -
> -	return rc;
> -}
> -#endif
> -
> -struct iommu_table_ops iommu_table_lpar_multi_ops = {
> -	.set = tce_buildmulti_pSeriesLP,
> -#ifdef CONFIG_IOMMU_API
> -	.xchg_no_kill = tce_exchange_pseries,
> -#endif
> -	.clear = tce_freemulti_pSeriesLP,
> -	.get = tce_get_pSeriesLP
> -};
> -
>   static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
>   {
>   	struct iommu_table *tbl;
> @@ -729,7 +727,6 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
>   		tbl = ppci->table_group->tables[0];
>   		iommu_table_setparms_lpar(ppci->phb, pdn, tbl,
>   				ppci->table_group, dma_window);
> -		tbl->it_ops = &iommu_table_lpar_multi_ops;
>   		iommu_init_table(tbl, ppci->phb->node, 0, 0);
>   		iommu_register_group(ppci->table_group,
>   				pci_domain_nr(bus), 0);
> @@ -758,7 +755,6 @@ static void pci_dma_dev_setup_pSeries(struct pci_dev *dev)
>   		PCI_DN(dn)->table_group = iommu_pseries_alloc_group(phb->node);
>   		tbl = PCI_DN(dn)->table_group->tables[0];
>   		iommu_table_setparms(phb, dn, tbl);
> -		tbl->it_ops = &iommu_table_pseries_ops;
>   		iommu_init_table(tbl, phb->node, 0, 0);
>   		set_iommu_table_base(&dev->dev, tbl);
>   		return;
> @@ -1385,7 +1381,6 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
>   		tbl = pci->table_group->tables[0];
>   		iommu_table_setparms_lpar(pci->phb, pdn, tbl,
>   				pci->table_group, dma_window);
> -		tbl->it_ops = &iommu_table_lpar_multi_ops;
>   		iommu_init_table(tbl, pci->phb->node, 0, 0);
>   		iommu_register_group(pci->table_group,
>   				pci_domain_nr(pci->phb->bus), 0);
> 

-- 
Alexey
