Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C71766E9C9B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 21:46:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2SpL5Dszz3chy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 05:46:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T0V1eqVB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gbatra@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T0V1eqVB;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2SnQ2zLXz3cdd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Apr 2023 05:45:45 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33KJebAM022863;
	Thu, 20 Apr 2023 19:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=E70LSFUzNE9nuKZGJPA1C+H4vZVeUm3I5c3FTQrA0TI=;
 b=T0V1eqVBkxA05W/FAhJgEjRWmKwEFCW0YArE1f1i6GUrZwctwoEdsIxyO+PEuPHLAHux
 1QQ7CHE/GiFplMQZx+rAHAwi0fLduQQBSAKtfRehxO4MzKW7EFLwGH/WgXSA4M6T16pX
 uogsa6uM078O6HCiJHXE47cLPg1lcY96JDQrq5E/d18vR6r6DkDUE7ngADriQvHfjhNL
 twM7peZHqReoXapG90a5nsUSDRjXBh3kaiuhtjHc71lA8cu961m5/HZCGOtDXjNkX3eD
 5QQEFvp+CFLdskFXxHlWMIPIGL8uaB57uWTkYL+fuQrni02N/8JwYkTXd73V4XCIHBj9 gw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q3asbt3vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Apr 2023 19:45:36 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33KGEJ2h010108;
	Thu, 20 Apr 2023 19:45:36 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3pykj7ntuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Apr 2023 19:45:36 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33KJjYLb30737032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Apr 2023 19:45:35 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 941E058063;
	Thu, 20 Apr 2023 19:45:34 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28E275805E;
	Thu, 20 Apr 2023 19:45:34 +0000 (GMT)
Received: from [9.160.177.124] (unknown [9.160.177.124])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 20 Apr 2023 19:45:34 +0000 (GMT)
Message-ID: <1ce16c05-b492-fed8-06af-0bbba9de9053@linux.vnet.ibm.com>
Date: Thu, 20 Apr 2023 14:45:33 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2] powerpc/iommu: DMA address offset is incorrectly
 calculated with 2MB TCEs
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20230419152623.26439-1-gbatra@linux.vnet.ibm.com>
 <87leimfuk0.fsf@mail.concordia>
From: Gaurav Batra <gbatra@linux.vnet.ibm.com>
In-Reply-To: <87leimfuk0.fsf@mail.concordia>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k46F-57Shjk0KfcXzT7BC7Isn1xC8FRu
X-Proofpoint-ORIG-GUID: k46F-57Shjk0KfcXzT7BC7Isn1xC8FRu
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_15,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304200163
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
Cc: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, Greg Joyce <gjoyce@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michael,

I was looking into the Bug: 199106 
(https://bugzilla.linux.ibm.com/show_bug.cgi?id=199106).

In the Bug, Mellanox driver was timing out when enabling SRIOV device.

I tested, Alexey's patch and it fixes the issue with Mellanox driver. 
The down side

to Alexey's fix is that even a small memory request by the driver will 
be aligned up

to 2MB. In my test, the Mellanox driver is issuing multiple requests of 
64K size.

All these will get aligned up to 2MB, which is quite a waste of resources.


In any case, both the patches work. Let me know which approach you 
prefer. In case

we decide to go with my patch, I just realized that I need to fix 
nio_pages in

iommu_free_coherent() as well.


Thanks,

Gaurav

On 4/20/23 10:21 AM, Michael Ellerman wrote:
> Gaurav Batra <gbatra@linux.vnet.ibm.com> writes:
>> When DMA window is backed by 2MB TCEs, the DMA address for the mapped
>> page should be the offset of the page relative to the 2MB TCE. The code
>> was incorrectly setting the DMA address to the beginning of the TCE
>> range.
>>
>> Mellanox driver is reporting timeout trying to ENABLE_HCA for an SR-IOV
>> ethernet port, when DMA window is backed by 2MB TCEs.
> I assume this is similar or related to the bug Srikar reported?
>
>    https://lore.kernel.org/linuxppc-dev/20230323095333.GI1005120@linux.vnet.ibm.com/
>
> In that thread Alexey suggested a patch, have you tried his patch? He
> suggested rounding up the allocation size, rather than adjusting the
> dma_handle.
>
>> Fixes: 3872731187141d5d0a5c4fb30007b8b9ec36a44d
> That's not the right syntax, it's described in the documentation how to
> generate it.
>
> It should be:
>
>    Fixes: 387273118714 ("powerps/pseries/dma: Add support for 2M IOMMU page size")
>
> cheers
>
>> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
>> index ee95937bdaf1..ca57526ce47a 100644
>> --- a/arch/powerpc/kernel/iommu.c
>> +++ b/arch/powerpc/kernel/iommu.c
>> @@ -517,7 +517,7 @@ int ppc_iommu_map_sg(struct device *dev, struct iommu_table *tbl,
>>   		/* Convert entry to a dma_addr_t */
>>   		entry += tbl->it_offset;
>>   		dma_addr = entry << tbl->it_page_shift;
>> -		dma_addr |= (s->offset & ~IOMMU_PAGE_MASK(tbl));
>> +		dma_addr |= (vaddr & ~IOMMU_PAGE_MASK(tbl));
>>   
>>   		DBG("  - %lu pages, entry: %lx, dma_addr: %lx\n",
>>   			    npages, entry, dma_addr);
>> @@ -904,6 +904,7 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
>>   	unsigned int order;
>>   	unsigned int nio_pages, io_order;
>>   	struct page *page;
>> +	int tcesize = (1 << tbl->it_page_shift);
>>   
>>   	size = PAGE_ALIGN(size);
>>   	order = get_order(size);
>> @@ -930,7 +931,8 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
>>   	memset(ret, 0, size);
>>   
>>   	/* Set up tces to cover the allocated range */
>> -	nio_pages = size >> tbl->it_page_shift;
>> +	nio_pages = IOMMU_PAGE_ALIGN(size, tbl) >> tbl->it_page_shift;
>> +
>>   	io_order = get_iommu_order(size, tbl);
>>   	mapping = iommu_alloc(dev, tbl, ret, nio_pages, DMA_BIDIRECTIONAL,
>>   			      mask >> tbl->it_page_shift, io_order, 0);
>> @@ -938,7 +940,8 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
>>   		free_pages((unsigned long)ret, order);
>>   		return NULL;
>>   	}
>> -	*dma_handle = mapping;
>> +
>> +	*dma_handle = mapping | ((u64)ret & (tcesize - 1));
>>   	return ret;
>>   }
>>   
>> -- 
