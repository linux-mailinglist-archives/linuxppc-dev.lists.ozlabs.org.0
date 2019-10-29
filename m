Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2201E7F41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 05:38:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472JkG5gSSzF1Hv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 15:38:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472Jdv6cSnzF157
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 15:34:43 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9T3IRCr099525; Tue, 29 Oct 2019 00:34:31 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vxcdqkdmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2019 00:34:31 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9T4Ur72028247;
 Tue, 29 Oct 2019 04:34:30 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 2vvds6r59c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2019 04:34:30 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9T4YTst53084634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Oct 2019 04:34:29 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9403D6A04F;
 Tue, 29 Oct 2019 04:34:29 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F30B6A051;
 Tue, 29 Oct 2019 04:34:27 +0000 (GMT)
Received: from [9.204.200.92] (unknown [9.204.200.92])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 29 Oct 2019 04:34:27 +0000 (GMT)
Subject: Re: [RFC PATCH 1/4] libnvdimm/namespace: Make namespace size
 validation arch dependent
To: Dan Williams <dan.j.williams@intel.com>
References: <20191028094825.21448-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4gZ=wKzwscu_nch8VUtNTHusKzjmMhYZWo+Se=BPO9q8g@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <6f85f4af-788d-aaef-db64-ab8d3faf6b1b@linux.ibm.com>
Date: Tue, 29 Oct 2019 10:04:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4gZ=wKzwscu_nch8VUtNTHusKzjmMhYZWo+Se=BPO9q8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-28_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910290027
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

On 10/29/19 4:38 AM, Dan Williams wrote:
> On Mon, Oct 28, 2019 at 2:48 AM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> The page size used to map the namespace is arch dependent. For example
>> architectures like ppc64 use 16MB page size for direct-mapping. If the namespace
>> size is not aligned to the mapping page size, we can observe kernel crash
>> during namespace init and destroy.
>>
>> This is due to kernel doing partial map/unmap of the resource range
>>
>> BUG: Unable to handle kernel data access at 0xc001000406000000
>> Faulting instruction address: 0xc000000000090790
>> NIP [c000000000090790] arch_add_memory+0xc0/0x130
>> LR [c000000000090744] arch_add_memory+0x74/0x130
>> Call Trace:
>>   arch_add_memory+0x74/0x130 (unreliable)
>>   memremap_pages+0x74c/0xa30
>>   devm_memremap_pages+0x3c/0xa0
>>   pmem_attach_disk+0x188/0x770
>>   nvdimm_bus_probe+0xd8/0x470
>>   really_probe+0x148/0x570
>>   driver_probe_device+0x19c/0x1d0
>>   device_driver_attach+0xcc/0x100
>>   bind_store+0x134/0x1c0
>>   drv_attr_store+0x44/0x60
>>   sysfs_kf_write+0x74/0xc0
>>   kernfs_fop_write+0x1b4/0x290
>>   __vfs_write+0x3c/0x70
>>   vfs_write+0xd0/0x260
>>   ksys_write+0xdc/0x130
>>   system_call+0x5c/0x68
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/arm64/mm/flush.c     | 11 +++++++++++
>>   arch/powerpc/lib/pmem.c   | 21 +++++++++++++++++++--
>>   arch/x86/mm/pageattr.c    | 12 ++++++++++++
>>   include/linux/libnvdimm.h |  1 +
>>   4 files changed, 43 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/mm/flush.c b/arch/arm64/mm/flush.c
>> index ac485163a4a7..90c54c600023 100644
>> --- a/arch/arm64/mm/flush.c
>> +++ b/arch/arm64/mm/flush.c
>> @@ -91,4 +91,15 @@ void arch_invalidate_pmem(void *addr, size_t size)
>>          __inval_dcache_area(addr, size);
>>   }
>>   EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
>> +
>> +unsigned long arch_validate_namespace_size(unsigned int ndr_mappings, unsigned long size)
>> +{
>> +       u32 remainder;
>> +
>> +       div_u64_rem(size, PAGE_SIZE * ndr_mappings, &remainder);
>> +       if (remainder)
>> +               return PAGE_SIZE * ndr_mappings;
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(arch_validate_namespace_size);
>>   #endif
>> diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
>> index 377712e85605..2e661a08dae5 100644
>> --- a/arch/powerpc/lib/pmem.c
>> +++ b/arch/powerpc/lib/pmem.c
>> @@ -17,14 +17,31 @@ void arch_wb_cache_pmem(void *addr, size_t size)
>>          unsigned long start = (unsigned long) addr;
>>          flush_dcache_range(start, start + size);
>>   }
>> -EXPORT_SYMBOL(arch_wb_cache_pmem);
>> +EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);
>>
>>   void arch_invalidate_pmem(void *addr, size_t size)
>>   {
>>          unsigned long start = (unsigned long) addr;
>>          flush_dcache_range(start, start + size);
>>   }
>> -EXPORT_SYMBOL(arch_invalidate_pmem);
>> +EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
>> +
>> +unsigned long arch_validate_namespace_size(unsigned int ndr_mappings, unsigned long size)
>> +{
>> +       u32 remainder;
>> +       unsigned long linear_map_size;
>> +
>> +       if (radix_enabled())
>> +               linear_map_size = PAGE_SIZE;
>> +       else
>> +               linear_map_size = (1UL << mmu_psize_defs[mmu_linear_psize].shift);
> 
> This seems more a "supported_alignments" problem, and less a namespace
> size or PAGE_SIZE problem, because if the starting address is
> misaligned this size validation can still succeed when it shouldn't.
> 


Isn't supported_alignments an indication of how user want the namespace 
to be mapped to applications?  Ie, with the above restrictions we can 
still do both 64K and 16M mapping of the namespace to userspace.

Also for supported alignment the huge page mapping is further  dependent 
on the THP feature.

The restrictions here are mostly w.r.t the direct-mapping page size used 
by some architecture.


> One problem is that __size_store() does not validate the size against
> the namespace alignment.
> 
> However, the next problem is that alignment is a property of the pfn
> device, but not the raw namespace. I think this alignment constraint
> should be captured by exposing "align" and "supported_alignments" at
> the namespace level as the minimum alignment. The pfn level alignment
> could then be an additional alignment constraint, but ndctl would
> likely set them to the same value.
> 
> The "* ndr_mappings" constraint should be left out of the interface,
> because that's a side effect of supporting namespace-type-blk aliasing
> which no platform seems to do in practice. If for some strange reason
> it's need in the future I'd rather expose the "aliasing" property
> rather than fold it into the align / supported_aligns interface.
> 

-aneesh
