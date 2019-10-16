Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A89BED90E2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 14:29:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tWnv4yK2zDr08
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 23:29:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=virtuozzo.com (client-ip=185.231.240.75; helo=relay.sw.ru;
 envelope-from=aryabinin@virtuozzo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=virtuozzo.com
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tWb449hkzDr0m
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 23:20:14 +1100 (AEDT)
Received: from [172.16.25.5] by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <aryabinin@virtuozzo.com>)
 id 1iKiHd-0008JI-Fd; Wed, 16 Oct 2019 15:20:05 +0300
Subject: Re: [PATCH v8 1/5] kasan: support backing vmalloc space with real
 shadow memory
To: Daniel Axtens <dja@axtens.net>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, x86@kernel.org, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
References: <20191001065834.8880-1-dja@axtens.net>
 <20191001065834.8880-2-dja@axtens.net>
 <352cb4fa-2e57-7e3b-23af-898e113bbe22@virtuozzo.com>
 <87ftjvtoo7.fsf@dja-thinkpad.axtens.net>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <8f573b40-3a5a-ed36-dffb-4a54faf3c4e1@virtuozzo.com>
Date: Wed, 16 Oct 2019 15:19:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87ftjvtoo7.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, gor@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 10/14/19 4:57 PM, Daniel Axtens wrote:
> Hi Andrey,
> 
> 
>>> +	/*
>>> +	 * Ensure poisoning is visible before the shadow is made visible
>>> +	 * to other CPUs.
>>> +	 */
>>> +	smp_wmb();
>>
>> I'm not quite understand what this barrier do and why it needed.
>> And if it's really needed there should be a pairing barrier
>> on the other side which I don't see.
> 
> Mark might be better able to answer this, but my understanding is that
> we want to make sure that we never have a situation where the writes are
> reordered so that PTE is installed before all the poisioning is written
> out. I think it follows the logic in __pte_alloc() in mm/memory.c:
> 
> 	/*
> 	 * Ensure all pte setup (eg. pte page lock and page clearing) are
> 	 * visible before the pte is made visible to other CPUs by being
> 	 * put into page tables.
> 	 *
> 	 * The other side of the story is the pointer chasing in the page
> 	 * table walking code (when walking the page table without locking;
> 	 * ie. most of the time). Fortunately, these data accesses consist
> 	 * of a chain of data-dependent loads, meaning most CPUs (alpha
> 	 * being the notable exception) will already guarantee loads are
> 	 * seen in-order. See the alpha page table accessors for the
> 	 * smp_read_barrier_depends() barriers in page table walking code.
> 	 */
> 	smp_wmb(); /* Could be smp_wmb__xxx(before|after)_spin_lock */
> 
> I can clarify the comment.
> 

I don't see how is this relevant here.

barrier in __pte_alloc() for very the following case:

CPU 0							CPU 1
__pte_alloc():                                          pte_offset_kernel(pmd_t * dir, unsigned long address):
     pgtable_t new = pte_alloc_one(mm);                        pte_t *new = (pte_t *) pmd_page_vaddr(*dir) + ((address >> PAGE_SHIFT) & (PTRS_PER_PAGE - 1));  
     smp_wmb();                                                smp_read_barrier_depends();
     pmd_populate(mm, pmd, new);
							/* do something with pte, e.g. check if (pte_none(*new)) */


It's needed to ensure that if CPU1 sees pmd_populate() it also sees initialized contents of the 'new'.

In our case the barrier would have been needed if we had the other side like this:

if (!pte_none(*vmalloc_shadow_pte)) {
	shadow_addr = (unsigned long)__va(pte_pfn(*vmalloc_shadow_pte) << PAGE_SHIFT);
	smp_read_barrier_depends();
	*shadow_addr; /* read the shadow, barrier ensures that if we see installed pte, we will see initialized shadow memory. */
}


Without such other side the barrier is pointless.
