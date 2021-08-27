Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D6B3F9D42
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 19:08:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx5kj03Nsz3bWT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 03:07:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i7aOsq7D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=i7aOsq7D; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx5jx4hH8z2yn0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 03:07:17 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17RH6ehs006156; Fri, 27 Aug 2021 13:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MkfbKmpvrxdd8FwJUXIrFDgZUyNh8Nacy6aarX7YHd8=;
 b=i7aOsq7DrgyEFKAUDR/A9GNv7ttqZvLgN5hlcpQm8D4hCPVFu6jHtQ4ojDx1TRO265Zy
 PrBEkFFcOSs3//OzcTLYTCXhT/NgrEaAiZrhHcedFkiz/cIAne5FSzcKh04b9ASlgAmG
 353aMHeGvfXKz3/a16rDnkbcXwKaQdvflv613pXRV5Zut6AD1dzBkpnaV5WbVGMTMRl/
 xH0G09c9l9zErS+dLmgh5zYiRq3eQ6HqjLMu8mN0WystjrRsZSJF1T9zO1N8eeTd/5g0
 jJ9ARPBU/RNWls7JvE+brAv9TqyLS9UKgLIrsSK9mSD+Gxa9NPHSs7sjs9Qgq9UB7onz rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aq36aspgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 13:07:11 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17RH6h85006490;
 Fri, 27 Aug 2021 13:07:10 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aq36asp04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 13:07:10 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17RH69rf030133;
 Fri, 27 Aug 2021 17:06:47 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3ajs48swhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 17:06:47 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17RH6jv435455236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:06:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B24652073;
 Fri, 27 Aug 2021 17:06:45 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.153.220])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A887D5204E;
 Fri, 27 Aug 2021 17:06:44 +0000 (GMT)
Subject: Re: [PATCH v6 10/11] powerpc/pseries/iommu: Make use of DDW for
 indirect mapping
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 Nicolin Chen <nicoleotsuka@gmail.com>, kernel test robot <lkp@intel.com>
References: <20210817063929.38701-1-leobras.c@gmail.com>
 <20210817063929.38701-11-leobras.c@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <3d79480a-20df-ea1a-e17f-8bf2c8a8a2be@linux.ibm.com>
Date: Fri, 27 Aug 2021 19:06:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817063929.38701-11-leobras.c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3Kq-2fJjEcN9ANvJKqy_yMWZFHVEy2PC
X-Proofpoint-ORIG-GUID: hiPoJY_iS1NkOoHU8zIOh0rppydoA108
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-27_05:2021-08-27,
 2021-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108270102
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



On 17/08/2021 08:39, Leonardo Bras wrote:
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


I think it looks ok now as it was mostly me who was misunderstanding one 
part of the previous iteration.
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

Sorry for the late review, I was enjoying some time off. And thanks for 
that series, I believe it should help with those bugs complaining about 
lack of DMA space. It was also very educational for me, thanks to you 
and Alexey for your detailed answers.

   Fred


