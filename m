Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4094E24F220
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 07:21:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZgT120QpzDqRk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 15:21:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=XrQEN6fW; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZgPD3zYnzDqR5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Aug 2020 15:17:51 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id mw10so3591359pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Aug 2020 22:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M/9hECGSRmL3KSE+kMIwcqbc+Rwjzw1H9zWt9gra3Cc=;
 b=XrQEN6fWLFaKTZhrIvmjgbzJMboIqukewCl7z8ES8BtJKHG2IVcBwVFRLnHDcDndi2
 ptH5uE79+FCpP060ZQbaxcDEFuxSuOiKwLznzUO+lEZYVhgQ9JHgGFbdUrAq++jUkoJ1
 HRT3hUCLVY6kM3Lkj5RqKtCGds5TpLxeISRshzkA9Erv8ds6CfyhM2prrJ4bC4gH8Mq8
 KPHoRfBvaZ6qdozGMFPNX973SGDEdJL772rtClK9geY5qAYiwZx5N+7UEn9mI8I8XEa7
 kqrdH/vgoz1JCBS0jDQ5CByYz88L4md7sILkeycgWfN9lWPlrBe3oZZLP7qvABYpWxt/
 Khag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=M/9hECGSRmL3KSE+kMIwcqbc+Rwjzw1H9zWt9gra3Cc=;
 b=jt/mjjHeQlK6FHfsg7Gqq9np4SbhkZ7ThbYIW+mn3XwdQyeGYxU5YhV3KCrgEQfhWm
 he8Vyr8g8iKYqz0c87xiJtQ2QdQHaZT3d4l+qfQYHwgD+ByRi2geS8mxqmW/elSEh3FP
 jMOog/CBhSv13WBjBonbUzgElGPbYCMsq6xUXx24Mn3QUjc1U8W5GN6aD/FhOwB46yH6
 Nundi+DIzLwhEu3VkVaPXKq+ylTWFl9T0VMRXJUTQc92GbDp/xENV401rCkUtxaCmFnr
 YZvYMVSPs6wQIe+PRXzg9r5Se/YaWn+eeaH47wv0kMoIM8vO6GVFBHPKcDpAJfAgp9kz
 cRFQ==
X-Gm-Message-State: AOAM531e/h44bCuiaSHCjdvPLwJd/u/Pl7vxgWBqRK4KVoa25tNCyUGf
 STkSZUo9a6GkkVd7Z/TOIa8EVQ==
X-Google-Smtp-Source: ABdhPJy7pp+Tv5dCr62B7QtoTc3u0SDuA3E3s5RSr2j+sb8VAbJ1nb1p/iKHQcIYo9tjmgOQtqiP7Q==
X-Received: by 2002:a17:90a:dd45:: with SMTP id
 u5mr3386847pjv.198.1598246269441; 
 Sun, 23 Aug 2020 22:17:49 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id 78sm1562924pfv.200.2020.08.23.22.17.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Aug 2020 22:17:48 -0700 (PDT)
Subject: Re: [PATCH v1 09/10] powerpc/pseries/iommu: Make use of DDW even if
 it does not map the partition
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Joel Stanley <joel@jms.id.au>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-10-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <d2d98195-982d-c40a-43bc-5853726ed1d6@ozlabs.ru>
Date: Mon, 24 Aug 2020 15:17:42 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817234033.442511-10-leobras.c@gmail.com>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 18/08/2020 09:40, Leonardo Bras wrote:
> As of today, if the biggest DDW that can be created can't map the whole
> partition, it's creation is skipped and the default DMA window
> "ibm,dma-window" is used instead.
> 
> DDW is 16x bigger than the default DMA window,

16x only under very specific circumstances which are
1. phyp
2. sriov
3. device class in hmc (or what that priority number is in the lpar config).

> having the same amount of
> pages, but increasing the page size to 64k.
> Besides larger DMA window,

"Besides being larger"?

> it performs better for allocations over 4k,

Better how?

> so it would be nice to use it instead.


I'd rather say something like:
===
So far we assumed we can map the guest RAM 1:1 to the bus which worked
with a small number of devices. SRIOV changes it as the user can
configure hundreds VFs and since phyp preallocates TCEs and does not
allow IOMMU pages bigger than 64K, it has to limit the number of TCEs
per a PE to limit waste of physical pages.
===


> 
> The DDW created will be used for direct mapping by default.
> If it's not available, indirect mapping will be used instead.
> 
> For indirect mapping, it's necessary to update the iommu_table so
> iommu_alloc() can use the DDW created. For this,
> iommu_table_update_window() is called when everything else succeeds
> at enable_ddw().
> 
> Removing the default DMA window for using DDW with indirect mapping
> is only allowed if there is no current IOMMU memory allocated in
> the iommu_table. enable_ddw() is aborted otherwise.
> 
> As there will never have both direct and indirect mappings at the same
> time, the same property name can be used for the created DDW.
> 
> So renaming
> define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
> to
> define DMA64_PROPNAME "linux,dma64-ddr-window-info"
> looks the right thing to do.

