Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 253B243D5C9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 23:31:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfhhv0CwDz3c9h
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 08:31:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rQMvZke4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rQMvZke4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hfhh51vNwz2yms
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 08:31:00 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RJLhc4022319; 
 Wed, 27 Oct 2021 21:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ivxB8loxYZdIrg7LsJUfCGTu+Q4idweB8bUXOVGhsuM=;
 b=rQMvZke4LUHJ7lbcmm5IH3aHQi/dhpMFN4b25ahnE1cPsW+sr0ReMTEn68Y7/K2iulnO
 KIsNSKjtnRGCf0201JWRCfdWov9eoqd947Q7OS3wwpC6r0C5y5hoFwEgDICrYHKIu+xU
 krhtysd6mWu2XYLjuJECIPQRaJ46cZ6/N2YnC7If5uyb+aWS3C/I3tbrsiO8I5EHZpGj
 6d7FY1QDOKwnX98/+G5VN3Ef897mIjwhehlO9h6VqytzVDT28nhQxPMlMLHrHzGr2jF1
 o+BfIsQzIQe9HP6gfHiFzpAYfvvcOD/6llOMwrJ0zm30iX0gs3QTt05eKr5JX42xPeNq gQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bycv0tb0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 21:30:57 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19RLBwqi017731;
 Wed, 27 Oct 2021 21:30:52 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 3bx4egbe41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 21:30:52 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19RLUosH53215688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 21:30:51 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF60DC605B;
 Wed, 27 Oct 2021 21:30:50 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C0CEC6062;
 Wed, 27 Oct 2021 21:30:50 +0000 (GMT)
Received: from [9.211.97.158] (unknown [9.211.97.158])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 27 Oct 2021 21:30:50 +0000 (GMT)
Message-ID: <2075ad89-09d5-6906-f8fe-83a2347bbe9d@linux.vnet.ibm.com>
Date: Wed, 27 Oct 2021 16:30:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] powerpc: Enhance pmem DMA bypass handling
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20211021174449.120875-1-brking@linux.vnet.ibm.com>
 <84b82d2b-1263-39bb-d966-b432af530ca8@ozlabs.ru>
 <e4120ddc-8cac-c722-2379-ecc44bd9ef89@linux.vnet.ibm.com>
 <3d1dcfa3-23a7-cb7f-8671-2198861987e6@ozlabs.ru>
 <f9af9834-797f-cd69-bbcf-3663ce375c72@linux.vnet.ibm.com>
 <a2537ac0-cee3-31d3-73da-7d9de860f602@ozlabs.ru>
From: Brian King <brking@linux.vnet.ibm.com>
In-Reply-To: <a2537ac0-cee3-31d3-73da-7d9de860f602@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: O29gLj1jAWjW4nrh9g4cbJG7YiXC7pPp
X-Proofpoint-ORIG-GUID: O29gLj1jAWjW4nrh9g4cbJG7YiXC7pPp
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_06,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270120
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