>   arch/powerpc/platforms/pseries/iommu.c | 89 +++++++++++++++++++++-----
>   1 file changed, 74 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index e11c00b2dc1e..0eccc29f5573 100644
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
> @@ -940,6 +941,7 @@ static int find_existing_ddw_windows(void)
>   		return 0;
>   
>   	find_existing_ddw_windows_named(DIRECT64_PROPNAME);
> +	find_existing_ddw_windows_named(DMA64_PROPNAME);
>   
>   	return 0;
>   }
> @@ -1226,14 +1228,17 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	struct ddw_create_response create;
>   	int page_shift;
>   	u64 win_addr;
> +	const char *win_name;
>   	struct device_node *dn;
>   	u32 ddw_avail[DDW_APPLICABLE_SIZE];
>   	struct direct_window *window;
>   	struct property *win64;
>   	bool ddw_enabled = false;
>   	struct failed_ddw_pdn *fpdn;
> -	bool default_win_removed = false;
> +	bool default_win_removed = false, direct_mapping = false;
>   	bool pmem_present;
> +	struct pci_dn *pci = PCI_DN(pdn);
> +	struct iommu_table *tbl = pci->table_group->tables[0];
>   
>   	dn = of_find_node_by_type(NULL, "ibm,pmemory");
>   	pmem_present = dn != NULL;
> @@ -1242,6 +1247,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	mutex_lock(&direct_window_init_mutex);
>   
>   	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &len)) {
> +		direct_mapping = (len >= max_ram_len);
>   		ddw_enabled = true;
>   		goto out_unlock;
>   	}
> @@ -1322,8 +1328,8 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   			  query.page_size);
>   		goto out_failed;
>   	}
> -	/* verify the window * number of ptes will map the partition */
> -	/* check largest block * page size > max memory hotplug addr */
> +
> +
>   	/*
>   	 * The "ibm,pmemory" can appear anywhere in the address space.
>   	 * Assuming it is still backed by page structs, try MAX_PHYSMEM_BITS
> @@ -1339,13 +1345,25 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   			dev_info(&dev->dev, "Skipping ibm,pmemory");
>   	}
>   
> +	/* check if the available block * number of ptes will map everything */
>   	if (query.largest_available_block < (1ULL << (len - page_shift))) {
>   		dev_dbg(&dev->dev,
>   			"can't map partition max 0x%llx with %llu %llu-sized pages\n",
>   			1ULL << len,
>   			query.largest_available_block,
>   			1ULL << page_shift);
> -		goto out_failed;
> +
> +		/* DDW + IOMMU on single window may fail if there is any allocation */
> +		if (default_win_removed && iommu_table_in_use(tbl)) {
> +			dev_dbg(&dev->dev, "current IOMMU table in use, can't be replaced.\n");
> +			goto out_failed;
> +		}
> +
> +		len = order_base_2(query.largest_available_block << page_shift);
> +		win_name = DMA64_PROPNAME;
> +	} else {
> +		direct_mapping = true;
> +		win_name = DIRECT64_PROPNAME;
>   	}
>   
>   	ret = create_ddw(dev, ddw_avail, &create, page_shift, len);
> @@ -1356,8 +1374,8 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   		  create.liobn, dn);
>   
>   	win_addr = ((u64)create.addr_hi << 32) | create.addr_lo;
> -	win64 = ddw_property_create(DIRECT64_PROPNAME, create.liobn, win_addr,
> -				    page_shift, len);
> +	win64 = ddw_property_create(win_name, create.liobn, win_addr, page_shift, len);
> +
>   	if (!win64) {
>   		dev_info(&dev->dev,
>   			 "couldn't allocate property, property name, or value\n");
> @@ -1375,15 +1393,54 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	if (!window)
>   		goto out_del_prop;
>   
> -	ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
> -			win64->value, tce_setrange_multi_pSeriesLP_walk);
> -	if (ret) {
> -		dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
> -			 dn, ret);
> +	if (direct_mapping) {
> +		/* DDW maps the whole partition, so enable direct DMA mapping */
> +		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
> +					    win64->value, tce_setrange_multi_pSeriesLP_walk);
> +		if (ret) {
> +			dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
> +				 dn, ret);
>   
>   		/* Make sure to clean DDW if any TCE was set*/
>   		clean_dma_window(pdn, win64->value);
> -		goto out_del_list;
> +			goto out_del_list;
> +		}
> +	} else {
> +		struct iommu_table *newtbl;
> +		int i;
> +
> +		for (i = 0; i < ARRAY_SIZE(pci->phb->mem_resources); i++) {
> +			const unsigned long mask = IORESOURCE_MEM_64 | IORESOURCE_MEM;
> +
> +			/* Look for MMIO32 */
> +			if ((pci->phb->mem_resources[i].flags & mask) == IORESOURCE_MEM)
> +				break;
> +		}
> +
> +		if (i == ARRAY_SIZE(pci->phb->mem_resources))
> +			goto out_del_list;
> +
> +		/* New table for using DDW instead of the default DMA window */
> +		newtbl = iommu_pseries_alloc_table(pci->phb->node);
> +		if (!newtbl) {
> +			dev_dbg(&dev->dev, "couldn't create new IOMMU table\n");
> +			goto out_del_list;
> +		}
> +
> +		iommu_table_setparms_common(newtbl, pci->phb->bus->number, create.liobn, win_addr,
> +					    1UL << len, page_shift, NULL, &iommu_table_lpar_multi_ops);
> +		iommu_init_table(newtbl, pci->phb->node, pci->phb->mem_resources[i].start,
> +				 pci->phb->mem_resources[i].end);
> +
> +		pci->table_group->tables[1] = newtbl;
> +
> +		/* Keep default DMA window stuct if removed */
> +		if (default_win_removed) {
> +			tbl->it_size = 0;
> +			kfree(tbl->it_map);
> +		}
> +
> +		set_iommu_table_base(&dev->dev, newtbl);
>   	}
>   
>   	spin_lock(&direct_window_list_lock);
> @@ -1427,10 +1484,10 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	 * as RAM, then we failed to create a window to cover persistent
>   	 * memory and need to set the DMA limit.
>   	 */
> -	if (pmem_present && ddw_enabled && (len == max_ram_len))
> +	if (pmem_present && ddw_enabled && direct_mapping && len == max_ram_len)
>   		dev->dev.bus_dma_limit = dev->dev.archdata.dma_offset + (1ULL << len);
>   
> -	return ddw_enabled;
> +    return ddw_enabled && direct_mapping;
>   }
>   
>   static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
> @@ -1572,7 +1629,9 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
>   		 * we have to remove the property when releasing
>   		 * the device node.
>   		 */
> -		remove_ddw(np, false, DIRECT64_PROPNAME);
> +		if (remove_ddw(np, false, DIRECT64_PROPNAME))
> +			remove_ddw(np, false, DMA64_PROPNAME);
> +
>   		if (pci && pci->table_group)
>   			iommu_pseries_free_group(pci->table_group,
>   					np->full_name);
> 
