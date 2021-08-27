Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F973F9D13
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 18:56:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx5Th5xcGz2ypb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 02:56:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FG8VPi35;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FG8VPi35; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx5Sx0J05z2xYD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 02:56:00 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17RGXcPm116405; Fri, 27 Aug 2021 12:55:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1IJzVCg/bUDCLNyiQ3q1RqasppeZ18L8vcxFtI0VsQ8=;
 b=FG8VPi35Do4yei7GXshgKuwUojXVeBN7VwpZgbF90B2qW1NZ3GTn4h8wONVHRoTW0rmc
 jWxOnZnMVcQwIub3xRF7jUTMaZ4IP4c8hqylzlXfc+dvPuJmp1PjD50xzu91qcGI+PTT
 X5ICRccV0Qb/d105rmNOrqdnREX4BpWncMxmCswxa3bxT7BFP04U155e7WE6j3+nYX9G
 Jpwy/K53Hhanp7NLXWmoIIWPeFwtkSIJw18aQ1zTbZ5nBQodpqyl72gYiHD+/p/+eMfS
 /dJoHPCUXRavfn/6fn6/Vgu0JQbo1hMLyAXpmoS2O7YJdnsw1Y35Z0PT5o1E4z/zaMvn Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aq1qjkueu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 12:55:52 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17RGXcUc116390;
 Fri, 27 Aug 2021 12:55:50 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aq1qjkue6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 12:55:50 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17RGt8MJ001209;
 Fri, 27 Aug 2021 16:55:48 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3ajs48hvu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 16:55:48 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17RGpsuQ54657300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 16:51:54 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9399B52059;
 Fri, 27 Aug 2021 16:55:45 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.153.220])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3A6B252050;
 Fri, 27 Aug 2021 16:55:45 +0000 (GMT)
Subject: Re: [PATCH v6 06/11] powerpc/pseries/iommu: Add ddw_property_create()
 and refactor enable_ddw()
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 Nicolin Chen <nicoleotsuka@gmail.com>, kernel test robot <lkp@intel.com>
References: <20210817063929.38701-1-leobras.c@gmail.com>
 <20210817063929.38701-7-leobras.c@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <cfb1a5e0-96c0-6390-e03d-6a6579bd58ba@linux.ibm.com>
Date: Fri, 27 Aug 2021 18:55:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817063929.38701-7-leobras.c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XKgMPoJ-wbrUJr0gZh-GDUzVJMeQ9BzJ
X-Proofpoint-GUID: h98YUj2id6H5IMojYudgDNfkNzGVjly3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-27_04:2021-08-26,
 2021-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108270098
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
> Code used to create a ddw property that was previously scattered in
> enable_ddw() is now gathered in ddw_property_create(), which deals with
> allocation and filling the property, letting it ready for
> of_property_add(), which now occurs in sequence.
> 
> This created an opportunity to reorganize the second part of enable_ddw():
> 
> Without this patch enable_ddw() does, in order:
> kzalloc() property & members, create_ddw(), fill ddwprop inside property,
> ddw_list_new_entry(), do tce_setrange_multi_pSeriesLP_walk in all memory,
> of_add_property(), and list_add().
> 
> With this patch enable_ddw() does, in order:
> create_ddw(), ddw_property_create(), of_add_property(),
> ddw_list_new_entry(), do tce_setrange_multi_pSeriesLP_walk in all memory,
> and list_add().
> 
> This change requires of_remove_property() in case anything fails after
> of_add_property(), but we get to do tce_setrange_multi_pSeriesLP_walk
> in all memory, which looks the most expensive operation, only if
> everything else succeeds.
> 
> Also, the error path got remove_ddw() replaced by a new helper
> __remove_dma_window(), which only removes the new DDW with an rtas-call.
> For this, a new helper clean_dma_window() was needed to clean anything
> that could left if walk_system_ram_range() fails.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---


