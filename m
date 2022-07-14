Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BD6574640
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 10:00:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk6NY5mjNz3cCL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 18:00:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IEbw5AiV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IEbw5AiV;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lk6Mr6vNyz30LR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 17:59:36 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26E7hxE6001307;
	Thu, 14 Jul 2022 07:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZyJxEQmVAWqKpycD6/69GPooEDReIGIQYXwCVwna5ow=;
 b=IEbw5AiVk6S4RR5zYQnjntHJMMSczHhvspPyCjA79INgp//iPpkTpUPr/oOcoqmbgOdb
 P9P6MEQlHp3B5PvXMLyTpYqxxlbA8pjzWWHlRXzPx6QKVVybT6U8A9Tp0jCDsKJEFiFZ
 aPdf+5oIi5Wp7Uj4AQ0ubdz5EzOiulAck8/OfBQEwFsIlmBGZQSZVCKr1iyrGcI19uqp
 TBIMWdisZU5chjmfh6oGqhLRz8PC2rGjzdivp6LJ9rYd8RkyWz2A8FpELLwfaqsHjy/G
 zPk2ReNhxEZKIs0LRQ/OUd/zesL7nrKNlZYjr8U/wivwznZL9YBhjKCxGTLll1FAbh3A dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3haf0pra3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Jul 2022 07:59:33 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26E7oNbT027108;
	Thu, 14 Jul 2022 07:59:33 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3haf0pra2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Jul 2022 07:59:33 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26E7sY86024727;
	Thu, 14 Jul 2022 07:59:31 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04fra.de.ibm.com with ESMTP id 3h99s79wr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Jul 2022 07:59:31 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26E7vsRN19661288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Jul 2022 07:57:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD2A411C04A;
	Thu, 14 Jul 2022 07:59:27 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7846111C052;
	Thu, 14 Jul 2022 07:59:24 +0000 (GMT)
Received: from [9.211.37.226] (unknown [9.211.37.226])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 14 Jul 2022 07:59:24 +0000 (GMT)
Message-ID: <26065e2a-b64e-22ba-8522-ff5ae563e2cf@linux.ibm.com>
Date: Thu, 14 Jul 2022 13:29:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH kernel v2] pseries/iommu/ddw: Fix kdump to work in absence
 of ibm,dma-window
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20220629060614.1680476-1-aik@ozlabs.ru>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20220629060614.1680476-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VBlSfimYD_lmej8TX7nLpTmCdcwT6zE4
X-Proofpoint-ORIG-GUID: _4U1ReqfuzitFYevpwNNzdgBDxCy2eI6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-14_04,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207140030
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Leonardo Bras <leobras.c@gmail.com>, Andrew Donnellan <ajd@linux.ibm.com>, Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 29/06/22 11:36 am, Alexey Kardashevskiy wrote:
> The pseries platform uses 32bit default DMA window (always 4K pages) and
> optional 64bit DMA window available via DDW ("Dynamic DMA Windows"),
> 64K or 2M pages. For ages the default one was not removed and a huge
> window was created in addition. Things changed with SRIOV-enabled
> PowerVM which creates a default-and-bigger DMA window in 64bit space
> (still using 4K pages) for IOV VFs so certain OSes do not need to use
> the DDW API in order to utilize all available TCE budget.
> 
> Linux on the other hand removes the default window and creates a bigger
> one (with more TCEs or/and a bigger page size - 64K/2M) in a bid to map
> the entire RAM, and if the new window size is smaller than that - it
> still uses this new bigger window. The result is that the default window
> is removed but the "ibm,dma-window" property is not.
> 
> When kdump is invoked, the existing code tries reusing the existing 64bit
> DMA window which location and parameters are stored in the device tree but
> this fails as the new property does not make it to the kdump device tree
> blob. So the code falls back to the default window which does not exist
> anymore although the device tree says that it does. The result of that
> is that PCI devices become unusable and cannot be used for kdumping.
> 
> This preserves the DMA64 and DIRECT64 properties in the device tree blob
> for the crash kernel. Since the crash kernel setup is done after device
> drivers are loaded and probed, the proper DMA config is stored at least
> for boot time devices.
> 
> Because DDW window is optional and the code configures the default window
> first, the existing code creates an IOMMU table descriptor for
> the non-existing default DMA window. It is harmless for kdump as it does
> not touch the actual window (only reads what is mapped and marks those IO
> pages as used) but it is bad for kexec which clears it thinking it is
> a smaller default window rather than a bigger DDW window.
> 
> This removes the "ibm,dma-window" property from the device tree after
> a bigger window is created and the crash kernel setup picks it up.

> Fixes: 381ceda88c4c ("powerpc/pseries/iommu: Make use of DDW for indirect mapping")
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Maybe another day  but one more reason why fdt should be prepared from
the current unflatted dt instead of initial_boot_params. ..

Anyway, the patch looks good to me..

Acked-by: Hari Bathini <hbathini@linux.ibm.com>

