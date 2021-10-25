Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F035E4398D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 16:41:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdHhJ6pXLz2xZR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 01:41:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C9FI44fD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=C9FI44fD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdHgX1j8vz2xCW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 01:40:40 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PCM8oS017028; 
 Mon, 25 Oct 2021 14:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=wgW2xmbAd3qs5KEekNP/i1ik4mjUd6ZS+b4Wu99jiAw=;
 b=C9FI44fDi8pKdz7zNfTHtGD0PjxhLFYr1ItQOBYWEukhFJ6fr/gOT5FBSEjOgqdtlh4/
 AX9+kAijfyRMN41uBwXM+E0urXbV7bDtIar6Sq5Jt1DAMuvJm66SDMDlMvTpTQiN+H2g
 23+AvhWwTDUv/LDfOPlQIUrRgCFL12CwPkDTAGin71eTTNPog2FvOMm/hV+6sD1840iD
 Xa0StO/9ZisaFtRKKPA58lxvDiL91H6taBfA/KlzIamUFkb37YtB7iwdmylb9dO8ML4Y
 pVvak7koMhmG5brBAN08+wk5B/Db4ZojIf5Lc6QXbICFFRnXOlndfn0fcOtEf4f8aKNq nQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bwt2jq8pn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 14:40:37 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19PEdNXg026583;
 Mon, 25 Oct 2021 14:40:36 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 3bva1a6ph8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 14:40:36 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19PEeZJ040436120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Oct 2021 14:40:35 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82DE86E052;
 Mon, 25 Oct 2021 14:40:35 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BB546E059;
 Mon, 25 Oct 2021 14:40:35 +0000 (GMT)
Received: from [9.211.75.9] (unknown [9.211.75.9])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 25 Oct 2021 14:40:35 +0000 (GMT)
Message-ID: <f9af9834-797f-cd69-bbcf-3663ce375c72@linux.vnet.ibm.com>
Date: Mon, 25 Oct 2021 09:40:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] powerpc: Enhance pmem DMA bypass handling
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20211021174449.120875-1-brking@linux.vnet.ibm.com>
 <84b82d2b-1263-39bb-d966-b432af530ca8@ozlabs.ru>
 <e4120ddc-8cac-c722-2379-ecc44bd9ef89@linux.vnet.ibm.com>
 <3d1dcfa3-23a7-cb7f-8671-2198861987e6@ozlabs.ru>
From: Brian King <brking@linux.vnet.ibm.com>
In-Reply-To: <3d1dcfa3-23a7-cb7f-8671-2198861987e6@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bre5uG7pHg1ZPYtRoU3sPZiVilSqfeNb
X-Proofpoint-GUID: bre5uG7pHg1ZPYtRoU3sPZiVilSqfeNb
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_05,2021-10-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110250089
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/23/21 7:18 AM, Alexey Kardashevskiy wrote:
> 
> 
> On 23/10/2021 07:18, Brian King wrote:
>> On 10/22/21 7:24 AM, Alexey Kardashevskiy wrote:
>>>
>>>
>>> On 22/10/2021 04:44, Brian King wrote:
>>>> If ibm,pmemory is installed in the system, it can appear anywhere
>>>> in the address space. This patch enhances how we handle DMA for devices when
>>>> ibm,pmemory is present. In the case where we have enough DMA space to
>>>> direct map all of RAM, but not ibm,pmemory, we use direct DMA for
>>>> I/O to RAM and use the default window to dynamically map ibm,pmemory.
>>>> In the case where we only have a single DMA window, this won't work, > so if the window is not big enough to map the entire address range,
>>>> we cannot direct map.
>>>
>>> but we want the pmem range to be mapped into the huge DMA window too if we can, why skip it?
>>
>> This patch should simply do what the comment in this commit mentioned below suggests, which says that
>> ibm,pmemory can appear anywhere in the address space. If the DMA window is large enough
>> to map all of MAX_PHYSMEM_BITS, we will indeed simply do direct DMA for everything,
>> including the pmem. If we do not have a big enough window to do that, we will do
>> direct DMA for DRAM and dynamic mapping for pmem.
> 
> 
> Right, and this is what we do already, do not we? I missing something here.

