Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DAC6F4F23
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 May 2023 05:26:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QB2RW0hZGz3cKv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 May 2023 13:26:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hW5O+cye;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hW5O+cye;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QB2Qd4V9Vz3bf7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 May 2023 13:25:45 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3433N9NX011340;
	Wed, 3 May 2023 03:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=z/x5QrB+1EbcKmDREI2Ls8Of+RbBZjQ42dWgId+S7Ao=;
 b=hW5O+cyeeD4/B6Eoh3Q+8b1JZas1s4eNLxL56TBgh7ztSc3ey4xOgh985AduBJNriRJN
 QFDSSEKbKU2J1D17S75t/GsI4mvUDRUOlj1tODLAjAsNG0bHFVc4r32DBoWf+xTGMvpA
 qzV1RcmudEZmbOEHKoox+warvtJrpMTo3K8n/UYoLIE2eokrSR4mZ/ioScF8GGe3UYia
 82JqPnJQ/Mxy+SoAtL+Yj2vYbCNMlyn8gImzqmpp5/mLsLorQou9l0bj2t+ClZcMVS6s
 kxwiKqQjYiAsy5fibkVpRSPn3LKS+SZvKSKs6I6sIWDeerTc19x8eAm+/R3hFsQY8A29 og== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qbfgc08by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 May 2023 03:25:38 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3431UjLV026693;
	Wed, 3 May 2023 03:25:37 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3q8tv976en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 May 2023 03:25:37 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3433PZAB38994440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 May 2023 03:25:36 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D61D85805A;
	Wed,  3 May 2023 03:25:35 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 47FB558051;
	Wed,  3 May 2023 03:25:35 +0000 (GMT)
Received: from [9.160.36.80] (unknown [9.160.36.80])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  3 May 2023 03:25:35 +0000 (GMT)
Message-ID: <9b60469b-a8f4-bc69-ef1b-9b15d0836e25@linux.vnet.ibm.com>
Date: Tue, 2 May 2023 22:25:34 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2] powerpc/iommu: DMA address offset is incorrectly
 calculated with 2MB TCEs
From: Gaurav Batra <gbatra@linux.vnet.ibm.com>
To: aik@ozlabs.ru
References: <20230419152623.26439-1-gbatra@linux.vnet.ibm.com>
 <87leimfuk0.fsf@mail.concordia>
 <1ce16c05-b492-fed8-06af-0bbba9de9053@linux.vnet.ibm.com>
Content-Language: en-US
In-Reply-To: <1ce16c05-b492-fed8-06af-0bbba9de9053@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: G0wk9Zx6es5fkSZqxhD8dxHUfe-sRL9s
X-Proofpoint-GUID: G0wk9Zx6es5fkSZqxhD8dxHUfe-sRL9s
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_14,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1011 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030024
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

Hello Alexey,

I recently joined IOMMU team. There was a bug reported by test team 
where Mellanox driver was timing out during configuration. I proposed a 
fix for the same, which is below in the email.

You suggested a fix for Srikar's reported problem. Basically, both these 
fixes will resolve Srikar and Mellanox driver issues. The problem is 
with 2MB DDW.

Since you have extensive knowledge of IOMMU design and code, in your 
opinion, which patch should we adopt?

Thanks a lot

Gaurav

