Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9570637A13F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 09:58:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfVf04Zbnz308q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 17:58:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=JoLr8/6z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=JoLr8/6z; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfVdV2xpLz2yWT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 17:57:30 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id i14so15197330pgk.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 00:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WkHXZovC6q4P6RMUrDdIlC4m9PUWN46i6uHcGaxj1/I=;
 b=JoLr8/6zuHvXp8VhvnOdFe0d/FbQSgKHRS0MhrF9DOHnBUuM1Si535/iOSbckeGnNh
 sYJ7AqAJJrxu4o2X7ltvmCsFptukbkNTYJLY3nIhkuyNycDbHy4x7ImTJU0JzXyP9pKr
 USYZ5C7v0pNd+ditc1eEZs1pxM95u4ifkG9a1JZJ6tpyfWT+lR13kE7ZOey5OtehqrEs
 6Duyn6q6elLTxQmc+j/L8ktoMzbshrYvMOLRRsChwwXCc6kUMgfoKdxsawdTR/X51KeD
 9sEh/HoZfJaBTwI6lSxd/oFNSqbRKN6mZ6rU8fRxGFT1k16hwIm0BaUN0oW/ctD0LK/q
 R/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WkHXZovC6q4P6RMUrDdIlC4m9PUWN46i6uHcGaxj1/I=;
 b=KamuKRyv5wqVO9fgXBcyFAcakNPXNN7+9/dhqE4I2nSPLsZeEvRimb8xAGsoaP/y9r
 R+GpFMvw/t2yjBgGFpGY2Gbjb9TxVNEhnLhtF5jFzV37fcZTQ6evW1zugk2pZci6KtOD
 8gWe/uQhWdBXV6lUA5mtBkKKvUU1fxN/bsmE0s4bNRdVZN+48GSk3W1nAiAIDVav1ov9
 0aawvvMQ9lMwV87hykPILbEv5kpDXElq3YfiHy7mtIfPGmQiZ6J1AmRAAm1wXUcmRLxy
 Kb17cujfxnOIZ+5QMLKV09jbLNRvQx+HXNLg5BNp7YDV1vOotZuqHhc1LMlL732tbMSZ
 1fRQ==
X-Gm-Message-State: AOAM532ahe7W+UAfYHLL/7duJPuGn2V7aSq4Bq/vuBduS9eOZ8tw+YND
 yMccFEjV7STBDnPjkRDCdxZwuA==
X-Google-Smtp-Source: ABdhPJwWlTMYbnvsayEbOhbaUuTO7jmCQuB55trieqvmuma8cagfh5JKOZ8Z4eHF4K4vodhNxrAZHQ==
X-Received: by 2002:a63:a709:: with SMTP id d9mr3677848pgf.143.1620719847510; 
 Tue, 11 May 2021 00:57:27 -0700 (PDT)
Received: from localhost
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id y17sm12558988pfb.183.2021.05.11.00.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 00:57:26 -0700 (PDT)
Message-ID: <95ac11e9-a709-e0a2-9690-ef13c4a2cd43@ozlabs.ru>
Date: Tue, 11 May 2021 17:57:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH v4 10/11] powerpc/pseries/iommu: Make use of DDW for
 indirect mapping
Content-Language: en-US
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
References: <20210430163145.146984-1-leobras.c@gmail.com>
 <20210430163145.146984-11-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210430163145.146984-11-leobras.c@gmail.com>
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



