Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1F2217F8D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 08:28:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1qBp0XNYzDqsv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 16:28:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1q7X3Dw1zDr55
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 16:26:00 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06864V5h003644; Wed, 8 Jul 2020 02:25:53 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3253uueu9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 02:25:52 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0686G93q017603;
 Wed, 8 Jul 2020 06:25:50 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 322hd84a6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 06:25:50 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0686OWOg40304710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 06:24:32 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CDBF11C05C;
 Wed,  8 Jul 2020 06:24:32 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9AD6811C054;
 Wed,  8 Jul 2020 06:24:31 +0000 (GMT)
Received: from [9.102.2.253] (unknown [9.102.2.253])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 Jul 2020 06:24:31 +0000 (GMT)
Subject: Re: [PATCH v2 4/4] powerpc/mm/radix: Create separate mappings for
 hot-plugged memory
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20200625064547.228448-1-aneesh.kumar@linux.ibm.com>
 <20200625064547.228448-5-aneesh.kumar@linux.ibm.com>
 <877dve4nvj.fsf@mpe.ellerman.id.au>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <aa2e029f-d6f3-60da-7840-0b377da0337a@linux.ibm.com>
Date: Wed, 8 Jul 2020 11:54:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <877dve4nvj.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_01:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 phishscore=0 impostorscore=0 cotscore=-2147483648 malwarescore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007080042
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
Cc: Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/8/20 10:14 AM, Michael Ellerman wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> To enable memory unplug without splitting kernel page table
>> mapping, we force the max mapping size to the LMB size. LMB
>> size is the unit in which hypervisor will do memory add/remove
>> operation.
>>
>> This implies on pseries system, we now end up mapping
> 
> Please expand on why it "implies" that for pseries.
> 
>> memory with 2M page size instead of 1G. To improve
>> that we want hypervisor to hint the kernel about the hotplug
>> memory range.  This was added that as part of
>                   That
>>
>> commit b6eca183e23e ("powerpc/kernel: Enables memory
>> hot-remove after reboot on pseries guests")
>>
>> But we still don't do that on PowerVM. Once we get PowerVM
> 
> I think you mean PowerVM doesn't provide that hint yet?
> 
> Realistically it won't until P10. So this means we'll always use 2MB on
> Power9 PowerVM doesn't it?
> 
> What about KVM?
> 
> Have you done any benchmarking on the impact of switching the linear
> mapping to 2MB pages?
> 

The TLB impact should be minimal because with a 256M LMB size partition 
scoped entries are still 2M and hence we end up with TLBs of 2M size.


>> updated, we can then force the 2M mapping only to hot-pluggable
>> memory region using memblock_is_hotpluggable(). Till then
>> let's depend on LMB size for finding the mapping page size
>> for linear range.
>>

updated


powerpc/mm/radix: Create separate mappings for hot-plugged memory

To enable memory unplug without splitting kernel page table
mapping, we force the max mapping size to the LMB size. LMB
size is the unit in which hypervisor will do memory add/remove
operation.

Pseries systems supports max LMB size of 256MB. Hence on pseries,
we now end up mapping memory with 2M page size instead of 1G. To improve
that we want hypervisor to hint the kernel about the hotplug
memory range.  That was added that as part of

commit b6eca18 ("powerpc/kernel: Enables memory
hot-remove after reboot on pseries guests")

But PowerVM doesn't provide that hint yet. Once we get PowerVM
updated, we can then force the 2M mapping only to hot-pluggable
memory region using memblock_is_hotpluggable(). Till then
let's depend on LMB size for finding the mapping page size
for linear range.

With this change KVM guest will also be doing linear mapping with
2M page size.



>> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/mm/book3s64/radix_pgtable.c | 83 ++++++++++++++++++++----
>>   arch/powerpc/platforms/powernv/setup.c   | 10 ++-
>>   2 files changed, 81 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> index 78ad11812e0d..a4179e4da49d 100644
>> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/mm.h>
>>   #include <linux/hugetlb.h>
>>   #include <linux/string_helpers.h>
>> +#include <linux/memory.h>
>>   
>>   #include <asm/pgtable.h>
>>   #include <asm/pgalloc.h>
>> @@ -34,6 +35,7 @@
>>   
>>   unsigned int mmu_pid_bits;
>>   unsigned int mmu_base_pid;
>> +unsigned int radix_mem_block_size;
> 
> static? __ro_after_init?
> 

Added __ro_after_iit

>> @@ -266,6 +268,7 @@ static unsigned long next_boundary(unsigned long addr, unsigned long end)
>>   
>>   static int __meminit create_physical_mapping(unsigned long start,
>>   					     unsigned long end,
>> +					     unsigned long max_mapping_size,
>>   					     int nid, pgprot_t _prot)
>>   {
>>   	unsigned long vaddr, addr, mapping_size = 0;
>> @@ -279,6 +282,8 @@ static int __meminit create_physical_mapping(unsigned long start,
>>   		int rc;
>>   
>>   		gap = next_boundary(addr, end) - addr;
>> +		if (gap > max_mapping_size)
>> +			gap = max_mapping_size;
>>   		previous_size = mapping_size;
>>   		prev_exec = exec;
>>   
>> @@ -329,8 +334,9 @@ static void __init radix_init_pgtable(void)
>>   
>>   	/* We don't support slb for radix */
>>   	mmu_slb_size = 0;
>> +
>>   	/*
>> -	 * Create the linear mapping, using standard page size for now
>> +	 * Create the linear mapping
>>   	 */
>>   	for_each_memblock(memory, reg) {
>>   		/*
>> @@ -346,6 +352,7 @@ static void __init radix_init_pgtable(void)
>>   
>>   		WARN_ON(create_physical_mapping(reg->base,
>>   						reg->base + reg->size,
>> +						radix_mem_block_size,
>>   						-1, PAGE_KERNEL));
>>   	}
>>   
>> @@ -486,6 +493,49 @@ static int __init radix_dt_scan_page_sizes(unsigned long node,
>>   	return 1;
>>   }
>>   
>> +static int __init probe_memory_block_size(unsigned long node, const char *uname, int
>> +					  depth, void *data)
>> +{
>> +	const __be32 *block_size;
>> +	int len;
>> +
>> +	if (depth != 1)
>> +		return 0;
>> +
>> +	if (!strcmp(uname, "ibm,dynamic-reconfiguration-memory")) {
> 
> 	if (strcmp(uname, "ibm,dynamic-reconfiguration-memory") != 0)
>          	return 0;
> 
> Then you can de-indent the rest of the body.
> 

updated

> 
>> +		block_size = of_get_flat_dt_prop(node, "ibm,lmb-size", &len);
>> +		if (!block_size || len < dt_root_size_cells * sizeof(__be32))
> 
> This will give us a sparse warning, please do the endian conversion
> before looking at the value.
> 
>> +			/*
>> +			 * Nothing in the device tree
>> +			 */
>> +			return MIN_MEMORY_BLOCK_SIZE;
> 
>> +
>> +		return dt_mem_next_cell(dt_root_size_cells, &block_size);
> 
> Just of_read_number() ?
> 
> This is misusing the return value, as I explained on one of your other
> recent patches. You should return !0 to indicate that scanning should
> stop, and the actual value can go via the data pointer, or better just
> set the global.
> 


updated

> 
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static unsigned long radix_memory_block_size(void)
>> +{
>> +	unsigned long mem_block_size = MIN_MEMORY_BLOCK_SIZE;
> 
>> +
>> +	if (firmware_has_feature(FW_FEATURE_OPAL)) {
>> +
>> +		mem_block_size = 1UL * 1024 * 1024 * 1024;
> 
> We have 1GB hardcoded here and also in pnv_memory_block_size().
> 
> Shouldn't pnv_memory_block_size() at least be using radix_mem_block_size?


updated

> 
>> +	} else if (firmware_has_feature(FW_FEATURE_LPAR)) {
>> +		mem_block_size = of_scan_flat_dt(probe_memory_block_size, NULL);
>> +		if (!mem_block_size)
>> +			mem_block_size = MIN_MEMORY_BLOCK_SIZE;
>> +	}
>> +
>> +	return mem_block_size;
>> +}
> 
> It would probably be simpler if that was just inlined below.
> 
>> +
>> +
>>   void __init radix__early_init_devtree(void)
>>   {
>>   	int rc;
>> @@ -494,17 +544,27 @@ void __init radix__early_init_devtree(void)
>>   	 * Try to find the available page sizes in the device-tree
>>   	 */
>>   	rc = of_scan_flat_dt(radix_dt_scan_page_sizes, NULL);
>> -	if (rc != 0)  /* Found */
>> -		goto found;
>> +	if (rc == 0) {
>> +		/*
>> +		 * no page size details found in device tree
>> +		 * let's assume we have page 4k and 64k support
> 
> Capitals and punctuation please?
> 
>> +		 */
>> +		mmu_psize_defs[MMU_PAGE_4K].shift = 12;
>> +		mmu_psize_defs[MMU_PAGE_4K].ap = 0x0;
>> +
>> +		mmu_psize_defs[MMU_PAGE_64K].shift = 16;
>> +		mmu_psize_defs[MMU_PAGE_64K].ap = 0x5;
>> +	}
> 
> Moving that seems like an unrelated change. It's a reasonable change but
> I'd rather you did it in a standalone patch.
> 

we needed that change so that we can call radix_memory_block_size() for 
both found and !found case.

>>   	/*
>> -	 * let's assume we have page 4k and 64k support
>> +	 * Max mapping size used when mapping pages. We don't use
>> +	 * ppc_md.memory_block_size() here because this get called
>> +	 * early and we don't have machine probe called yet. Also
>> +	 * the pseries implementation only check for ibm,lmb-size.
>> +	 * All hypervisor supporting radix do expose that device
>> +	 * tree node.
>>   	 */
>> -	mmu_psize_defs[MMU_PAGE_4K].shift = 12;
>> -	mmu_psize_defs[MMU_PAGE_4K].ap = 0x0;
>> -
>> -	mmu_psize_defs[MMU_PAGE_64K].shift = 16;
>> -	mmu_psize_defs[MMU_PAGE_64K].ap = 0x5;
>> -found:
>> +	radix_mem_block_size = radix_memory_block_size();
> 
> If you did that earlier in the function, before
> radix_dt_scan_page_sizes(), the logic would be simpler.
> 
>>   	return;
>>   }
>>   
>> @@ -856,7 +916,8 @@ int __meminit radix__create_section_mapping(unsigned long start,
>>   		return -1;
>>   	}
>>   
>> -	return create_physical_mapping(__pa(start), __pa(end), nid, prot);
>> +	return create_physical_mapping(__pa(start), __pa(end),
>> +				       radix_mem_block_size, nid, prot);
>>   }
>>   
>>   int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
>> diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
>> index 3bc188da82ba..6e2f614590a3 100644
>> --- a/arch/powerpc/platforms/powernv/setup.c
>> +++ b/arch/powerpc/platforms/powernv/setup.c
>> @@ -399,7 +399,15 @@ static void pnv_kexec_cpu_down(int crash_shutdown, int secondary)
>>   #ifdef CONFIG_MEMORY_HOTPLUG_SPARSE
>>   static unsigned long pnv_memory_block_size(void)
>>   {
>> -	return 256UL * 1024 * 1024;
>> +	/*
>> +	 * We map the kernel linear region with 1GB large pages on radix. For
>> +	 * memory hot unplug to work our memory block size must be at least
>> +	 * this size.
>> +	 */
>> +	if (radix_enabled())
>> +		return 1UL * 1024 * 1024 * 1024;
>> +	else
>> +		return 256UL * 1024 * 1024;
>>   }
>>   #endif
>>   
>> -- 
>> 2.26.2
> 
> 
> cheers
> 


-aneesh
