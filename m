Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 653753D0150
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 20:13:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTn022Mxwz3bpw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 04:13:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o4k+zePw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=o4k+zePw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTmzX2G6Cz3bhP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 04:13:12 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KI3aJH096173; Tue, 20 Jul 2021 14:13:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0RZshLWI22E42zj33l6BQMMuDmxHaoDW9rAw8LSl5LU=;
 b=o4k+zePwLWddoqfR+lSxxJRWyhROufy20g3Me6+ZbI/gSdFIE4FndmvNI9IvJxDxjFMC
 9lxhtaepWX5UMSo6YNpsei7wrxJvxmcuvur6QwGFqVMQhBdaJQsY+cw3qKioxf6FiXPY
 UKHY7GoB4cJf3mgblJ27Wl57TiEfqmPmRLmnI+Q1YuKTkSX3L35bwUZlCrmmAo5GbGMK
 AclS10os3xGRbZtDpreniChsdD4TLKpZe40oErWhfCB1SfEukqx2tcEL7hYHiQgp6hRH
 aFX6E9ZfSzGRknzWZ1Mu4VoRqVLnL96424HwBklWsl1pBazwAh9jA0T0oEHoj7pjYeU5 gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39x292tnt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 14:13:03 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16KI4AbJ098471;
 Tue, 20 Jul 2021 14:13:03 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39x292tnru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 14:13:03 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16KICooR006569;
 Tue, 20 Jul 2021 18:13:01 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 39upu88uua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 18:13:01 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16KICwGo26542348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 18:12:59 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD6064C058;
 Tue, 20 Jul 2021 18:12:58 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 666894C040;
 Tue, 20 Jul 2021 18:12:58 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.178.12])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Jul 2021 18:12:58 +0000 (GMT)
Subject: Re: [PATCH v5 11/11] powerpc/pseries/iommu: Rename "direct window" to
 "dma window"
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>, kernel test robot
 <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-12-leobras.c@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <2c29cdfc-a5b7-4b12-b254-c01b48e30663@linux.ibm.com>
Date: Tue, 20 Jul 2021 20:12:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716082755.428187-12-leobras.c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OWn6kLEBx291A8Pyt-jr9og46hv6asxj
X-Proofpoint-GUID: SlfgKJmbCXBSrUGWDfhyunF-Xz6k5ETf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_12:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107200119
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



On 16/07/2021 10:27, Leonardo Bras wrote:
> A previous change introduced the usage of DDW as a bigger indirect DMA
> mapping when the DDW available size does not map the whole partition.
> 
> As most of the code that manipulates direct mappings was reused for
> indirect mappings, it's necessary to rename all names and debug/info
> messages to reflect that it can be used for both kinds of mapping.
> 
> This should cause no behavioural change, just adjust naming.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---


LGTM:
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>



