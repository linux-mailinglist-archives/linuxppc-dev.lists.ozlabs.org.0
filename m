Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE812186FF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 14:14:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1yss3F3CzDqQj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 22:14:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1yqM6tXzzDqfj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 22:12:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=N0ME8wmj; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1yqK51zdz9sRf;
 Wed,  8 Jul 2020 22:12:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594210349;
 bh=PL91sEuccRkhCqAtfob7pQDXe5kXLWacpArSdJI++2o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=N0ME8wmjahxXIllko4JiHNHsPJ+Y/dibVdmAITs9ILi21kzLUVcddomQhNONrRrQ7
 Fen4r1zL+mUwXMW9o4Ri0zEmdRCfAAfK6Yly6R9p16T0CJ0OaDHkFPliJQKpj+gp7a
 K3ljPIuCVdUoDu0jWUi+aGo9uNMGpepdEfs+Dzj/lX5GIEi+hneIzr63owt4Rghy/C
 1KuTUAAiqmDUcoFjZM6EuwMyNSsTErE/ZrVfoYxei/HUjiNCa9EsXWs5tIHe2zWIFD
 RaQJZ4VnbEDULlWUt8YHVe8sLOwk1THi/D4HvciPY2cAPJavYMsk1uPnGHnlosOkqm
 lgcDW4coYq9og==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 4/4] powerpc/mm/radix: Create separate mappings for
 hot-plugged memory
In-Reply-To: <aa2e029f-d6f3-60da-7840-0b377da0337a@linux.ibm.com>
References: <20200625064547.228448-1-aneesh.kumar@linux.ibm.com>
 <20200625064547.228448-5-aneesh.kumar@linux.ibm.com>
 <877dve4nvj.fsf@mpe.ellerman.id.au>
 <aa2e029f-d6f3-60da-7840-0b377da0337a@linux.ibm.com>
Date: Wed, 08 Jul 2020 22:14:44 +1000
Message-ID: <87mu4a2ogb.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> On 7/8/20 10:14 AM, Michael Ellerman wrote:
>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>> To enable memory unplug without splitting kernel page table
>>> mapping, we force the max mapping size to the LMB size. LMB
>>> size is the unit in which hypervisor will do memory add/remove
>>> operation.
>>>
>>> This implies on pseries system, we now end up mapping
>> 
>> Please expand on why it "implies" that for pseries.
>> 
>>> memory with 2M page size instead of 1G. To improve
>>> that we want hypervisor to hint the kernel about the hotplug
>>> memory range.  This was added that as part of
>>                   That
>>>
>>> commit b6eca183e23e ("powerpc/kernel: Enables memory
>>> hot-remove after reboot on pseries guests")
>>>
>>> But we still don't do that on PowerVM. Once we get PowerVM
>> 
>> I think you mean PowerVM doesn't provide that hint yet?
>> 
>> Realistically it won't until P10. So this means we'll always use 2MB on
>> Power9 PowerVM doesn't it?
>> 
>> What about KVM?
>> 
>> Have you done any benchmarking on the impact of switching the linear
>> mapping to 2MB pages?
>> 
>
> The TLB impact should be minimal because with a 256M LMB size partition 
> scoped entries are still 2M and hence we end up with TLBs of 2M size.
>
>
>>> updated, we can then force the 2M mapping only to hot-pluggable
>>> memory region using memblock_is_hotpluggable(). Till then
>>> let's depend on LMB size for finding the mapping page size
>>> for linear range.
>>>
>
> updated
>
>
> powerpc/mm/radix: Create separate mappings for hot-plugged memory
>
> To enable memory unplug without splitting kernel page table
> mapping, we force the max mapping size to the LMB size. LMB
> size is the unit in which hypervisor will do memory add/remove
> operation.
>
> Pseries systems supports max LMB size of 256MB. Hence on pseries,
> we now end up mapping memory with 2M page size instead of 1G. To improve
> that we want hypervisor to hint the kernel about the hotplug
> memory range.  That was added that as part of
>
> commit b6eca18 ("powerpc/kernel: Enables memory
> hot-remove after reboot on pseries guests")
>
> But PowerVM doesn't provide that hint yet. Once we get PowerVM
> updated, we can then force the 2M mapping only to hot-pluggable
> memory region using memblock_is_hotpluggable(). Till then
> let's depend on LMB size for finding the mapping page size
> for linear range.
>
> With this change KVM guest will also be doing linear mapping with
> 2M page size.

...
>>> @@ -494,17 +544,27 @@ void __init radix__early_init_devtree(void)
>>>   	 * Try to find the available page sizes in the device-tree
>>>   	 */
>>>   	rc = of_scan_flat_dt(radix_dt_scan_page_sizes, NULL);
>>> -	if (rc != 0)  /* Found */
>>> -		goto found;
>>> +	if (rc == 0) {
>>> +		/*
>>> +		 * no page size details found in device tree
>>> +		 * let's assume we have page 4k and 64k support
>> 
>> Capitals and punctuation please?
>> 
>>> +		 */
>>> +		mmu_psize_defs[MMU_PAGE_4K].shift = 12;
>>> +		mmu_psize_defs[MMU_PAGE_4K].ap = 0x0;
>>> +
>>> +		mmu_psize_defs[MMU_PAGE_64K].shift = 16;
>>> +		mmu_psize_defs[MMU_PAGE_64K].ap = 0x5;
>>> +	}
>> 
>> Moving that seems like an unrelated change. It's a reasonable change but
>> I'd rather you did it in a standalone patch.
>> 
>
> we needed that change so that we can call radix_memory_block_size() for 
> both found and !found case.

But the found and !found cases converge at found:, which is where you
call it. So I don't understand.

But as I said below, it would be even simpler if you worked out the
memory block size first.

cheers

>>>   	/*
>>> -	 * let's assume we have page 4k and 64k support
>>> +	 * Max mapping size used when mapping pages. We don't use
>>> +	 * ppc_md.memory_block_size() here because this get called
>>> +	 * early and we don't have machine probe called yet. Also
>>> +	 * the pseries implementation only check for ibm,lmb-size.
>>> +	 * All hypervisor supporting radix do expose that device
>>> +	 * tree node.
>>>   	 */
>>> -	mmu_psize_defs[MMU_PAGE_4K].shift = 12;
>>> -	mmu_psize_defs[MMU_PAGE_4K].ap = 0x0;
>>> -
>>> -	mmu_psize_defs[MMU_PAGE_64K].shift = 16;
>>> -	mmu_psize_defs[MMU_PAGE_64K].ap = 0x5;
>>> -found:
>>> +	radix_mem_block_size = radix_memory_block_size();
>> 
>> If you did that earlier in the function, before
>> radix_dt_scan_page_sizes(), the logic would be simpler.
>> 
>>>   	return;
>>>   }