On 10/26/21 12:39 AM, Alexey Kardashevskiy wrote:
> 
> 
> On 10/26/21 01:40, Brian King wrote:
>> On 10/23/21 7:18 AM, Alexey Kardashevskiy wrote:
>>>
>>>
>>> On 23/10/2021 07:18, Brian King wrote:
>>>> On 10/22/21 7:24 AM, Alexey Kardashevskiy wrote:
>>>>>
>>>>>
>>>>> On 22/10/2021 04:44, Brian King wrote:
>>>>>> If ibm,pmemory is installed in the system, it can appear anywhere
>>>>>> in the address space. This patch enhances how we handle DMA for devices when
>>>>>> ibm,pmemory is present. In the case where we have enough DMA space to
>>>>>> direct map all of RAM, but not ibm,pmemory, we use direct DMA for
>>>>>> I/O to RAM and use the default window to dynamically map ibm,pmemory.
>>>>>> In the case where we only have a single DMA window, this won't work, > so if the window is not big enough to map the entire address range,
>>>>>> we cannot direct map.
>>>>>
>>>>> but we want the pmem range to be mapped into the huge DMA window too if we can, why skip it?
>>>>
>>>> This patch should simply do what the comment in this commit mentioned below suggests, which says that
>>>> ibm,pmemory can appear anywhere in the address space. If the DMA window is large enough
>>>> to map all of MAX_PHYSMEM_BITS, we will indeed simply do direct DMA for everything,
>>>> including the pmem. If we do not have a big enough window to do that, we will do
>>>> direct DMA for DRAM and dynamic mapping for pmem.
>>>
>>>
>>> Right, and this is what we do already, do not we? I missing something here.
>>
>> The upstream code does not work correctly that I can see. If I boot an upstream kernel
>> with an nvme device and vpmem assigned to the LPAR, and enable dev_dbg in arch/powerpc/platforms/pseries/iommu.c,
>> I see the following in the logs:
>>
>> [    2.157549] nvme 0121:50:00.0: ibm,query-pe-dma-windows(53) 500000 8000000 20000121 returned 0
>> [    2.157561] nvme 0121:50:00.0: Skipping ibm,pmemory
>> [    2.157567] nvme 0121:50:00.0: can't map partition max 0x8000000000000 with 16777216 65536-sized pages
>> [    2.170150] nvme 0121:50:00.0: ibm,create-pe-dma-window(54) 500000 8000000 20000121 10 28 returned 0 (liobn = 0x70000121 starting addr = 8000000 0)
>> [    2.170170] nvme 0121:50:00.0: created tce table LIOBN 0x70000121 for /pci@800000020000121/pci1014,683@0
>> [    2.356260] nvme 0121:50:00.0: node is /pci@800000020000121/pci1014,683@0
>>
>> This means we are heading down the leg in enable_ddw where we do not set direct_mapping to true. We use
>> create the DDW window, but don't do any direct DMA. This is because the window is not large enough to
>> map 2PB of memory, which is what ddw_memory_hotplug_max returns without my patch. 
>>
>> With my patch applied, I get this in the logs:
>>
>> [    2.204866] nvme 0121:50:00.0: ibm,query-pe-dma-windows(53) 500000 8000000 20000121 returned 0
>> [    2.204875] nvme 0121:50:00.0: Skipping ibm,pmemory
>> [    2.205058] nvme 0121:50:00.0: ibm,create-pe-dma-window(54) 500000 8000000 20000121 10 21 returned 0 (liobn = 0x70000121 starting addr = 8000000 0)
>> [    2.205068] nvme 0121:50:00.0: created tce table LIOBN 0x70000121 for /pci@800000020000121/pci1014,683@0
>> [    2.215898] nvme 0121:50:00.0: iommu: 64-bit OK but direct DMA is limited by 800000200000000
>>
> 
> 
> ah I see. then...
> 
> 
>>
>> Thanks,
>>
>> Brian
>>
>>
>>>
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/powerpc/platforms/pseries/iommu.c?id=bf6e2d562bbc4d115cf322b0bca57fe5bbd26f48
>>>>
>>>>
>>>> Thanks,
>>>>
>>>> Brian
>>>>
>>>>
>>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
>>>>>> ---
>>>>>>    arch/powerpc/platforms/pseries/iommu.c | 19 ++++++++++---------
>>>>>>    1 file changed, 10 insertions(+), 9 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>>>>>> index 269f61d519c2..d9ae985d10a4 100644
>>>>>> --- a/arch/powerpc/platforms/pseries/iommu.c
>>>>>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>>>>>> @@ -1092,15 +1092,6 @@ static phys_addr_t ddw_memory_hotplug_max(void)
>>>>>>        phys_addr_t max_addr = memory_hotplug_max();
>>>>>>        struct device_node *memory;
>>>>>>    -    /*
>>>>>> -     * The "ibm,pmemory" can appear anywhere in the address space.
>>>>>> -     * Assuming it is still backed by page structs, set the upper limit
>>>>>> -     * for the huge DMA window as MAX_PHYSMEM_BITS.
>>>>>> -     */
>>>>>> -    if (of_find_node_by_type(NULL, "ibm,pmemory"))
>>>>>> -        return (sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
>>>>>> -            (phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS);
>>>>>> -
>>>>>>        for_each_node_by_type(memory, "memory") {
>>>>>>            unsigned long start, size;
>>>>>>            int n_mem_addr_cells, n_mem_size_cells, len;
>>>>>> @@ -1341,6 +1332,16 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>>>>>>         */
>>>>>>        len = max_ram_len;
>>>>>>        if (pmem_present) {
>>>>>> +        if (default_win_removed) {
>>>>>> +            /*
>>>>>> +             * If we only have one DMA window and have pmem present,
>>>>>> +             * then we need to be able to map the entire address
>>>>>> +             * range in order to be able to do direct DMA to RAM.
>>>>>> +             */
>>>>>> +            len = order_base_2((sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
>>>>>> +                    (phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS));
> 
> 
> ... len = (sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ? 31 :
> MAX_PHYSMEM_BITS  ?
> 
> Or actually simply drop this hunk and only leave the first one and add
> this instead:
> 
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c
> b/arch/powerpc/platforms/pseries/iommu.c
> index 591ec9e94edb..68bfcd2227d9 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -1518,7 +1518,7 @@ static bool enable_ddw(struct pci_dev *dev, struct
> device_node *pdn)
>          * as RAM, then we failed to create a window to cover persistent
>          * memory and need to set the DMA limit.
>          */
> -       if (pmem_present && ddw_enabled && direct_mapping && len ==
> max_ram_len)
> +       if (pmem_present && ddw_enabled && direct_mapping)
> 
> ?


So, this would change the handling of devices that have a single window when pmem
is present. With your proposed change, we would then direct map for DRAM
and attempt to use whatever TCE space is left to do the dynamic mapping
when DMA'ing to the pmem, all from a single window. We don't account for this
in the code from what I can see, so we could get into the scenario where we have
a DMA window just large enough to map all of DRAM, we direct map that, and then
have nothing left over for the pmem.

I would actually like to get this working, as it would be helpful for the performance
of SR-IOV devices when pmem is present. However, I think we'd need to ensure we
have at least a certain amount of reserved DMA space for the dynamic mapping
before we do. There might be other things to consider as well...

Should we handle that as a further enhancement in a future patch, and move forward with this
as a bug fix?

Thanks,

Brian

> 
> Thanks,
> 
> 
> 
>>>>>> +        }
>>>>>> +
>>>>>>            if (query.largest_available_block >=
>>>>>>                (1ULL << (MAX_PHYSMEM_BITS - page_shift)))
>>>>>>                len = MAX_PHYSMEM_BITS;
>>>>>>
>>>>>
>>>>
>>>>
>>>
>>
>>
> 


-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