On 4/20/23 2:45 PM, Gaurav Batra wrote:
> Hello Michael,
>
> I was looking into the Bug: 199106 
> (https://bugzilla.linux.ibm.com/show_bug.cgi?id=199106).
>
> In the Bug, Mellanox driver was timing out when enabling SRIOV device.
>
> I tested, Alexey's patch and it fixes the issue with Mellanox driver. 
> The down side
>
> to Alexey's fix is that even a small memory request by the driver will 
> be aligned up
>
> to 2MB. In my test, the Mellanox driver is issuing multiple requests 
> of 64K size.
>
> All these will get aligned up to 2MB, which is quite a waste of 
> resources.
>
>
> In any case, both the patches work. Let me know which approach you 
> prefer. In case
>
> we decide to go with my patch, I just realized that I need to fix 
> nio_pages in
>
> iommu_free_coherent() as well.
>
>
> Thanks,
>
> Gaurav
>
> On 4/20/23 10:21 AM, Michael Ellerman wrote:
>> Gaurav Batra <gbatra@linux.vnet.ibm.com> writes:
>>> When DMA window is backed by 2MB TCEs, the DMA address for the mapped
>>> page should be the offset of the page relative to the 2MB TCE. The code
>>> was incorrectly setting the DMA address to the beginning of the TCE
>>> range.
>>>
>>> Mellanox driver is reporting timeout trying to ENABLE_HCA for an SR-IOV
>>> ethernet port, when DMA window is backed by 2MB TCEs.
>> I assume this is similar or related to the bug Srikar reported?
>>
>> https://lore.kernel.org/linuxppc-dev/20230323095333.GI1005120@linux.vnet.ibm.com/
>>
>> In that thread Alexey suggested a patch, have you tried his patch? He
>> suggested rounding up the allocation size, rather than adjusting the
>> dma_handle.
>>
>>> Fixes: 3872731187141d5d0a5c4fb30007b8b9ec36a44d
>> That's not the right syntax, it's described in the documentation how to
>> generate it.
>>
>> It should be:
>>
>>    Fixes: 387273118714 ("powerps/pseries/dma: Add support for 2M 
>> IOMMU page size")
>>
>> cheers
>>
>>> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
>>> index ee95937bdaf1..ca57526ce47a 100644
>>> --- a/arch/powerpc/kernel/iommu.c
>>> +++ b/arch/powerpc/kernel/iommu.c
>>> @@ -517,7 +517,7 @@ int ppc_iommu_map_sg(struct device *dev, struct 
>>> iommu_table *tbl,
>>>           /* Convert entry to a dma_addr_t */
>>>           entry += tbl->it_offset;
>>>           dma_addr = entry << tbl->it_page_shift;
>>> -        dma_addr |= (s->offset & ~IOMMU_PAGE_MASK(tbl));
>>> +        dma_addr |= (vaddr & ~IOMMU_PAGE_MASK(tbl));
>>>             DBG("  - %lu pages, entry: %lx, dma_addr: %lx\n",
>>>                   npages, entry, dma_addr);
>>> @@ -904,6 +904,7 @@ void *iommu_alloc_coherent(struct device *dev, 
>>> struct iommu_table *tbl,
>>>       unsigned int order;
>>>       unsigned int nio_pages, io_order;
>>>       struct page *page;
>>> +    int tcesize = (1 << tbl->it_page_shift);
>>>         size = PAGE_ALIGN(size);
>>>       order = get_order(size);
>>> @@ -930,7 +931,8 @@ void *iommu_alloc_coherent(struct device *dev, 
>>> struct iommu_table *tbl,
>>>       memset(ret, 0, size);
>>>         /* Set up tces to cover the allocated range */
>>> -    nio_pages = size >> tbl->it_page_shift;
>>> +    nio_pages = IOMMU_PAGE_ALIGN(size, tbl) >> tbl->it_page_shift;
>>> +
>>>       io_order = get_iommu_order(size, tbl);
>>>       mapping = iommu_alloc(dev, tbl, ret, nio_pages, 
>>> DMA_BIDIRECTIONAL,
>>>                     mask >> tbl->it_page_shift, io_order, 0);
>>> @@ -938,7 +940,8 @@ void *iommu_alloc_coherent(struct device *dev, 
>>> struct iommu_table *tbl,
>>>           free_pages((unsigned long)ret, order);
>>>           return NULL;
>>>       }
>>> -    *dma_handle = mapping;
>>> +
>>> +    *dma_handle = mapping | ((u64)ret & (tcesize - 1));
>>>       return ret;
>>>   }
>>>   --
