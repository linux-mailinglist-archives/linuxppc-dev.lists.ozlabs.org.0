Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C80D13492B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 18:21:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tGHx51xbzDqVL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 04:21:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=deltatee.com (client-ip=207.54.116.67; helo=ale.deltatee.com;
 envelope-from=logang@deltatee.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=deltatee.com
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tGCL3jwwzDqVN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 04:17:34 +1100 (AEDT)
Received: from s0106ac1f6bb1ecac.cg.shawcable.net ([70.73.163.230]
 helo=[192.168.11.155])
 by ale.deltatee.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <logang@deltatee.com>)
 id 1ipExL-0004JB-Ec; Wed, 08 Jan 2020 10:17:20 -0700
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-mm@kvack.org, Dan Williams <dan.j.williams@intel.com>,
 Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20200107205959.7575-1-logang@deltatee.com>
 <20200107205959.7575-8-logang@deltatee.com>
 <f4c11a37-91dd-a366-7683-4e4cd4bd7e99@redhat.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <f08ae374-365e-4291-9cf2-d807a45579bb@deltatee.com>
Date: Wed, 8 Jan 2020 10:17:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <f4c11a37-91dd-a366-7683-4e4cd4bd7e99@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.73.163.230
X-SA-Exim-Rcpt-To: mhocko@suse.com, ebadger@gigaio.com, peterz@infradead.org,
 luto@kernel.org, dave.hansen@linux.intel.com, bp@alien8.de, mingo@redhat.com,
 tglx@linutronix.de, benh@kernel.crashing.org, will@kernel.org,
 catalin.marinas@arm.com, hch@lst.de, akpm@linux-foundation.org,
 mhocko@kernel.org, dan.j.williams@intel.com, linux-mm@kvack.org,
 platform-driver-x86@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-ia64@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, david@redhat.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v2 7/8] mm/memory_hotplug: Add pgprot_t to mhp_modifiers
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
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
Cc: Eric Badger <ebadger@gigaio.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Michal Hocko <mhocko@suse.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2020-01-08 5:39 a.m., David Hildenbrand wrote:
> On 07.01.20 21:59, Logan Gunthorpe wrote:
>> devm_memremap_pages() is currently used by the PCI P2PDMA code to create
>> struct page mappings for IO memory. At present, these mappings are created
>> with PAGE_KERNEL which implies setting the PAT bits to be WB. However, on
>> x86, an mtrr register will typically override this and force the cache
>> type to be UC-. In the case firmware doesn't set this register it is
>> effectively WB and will typically result in a machine check exception
>> when it's accessed.
>>
>> Other arches are not currently likely to function correctly seeing they
>> don't have any MTRR registers to fall back on.
>>
>> To solve this, add an argument to arch_add_memory() to explicitly
>> set the pgprot value to a specific value.
> 
> You're adding a parameter indirectly by adding it to the structure.
> Maybe "provide a way to specify the pgprot value explicitly to
> arch_add_memory()"
> 
>>
>> Of the arches that support MEMORY_HOTPLUG: x86_64, s390 and arm64 is a
> 
> s/is/need/
> 
>> simple change to pass the pgprot_t down to their respective functions
>> which set up the page tables. For x86_32, set the page tables explicitly
> 
> "page table protection" ?
> 
>> using _set_memory_prot() (seeing they are already mapped). For sh, reject
>> anything but PAGE_KERNEL settings -- this should be fine, for now, seeing
>> sh doesn't support ZONE_DEVICE anyway.
>>
>> Cc: Dan Williams <dan.j.williams@intel.com>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Michal Hocko <mhocko@suse.com>
>> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
>> ---
>>  arch/arm64/mm/mmu.c            | 3 ++-
>>  arch/ia64/mm/init.c            | 4 ++++
>>  arch/powerpc/mm/mem.c          | 3 ++-
>>  arch/s390/mm/init.c            | 2 +-
>>  arch/sh/mm/init.c              | 3 +++
>>  arch/x86/mm/init_32.c          | 5 +++++
>>  arch/x86/mm/init_64.c          | 2 +-
>>  include/linux/memory_hotplug.h | 2 ++
>>  mm/memory_hotplug.c            | 2 +-
>>  mm/memremap.c                  | 6 +++---
>>  10 files changed, 24 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 3320406579c3..9b214b0d268f 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1058,7 +1058,8 @@ int arch_add_memory(int nid, u64 start, u64 size,
>>  		flags = NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>  
>>  	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
>> -			     size, PAGE_KERNEL, __pgd_pgtable_alloc, flags);
>> +			     size, modifiers->pgprot, __pgd_pgtable_alloc,
>> +			     flags);
>>  
>>  	memblock_clear_nomap(start, size);
>>  
>> diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
>> index daf438e08b96..5fd6ae4929c9 100644
>> --- a/arch/ia64/mm/init.c
>> +++ b/arch/ia64/mm/init.c
>> @@ -677,6 +677,10 @@ int arch_add_memory(int nid, u64 start, u64 size,
>>  	int ret;
>>  
>>  	ret = __add_pages(nid, start_pfn, nr_pages, modifiers);
>> +	if (modifiers->pgprot != PAGE_KERNEL)
>> +		return -EINVAL;
> 
> ... maybe better "if (WARN_ON_ONCE(...))"
> [...]
> 
>> --- a/include/linux/memory_hotplug.h
>> +++ b/include/linux/memory_hotplug.h
>> @@ -56,9 +56,11 @@ enum {
>>  /*
>>   * Restrictions for the memory hotplug:
>>   * altmap: alternative allocator for memmap array
>> + * pgprot: page protection flags to apply to newly added page tables
>>   */
>>  struct mhp_modifiers {
>>  	struct vmem_altmap *altmap;
>> +	pgprot_t pgprot;
>>  };
>>  
>>  /*
>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>> index 1bb3f92e087d..0888f821af06 100644
>> --- a/mm/memory_hotplug.c
>> +++ b/mm/memory_hotplug.c
>> @@ -1027,7 +1027,7 @@ static int online_memory_block(struct memory_block *mem, void *arg)
>>   */
>>  int __ref add_memory_resource(int nid, struct resource *res)
>>  {
>> -	struct mhp_modifiers modifiers = {};
>> +	struct mhp_modifiers modifiers = {.pgprot = PAGE_KERNEL};
> 
> I think we usually use spaces like
> 
> = { .pgprot = PAGE_KERNEL };
> 
> t480s: ~/git/linux virtio-mem-v1 $ git grep "= {\." | wc -l
> 978
> t480s: ~/git/linux virtio-mem-v1 $ git grep "= { " | wc -l
> 35447
> 
>>  	u64 start, size;
>>  	bool new_node = false;
>>  	int ret;
>> diff --git a/mm/memremap.c b/mm/memremap.c
>> index e30be8ba706b..45ab4ef0643d 100644
>> --- a/mm/memremap.c
>> +++ b/mm/memremap.c
>> @@ -163,8 +163,8 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>>  		 * We do not want any optional features only our own memmap
>>  		 */
>>  		.altmap = pgmap_altmap(pgmap),
>> +		.pgprot = PAGE_KERNEL,
>>  	};
>> -	pgprot_t pgprot = PAGE_KERNEL;
>>  	int error, is_ram;
>>  	bool need_devmap_managed = true;
>>  
>> @@ -252,8 +252,8 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>>  	if (nid < 0)
>>  		nid = numa_mem_id();
>>  
>> -	error = track_pfn_remap(NULL, &pgprot, PHYS_PFN(res->start), 0,
>> -			resource_size(res));
>> +	error = track_pfn_remap(NULL, &modifiers.pgprot, PHYS_PFN(res->start),
>> +				0, resource_size(res));
>>  	if (error)
>>  		goto err_pfn_remap;
>>  
>>
> 
> The !arch code looks good to me (besides I would prefer "params" instead
> of "modifiers").
> 
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks, I'll make the changes above for v3.

Logan

