Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8606C3D00E5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 19:50:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTmTj2qPLz3bh2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 03:50:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iq7FHtV1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iq7FHtV1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTmT94WNqz2xKJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 03:50:21 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KHYOYT083755; Tue, 20 Jul 2021 13:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=M+k/THqYmQioCQfI+vvQ675Vl3gkL6U2pMThTBk09aQ=;
 b=iq7FHtV1CAfdF+tx2uzC5LJtaxFdI3ijk8fH4SSe6IFqB4+5AE2bXLgHocd1BhLQMPmf
 hQhcSITOtCFEMHY01Vcbd90RPMwj3cwKPZH9ckXWz8W/mj0PmOUaxIPjnPz8dSLEUMWv
 Xmj2VE47ufz2Kz1ekSF8jRLN8XQAPoj41SVqrIS8YvfsjSj7o2bE8xkLVFRhDqe9yaeU
 aK8QUUe0i0OLLYjscPAUZG5ElaPF+lVHis3JblaqybWr4YZwkMt3lIQ/vSLn//pm9OHV
 vy1Wm/+ooIvVWcm0e6PUnuyDDuBU/ltTv8gU+EmA/FGPmVOBgT4JoEGtYrKT3rLxr4A3 XA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39x2u1gpbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 13:50:12 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16KHZeMK088052;
 Tue, 20 Jul 2021 13:50:12 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39x2u1gpaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 13:50:12 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16KHhBsO021985;
 Tue, 20 Jul 2021 17:50:10 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 39upu89f3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 17:50:10 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16KHo7D927394502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 17:50:07 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5EBC4C058;
 Tue, 20 Jul 2021 17:50:07 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A44F4C046;
 Tue, 20 Jul 2021 17:50:07 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.178.12])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Jul 2021 17:50:07 +0000 (GMT)
Subject: Re: [PATCH v5 07/11] powerpc/pseries/iommu: Reorganize
 iommu_table_setparms*() with new helper
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>, kernel test robot
 <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-8-leobras.c@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <b1cdc216-31e3-a0ca-7b52-22cf4fa5579a@linux.ibm.com>
Date: Tue, 20 Jul 2021 19:50:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716082755.428187-8-leobras.c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qwHudOO9SoRziUdczZVY9b1MU1MAyvGs
X-Proofpoint-GUID: 5f5KeENN8SKx9n7LfIX9zixWbCbqa4vL
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_12:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> Add a new helper _iommu_table_setparms(), and use it in
> iommu_table_setparms() and iommu_table_setparms_lpar() to avoid duplicated
> code.
> 
> Also, setting tbl->it_ops was happening outsite iommu_table_setparms*(),
> so move it to the new helper. Since we need the iommu_table_ops to be
> declared before used, declare iommu_table_lpar_multi_ops and
> iommu_table_pseries_ops to before their respective iommu_table_setparms*().
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---


Looks good
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>



