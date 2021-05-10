Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A35377D35
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 09:35:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdtB8414Vz308k
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 17:35:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=TnymSowG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=TnymSowG; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdt951BcBz2yXk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 17:34:13 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id b21so5916102pft.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 00:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vA3gf5U3qgSMXovfcB4UhmgzKIceIYSkZrJbqbnFQQs=;
 b=TnymSowGCl8At/Z5vJjiv6UkoDI9j2N2BTdVmLCLCOKMpsMJulNPkSWZYc6yDKrvXU
 yKbWB1niCmvzdg5oH7OBLZdRVTkvbkCTpoF0KeXI6Gi0a+ZJwcsXngGOJdw7IqLU+aJR
 95UFJcfONNQPxssqx66EH8m4kWwWi+iDJwaGDtGuN8Sk+rNHrBQ5KmrsE04RYRv3/VSG
 94INqG/VKbm96f5jrlb/FK6dyOX1CWATud+m/4qnve7TXFuVOkrDX6SEbRJ1gW6U+DRx
 Z/7fQRIGJ39jY75K/HWCaIByNhj+rNsIptw+lzY7WEc+Z60Nm3/Tp9qlHrhRmLhA+Xiv
 QiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vA3gf5U3qgSMXovfcB4UhmgzKIceIYSkZrJbqbnFQQs=;
 b=MrSkDWZ+5xqTK56iZEvirCX/1MAEmw/fsVWna+CvNV7Kb5e9KQbs0Sp851cjREEcFU
 CgUS8cSr01BBJ7BNWQdYYfWJCQnablS7Nzlskr5t58ZZFe4OFm1WPy8jv+MmlazUCK7h
 neLT6TctRN4EmTMb6cGti8oq/qJ+o1FMIJFPx9YIrIOPIBgK+zWQMYfXiPFt7qYMsAp1
 I1Jm2bH1niX3BdpvQxUMKV+D7h52xeMDuBE9yODYEYMR03F8Dn0FiVKt0xjtyqPG5mWi
 Xn1c48IPv+nqNZ4rWpMrcjlk6k/HAZfZ6e0w3qv/sdu5Ce+mNe5boivfOQun0ZsFvEFU
 i2Hg==
X-Gm-Message-State: AOAM531gdm8JqLUeSAdk7LmSS2GY1PnXzPhQHq6Ev6PxA2tV89pn4Smi
 UZugqAWH1PjeKp4vl2hQ82XCvA==
X-Google-Smtp-Source: ABdhPJzoWupZxWPbVtYgLa+kmwmlg4iI4EhPt8v8lypgPYnkfkeQ/6SdyDSS7bmttVEVYeQvrgTTCA==
X-Received: by 2002:a63:2c92:: with SMTP id s140mr24065723pgs.39.1620632051387; 
 Mon, 10 May 2021 00:34:11 -0700 (PDT)
Received: from localhost (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with UTF8SMTPSA id s6sm10396487pgv.48.2021.05.10.00.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 00:34:10 -0700 (PDT)
Message-ID: <e4984fa0-2afe-a987-4fb8-61b878431b1f@ozlabs.ru>
Date: Mon, 10 May 2021 17:34:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH v4 07/11] powerpc/pseries/iommu: Reorganize
 iommu_table_setparms*() with new helper
Content-Language: en-US
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
References: <20210430163145.146984-1-leobras.c@gmail.com>
 <20210430163145.146984-8-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210430163145.146984-8-leobras.c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/1/21 02:31, Leonardo Bras wrote:
> Add a new helper _iommu_table_setparms(), and use it in
> iommu_table_setparms() and iommu_table_setparms_lpar() to avoid duplicated
> code.
> 
> Also, setting tbl->it_ops was happening outsite iommu_table_setparms*(),
> so move it to the new helper. Since we need the iommu_table_ops to be
> declared before used, move iommu_table_lpar_multi_ops and
> iommu_table_pseries_ops to before their respective iommu_table_setparms*().
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>


This does not apply anymore as it conflicts with my 4be518d838809e2135.


> ---
>   arch/powerpc/platforms/pseries/iommu.c | 100 ++++++++++++-------------
>   1 file changed, 50 insertions(+), 50 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 5a70ecd579b8..89cb6e9e9f31 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -53,6 +53,11 @@ enum {
>   	DDW_EXT_QUERY_OUT_SIZE = 2
>   };
>   
> +#ifdef CONFIG_IOMMU_API
> +static int tce_exchange_pseries(struct iommu_table *tbl, long index, unsigned long *tce,
> +				enum dma_data_direction *direction, bool realmode);
> +#endif


Instead of declaring this so far from the the code which needs it, may 
be add

