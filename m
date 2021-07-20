Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA193D00B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 19:44:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTmLd46bTz3bfb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 03:44:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JLPuOWjY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JLPuOWjY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTmLB5028z2xZZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 03:44:18 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KHYCaY119779; Tue, 20 Jul 2021 13:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=IB2BRyUF2HiW8pbt61yXCkMkbaehOKFmF4dUzRiYZUk=;
 b=JLPuOWjYI4NRpozIPIksV9soy9HPT95syBYuriq2eoDqEx/hY4brg3X6YwMGhnIm9lcQ
 F/xFg429vv5qayhutaRpUOrqgJXWELVdIGwK8QpOXhAhRe3cx7OHSZBrFGKNMv+YkgrO
 TWD/CokuyvbEkuFD6GB0xY6MHoX4sm3UvU9Kko+bkFNYddCByh06H6Wz/k7FPNfRjf8q
 4bxDTDqe7TIYQI19JD+0V6Jk7YL751b+ksxqElWAS/JhsZ9GeAriXzLaynFXNtyAeis+
 BWOsGPEGsb1PTZXYstYsvbNIpDzkooIo1iNYF+fPOmGQb3wosXzDFj4PlsRKG7P10fLS IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39x2q08rr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 13:44:06 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16KHZhSq127953;
 Tue, 20 Jul 2021 13:44:05 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39x2q08rq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 13:44:05 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16KHi366021690;
 Tue, 20 Jul 2021 17:44:03 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 39vng71336-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 17:44:03 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16KHfdpM23331088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 17:41:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D518D4C04E;
 Tue, 20 Jul 2021 17:44:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8628D4C059;
 Tue, 20 Jul 2021 17:44:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.178.12])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Jul 2021 17:44:00 +0000 (GMT)
Subject: Re: [PATCH v5 05/11] powerpc/pseries/iommu: Allow DDW windows
 starting at 0x00
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>, kernel test robot
 <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-6-leobras.c@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <862eabc4-b317-334e-acd9-5e83c7eee350@linux.ibm.com>
Date: Tue, 20 Jul 2021 19:44:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716082755.428187-6-leobras.c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Q-AjCKWSlJoJHnsThq2q50-YuFnFa_8Q
X-Proofpoint-GUID: NgVF-wvYZjnPJFjd2ibetvMj6bNc59M5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_12:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107200115
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
> enable_ddw() currently returns the address of the DMA window, which is
> considered invalid if has the value 0x00.
> 
> Also, it only considers valid an address returned from find_existing_ddw
> if it's not 0x00.
> 
> Changing this behavior makes sense, given the users of enable_ddw() only
> need to know if direct mapping is possible. It can also allow a DMA window
> starting at 0x00 to be used.
> 
> This will be helpful for using a DDW with indirect mapping, as the window
> address will be different than 0x00, but it will not map the whole
> partition.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---


Looks good to me
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>



>   arch/powerpc/platforms/pseries/iommu.c | 36 +++++++++++++-------------
>   1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 712d1667144a..b34b473bbdc1 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -853,25 +853,26 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
>   			np, ret);
>   }
>   
> -static u64 find_existing_ddw(struct device_node *pdn, int *window_shift)
> +static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, int *window_shift)
>   {
>   	struct direct_window *window;
>   	const struct dynamic_dma_window_prop *direct64;
> -	u64 dma_addr = 0;
> +	bool found = false;
>   
>   	spin_lock(&direct_window_list_lock);
>   	/* check if we already created a window and dupe that config if so */
>   	list_for_each_entry(window, &direct_window_list, list) {
>   		if (window->device == pdn) {
>   			direct64 = window->prop;
> -			dma_addr = be64_to_cpu(direct64->dma_base);
> +			*dma_addr = be64_to_cpu(direct64->dma_base);
>   			*window_shift = be32_to_cpu(direct64->window_shift);
> +			found = true;
>   			break;
>   		}
>   	}
>   	spin_unlock(&direct_window_list_lock);
>   
> -	return dma_addr;
> +	return found;
>   }
>   
>   static struct direct_window *ddw_list_new_entry(struct device_node *pdn,
> @@ -1161,20 +1162,20 @@ static int iommu_get_page_shift(u32 query_page_size)
>    * pdn: the parent pe node with the ibm,dma_window property
>    * Future: also check if we can remap the base window for our base page size
>    *
> - * returns the dma offset for use by the direct mapped DMA code.
> + * returns true if can map all pages (direct mapping), false otherwise..
>    */
> -static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> +static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   {
>   	int len = 0, ret;
>   	int max_ram_len = order_base_2(ddw_memory_hotplug_max());
>   	struct ddw_query_response query;
>   	struct ddw_create_response create;
>   	int page_shift;
> -	u64 dma_addr;
>   	struct device_node *dn;
>   	u32 ddw_avail[DDW_APPLICABLE_SIZE];
>   	struct direct_window *window;
>   	struct property *win64;
> +	bool ddw_enabled = false;
>   	struct dynamic_dma_window_prop *ddwprop;
>   	struct failed_ddw_pdn *fpdn;
>   	bool default_win_removed = false;
> @@ -1186,9 +1187,10 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   
>   	mutex_lock(&direct_window_init_mutex);
>   
> -	dma_addr = find_existing_ddw(pdn, &len);
> -	if (dma_addr != 0)
> +	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &len)) {
> +		ddw_enabled = true;
>   		goto out_unlock;
> +	}
>   
>   	/*
>   	 * If we already went through this for a previous function of
> @@ -1342,7 +1344,8 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	list_add(&window->list, &direct_window_list);
>   	spin_unlock(&direct_window_list_lock);
>   
> -	dma_addr = be64_to_cpu(ddwprop->dma_base);
> +	dev->dev.archdata.dma_offset = be64_to_cpu(ddwprop->dma_base);
> +	ddw_enabled = true;
>   	goto out_unlock;
>   
>   out_free_window:
> @@ -1374,10 +1377,10 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	 * as RAM, then we failed to create a window to cover persistent
>   	 * memory and need to set the DMA limit.
>   	 */
> -	if (pmem_present && dma_addr && (len == max_ram_len))
> -		dev->dev.bus_dma_limit = dma_addr + (1ULL << len);
> +	if (pmem_present && ddw_enabled && (len == max_ram_len))
> +		dev->dev.bus_dma_limit = dev->dev.archdata.dma_offset + (1ULL << len);
>   
> -	return dma_addr;
> +	return ddw_enabled;
>   }
>   
>   static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
> @@ -1456,11 +1459,8 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
>   			break;
>   	}
>   
> -	if (pdn && PCI_DN(pdn)) {
> -		pdev->dev.archdata.dma_offset = enable_ddw(pdev, pdn);
> -		if (pdev->dev.archdata.dma_offset)
> -			return true;
> -	}
> +	if (pdn && PCI_DN(pdn))
> +		return enable_ddw(pdev, pdn);
>   
>   	return false;
>   }
> 