>   arch/powerpc/platforms/pseries/iommu.c | 72 ++++++++++++++------------
>   1 file changed, 38 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 7ca79a04fa52..108c3dcca686 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -501,6 +501,24 @@ static int tce_setrange_multi_pSeriesLP_walk(unsigned long start_pfn,
>   	return tce_setrange_multi_pSeriesLP(start_pfn, num_pfn, arg);
>   }
>   
> +static void iommu_table_setparms_common(struct iommu_table *tbl, unsigned long busno,
> +					unsigned long liobn, unsigned long win_addr,
> +					unsigned long window_size, unsigned long page_shift,
> +					void *base, struct iommu_table_ops *table_ops)
> +{
> +	tbl->it_busno = busno;
> +	tbl->it_index = liobn;
> +	tbl->it_offset = win_addr >> page_shift;
> +	tbl->it_size = window_size >> page_shift;
> +	tbl->it_page_shift = page_shift;
> +	tbl->it_base = (unsigned long)base;
> +	tbl->it_blocksize = 16;
> +	tbl->it_type = TCE_PCI;
> +	tbl->it_ops = table_ops;
> +}
> +
> +struct iommu_table_ops iommu_table_pseries_ops;
> +
>   static void iommu_table_setparms(struct pci_controller *phb,
>   				 struct device_node *dn,
>   				 struct iommu_table *tbl)
> @@ -509,8 +527,13 @@ static void iommu_table_setparms(struct pci_controller *phb,
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
> @@ -519,33 +542,18 @@ static void iommu_table_setparms(struct pci_controller *phb,
>   		return;
>   	}
>   
> -	tbl->it_base = (unsigned long)__va(*basep);
> +	iommu_table_setparms_common(tbl, phb->bus->number, 0, phb->dma_window_base_cur,
> +				    phb->dma_window_size, IOMMU_PAGE_SHIFT_4K,
> +				    __va(*basep), &iommu_table_pseries_ops);
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
> +struct iommu_table_ops iommu_table_lpar_multi_ops;
> +
>   /*
>    * iommu_table_setparms_lpar
>    *
> @@ -557,17 +565,13 @@ static void iommu_table_setparms_lpar(struct pci_controller *phb,
>   				      struct iommu_table_group *table_group,
>   				      const __be32 *dma_window)
>   {
> -	unsigned long offset, size;
> +	unsigned long offset, size, liobn;
>   
> -	of_parse_dma_window(dn, dma_window, &tbl->it_index, &offset, &size);
> +	of_parse_dma_window(dn, dma_window, &liobn, &offset, &size);
> +
> +	iommu_table_setparms_common(tbl, phb->bus->number, liobn, offset, size, IOMMU_PAGE_SHIFT_4K, NULL,
> +				    &iommu_table_lpar_multi_ops);
>   
> -	tbl->it_busno = phb->bus->number;
> -	tbl->it_page_shift = IOMMU_PAGE_SHIFT_4K;
> -	tbl->it_base   = 0;
> -	tbl->it_blocksize  = 16;
> -	tbl->it_type = TCE_PCI;
> -	tbl->it_offset = offset >> tbl->it_page_shift;
> -	tbl->it_size = size >> tbl->it_page_shift;
>   
>   	table_group->tce32_start = offset;
>   	table_group->tce32_size = size;
> @@ -647,7 +651,7 @@ static void pci_dma_bus_setup_pSeries(struct pci_bus *bus)
>   	tbl = pci->table_group->tables[0];
>   
>   	iommu_table_setparms(pci->phb, dn, tbl);
> -	tbl->it_ops = &iommu_table_pseries_ops;
> +
>   	if (!iommu_init_table(tbl, pci->phb->node, 0, 0))
>   		panic("Failed to initialize iommu table");
>   
> @@ -730,7 +734,7 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
>   		tbl = ppci->table_group->tables[0];
>   		iommu_table_setparms_lpar(ppci->phb, pdn, tbl,
>   				ppci->table_group, dma_window);
> -		tbl->it_ops = &iommu_table_lpar_multi_ops;
> +
>   		if (!iommu_init_table(tbl, ppci->phb->node, 0, 0))
>   			panic("Failed to initialize iommu table");
>   		iommu_register_group(ppci->table_group,
> @@ -760,7 +764,7 @@ static void pci_dma_dev_setup_pSeries(struct pci_dev *dev)
>   		PCI_DN(dn)->table_group = iommu_pseries_alloc_group(phb->node);
>   		tbl = PCI_DN(dn)->table_group->tables[0];
>   		iommu_table_setparms(phb, dn, tbl);
> -		tbl->it_ops = &iommu_table_pseries_ops;
> +
>   		if (!iommu_init_table(tbl, phb->node, 0, 0))
>   			panic("Failed to initialize iommu table");
>   
> @@ -1443,7 +1447,7 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
>   		tbl = pci->table_group->tables[0];
>   		iommu_table_setparms_lpar(pci->phb, pdn, tbl,
>   				pci->table_group, dma_window);
> -		tbl->it_ops = &iommu_table_lpar_multi_ops;
> +
>   		iommu_init_table(tbl, pci->phb->node, 0, 0);
>   		iommu_register_group(pci->table_group,
>   				pci_domain_nr(pci->phb->bus), 0);
> 