struct iommu_table_ops iommu_table_lpar_multi_ops;

right before iommu_table_setparms() (as the sctruct is what you actually 
want there), and you won't need to move iommu_table_pseries_ops as well.


> +
>   static struct iommu_table *iommu_pseries_alloc_table(int node)
>   {
>   	struct iommu_table *tbl;
> @@ -501,6 +506,28 @@ static int tce_setrange_multi_pSeriesLP_walk(unsigned long start_pfn,
>   	return tce_setrange_multi_pSeriesLP(start_pfn, num_pfn, arg);
>   }
>   
> +static inline void _iommu_table_setparms(struct iommu_table *tbl, unsigned long busno,


The underscore is confusing, may be iommu_table_do_setparms()? 
iommu_table_setparms_common()? Not sure. I cannot recall a single 
function with just one leading underscore, I suspect I was pushed back 
when I tried adding one ages ago :) "inline" seems excessive, the 
compiler will probably figure it out anyway.



> +					 unsigned long liobn, unsigned long win_addr,
> +					 unsigned long window_size, unsigned long page_shift,
> +					 unsigned long base, struct iommu_table_ops *table_ops)


Make "base" a pointer. Or, better, just keep setting it directly in 
iommu_table_setparms() rather than passing 0 around.

The same comment about "liobn" - set it in iommu_table_setparms_lpar(). 
The reviewer will see what field atters in what situation imho.



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
> @@ -509,8 +536,13 @@ static void iommu_table_setparms(struct pci_controller *phb,
>   	const unsigned long *basep;
>   	const u32 *sizep;
>   
> -	node = phb->dn;
> +	/* Test if we are going over 2GB of DMA space */
> +	if (phb->dma_window_base_cur + phb->dma_window_size > SZ_2G) {
> +		udbg_printf("PCI_DMA: Unexpected number of IOAs under this PHB.\n");
> +		panic("PCI_DMA: Unexpected number of IOAs under this PHB.\n");
> +	}
>   
> +	node = phb->dn;
>   	basep = of_get_property(node, "linux,tce-base", NULL);
>   	sizep = of_get_property(node, "linux,tce-size", NULL);
>   	if (basep == NULL || sizep == NULL) {
> @@ -519,33 +551,25 @@ static void iommu_table_setparms(struct pci_controller *phb,
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
> @@ -557,28 +581,17 @@ static void iommu_table_setparms_lpar(struct pci_controller *phb,
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
> @@ -647,7 +660,6 @@ static void pci_dma_bus_setup_pSeries(struct pci_bus *bus)
>   	tbl = pci->table_group->tables[0];
>   
>   	iommu_table_setparms(pci->phb, dn, tbl);
> -	tbl->it_ops = &iommu_table_pseries_ops;
>   	iommu_init_table(tbl, pci->phb->node, 0, 0);
>   
>   	/* Divide the rest (1.75GB) among the children */
> @@ -664,7 +676,7 @@ static int tce_exchange_pseries(struct iommu_table *tbl, long index, unsigned
>   				bool realmode)
>   {
>   	long rc;
> -	unsigned long ioba = (unsigned long) index << tbl->it_page_shift;
> +	unsigned long ioba = (unsigned long)index << tbl->it_page_shift;


Unrelated change, why, did checkpatch.pl complain?


>   	unsigned long flags, oldtce = 0;
>   	u64 proto_tce = iommu_direction_to_tce_perm(*direction);
>   	unsigned long newtce = *tce | proto_tce;
> @@ -686,15 +698,6 @@ static int tce_exchange_pseries(struct iommu_table *tbl, long index, unsigned
>   }
>   #endif
>   
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
> @@ -729,7 +732,6 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
>   		tbl = ppci->table_group->tables[0];
>   		iommu_table_setparms_lpar(ppci->phb, pdn, tbl,
>   				ppci->table_group, dma_window);
> -		tbl->it_ops = &iommu_table_lpar_multi_ops;
>   		iommu_init_table(tbl, ppci->phb->node, 0, 0);
>   		iommu_register_group(ppci->table_group,
>   				pci_domain_nr(bus), 0);
> @@ -758,7 +760,6 @@ static void pci_dma_dev_setup_pSeries(struct pci_dev *dev)
>   		PCI_DN(dn)->table_group = iommu_pseries_alloc_group(phb->node);
>   		tbl = PCI_DN(dn)->table_group->tables[0];
>   		iommu_table_setparms(phb, dn, tbl);
> -		tbl->it_ops = &iommu_table_pseries_ops;
>   		iommu_init_table(tbl, phb->node, 0, 0);
>   		set_iommu_table_base(&dev->dev, tbl);
>   		return;
> @@ -1436,7 +1437,6 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
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