> ---
> 
> Looks like SYSCALL(kexec_file_load) never supported DMA. so it could be:
> Fixes: a0458284f062 ("powerpc: Add support code for kexec_file_load()")
> 
> ---
> Changes:
> v2:
> * reworked enable_ddw() to reuse default_win
> * removed @tbl as it was only used once and later on this zeroes it
> * undef for xxx64_PROPNAME in file_load_64.c
> * renamed new functions in file_load_64.c
> ---
>   arch/powerpc/kexec/file_load_64.c      | 54 ++++++++++++++++
>   arch/powerpc/platforms/pseries/iommu.c | 89 ++++++++++++++------------
>   2 files changed, 102 insertions(+), 41 deletions(-)
> 
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index b4981b651d9a..5d2c22aa34fb 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -1038,6 +1038,48 @@ static int update_cpus_node(void *fdt)
>   	return ret;
>   }
>   
> +static int copy_property(void *fdt, int node_offset, const struct device_node *dn,
> +			 const char *propname)
> +{
> +	const void *prop, *fdtprop;
> +	int len = 0, fdtlen = 0, ret;
> +
> +	prop = of_get_property(dn, propname, &len);
> +	fdtprop = fdt_getprop(fdt, node_offset, propname, &fdtlen);
> +
> +	if (fdtprop && !prop)
> +		ret = fdt_delprop(fdt, node_offset, propname);
> +	else if (prop)
> +		ret = fdt_setprop(fdt, node_offset, propname, prop, len);
> +
> +	return ret;
> +}
> +
> +static int update_pci_dma_nodes(void *fdt, const char *dmapropname)
> +{
> +	struct device_node *dn;
> +	int pci_offset, root_offset, ret = 0;
> +
> +	if (!firmware_has_feature(FW_FEATURE_LPAR))
> +		return 0;
> +
> +	root_offset = fdt_path_offset(fdt, "/");
> +	for_each_node_with_property(dn, dmapropname) {
> +		pci_offset = fdt_subnode_offset(fdt, root_offset, of_node_full_name(dn));
> +		if (pci_offset < 0)
> +			continue;
> +
> +		ret = copy_property(fdt, pci_offset, dn, "ibm,dma-window");
> +		if (ret < 0)
> +			break;
> +		ret = copy_property(fdt, pci_offset, dn, dmapropname);
> +		if (ret < 0)
> +			break;
> +	}
> +
> +	return ret;
> +}
> +
>   /**
>    * setup_new_fdt_ppc64 - Update the flattend device-tree of the kernel
>    *                       being loaded.
> @@ -1099,6 +1141,18 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
>   	if (ret < 0)
>   		goto out;
>   
> +#define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
> +#define DMA64_PROPNAME "linux,dma64-ddr-window-info"
> +	ret = update_pci_dma_nodes(fdt, DIRECT64_PROPNAME);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = update_pci_dma_nodes(fdt, DMA64_PROPNAME);
> +	if (ret < 0)
> +		goto out;
> +#undef DMA64_PROPNAME
> +#undef DIRECT64_PROPNAME
> +
>   	/* Update memory reserve map */
>   	ret = get_reserved_memory_ranges(&rmem);
>   	if (ret)
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index fba64304e859..c3d425ef7b39 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -700,6 +700,33 @@ struct iommu_table_ops iommu_table_lpar_multi_ops = {
>   	.get = tce_get_pSeriesLP
>   };
>   
> +/*
> + * Find nearest ibm,dma-window (default DMA window) or direct DMA window or
> + * dynamic 64bit DMA window, walking up the device tree.
> + */
> +static struct device_node *pci_dma_find(struct device_node *dn,
> +					const __be32 **dma_window)
> +{
> +	const __be32 *dw = NULL;
> +
> +	for ( ; dn && PCI_DN(dn); dn = dn->parent) {
> +		dw = of_get_property(dn, "ibm,dma-window", NULL);
> +		if (dw) {
> +			if (dma_window)
> +				*dma_window = dw;
> +			return dn;
> +		}
> +		dw = of_get_property(dn, DIRECT64_PROPNAME, NULL);
> +		if (dw)
> +			return dn;
> +		dw = of_get_property(dn, DMA64_PROPNAME, NULL);
> +		if (dw)
> +			return dn;
> +	}
> +
> +	return NULL;
> +}
> +
>   static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
>   {
>   	struct iommu_table *tbl;
> @@ -712,20 +739,10 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
>   	pr_debug("pci_dma_bus_setup_pSeriesLP: setting up bus %pOF\n",
>   		 dn);
>   
> -	/*
> -	 * Find nearest ibm,dma-window (default DMA window), walking up the
> -	 * device tree
> -	 */
> -	for (pdn = dn; pdn != NULL; pdn = pdn->parent) {
> -		dma_window = of_get_property(pdn, "ibm,dma-window", NULL);
> -		if (dma_window != NULL)
> -			break;
> -	}
> +	pdn = pci_dma_find(dn, &dma_window);
>   
> -	if (dma_window == NULL) {
> +	if (dma_window == NULL)
>   		pr_debug("  no ibm,dma-window property !\n");
> -		return;
> -	}
>   
>   	ppci = PCI_DN(pdn);
>   
> @@ -735,11 +752,13 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
>   	if (!ppci->table_group) {
>   		ppci->table_group = iommu_pseries_alloc_group(ppci->phb->node);
>   		tbl = ppci->table_group->tables[0];
> -		iommu_table_setparms_lpar(ppci->phb, pdn, tbl,
> -				ppci->table_group, dma_window);
> +		if (dma_window) {
> +			iommu_table_setparms_lpar(ppci->phb, pdn, tbl,
> +						  ppci->table_group, dma_window);
>   
> -		if (!iommu_init_table(tbl, ppci->phb->node, 0, 0))
> -			panic("Failed to initialize iommu table");
> +			if (!iommu_init_table(tbl, ppci->phb->node, 0, 0))
> +				panic("Failed to initialize iommu table");
> +		}
>   		iommu_register_group(ppci->table_group,
>   				pci_domain_nr(bus), 0);
>   		pr_debug("  created table: %p\n", ppci->table_group);
> @@ -1232,7 +1251,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	bool default_win_removed = false, direct_mapping = false;
>   	bool pmem_present;
>   	struct pci_dn *pci = PCI_DN(pdn);
> -	struct iommu_table *tbl = pci->table_group->tables[0];
> +	struct property *default_win = NULL;
>   
>   	dn = of_find_node_by_type(NULL, "ibm,pmemory");
>   	pmem_present = dn != NULL;
> @@ -1289,11 +1308,10 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	 * for extensions presence.
>   	 */
>   	if (query.windows_available == 0) {
> -		struct property *default_win;
>   		int reset_win_ext;
>   
>   		/* DDW + IOMMU on single window may fail if there is any allocation */
> -		if (iommu_table_in_use(tbl)) {
> +		if (iommu_table_in_use(pci->table_group->tables[0])) {
>   			dev_warn(&dev->dev, "current IOMMU table in use, can't be replaced.\n");
>   			goto out_failed;
>   		}
> @@ -1429,16 +1447,18 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   
>   		pci->table_group->tables[1] = newtbl;
>   
> -		/* Keep default DMA window struct if removed */
> -		if (default_win_removed) {
> -			tbl->it_size = 0;
> -			vfree(tbl->it_map);
> -			tbl->it_map = NULL;
> -		}
> -
>   		set_iommu_table_base(&dev->dev, newtbl);
>   	}
>   
> +	if (default_win_removed) {
> +		iommu_tce_table_put(pci->table_group->tables[0]);
> +		pci->table_group->tables[0] = NULL;
> +
> +		/* default_win is valid here because default_win_removed == true */
> +		of_remove_property(pdn, default_win);
> +		dev_info(&dev->dev, "Removed default DMA window for %pOF\n", pdn);
> +	}
> +
>   	spin_lock(&dma_win_list_lock);
>   	list_add(&window->list, &dma_win_list);
>   	spin_unlock(&dma_win_list_lock);
> @@ -1503,13 +1523,7 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
>   	dn = pci_device_to_OF_node(dev);
>   	pr_debug("  node is %pOF\n", dn);
>   
> -	for (pdn = dn; pdn && PCI_DN(pdn) && !PCI_DN(pdn)->table_group;
> -	     pdn = pdn->parent) {
> -		dma_window = of_get_property(pdn, "ibm,dma-window", NULL);
> -		if (dma_window)
> -			break;
> -	}
> -
> +	pdn = pci_dma_find(dn, &dma_window);
>   	if (!pdn || !PCI_DN(pdn)) {
>   		printk(KERN_WARNING "pci_dma_dev_setup_pSeriesLP: "
>   		       "no DMA window found for pci dev=%s dn=%pOF\n",
> @@ -1540,7 +1554,6 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
>   static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
>   {
>   	struct device_node *dn = pci_device_to_OF_node(pdev), *pdn;
> -	const __be32 *dma_window = NULL;
>   
>   	/* only attempt to use a new window if 64-bit DMA is requested */
>   	if (dma_mask < DMA_BIT_MASK(64))
> @@ -1554,13 +1567,7 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
>   	 * search upwards in the tree until we either hit a dma-window
>   	 * property, OR find a parent with a table already allocated.
>   	 */
> -	for (pdn = dn; pdn && PCI_DN(pdn) && !PCI_DN(pdn)->table_group;
> -			pdn = pdn->parent) {
> -		dma_window = of_get_property(pdn, "ibm,dma-window", NULL);
> -		if (dma_window)
> -			break;
> -	}
> -
> +	pdn = pci_dma_find(dn, NULL);
>   	if (pdn && PCI_DN(pdn))
>   		return enable_ddw(pdev, pdn);
>   