On 01/05/2021 02:31, Leonardo Bras wrote:
> So far it's assumed possible to map the guest RAM 1:1 to the bus, which
> works with a small number of devices. SRIOV changes it as the user can
> configure hundreds VFs and since phyp preallocates TCEs and does not
> allow IOMMU pages bigger than 64K, it has to limit the number of TCEs
> per a PE to limit waste of physical pages.
> 
> As of today, if the assumed direct mapping is not possible, DDW creation
> is skipped and the default DMA window "ibm,dma-window" is used instead.
> 
> By using DDW, indirect mapping  can get more TCEs than available for the
> default DMA window, and also get access to using much larger pagesizes
> (16MB as implemented in qemu vs 4k from default DMA window), causing a
> significant increase on the maximum amount of memory that can be IOMMU
> mapped at the same time.
> 
> Indirect mapping will only be used if direct mapping is not a
> possibility.
> 
> For indirect mapping, it's necessary to re-create the iommu_table with
> the new DMA window parameters, so iommu_alloc() can use it.
> 
> Removing the default DMA window for using DDW with indirect mapping
> is only allowed if there is no current IOMMU memory allocated in
> the iommu_table. enable_ddw() is aborted otherwise.
> 
> Even though there won't be both direct and indirect mappings at the
> same time, we can't reuse the DIRECT64_PROPNAME property name, or else
> an older kexec()ed kernel can assume direct mapping, and skip
> iommu_alloc(), causing undesirable behavior.
> So a new property name DMA64_PROPNAME "linux,dma64-ddr-window-info"
> was created to represent a DDW that does not allow direct mapping.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>   arch/powerpc/platforms/pseries/iommu.c | 87 +++++++++++++++++++++-----
>   1 file changed, 72 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index de54ddd9decd..572879af0211 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -53,6 +53,7 @@ enum {
>   	DDW_EXT_QUERY_OUT_SIZE = 2
>   };
>   
> +static phys_addr_t ddw_memory_hotplug_max(void);
>   #ifdef CONFIG_IOMMU_API
>   static int tce_exchange_pseries(struct iommu_table *tbl, long index, unsigned long *tce,
>   				enum dma_data_direction *direction, bool realmode);
> @@ -380,6 +381,7 @@ static DEFINE_SPINLOCK(direct_window_list_lock);
>   /* protects initializing window twice for same device */
>   static DEFINE_MUTEX(direct_window_init_mutex);
>   #define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
> +#define DMA64_PROPNAME "linux,dma64-ddr-window-info"
>   
>   static int tce_clearrange_multi_pSeriesLP(unsigned long start_pfn,
>   					unsigned long num_pfn, const void *arg)
> @@ -918,6 +920,7 @@ static int find_existing_ddw_windows(void)
>   		return 0;
>   
>   	find_existing_ddw_windows_named(DIRECT64_PROPNAME);
> +	find_existing_ddw_windows_named(DMA64_PROPNAME);
>   
>   	return 0;
>   }
> @@ -1207,10 +1210,13 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	struct device_node *dn;
>   	u32 ddw_avail[DDW_APPLICABLE_SIZE];
>   	struct direct_window *window;
> +	const char *win_name;
>   	struct property *win64 = NULL;
>   	struct failed_ddw_pdn *fpdn;
> -	bool default_win_removed = false;
> +	bool default_win_removed = false, direct_mapping = false;
>   	bool pmem_present;
> +	struct pci_dn *pci = PCI_DN(pdn);
> +	struct iommu_table *tbl = pci->table_group->tables[0];
>   
>   	dn = of_find_node_by_type(NULL, "ibm,pmemory");
>   	pmem_present = dn != NULL;
> @@ -1218,8 +1224,12 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   
>   	mutex_lock(&direct_window_init_mutex);
>   
> -	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &len))
> -		goto out_unlock;
> +	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &len)) {
> +		direct_mapping = (len >= max_ram_len);
> +
> +		mutex_unlock(&direct_window_init_mutex);
> +		return direct_mapping;

Does not this break the existing case when direct_mapping==true by 
skipping setting dev->dev.bus_dma_limit before returning?



> +	}
>   
>   	/*
>   	 * If we already went through this for a previous function of
> @@ -1298,7 +1308,6 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   		goto out_failed;
>   	}
>   	/* verify the window * number of ptes will map the partition */
> -	/* check largest block * page size > max memory hotplug addr */
>   	/*
>   	 * The "ibm,pmemory" can appear anywhere in the address space.
>   	 * Assuming it is still backed by page structs, try MAX_PHYSMEM_BITS
> @@ -1320,6 +1329,17 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   			1ULL << len,
>   			query.largest_available_block,
>   			1ULL << page_shift);
> +
> +		len = order_base_2(query.largest_available_block << page_shift);
> +		win_name = DMA64_PROPNAME;

[1] ....


> +	} else {
> +		direct_mapping = true;
> +		win_name = DIRECT64_PROPNAME;
> +	}
> +
> +	/* DDW + IOMMU on single window may fail if there is any allocation */
> +	if (default_win_removed && !direct_mapping && iommu_table_in_use(tbl)) {
> +		dev_dbg(&dev->dev, "current IOMMU table in use, can't be replaced.\n");


... remove !direct_mapping and move to [1]?


>   		goto out_failed;
>   	}
>   
> @@ -1331,8 +1351,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   		  create.liobn, dn);
>   
>   	win_addr = ((u64)create.addr_hi << 32) | create.addr_lo;
> -	win64 = ddw_property_create(DIRECT64_PROPNAME, create.liobn, win_addr,
> -				    page_shift, len);
> +	win64 = ddw_property_create(win_name, create.liobn, win_addr, page_shift, len);
>   	if (!win64) {
>   		dev_info(&dev->dev,
>   			 "couldn't allocate property, property name, or value\n");
> @@ -1350,12 +1369,47 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	if (!window)
>   		goto out_del_prop;
>   
> -	ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
> -			win64->value, tce_setrange_multi_pSeriesLP_walk);
> -	if (ret) {
> -		dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
> -			 dn, ret);
> -		goto out_del_list;
> +	if (direct_mapping) {
> +		/* DDW maps the whole partition, so enable direct DMA mapping */
> +		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
> +					    win64->value, tce_setrange_multi_pSeriesLP_walk);
> +		if (ret) {
> +			dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
> +				 dn, ret);
> +			goto out_del_list;
> +		}
> +	} else {
> +		struct iommu_table *newtbl;
> +		int i;
> +
> +		/* New table for using DDW instead of the default DMA window */
> +		newtbl = iommu_pseries_alloc_table(pci->phb->node);
> +		if (!newtbl) {
> +			dev_dbg(&dev->dev, "couldn't create new IOMMU table\n");
> +			goto out_del_list;
> +		}
> +
> +		for (i = 0; i < ARRAY_SIZE(pci->phb->mem_resources); i++) {
> +			const unsigned long mask = IORESOURCE_MEM_64 | IORESOURCE_MEM;
> +
> +			/* Look for MMIO32 */
> +			if ((pci->phb->mem_resources[i].flags & mask) == IORESOURCE_MEM)
> +				break;

What if there is no IORESOURCE_MEM? pci->phb->mem_resources[i].start 
below will have garbage.


> +		}
> +
> +		_iommu_table_setparms(newtbl, pci->phb->bus->number, create.liobn, win_addr,
> +				      1UL << len, page_shift, 0, &iommu_table_lpar_multi_ops);
> +		iommu_init_table(newtbl, pci->phb->node, pci->phb->mem_resources[i].start,
> +				 pci->phb->mem_resources[i].end);
> +
> +		if (default_win_removed)
> +			iommu_tce_table_put(tbl);


iommu_tce_table_put() should have been called when the window was removed.

Also after some thinking - what happens if there were 2 devices in the 
PE and one requested 64bit DMA? This will only update 
set_iommu_table_base() for the 64bit one but not for the other.

I think the right thing to do is:

1. check if table[0] is in use, if yes => fail (which this does already)

2. remove default dma window but keep the iommu_table struct with one 
change - set it_size to 0 (and free it_map) so the 32bit device won't 
look at a stale structure and think there is some window (imaginery 
situation for phyp but easy to recreate in qemu).

3. use table[1] for newly created indirect DDW window.

4. change get_iommu_table_base() to return a usable table (or may be not 
needed?).

If this sounds reasonable (does it?), the question is now if you have 
time to do that and the hardware to test that, or I'll have to finish 
the work :)