Thanks for fixing the error paths
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   arch/powerpc/platforms/pseries/iommu.c | 129 ++++++++++++++++---------
>   1 file changed, 84 insertions(+), 45 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index b34b473bbdc1..00392582fe10 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -795,17 +795,10 @@ static int __init disable_ddw_setup(char *str)
>   
>   early_param("disable_ddw", disable_ddw_setup);
>   
> -static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
> -			      struct property *win)
> +static void clean_dma_window(struct device_node *np, struct dynamic_dma_window_prop *dwp)
>   {
> -	struct dynamic_dma_window_prop *dwp;
> -	u64 liobn;
>   	int ret;
>   
> -	dwp = win->value;
> -	liobn = (u64)be32_to_cpu(dwp->liobn);
> -
> -	/* clear the whole window, note the arg is in kernel pages */
>   	ret = tce_clearrange_multi_pSeriesLP(0,
>   		1ULL << (be32_to_cpu(dwp->window_shift) - PAGE_SHIFT), dwp);
>   	if (ret)
> @@ -814,18 +807,39 @@ static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
>   	else
>   		pr_debug("%pOF successfully cleared tces in window.\n",
>   			 np);
> +}
> +
> +/*
> + * Call only if DMA window is clean.
> + */
> +static void __remove_dma_window(struct device_node *np, u32 *ddw_avail, u64 liobn)
> +{
> +	int ret;
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
>   
> +static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
> +			      struct property *win)
> +{
> +	struct dynamic_dma_window_prop *dwp;
> +	u64 liobn;
> +
> +	dwp = win->value;
> +	liobn = (u64)be32_to_cpu(dwp->liobn);
> +
> +	clean_dma_window(np, dwp);
> +	__remove_dma_window(np, ddw_avail, liobn);
> +}
> +
>   static void remove_ddw(struct device_node *np, bool remove_prop)
>   {
>   	struct property *win;
> @@ -1153,6 +1167,35 @@ static int iommu_get_page_shift(u32 query_page_size)
>   	return 0;
>   }
>   
> +static struct property *ddw_property_create(const char *propname, u32 liobn, u64 dma_addr,
> +					    u32 page_shift, u32 window_shift)
> +{
> +	struct dynamic_dma_window_prop *ddwprop;
> +	struct property *win64;
> +
> +	win64 = kzalloc(sizeof(*win64), GFP_KERNEL);
> +	if (!win64)
> +		return NULL;
> +
> +	win64->name = kstrdup(propname, GFP_KERNEL);
> +	ddwprop = kzalloc(sizeof(*ddwprop), GFP_KERNEL);
> +	win64->value = ddwprop;
> +	win64->length = sizeof(*ddwprop);
> +	if (!win64->name || !win64->value) {
> +		kfree(win64->name);
> +		kfree(win64->value);
> +		kfree(win64);
> +		return NULL;
> +	}
> +
> +	ddwprop->liobn = cpu_to_be32(liobn);
> +	ddwprop->dma_base = cpu_to_be64(dma_addr);
> +	ddwprop->tce_shift = cpu_to_be32(page_shift);
> +	ddwprop->window_shift = cpu_to_be32(window_shift);
> +
> +	return win64;
> +}
> +
>   /*
>    * If the PE supports dynamic dma windows, and there is space for a table
>    * that can map all pages in a linear offset, then setup such a table,
> @@ -1171,12 +1214,12 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	struct ddw_query_response query;
>   	struct ddw_create_response create;
>   	int page_shift;
> +	u64 win_addr;
>   	struct device_node *dn;
>   	u32 ddw_avail[DDW_APPLICABLE_SIZE];
>   	struct direct_window *window;
>   	struct property *win64;
>   	bool ddw_enabled = false;
> -	struct dynamic_dma_window_prop *ddwprop;
>   	struct failed_ddw_pdn *fpdn;
>   	bool default_win_removed = false;
>   	bool pmem_present;
> @@ -1293,72 +1336,68 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   			1ULL << page_shift);
>   		goto out_failed;
>   	}
> -	win64 = kzalloc(sizeof(struct property), GFP_KERNEL);
> -	if (!win64) {
> -		dev_info(&dev->dev,
> -			"couldn't allocate property for 64bit dma window\n");
> -		goto out_failed;
> -	}
> -	win64->name = kstrdup(DIRECT64_PROPNAME, GFP_KERNEL);
> -	win64->value = ddwprop = kmalloc(sizeof(*ddwprop), GFP_KERNEL);
> -	win64->length = sizeof(*ddwprop);
> -	if (!win64->name || !win64->value) {
> -		dev_info(&dev->dev,
> -			"couldn't allocate property name and value\n");
> -		goto out_free_prop;
> -	}
>   
>   	ret = create_ddw(dev, ddw_avail, &create, page_shift, len);
>   	if (ret != 0)
> -		goto out_free_prop;
> -
> -	ddwprop->liobn = cpu_to_be32(create.liobn);
> -	ddwprop->dma_base = cpu_to_be64(((u64)create.addr_hi << 32) |
> -			create.addr_lo);
> -	ddwprop->tce_shift = cpu_to_be32(page_shift);
> -	ddwprop->window_shift = cpu_to_be32(len);
> +		goto out_failed;
>   
>   	dev_dbg(&dev->dev, "created tce table LIOBN 0x%x for %pOF\n",
>   		  create.liobn, dn);
>   
> -	window = ddw_list_new_entry(pdn, ddwprop);
> +	win_addr = ((u64)create.addr_hi << 32) | create.addr_lo;
> +	win64 = ddw_property_create(DIRECT64_PROPNAME, create.liobn, win_addr,
> +				    page_shift, len);
> +	if (!win64) {
> +		dev_info(&dev->dev,
> +			 "couldn't allocate property, property name, or value\n");
> +		goto out_remove_win;
> +	}
> +
> +	ret = of_add_property(pdn, win64);
> +	if (ret) {
> +		dev_err(&dev->dev, "unable to add dma window property for %pOF: %d",
> +			pdn, ret);
> +		goto out_free_prop;
> +	}
> +
> +	window = ddw_list_new_entry(pdn, win64->value);
>   	if (!window)
> -		goto out_clear_window;
> +		goto out_del_prop;
>   
>   	ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
>   			win64->value, tce_setrange_multi_pSeriesLP_walk);
>   	if (ret) {
>   		dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
>   			 dn, ret);
> -		goto out_free_window;
> -	}
>   
> -	ret = of_add_property(pdn, win64);
> -	if (ret) {
> -		dev_err(&dev->dev, "unable to add dma window property for %pOF: %d",
> -			 pdn, ret);
> -		goto out_free_window;
> +		/* Make sure to clean DDW if any TCE was set*/
> +		clean_dma_window(pdn, win64->value);
> +		goto out_del_list;
>   	}
>   
>   	spin_lock(&direct_window_list_lock);
>   	list_add(&window->list, &direct_window_list);
>   	spin_unlock(&direct_window_list_lock);
>   
> -	dev->dev.archdata.dma_offset = be64_to_cpu(ddwprop->dma_base);
> +	dev->dev.archdata.dma_offset = win_addr;
>   	ddw_enabled = true;
>   	goto out_unlock;
>   
> -out_free_window:
> +out_del_list:
>   	kfree(window);
>   
> -out_clear_window:
> -	remove_ddw(pdn, true);
> +out_del_prop:
> +	of_remove_property(pdn, win64);
>   
>   out_free_prop:
>   	kfree(win64->name);
>   	kfree(win64->value);
>   	kfree(win64);
>   
> +out_remove_win:
> +	/* DDW is clean, so it's ok to call this directly. */
> +	__remove_dma_window(pdn, ddw_avail, create.liobn);
> +
>   out_failed:
>   	if (default_win_removed)
>   		reset_dma_window(dev, pdn);
> 