>   arch/powerpc/platforms/pseries/iommu.c | 91 +++++++++++++-------------
>   1 file changed, 47 insertions(+), 44 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index a67e71c49aeb..52548dfb8b45 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -349,7 +349,7 @@ struct dynamic_dma_window_prop {
>   	__be32	window_shift;	/* ilog2(tce_window_size) */
>   };
>   
> -struct direct_window {
> +struct dma_win {
>   	struct device_node *device;
>   	const struct dynamic_dma_window_prop *prop;
>   	struct list_head list;
> @@ -369,11 +369,11 @@ struct ddw_create_response {
>   	u32 addr_lo;
>   };
>   
> -static LIST_HEAD(direct_window_list);
> +static LIST_HEAD(dma_win_list);
>   /* prevents races between memory on/offline and window creation */
> -static DEFINE_SPINLOCK(direct_window_list_lock);
> +static DEFINE_SPINLOCK(dma_win_list_lock);
>   /* protects initializing window twice for same device */
> -static DEFINE_MUTEX(direct_window_init_mutex);
> +static DEFINE_MUTEX(dma_win_init_mutex);
>   #define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
>   #define DMA64_PROPNAME "linux,dma64-ddr-window-info"
>   
> @@ -713,7 +713,10 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
>   	pr_debug("pci_dma_bus_setup_pSeriesLP: setting up bus %pOF\n",
>   		 dn);
>   
> -	/* Find nearest ibm,dma-window, walking up the device tree */
> +	/*
> +	 * Find nearest ibm,dma-window (default DMA window), walking up the
> +	 * device tree
> +	 */
>   	for (pdn = dn; pdn != NULL; pdn = pdn->parent) {
>   		dma_window = of_get_property(pdn, "ibm,dma-window", NULL);
>   		if (dma_window != NULL)
> @@ -822,11 +825,11 @@ static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
>   
>   	ret = rtas_call(ddw_avail[DDW_REMOVE_PE_DMA_WIN], 1, 1, NULL, liobn);
>   	if (ret)
> -		pr_warn("%pOF: failed to remove direct window: rtas returned "
> +		pr_warn("%pOF: failed to remove DMA window: rtas returned "
>   			"%d to ibm,remove-pe-dma-window(%x) %llx\n",
>   			np, ret, ddw_avail[DDW_REMOVE_PE_DMA_WIN], liobn);
>   	else
> -		pr_debug("%pOF: successfully removed direct window: rtas returned "
> +		pr_debug("%pOF: successfully removed DMA window: rtas returned "
>   			"%d to ibm,remove-pe-dma-window(%x) %llx\n",
>   			np, ret, ddw_avail[DDW_REMOVE_PE_DMA_WIN], liobn);
>   }
> @@ -854,37 +857,37 @@ static int remove_ddw(struct device_node *np, bool remove_prop, const char *win_
>   
>   	ret = of_remove_property(np, win);
>   	if (ret)
> -		pr_warn("%pOF: failed to remove direct window property: %d\n",
> +		pr_warn("%pOF: failed to remove DMA window property: %d\n",
>   			np, ret);
>   	return 0;
>   }
>   
>   static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, int *window_shift)
>   {
> -	struct direct_window *window;
> -	const struct dynamic_dma_window_prop *direct64;
> +	struct dma_win *window;
> +	const struct dynamic_dma_window_prop *dma64;
>   	bool found = false;
>   
> -	spin_lock(&direct_window_list_lock);
> +	spin_lock(&dma_win_list_lock);
>   	/* check if we already created a window and dupe that config if so */
> -	list_for_each_entry(window, &direct_window_list, list) {
> +	list_for_each_entry(window, &dma_win_list, list) {
>   		if (window->device == pdn) {
> -			direct64 = window->prop;
> -			*dma_addr = be64_to_cpu(direct64->dma_base);
> -			*window_shift = be32_to_cpu(direct64->window_shift);
> +			dma64 = window->prop;
> +			*dma_addr = be64_to_cpu(dma64->dma_base);
> +			*window_shift = be32_to_cpu(dma64->window_shift);
>   			found = true;
>   			break;
>   		}
>   	}
> -	spin_unlock(&direct_window_list_lock);
> +	spin_unlock(&dma_win_list_lock);
>   
>   	return found;
>   }
>   
> -static struct direct_window *ddw_list_new_entry(struct device_node *pdn,
> -						const struct dynamic_dma_window_prop *dma64)
> +static struct dma_win *ddw_list_new_entry(struct device_node *pdn,
> +					  const struct dynamic_dma_window_prop *dma64)
>   {
> -	struct direct_window *window;
> +	struct dma_win *window;
>   
>   	window = kzalloc(sizeof(*window), GFP_KERNEL);
>   	if (!window)
> @@ -900,7 +903,7 @@ static void find_existing_ddw_windows_named(const char *name)
>   {
>   	int len;
>   	struct device_node *pdn;
> -	struct direct_window *window;
> +	struct dma_win *window;
>   	const struct dynamic_dma_window_prop *dma64;
>   
>   	for_each_node_with_property(pdn, name) {
> @@ -914,9 +917,9 @@ static void find_existing_ddw_windows_named(const char *name)
>   		if (!window)
>   			break;
>   
> -		spin_lock(&direct_window_list_lock);
> -		list_add(&window->list, &direct_window_list);
> -		spin_unlock(&direct_window_list_lock);
> +		spin_lock(&dma_win_list_lock);
> +		list_add(&window->list, &dma_win_list);
> +		spin_unlock(&dma_win_list_lock);
>   	}
>   }
>   
> @@ -1216,7 +1219,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	const char *win_name;
>   	struct device_node *dn;
>   	u32 ddw_avail[DDW_APPLICABLE_SIZE];
> -	struct direct_window *window;
> +	struct dma_win *window;
>   	struct property *win64;
>   	bool ddw_enabled = false;
>   	struct failed_ddw_pdn *fpdn;
> @@ -1229,7 +1232,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	pmem_present = dn != NULL;
>   	of_node_put(dn);
>   
> -	mutex_lock(&direct_window_init_mutex);
> +	mutex_lock(&dma_win_init_mutex);
>   
>   	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &len)) {
>   		direct_mapping = (len >= max_ram_len);
> @@ -1309,8 +1312,8 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   
>   	page_shift = iommu_get_page_shift(query.page_size);
>   	if (!page_shift) {
> -		dev_dbg(&dev->dev, "no supported direct page size in mask %x",
> -			  query.page_size);
> +		dev_dbg(&dev->dev, "no supported page size in mask %x",
> +			query.page_size);
>   		goto out_failed;
>   	}
>   
> @@ -1367,7 +1370,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   
>   	ret = of_add_property(pdn, win64);
>   	if (ret) {
> -		dev_err(&dev->dev, "unable to add dma window property for %pOF: %d",
> +		dev_err(&dev->dev, "unable to add DMA window property for %pOF: %d",
>   			pdn, ret);
>   		goto out_free_prop;
>   	}
> @@ -1381,7 +1384,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
>   					    win64->value, tce_setrange_multi_pSeriesLP_walk);
>   		if (ret) {
> -			dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
> +			dev_info(&dev->dev, "failed to map DMA window for %pOF: %d\n",
>   				 dn, ret);
>   			goto out_del_list;
>   		}
> @@ -1423,9 +1426,9 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   		set_iommu_table_base(&dev->dev, newtbl);
>   	}
>   
> -	spin_lock(&direct_window_list_lock);
> -	list_add(&window->list, &direct_window_list);
> -	spin_unlock(&direct_window_list_lock);
> +	spin_lock(&dma_win_list_lock);
> +	list_add(&window->list, &dma_win_list);
> +	spin_unlock(&dma_win_list_lock);
>   
>   	dev->dev.archdata.dma_offset = win_addr;
>   	ddw_enabled = true;
> @@ -1456,7 +1459,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	list_add(&fpdn->list, &failed_ddw_pdn_list);
>   
>   out_unlock:
> -	mutex_unlock(&direct_window_init_mutex);
> +	mutex_unlock(&dma_win_init_mutex);
>   
>   	/*
>   	 * If we have persistent memory and the window size is only as big
> @@ -1554,29 +1557,29 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
>   static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
>   		void *data)
>   {
> -	struct direct_window *window;
> +	struct dma_win *window;
>   	struct memory_notify *arg = data;
>   	int ret = 0;
>   
>   	switch (action) {
>   	case MEM_GOING_ONLINE:
> -		spin_lock(&direct_window_list_lock);
> -		list_for_each_entry(window, &direct_window_list, list) {
> +		spin_lock(&dma_win_list_lock);
> +		list_for_each_entry(window, &dma_win_list, list) {
>   			ret |= tce_setrange_multi_pSeriesLP(arg->start_pfn,
>   					arg->nr_pages, window->prop);
>   			/* XXX log error */
>   		}
> -		spin_unlock(&direct_window_list_lock);
> +		spin_unlock(&dma_win_list_lock);
>   		break;
>   	case MEM_CANCEL_ONLINE:
>   	case MEM_OFFLINE:
> -		spin_lock(&direct_window_list_lock);
> -		list_for_each_entry(window, &direct_window_list, list) {
> +		spin_lock(&dma_win_list_lock);
> +		list_for_each_entry(window, &dma_win_list, list) {
>   			ret |= tce_clearrange_multi_pSeriesLP(arg->start_pfn,
>   					arg->nr_pages, window->prop);
>   			/* XXX log error */
>   		}
> -		spin_unlock(&direct_window_list_lock);
> +		spin_unlock(&dma_win_list_lock);
>   		break;
>   	default:
>   		break;
> @@ -1597,7 +1600,7 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
>   	struct of_reconfig_data *rd = data;
>   	struct device_node *np = rd->dn;
>   	struct pci_dn *pci = PCI_DN(np);
> -	struct direct_window *window;
> +	struct dma_win *window;
>   
>   	switch (action) {
>   	case OF_RECONFIG_DETACH_NODE:
> @@ -1615,15 +1618,15 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
>   			iommu_pseries_free_group(pci->table_group,
>   					np->full_name);
>   
> -		spin_lock(&direct_window_list_lock);
> -		list_for_each_entry(window, &direct_window_list, list) {
> +		spin_lock(&dma_win_list_lock);
> +		list_for_each_entry(window, &dma_win_list, list) {
>   			if (window->device == np) {
>   				list_del(&window->list);
>   				kfree(window);
>   				break;
>   			}
>   		}
> -		spin_unlock(&direct_window_list_lock);
> +		spin_unlock(&dma_win_list_lock);
>   		break;
>   	default:
>   		err = NOTIFY_DONE;
> 
