Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF04BEAA5E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 06:37:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473YxL5d3DzF4Q8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 16:37:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473Yv86PjpzF5Xm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 16:35:32 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9V5Ya8Q083730; Thu, 31 Oct 2019 01:35:24 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vyrjthvey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Oct 2019 01:35:24 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9V5ZNLF028354;
 Thu, 31 Oct 2019 05:35:23 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 2vxwh67jvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Oct 2019 05:35:23 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9V5ZMDt41812396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Oct 2019 05:35:22 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 692DD124054;
 Thu, 31 Oct 2019 05:35:22 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20AD1124058;
 Thu, 31 Oct 2019 05:35:21 +0000 (GMT)
Received: from [9.199.35.193] (unknown [9.199.35.193])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 31 Oct 2019 05:35:20 +0000 (GMT)
Subject: Re: [RFC PATCH 1/4] libnvdimm/namespace: Make namespace size
 validation arch dependent
To: Dan Williams <dan.j.williams@intel.com>
References: <20191028094825.21448-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4gZ=wKzwscu_nch8VUtNTHusKzjmMhYZWo+Se=BPO9q8g@mail.gmail.com>
 <6f85f4af-788d-aaef-db64-ab8d3faf6b1b@linux.ibm.com>
 <CAPcyv4gMnSe26QfSBABx0zj3XuFqy=K1XaGnmE3h3sP3Y76nRw@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <4c6e5743-663e-853b-2203-15c809965965@linux.ibm.com>
Date: Thu, 31 Oct 2019 11:05:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4gMnSe26QfSBABx0zj3XuFqy=K1XaGnmE3h3sP3Y76nRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-31_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910310055
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/29/19 11:00 AM, Dan Williams wrote:
> On Mon, Oct 28, 2019 at 9:35 PM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> On 10/29/19 4:38 AM, Dan Williams wrote:
>>> On Mon, Oct 28, 2019 at 2:48 AM Aneesh Kumar K.V
>>> <aneesh.kumar@linux.ibm.com> wrote:
>>>>
>>>> The page size used to map the namespace is arch dependent. For example
>>>> architectures like ppc64 use 16MB page size for direct-mapping. If the namespace
>>>> size is not aligned to the mapping page size, we can observe kernel crash
>>>> during namespace init and destroy.
>>>>
>>>> This is due to kernel doing partial map/unmap of the resource range
>>>>
>>>> BUG: Unable to handle kernel data access at 0xc001000406000000
>>>> Faulting instruction address: 0xc000000000090790
>>>> NIP [c000000000090790] arch_add_memory+0xc0/0x130
>>>> LR [c000000000090744] arch_add_memory+0x74/0x130
>>>> Call Trace:
>>>>    arch_add_memory+0x74/0x130 (unreliable)
>>>>    memremap_pages+0x74c/0xa30
>>>>    devm_memremap_pages+0x3c/0xa0
>>>>    pmem_attach_disk+0x188/0x770
>>>>    nvdimm_bus_probe+0xd8/0x470
>>>>    really_probe+0x148/0x570
>>>>    driver_probe_device+0x19c/0x1d0
>>>>    device_driver_attach+0xcc/0x100
>>>>    bind_store+0x134/0x1c0
>>>>    drv_attr_store+0x44/0x60
>>>>    sysfs_kf_write+0x74/0xc0
>>>>    kernfs_fop_write+0x1b4/0x290
>>>>    __vfs_write+0x3c/0x70
>>>>    vfs_write+0xd0/0x260
>>>>    ksys_write+0xdc/0x130
>>>>    system_call+0x5c/0x68
>>>>
>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>> ---
>>>>    arch/arm64/mm/flush.c     | 11 +++++++++++
>>>>    arch/powerpc/lib/pmem.c   | 21 +++++++++++++++++++--
>>>>    arch/x86/mm/pageattr.c    | 12 ++++++++++++
>>>>    include/linux/libnvdimm.h |  1 +
>>>>    4 files changed, 43 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/mm/flush.c b/arch/arm64/mm/flush.c
>>>> index ac485163a4a7..90c54c600023 100644
>>>> --- a/arch/arm64/mm/flush.c
>>>> +++ b/arch/arm64/mm/flush.c
>>>> @@ -91,4 +91,15 @@ void arch_invalidate_pmem(void *addr, size_t size)
>>>>           __inval_dcache_area(addr, size);
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
>>>> +
>>>> +unsigned long arch_validate_namespace_size(unsigned int ndr_mappings, unsigned long size)
>>>> +{
>>>> +       u32 remainder;
>>>> +
>>>> +       div_u64_rem(size, PAGE_SIZE * ndr_mappings, &remainder);
>>>> +       if (remainder)
>>>> +               return PAGE_SIZE * ndr_mappings;
>>>> +       return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(arch_validate_namespace_size);
>>>>    #endif
>>>> diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
>>>> index 377712e85605..2e661a08dae5 100644
>>>> --- a/arch/powerpc/lib/pmem.c
>>>> +++ b/arch/powerpc/lib/pmem.c
>>>> @@ -17,14 +17,31 @@ void arch_wb_cache_pmem(void *addr, size_t size)
>>>>           unsigned long start = (unsigned long) addr;
>>>>           flush_dcache_range(start, start + size);
>>>>    }
>>>> -EXPORT_SYMBOL(arch_wb_cache_pmem);
>>>> +EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);
>>>>
>>>>    void arch_invalidate_pmem(void *addr, size_t size)
>>>>    {
>>>>           unsigned long start = (unsigned long) addr;
>>>>           flush_dcache_range(start, start + size);
>>>>    }
>>>> -EXPORT_SYMBOL(arch_invalidate_pmem);
>>>> +EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
>>>> +
>>>> +unsigned long arch_validate_namespace_size(unsigned int ndr_mappings, unsigned long size)
>>>> +{
>>>> +       u32 remainder;
>>>> +       unsigned long linear_map_size;
>>>> +
>>>> +       if (radix_enabled())
>>>> +               linear_map_size = PAGE_SIZE;
>>>> +       else
>>>> +               linear_map_size = (1UL << mmu_psize_defs[mmu_linear_psize].shift);
>>>
>>> This seems more a "supported_alignments" problem, and less a namespace
>>> size or PAGE_SIZE problem, because if the starting address is
>>> misaligned this size validation can still succeed when it shouldn't.
>>>
>>
>>
>> Isn't supported_alignments an indication of how user want the namespace
>> to be mapped to applications?  Ie, with the above restrictions we can
>> still do both 64K and 16M mapping of the namespace to userspace.
> 
> True, for the pfn device and the device-dax mapping size, but I'm
> suggesting adding another instance of alignment control at the raw
> namespace level. That would need to be disconnected from the
> device-dax page mapping granularity.
> 

Can you explain what you mean by raw namespace level ? We don't have 
multiple values against which we need to check the alignment of 
namespace start and namespace size.

If you can outline how and where you would like to enforce that check I 
can start working on it.

-aneesh

