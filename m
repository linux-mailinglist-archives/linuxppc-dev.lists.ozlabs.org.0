Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CCF27BBB3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 06:01:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0m0V1fhpzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 14:01:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=0ie/Oys/; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0ltn2m7WzDqQv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 13:56:32 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id d9so3235596pfd.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 20:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ReGObfv/D4K6QzgU2LIKyHCTmv9OpLshjeCBO2s+5n0=;
 b=0ie/Oys/ucGUCZ872HXUDawTiWU6vKUA8T5AXQg5SZY7VOcdy8xYA6a0d5xoFQIWH8
 LYqpJvhLN6hu5W40bEZLnaqK1sFMrQiXbiGXi74r8EVZw+Tb2NkLQ32g8VIt5XesW6ok
 6iFXktNeMhb2WWvZkeBold+nHKSI0r1M5cjwW866NprdSqshpjfbarDXL8mxaLHqdm4/
 OOOhbM3I5ljDgmwozyx3rZblQTM6KwdIUwUi552VFSTQcBQGnpdj8wMwK2k81EqIBcee
 pIh1PBKkSze4mtGcGsLOclzWysSPATeO2lHHJTkaRiPtmli+743kjVAZwvL9BOsI7p0j
 3bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ReGObfv/D4K6QzgU2LIKyHCTmv9OpLshjeCBO2s+5n0=;
 b=dsGLYVmgN68ZkwW8VC4XnNNYbdjieNyVZuf+Vl7uQ4+Pm/3Z0iumltadMAM5X6ENqK
 DZ5uQfzteMCuoD/xiRDX6C4X2Ap60KlFB0mwGTvhjAmlp40nxyQ1MYhnnWI1XkXYq4QU
 U0CPwlH+1831PGoRtQbUuWZX8lEP6yd/0XCRVS56RZJLa7t9DjDJeFvh2RGytNOG+o4I
 y5kH4M5ILaO43Vvn5WFt27fFu6EA24I5yOv7WhFntdRclj1vtt0jY0In5qPPSu8wYkYL
 ViCFxPLgKC8a2wwE0lqgivBjmSii1LeKWk4tt3DNYhU2E0LHhpQMAyhBMrLYk7a+8RAa
 SQ2w==
X-Gm-Message-State: AOAM532jKGDETdD/sXfgoY67B3Yq3BXEzuyFEb4W0POoqeophMUHH0UD
 hZcj0ha3pvsictatMfqpONtVN1pi475Uwl25
X-Google-Smtp-Source: ABdhPJxBTjC3MnX2ZNlPTtCl0x7vHP4E0sDZA8OGNWvdvQIZB7bdNtHX6/5NPNFzeXZmwSPkyd/HPg==
X-Received: by 2002:a63:f342:: with SMTP id t2mr1762619pgj.313.1601351789848; 
 Mon, 28 Sep 2020 20:56:29 -0700 (PDT)
Received: from [192.168.10.88] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with UTF8SMTPSA id n9sm2874208pgi.2.2020.09.28.20.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2020 20:56:29 -0700 (PDT)
Subject: Re: [PATCH v2 13/14] powerpc/pseries/iommu: Make use of DDW for
 indirect mapping
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-14-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <f3bc958f-a656-6481-0a19-3cff4dd3a4ff@ozlabs.ru>
Date: Tue, 29 Sep 2020 13:56:23 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:82.0) Gecko/20100101
 Thunderbird/82.0
MIME-Version: 1.0
In-Reply-To: <20200911170738.82818-14-leobras.c@gmail.com>
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
> So far it's assumed possible to map the guest RAM 1:1 to the bus, which
> works with a small number of devices. SRIOV changes it as the user can
> configure hundreds VFs and since phyp preallocates TCEs and does not
> allow IOMMU pages bigger than 64K, it has to limit the number of TCEs
> per a PE to limit waste of physical pages.
> 
> As of today, if the assumed direct mapping is not possible, DDW creation
> is skipped and the default DMA window "ibm,dma-window" is used instead.
> 
> The default DMA window uses 4k pages instead of 64k pages, and since
> the amount of pages (TCEs) may stay the same (on pHyp case), making
> use of DDW instead of the default DMA window for indirect mapping will
> expand in up to 16x the amount of memory that can be mapped on DMA.
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
> Note: ddw_memory_hotplug_max() was moved up so it can be used in
> find_existing_ddw().
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>   arch/powerpc/platforms/pseries/iommu.c | 160 ++++++++++++++++---------
>   1 file changed, 103 insertions(+), 57 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 9b7c03652e72..c4de23080d1b 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -375,6 +375,7 @@ static DEFINE_SPINLOCK(direct_window_list_lock);
>   /* protects initializing window twice for same device */
>   static DEFINE_MUTEX(direct_window_init_mutex);
>   #define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
> +#define DMA64_PROPNAME "linux,dma64-ddr-window-info"
>   
>   static int tce_clearrange_multi_pSeriesLP(unsigned long start_pfn,
>   					unsigned long num_pfn, const void *arg)
> @@ -846,10 +847,48 @@ static int remove_ddw(struct device_node *np, bool remove_prop, const char *win_
>   	return 0;
>   }
>   
> -static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
> +static phys_addr_t ddw_memory_hotplug_max(void)