I know I suggested this but this does not look so good anymore as I
suspect it breaks kexec (from older kernel to this one) so you either
need to check for both DT names or just keep the old one. Changing the
macro name is fine.


> 
> To make sure the property differentiates both cases, a new u32 for flags
> was added at the end of the property, where BIT(0) set means direct
> mapping.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>  arch/powerpc/platforms/pseries/iommu.c | 108 +++++++++++++++++++------
>  1 file changed, 84 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 3a1ef02ad9d5..9544e3c91ced 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -350,8 +350,11 @@ struct dynamic_dma_window_prop {
>  	__be64	dma_base;	/* address hi,lo */
>  	__be32	tce_shift;	/* ilog2(tce_page_size) */
>  	__be32	window_shift;	/* ilog2(tce_window_size) */
> +	__be32	flags;		/* DDW properties, see bellow */
>  };
>  
> +#define DDW_FLAGS_DIRECT	0x01

This is set if ((1<<window_shift) >= ddw_memory_hotplug_max()), you
could simply check window_shift and drop the flags.


> +
>  struct direct_window {
>  	struct device_node *device;
>  	const struct dynamic_dma_window_prop *prop;
> @@ -377,7 +380,7 @@ static LIST_HEAD(direct_window_list);
>  static DEFINE_SPINLOCK(direct_window_list_lock);
>  /* protects initializing window twice for same device */
>  static DEFINE_MUTEX(direct_window_init_mutex);
> -#define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
> +#define DMA64_PROPNAME "linux,dma64-ddr-window-info"
>  
>  static int tce_clearrange_multi_pSeriesLP(unsigned long start_pfn,
>  					unsigned long num_pfn, const void *arg)
> @@ -836,7 +839,7 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
>  	if (ret)
>  		return;
>  
> -	win = of_find_property(np, DIRECT64_PROPNAME, NULL);
> +	win = of_find_property(np, DMA64_PROPNAME, NULL);
>  	if (!win)
>  		return;
>  
> @@ -852,7 +855,7 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
>  			np, ret);
>  }
>  
> -static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
> +static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, bool *direct_mapping)
>  {
>  	struct direct_window *window;
>  	const struct dynamic_dma_window_prop *direct64;
> @@ -864,6 +867,7 @@ static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
>  		if (window->device == pdn) {
>  			direct64 = window->prop;
>  			*dma_addr = be64_to_cpu(direct64->dma_base);
> +			*direct_mapping = be32_to_cpu(direct64->flags) & DDW_FLAGS_DIRECT;
>  			found = true;
>  			break;
>  		}
> @@ -901,8 +905,8 @@ static int find_existing_ddw_windows(void)
>  	if (!firmware_has_feature(FW_FEATURE_LPAR))
>  		return 0;
>  
> -	for_each_node_with_property(pdn, DIRECT64_PROPNAME) {
> -		direct64 = of_get_property(pdn, DIRECT64_PROPNAME, &len);
> +	for_each_node_with_property(pdn, DMA64_PROPNAME) {
> +		direct64 = of_get_property(pdn, DMA64_PROPNAME, &len);
>  		if (!direct64)
>  			continue;
>  
> @@ -1124,7 +1128,8 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
>  }
>  
>  static int ddw_property_create(struct property **ddw_win, const char *propname,
> -			       u32 liobn, u64 dma_addr, u32 page_shift, u32 window_shift)
> +			       u32 liobn, u64 dma_addr, u32 page_shift,
> +			       u32 window_shift, bool direct_mapping)
>  {
>  	struct dynamic_dma_window_prop *ddwprop;
>  	struct property *win64;
> @@ -1144,6 +1149,36 @@ static int ddw_property_create(struct property **ddw_win, const char *propname,
>  	ddwprop->dma_base = cpu_to_be64(dma_addr);
>  	ddwprop->tce_shift = cpu_to_be32(page_shift);
>  	ddwprop->window_shift = cpu_to_be32(window_shift);
> +	if (direct_mapping)
> +		ddwprop->flags = cpu_to_be32(DDW_FLAGS_DIRECT);
> +
> +	return 0;
> +}
> +
> +static int iommu_table_update_window(struct iommu_table **tbl, int nid, unsigned long liobn,
> +				     unsigned long win_addr, unsigned long page_shift,
> +				     unsigned long window_size)

Rather strange helper imho. I'd extract the most of
iommu_table_setparms_lpar() into iommu_table_setparms() (except
of_parse_dma_window) and call new helper from where you call
iommu_table_update_window; and do
iommu_pseries_alloc_table/iommu_tce_table_put there.


> +{
> +	struct iommu_table *new_tbl, *old_tbl;
> +
> +	new_tbl = iommu_pseries_alloc_table(nid);
> +	if (!new_tbl)
> +		return -ENOMEM;
> +
> +	old_tbl = *tbl;
> +	new_tbl->it_index = liobn;
> +	new_tbl->it_offset = win_addr >> page_shift;
> +	new_tbl->it_page_shift = page_shift;
> +	new_tbl->it_size = window_size >> page_shift;
> +	new_tbl->it_base = old_tbl->it_base;

Should not be used in pseries.


> +	new_tbl->it_busno = old_tbl->it_busno;
> +	new_tbl->it_blocksize = old_tbl->it_blocksize;

16 for pseries and does not change (may be even make it a macro).

> +	new_tbl->it_type = old_tbl->it_type;

TCE_PCI.


> +	new_tbl->it_ops = old_tbl->it_ops;
> +
> +	iommu_init_table(new_tbl, nid, old_tbl->it_reserved_start, old_tbl->it_reserved_end);
> +	iommu_tce_table_put(old_tbl);
> +	*tbl = new_tbl;
>  
>  	return 0;
>  }
> @@ -1171,12 +1206,16 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  	struct direct_window *window;
>  	struct property *win64 = NULL;
>  	struct failed_ddw_pdn *fpdn;
> -	bool default_win_removed = false;
> +	bool default_win_removed = false, maps_whole_partition = false;


s/maps_whole_partition/direct_mapping/


> +	struct pci_dn *pci = PCI_DN(pdn);
> +	struct iommu_table *tbl = pci->table_group->tables[0];
>  
>  	mutex_lock(&direct_window_init_mutex);
>  
> -	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset))
> -		goto out_unlock;
> +	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &maps_whole_partition)) {
> +		mutex_unlock(&direct_window_init_mutex);
> +		return maps_whole_partition;
> +	}
>  
>  	/*
>  	 * If we already went through this for a previous function of
> @@ -1258,16 +1297,24 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  			  query.page_size);
>  		goto out_failed;
>  	}
> +
>  	/* verify the window * number of ptes will map the partition */
> -	/* check largest block * page size > max memory hotplug addr */
>  	max_addr = ddw_memory_hotplug_max();
>  	if (query.largest_available_block < (max_addr >> page_shift)) {
> -		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu "
> -			  "%llu-sized pages\n", max_addr,  query.largest_available_block,
> -			  1ULL << page_shift);
> -		goto out_failed;
> +		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu %llu-sized pages\n",
> +			max_addr, query.largest_available_block,
> +			1ULL << page_shift);
> +
> +		len = order_base_2(query.largest_available_block << page_shift);
> +	} else {
> +		maps_whole_partition = true;
> +		len = order_base_2(max_addr);
>  	}
> -	len = order_base_2(max_addr);
> +
> +	/* DDW + IOMMU on single window may fail if there is any allocation */
> +	if (default_win_removed && !maps_whole_partition &&
> +	    iommu_table_in_use(tbl))
> +		goto out_failed;
>  
>  	ret = create_ddw(dev, ddw_avail, &create, page_shift, len);
>  	if (ret != 0)
> @@ -1277,8 +1324,8 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  		create.liobn, dn);
>  
>  	win_addr = ((u64)create.addr_hi << 32) | create.addr_lo;
> -	ret = ddw_property_create(&win64, DIRECT64_PROPNAME, create.liobn, win_addr,
> -				  page_shift, len);
> +	ret = ddw_property_create(&win64, DMA64_PROPNAME, create.liobn, win_addr,
> +				  page_shift, len, maps_whole_partition);
>  	if (ret) {
>  		dev_info(&dev->dev,
>  			 "couldn't allocate property, property name, or value\n");
> @@ -1297,12 +1344,25 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  	if (!window)
>  		goto out_prop_del;
>  
> -	ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
> -			win64->value, tce_setrange_multi_pSeriesLP_walk);
> -	if (ret) {
> -		dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
> -			 dn, ret);
> -		goto out_free_window;
> +	if (maps_whole_partition) {
> +		/* DDW maps the whole partition, so enable direct DMA mapping */
> +		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
> +					    win64->value, tce_setrange_multi_pSeriesLP_walk);
> +		if (ret) {
> +			dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
> +				 dn, ret);
> +			goto out_free_window;
> +		}
> +	} else {
> +		/* New table for using DDW instead of the default DMA window */
> +		if (iommu_table_update_window(&tbl, pci->phb->node, create.liobn,
> +					      win_addr, page_shift, 1UL << len))
> +			goto out_free_window;
> +
> +		set_iommu_table_base(&dev->dev, tbl);
> +		WARN_ON(dev->dev.archdata.dma_offset >= SZ_4G);

What is this check for exactly? Why 4G, not >= 0, for example?

> +		goto out_unlock;
> +
>  	}
>  
>  	dev->dev.archdata.dma_offset = win_addr;
> @@ -1340,7 +1400,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  
>  out_unlock:
>  	mutex_unlock(&direct_window_init_mutex);
> -	return win64;
> +	return win64 && maps_whole_partition;
>  }
>  
>  static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
> 

-- 
Alexey