The upstream code does not work correctly that I can see. If I boot an upstream kernel
with an nvme device and vpmem assigned to the LPAR, and enable dev_dbg in arch/powerpc/platforms/pseries/iommu.c,
I see the following in the logs:

[    2.157549] nvme 0121:50:00.0: ibm,query-pe-dma-windows(53) 500000 8000000 20000121 returned 0
[    2.157561] nvme 0121:50:00.0: Skipping ibm,pmemory
[    2.157567] nvme 0121:50:00.0: can't map partition max 0x8000000000000 with 16777216 65536-sized pages
[    2.170150] nvme 0121:50:00.0: ibm,create-pe-dma-window(54) 500000 8000000 20000121 10 28 returned 0 (liobn = 0x70000121 starting addr = 8000000 0)
[    2.170170] nvme 0121:50:00.0: created tce table LIOBN 0x70000121 for /pci@800000020000121/pci1014,683@0
[    2.356260] nvme 0121:50:00.0: node is /pci@800000020000121/pci1014,683@0

This means we are heading down the leg in enable_ddw where we do not set direct_mapping to true. We use
create the DDW window, but don't do any direct DMA. This is because the window is not large enough to
map 2PB of memory, which is what ddw_memory_hotplug_max returns without my patch. 

With my patch applied, I get this in the logs:

[    2.204866] nvme 0121:50:00.0: ibm,query-pe-dma-windows(53) 500000 8000000 20000121 returned 0
[    2.204875] nvme 0121:50:00.0: Skipping ibm,pmemory
[    2.205058] nvme 0121:50:00.0: ibm,create-pe-dma-window(54) 500000 8000000 20000121 10 21 returned 0 (liobn = 0x70000121 starting addr = 8000000 0)
[    2.205068] nvme 0121:50:00.0: created tce table LIOBN 0x70000121 for /pci@800000020000121/pci1014,683@0
[    2.215898] nvme 0121:50:00.0: iommu: 64-bit OK but direct DMA is limited by 800000200000000


Thanks,

Brian


> 
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/powerpc/platforms/pseries/iommu.c?id=bf6e2d562bbc4d115cf322b0bca57fe5bbd26f48
>>
>>
>> Thanks,
>>
>> Brian
>>
>>
>>>
>>>
>>>>
>>>> Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
>>>> ---
>>>>    arch/powerpc/platforms/pseries/iommu.c | 19 ++++++++++---------
>>>>    1 file changed, 10 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>>>> index 269f61d519c2..d9ae985d10a4 100644
>>>> --- a/arch/powerpc/platforms/pseries/iommu.c
>>>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>>>> @@ -1092,15 +1092,6 @@ static phys_addr_t ddw_memory_hotplug_max(void)
>>>>        phys_addr_t max_addr = memory_hotplug_max();
>>>>        struct device_node *memory;
>>>>    -    /*
>>>> -     * The "ibm,pmemory" can appear anywhere in the address space.
>>>> -     * Assuming it is still backed by page structs, set the upper limit
>>>> -     * for the huge DMA window as MAX_PHYSMEM_BITS.
>>>> -     */
>>>> -    if (of_find_node_by_type(NULL, "ibm,pmemory"))
>>>> -        return (sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
>>>> -            (phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS);
>>>> -
>>>>        for_each_node_by_type(memory, "memory") {
>>>>            unsigned long start, size;
>>>>            int n_mem_addr_cells, n_mem_size_cells, len;
>>>> @@ -1341,6 +1332,16 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>>>>         */
>>>>        len = max_ram_len;
>>>>        if (pmem_present) {
>>>> +        if (default_win_removed) {
>>>> +            /*
>>>> +             * If we only have one DMA window and have pmem present,
>>>> +             * then we need to be able to map the entire address
>>>> +             * range in order to be able to do direct DMA to RAM.
>>>> +             */
>>>> +            len = order_base_2((sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
>>>> +                    (phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS));
>>>> +        }
>>>> +
>>>>            if (query.largest_available_block >=
>>>>                (1ULL << (MAX_PHYSMEM_BITS - page_shift)))
>>>>                len = MAX_PHYSMEM_BITS;
>>>>
>>>
>>
>>
> 


-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