> +		else
> +			pci->table_group->tables[1] = tbl;


What is this for?

> +
> +		pci->table_group->tables[0] = newtbl;
> +
> +		set_iommu_table_base(&dev->dev, newtbl);
>   	}
>   
>   	spin_lock(&direct_window_list_lock);
> @@ -1398,10 +1452,10 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	 * as RAM, then we failed to create a window to cover persistent
>   	 * memory and need to set the DMA limit.
>   	 */
> -	if (pmem_present && win64 && (len == max_ram_len))
> +	if (pmem_present && direct_mapping && len == max_ram_len)
>   		dev->dev.bus_dma_limit = dev->dev.archdata.dma_offset + (1ULL << len);
>   
> -	return win64;
> +	return win64 && direct_mapping;
>   }
>   
>   static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
> @@ -1542,7 +1596,10 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
>   		 * we have to remove the property when releasing
>   		 * the device node.
>   		 */
> -		remove_ddw(np, false, DIRECT64_PROPNAME);
> +
> +		if (remove_ddw(np, false, DIRECT64_PROPNAME))
> +			remove_ddw(np, false, DMA64_PROPNAME);
> +
>   		if (pci && pci->table_group)
>   			iommu_pseries_free_group(pci->table_group,
>   					np->full_name);
> 

-- 
Alexey