Please, forward declaration or a separate patch; this creates 
unnecessary noise to the actual change.


> +{
> +	phys_addr_t max_addr = memory_hotplug_max();
> +	struct device_node *memory;
> +
> +	/*
> +	 * The "ibm,pmemory" can appear anywhere in the address space.
> +	 * Assuming it is still backed by page structs, set the upper limit
> +	 * for the huge DMA window as MAX_PHYSMEM_BITS.
> +	 */
> +	if (of_find_node_by_type(NULL, "ibm,pmemory"))
> +		return (sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
> +			(phys_addr_t)-1 : (1ULL << MAX_PHYSMEM_BITS);
> +
> +	for_each_node_by_type(memory, "memory") {
> +		unsigned long start, size;
> +		int n_mem_addr_cells, n_mem_size_cells, len;
> +		const __be32 *memcell_buf;
> +
> +		memcell_buf = of_get_property(memory, "reg", &len);
> +		if (!memcell_buf || len <= 0)
> +			continue;
> +
> +		n_mem_addr_cells = of_n_addr_cells(memory);
> +		n_mem_size_cells = of_n_size_cells(memory);
> +
> +		start = of_read_number(memcell_buf, n_mem_addr_cells);
> +		memcell_buf += n_mem_addr_cells;
> +		size = of_read_number(memcell_buf, n_mem_size_cells);
> +		memcell_buf += n_mem_size_cells;
> +
> +		max_addr = max_t(phys_addr_t, max_addr, start + size);
> +	}
> +
> +	return max_addr;
> +}
> +
> +static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, bool *direct_mapping)
>   {
>   	struct direct_window *window;
>   	const struct dynamic_dma_window_prop *direct64;
> +	unsigned long window_size;
>   	bool found = false;
>   
>   	spin_lock(&direct_window_list_lock);
> @@ -858,6 +897,10 @@ static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
>   		if (window->device == pdn) {
>   			direct64 = window->prop;
>   			*dma_addr = be64_to_cpu(direct64->dma_base);
> +
> +			window_size = (1UL << be32_to_cpu(direct64->window_shift));
> +			*direct_mapping = (window_size >= ddw_memory_hotplug_max());
> +
>   			found = true;
>   			break;
>   		}
> @@ -912,6 +955,7 @@ static int find_existing_ddw_windows(void)
>   		return 0;
>   
>   	find_existing_ddw_windows_named(DIRECT64_PROPNAME);
> +	find_existing_ddw_windows_named(DMA64_PROPNAME);
>   
>   	return 0;
>   }
> @@ -1054,43 +1098,6 @@ struct failed_ddw_pdn {
>   
>   static LIST_HEAD(failed_ddw_pdn_list);
>   
> -static phys_addr_t ddw_memory_hotplug_max(void)
> -{
> -	phys_addr_t max_addr = memory_hotplug_max();
> -	struct device_node *memory;
> -
> -	/*
> -	 * The "ibm,pmemory" can appear anywhere in the address space.
> -	 * Assuming it is still backed by page structs, set the upper limit
> -	 * for the huge DMA window as MAX_PHYSMEM_BITS.
> -	 */
> -	if (of_find_node_by_type(NULL, "ibm,pmemory"))
> -		return (sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
> -			(phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS);
> -
> -	for_each_node_by_type(memory, "memory") {
> -		unsigned long start, size;
> -		int n_mem_addr_cells, n_mem_size_cells, len;
> -		const __be32 *memcell_buf;
> -
> -		memcell_buf = of_get_property(memory, "reg", &len);
> -		if (!memcell_buf || len <= 0)
> -			continue;
> -
> -		n_mem_addr_cells = of_n_addr_cells(memory);
> -		n_mem_size_cells = of_n_size_cells(memory);
> -
> -		start = of_read_number(memcell_buf, n_mem_addr_cells);
> -		memcell_buf += n_mem_addr_cells;
> -		size = of_read_number(memcell_buf, n_mem_size_cells);
> -		memcell_buf += n_mem_size_cells;
> -
> -		max_addr = max_t(phys_addr_t, max_addr, start + size);
> -	}
> -
> -	return max_addr;
> -}
> -
>   /*
>    * Platforms supporting the DDW option starting with LoPAR level 2.7 implement
>    * ibm,ddw-extensions, which carries the rtas token for
> @@ -1173,14 +1180,19 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	struct device_node *dn;
>   	u32 ddw_avail[DDW_APPLICABLE_SIZE];
>   	struct direct_window *window;
> +	const char *win_name;
>   	struct property *win64 = NULL;
>   	struct failed_ddw_pdn *fpdn;
> -	bool default_win_removed = false;
> +	bool default_win_removed = false, direct_mapping = false;
> +	struct pci_dn *pci = PCI_DN(pdn);
> +	struct iommu_table *tbl = pci->table_group->tables[0];
>   
>   	mutex_lock(&direct_window_init_mutex);
>   
> -	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset))
> -		goto out_unlock;
> +	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &direct_mapping)) {
> +		mutex_unlock(&direct_window_init_mutex);
> +		return direct_mapping;
> +	}
>   
>   	/*
>   	 * If we already went through this for a previous function of
> @@ -1266,15 +1278,25 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	}
>   
>   	/* verify the window * number of ptes will map the partition */
> -	/* check largest block * page size > max memory hotplug addr */
>   	max_addr = ddw_memory_hotplug_max();
>   	if (query.largest_available_block < (max_addr >> page_shift)) {
> -		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu "
> -			  "%llu-sized pages\n", max_addr,  query.largest_available_block,
> -			  1ULL << page_shift);
> +		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu %llu-sized pages\n",
> +			max_addr, query.largest_available_block,
> +			1ULL << page_shift);
> +
> +		len = order_base_2(query.largest_available_block << page_shift);
> +		win_name = DMA64_PROPNAME;
> +	} else {
> +		direct_mapping = true;
> +		len = order_base_2(max_addr);
> +		win_name = DIRECT64_PROPNAME;
> +	}
> +
> +	/* DDW + IOMMU on single window may fail if there is any allocation */
> +	if (default_win_removed && !direct_mapping && iommu_table_in_use(tbl)) {
> +		dev_dbg(&dev->dev, "current IOMMU table in use, can't be replaced.\n");
>   		goto out_failed;
>   	}
> -	len = order_base_2(max_addr);
>   
>   	ret = create_ddw(dev, ddw_avail, &create, page_shift, len);
>   	if (ret != 0)
> @@ -1284,8 +1306,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   		create.liobn, dn);
>   
>   	win_addr = ((u64)create.addr_hi << 32) | create.addr_lo;
> -	win64 = ddw_property_create(DIRECT64_PROPNAME, create.liobn, win_addr,
> -				    page_shift, len);
> +	win64 = ddw_property_create(win_name, create.liobn, win_addr, page_shift, len);
>   	if (!win64) {
>   		dev_info(&dev->dev,
>   			 "couldn't allocate property, property name, or value\n");
> @@ -1300,15 +1321,37 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	}
>   
>   	window = ddw_list_new_entry(pdn, win64->value);
> -	if (!window)
> +	if (!window) {
> +		dev_dbg(&dev->dev, "couldn't create new list entry\n");
>   		goto out_prop_del;
> +	}
>   
> -	ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
> -			win64->value, tce_setrange_multi_pSeriesLP_walk);
> -	if (ret) {
> -		dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
> -			 dn, ret);
> -		goto out_list_del;
> +	if (direct_mapping) {
> +		/* DDW maps the whole partition, so enable direct DMA mapping */
> +		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
> +					    win64->value, tce_setrange_multi_pSeriesLP_walk);
> +		if (ret) {
> +			dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
> +				 dn, ret);
> +			goto out_list_del;
> +		}
> +	} else {
> +		/* New table for using DDW instead of the default DMA window */
> +		tbl = iommu_pseries_alloc_table(pci->phb->node);
> +		if (!tbl) {
> +			dev_dbg(&dev->dev, "couldn't create new IOMMU table\n");
> +			goto out_list_del;
> +		}
> +
> +		_iommu_table_setparms(tbl, pci->phb->bus->number, create.liobn, win_addr,
> +				      1UL << len, page_shift, 0, &iommu_table_lpar_multi_ops);
> +		iommu_init_table(tbl, pci->phb->node, 0, 0);


It is 0,0 only if win_addr>0 which is not the QEMU case.


> +
> +		/* Free old table and replace by the newer */
> +		iommu_tce_table_put(pci->table_group->tables[0]);
> +		pci->table_group->tables[0] = tbl;
> +
> +		set_iommu_table_base(&dev->dev, tbl);
>   	}
>   
>   	spin_lock(&direct_window_list_lock);
> @@ -1345,7 +1388,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   
>   out_unlock:
>   	mutex_unlock(&direct_window_init_mutex);
> -	return win64;
> +	return win64 && direct_mapping;
>   }
>   
>   static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
> @@ -1486,7 +1529,10 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
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
